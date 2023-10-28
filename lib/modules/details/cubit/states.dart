abstract class DetailsStates {}

class Initial extends DetailsStates {}

class GetLoadDetailsData extends DetailsStates {}

class GetDetailsDataSuccess extends DetailsStates {}

class GetDetailsDataError extends DetailsStates {}

class GetLoadSimilarData extends DetailsStates {}

class GetSimilarDataSuccess extends DetailsStates {}

class GetSimilarDataError extends DetailsStates {}
