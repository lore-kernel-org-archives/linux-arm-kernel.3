Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0C5C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 23:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJFl78XZ+XY3PQ6hqlxJcMbRGA/vaIbR4su4ePprkx4=; b=GNRCNRPgiigDKSRLlwGfzw9cOE
	IS3owvDba2j+c3RxRl37BV9YwsNfhKFMXBp7Yb19P9jNDjjeS8kiR46JxolgJqr4H7FdyP+jytu66
	GcV9capro5D7cgbXJwsj7pqhUQYCRxc/rvGHNwB1Ex6/vfE+PjhhreV8ud4sdzAp5MJKGCGwy42X4
	PsQomzRQjy3upIvfI0MM+R+F8/dK+BBDxyX/BIWwyl9cIG9MiWEPPanBW5mScQvM4c0L0JQ4wUeER
	jM4FUdwlRUN8Ltn9uef39m6UBiE79HhPzd9ofv6O5av31kLmzuTNePot/OVSRNox276/u55zN4OLp
	nqKboIsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajYT-0000000H7M2-48Ss;
	Sat, 12 Jul 2025 23:22:53 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajW5-0000000H7GH-1ndB;
	Sat, 12 Jul 2025 23:20:26 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6faf66905baso41838846d6.2;
        Sat, 12 Jul 2025 16:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752362424; x=1752967224; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJFl78XZ+XY3PQ6hqlxJcMbRGA/vaIbR4su4ePprkx4=;
        b=VMblYQSIJcWZRsANO/c6N+bRxyaM+g5MHc09P47MElP2j+PHJ9D+Q3Dodslzd2rs4W
         58j3viHzrsqD346z0eaE1NXVzZW1Kwj6qItLuDAm72VKfxjLXnSYz7SVM5tZ22aWv4XP
         OvTJL0N5SN1wdLmarCCtZ05DWlPgfk4oPgSYISoA9vYTOMMpFA3Yp0Xwn2NJbKD1VybR
         eOIFtjrWFkcLwbMpGI+Lgn4N49xT59nbXRuuj6nd0rhH8EwjGQIZ//VH50XxptxN7wy3
         jw4qOzUY523at4qrQfUtW0gr8oyZWEH6zGbUvWeRrgCnQpEAOMknHaDx3x8sp+BdZ3Nt
         hy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752362424; x=1752967224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJFl78XZ+XY3PQ6hqlxJcMbRGA/vaIbR4su4ePprkx4=;
        b=hdQm0H3DogDIS68A7ePz0epQRMsQmrPrhDgjxDeRh2WsyjiVYbOGYDNtBwRTLA2m4h
         gqBiAtaPlSLnJlsfO4DeKprmUL7s3uTut8ZWj9SOs3mn/QfuK72LfT4LE5yB5Xi+ehBb
         t/dplt4eJMpUT8c+Lpslh5T4tx1zfvEGOD37Esp68cjEQ244AFJ34LEKmrTINMkQHYvM
         J91Djv1cMHenWi7oXlbsVzzIz3XeVUCh0f4icPXb+q32UXRKtf/JBBkPQJjUmswpVUNL
         pl9+YhrC7jwK+ZPxyu/nvBV8UKDD3Pktk3Xvk4SXelzz6CjKmzve/vs7nPUrjTnb2pRk
         ZGZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDcpcYIT1aGwegIBKgT3l1xu5/o5XWacG8los/Xx1Fl9hAcqwg8WhY4+pfNP9585hdSbR59wxpbq9UJCH7Saw=@lists.infradead.org, AJvYcCX4nE+M9g4lcj5AWJ2uQJ/5wdsxi7q06pjON1kQ5qVFnpz5XLNU/7RljsWhHEh4klEP1+QOItJGLwRkckT5AmOb@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7+JzNE8r6x144ywnwDkbqejZrGK3Q47cWqiddKQDX5ZA1s42C
	JzBf5Md12xBCRlPcCawQZ35M3PzabqspMa2D/oo5cFqvcDc7pKYnFHYF4bqr7eNixpPJ8H+NJtW
	s7GqgMFlra3FRAhUFT2FiEKzFI3kzGcHHSw==
X-Gm-Gg: ASbGncvnwHribhi8ruPCsz6gLIWSps2D2DxPXylpTeUGxpCOZZdT9FlyO2GNdlpICOI
	7ymJ13emtl13dyU8pk/JwCJDoyQI+eWat/p06PNYZH+Wu0IUSKCCAo3TBA73dVCPlmvn2Fjt18U
	yuC+n0f3tX+vh6wEagZrhJXoZi6ext8PsFv9Y81/eY4A9r8g/7l6VdjqM/3HeJfX165HL0Ybrvq
	CmmBpg=
