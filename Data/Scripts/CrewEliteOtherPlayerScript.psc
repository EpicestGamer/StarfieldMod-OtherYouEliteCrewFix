ScriptName CrewEliteOtherPlayerScript Extends Actor

;-- Variables ---------------------------------------
Int BodyType_Feminine = 1 Const
Int BodyType_Masculine = 0 Const
Int Pronoun_HeHim = 1 Const
Int Pronoun_SheHer = 2 Const
Int Pronoun_TheyThem = 3 Const
Int Pronoun_Unselected = 0 Const

;-- Properties --------------------------------------
Message Property PlayerNameMSG Auto Const mandatory
VoiceType Property NPCFOtherPlayer Auto Const mandatory
VoiceType Property NPCMOtherPlayer Auto Const mandatory
VoiceType Property NPCXOtherPlayer Auto Const mandatory
VoiceType Property NPCXOtherPlayer_2 Auto Const mandatory
ReferenceAlias Property MQ00_OtherPlayer Auto Const mandatory

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnUnload()
    ; Empty function
  EndEvent

  Event OnLoad()
    Self.gotostate("hasbeentriggered") ; #DEBUG_LINE_NO:20
    Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:21
    ActorBase PlayerBase = PlayerREF.GetBaseObject() as ActorBase ; #DEBUG_LINE_NO:22
    Self.WaitFor3dLoad() ; #DEBUG_LINE_NO:24
    Self.CopyAppearance(PlayerREF) ; #DEBUG_LINE_NO:25
    MQ00_OtherPlayer.ForceRefTo(Self as ObjectReference) ; #DEBUG_LINE_NO:26
    If PlayerBase.GetPronoun() == Pronoun_TheyThem ; #DEBUG_LINE_NO:28
      If PlayerBase.GetSex() == BodyType_Feminine ; #DEBUG_LINE_NO:29
        Self.SetOverrideVoiceType(NPCXOtherPlayer_2) ; #DEBUG_LINE_NO:30
      Else
        Self.SetOverrideVoiceType(NPCXOtherPlayer) ; #DEBUG_LINE_NO:32
      EndIf
    ElseIf PlayerBase.GetSex() == BodyType_Feminine ; #DEBUG_LINE_NO:35
      If PlayerBase.GetPronoun() == Pronoun_SheHer || PlayerBase.GetPronoun() == Pronoun_Unselected ; #DEBUG_LINE_NO:36
        Self.SetOverrideVoiceType(NPCFOtherPlayer) ; #DEBUG_LINE_NO:37
      Else
        Self.SetOverrideVoiceType(NPCXOtherPlayer_2) ; #DEBUG_LINE_NO:39
      EndIf
    ElseIf PlayerBase.GetPronoun() == Pronoun_HeHim || PlayerBase.GetPronoun() == Pronoun_Unselected ; #DEBUG_LINE_NO:42
      Self.SetOverrideVoiceType(NPCMOtherPlayer) ; #DEBUG_LINE_NO:43
    Else
      Self.SetOverrideVoiceType(NPCXOtherPlayer) ; #DEBUG_LINE_NO:45
    EndIf
  EndEvent
EndState

;-- State -------------------------------------------
State hasbeentriggered

  Event OnLoad()
    ; Empty function
  EndEvent

  Event OnUnload()
    ; Self.gotostate("WaitingForPlayer")
  EndEvent
EndState
