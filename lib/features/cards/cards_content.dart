import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gastu_card/core/utils/extensions/context_ext.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';

import '../../app/styles/dimension.dart';
import '../../core/services/database/app_database.dart' as db;
import 'bloc/cards_bloc.dart';
import 'components/cards_section.dart';
import 'components/monthly_summary_section.dart';
import 'components/recent_transactions_section.dart';

class CardsContentWrapper extends StatelessWidget {
  const CardsContentWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (_) => CardsBloc(),
      child: _CardsContent(),
    );
  }
}

class _CardsContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardsContentState();
}

class _CardsContentState extends State<_CardsContent> with AutomaticKeepAliveClientMixin {

  final List<db.Card> _cards = <db.Card>[];

  db.Card? _card;

  @override
  void initState() {
    context.read<CardsBloc>().add(GetCardsEvent());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<CardsBloc, CardsState>(
      listener: (context, state) {

        if (state is LoadingCardsState) {
          context.showLoadingDialog();
        }
      },
      builder: (context, state) {

        if (state is GetCardsState) {
          context.dismissDialog();
          _cards..clear()..addAll(state.cards);
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              Dimension.spacingMedium.height(),
              CardsSection(
                cards: _cards,
                onCardChanged: (card) {
                  setState(() {
                    _card = card;
                  });
                },
              ),
              Dimension.spacingLarge.height(),
              if (_cards.isNotEmpty) MonthlySummarySection(
                statementDay: _card?.statementDueDate.day ?? _cards.first.statementDueDate.day,
                paymentDay: _card?.paymentDueDate.day ?? _cards.first.paymentDueDate.day,
                totalDue: 0,
              ),
              Dimension.spacingLarge.height(),
              RecentTransactionsSection(),
              Dimension.spacingTeraLarge.height(),
            ],
          )
        );
      }
    );
  }

  @override
  bool get wantKeepAlive => true;
}