X-Google-Smtp-Source: AGHT+IFxoLdRf98+nAnGYYkZ3v8X8Zabbt4512qKXAZnA97TDHShi9FJhWzH8PYyZvNSK3yat23YgSRK0z1vNWmf/lY=
X-Received: by 2002:a05:6214:2b86:b0:702:c939:9d9d with SMTP id
 6a1803df08f44-704a4220990mr161700106d6.28.1752362423744; Sat, 12 Jul 2025
 16:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250710200820.262295-1-rosenp@gmail.com> <20250710200820.262295-8-rosenp@gmail.com>
 <d8b0abb2-1a12-42bf-aafd-4cd1e21babd6@kernel.org> <CAKxU2N-c2tHBYWBM+FJGqdSaqzw9u0O8e0G7AVqk6b0QdRnPTw@mail.gmail.com>
 <20250711-invisible-dainty-jackrabbit-acbf8f@krzk-bin> <20250712104006.GA13512@wp.pl>
 <e435a765-fb91-408f-81dd-01a73fc43b6b@kernel.org> <23e629cb-0698-4a9c-aa18-9a7e71aa8b73@kernel.org>
In-Reply-To: <23e629cb-0698-4a9c-aa18-9a7e71aa8b73@kernel.org>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Sun, 13 Jul 2025 09:20:12 +1000
X-Gm-Features: Ac12FXzHmWw2pTYCCUYiI4xo0Q3W3oiBA__ty2FODlbGDbYFA2NA_IcVvNhC2_U
Message-ID: <CAGRGNgVk9__2mCE-hYSP7T0yKLjPsDkvG6+NghJMXazYXUid1w@mail.gmail.com>
Subject: Re: [PATCHv3 wireless-next 7/7] dt-bindings: net: wireless: rt2800: add
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Stanislaw Gruszka <stf_xl@wp.pl>, Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_162025_474014_088C7047 
X-CRM114-Status: GOOD (  30.27  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Krzysztof and Rob,

On Sun, Jul 13, 2025 at 2:59=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 12/07/2025 18:53, Krzysztof Kozlowski wrote:
> > On 12/07/2025 12:40, Stanislaw Gruszka wrote:
> >> Hi Krzysztof,
> >>
> >> On Fri, Jul 11, 2025 at 09:48:49AM +0200, Krzysztof Kozlowski wrote:
> >>> On Thu, Jul 10, 2025 at 03:40:30PM -0700, Rosen Penev wrote:
> >>>> On Thu, Jul 10, 2025 at 2:40=E2=80=AFPM Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> >>>>>
> >>>>> On 10/07/2025 22:08, Rosen Penev wrote:
> >>>>>> Add device-tree bindings for the RT2800 SOC wifi device found in o=
lder
> >>>>>> Ralink/Mediatek devices.
> >>>>>>
> >>>>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >>>>>> ---
> >>>>>>  .../bindings/net/wireless/ralink,rt2800.yaml  | 47 ++++++++++++++=
+++++
> >>>>>>  1 file changed, 47 insertions(+)
> >>>>>>  create mode 100644 Documentation/devicetree/bindings/net/wireless=
/ralink,rt2800.yaml
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/net/wireless/ralink=
,rt2800.yaml b/Documentation/devicetree/bindings/net/wireless/ralink,rt2800=
.yaml
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..8c13b25bd8b4
> >>>>>> --- /dev/null
> >>>>>> +++ b/Documentation/devicetree/bindings/net/wireless/ralink,rt2800=
.yaml
> >>>>>
> >>>>> Filename should match compatible. You were already changing somethi=
ng
> >>>>> here...
> >>>> hrm? that makes no sense. Various drivers have multiple compatible l=
ines.
> >>>
> >>> Luckily we do not speak about drivers here. Anyway, follow standard
> >>> review practices, you don't get special rules.
> >>
> >> Could you please elaborate what you mean ?
> >
> > Rosen replied in abrasive way, so I am not going to dig this.
> >
> >>
> >> I greped through Documentation/devicetree/bindings/*/*.yaml and plenty
> >
> > I assume you refer to last 2 years bindings, not something older, right=
?
> > It is really poor argument to find old files and use them as example
> > "they did like that".
> >
> >> of "compatible:" items do not match the filename. So hard to tell
> >
> > I did not ask for compatible to match filename.
> >
> >> what rule you are referencing, as it seems it's not really applied.
> > Check reviews on the lists. It is pretty standard review. Everyone gets
> > it for this case here - single device, single compatible.
>
> BTW, it is not hiding on the lists:
>
> https://lore.kernel.org/linux-devicetree/?q=3Df%3Aherring+filename
> https://lore.kernel.org/linux-devicetree/?q=3Df%3Akozlowski+filename

I just had a quick look through the in-tree documentation on device
tree bindings and can't find this rule there.

It's good that you and Rob are consistent in applying this rule, but
pointing to the mailing list archives instead of the documentation
makes it feel like patch submissions in this space are judged by some
arbitrary set of undocumented rules.

Could you please update the documentation with the current set of
requirements so that people who are new to this space have a
consistent set of rules they can apply to their work?

I understand that Krzysztof doesn't particularly like having
discussions around the rules given his usual abrasive manner, so
having the full rules documented would be a way to shift these
conversations into something a bit more like how Greg applies stable
rules: if you get it wrong, you get a link to the documentation, which
should clarify most issues without any further discussion.

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

