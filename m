Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A428D1D48C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 20:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvh6vFDxnLLRCkd44oRBGvN0fikzmU6YF3y7N7iZ7UI=; b=xa6SZ6gWxcFpDuM7Q+bB23Jin0
	QUZONMxwvSMARTR85a+CK3COGqXe3eGUsLWDr9UYAHhrA8kZJL2ypqWQnFmfRpNCqIRzIynV+0Wdr
	NMMK6WKo0PLX7Vo0LVkPWEAyVm1E/PueXfWfZqEzPsrTZeojC11qql3wrtxmbP97RH2tP2gI0ii+o
	hwtEtJyrUQnldVfflIgGKs/VEWt33HqwmiFSwQcMgpoku43PaAzulho+S/5AcxCpIWl6iaObFB5IA
	FGni+7wr1cBhwau3Mf5n3lb0wUISRfHNG40dw3x5JXIJ2ADHJGGCchzS3GXgoUywjAH5qCO2V2NN6
	YMRugrrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwKh-00000000nkP-3DjP;
	Thu, 08 Jan 2026 20:10:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwKe-00000000nju-2x5Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 20:10:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B33244340
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Jan 2026 20:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE426C19423
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Jan 2026 20:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767903008;
	bh=twpVp3jzla1rgtXT0dqZxOaRWr0DQx/Arkcq8HDQVLo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eEruCPv754vNpIOKiQ0D8uRyw+JnPI90S/uekVcIy6NOQx8SpNMpDhfN7Q9dnAiei
	 J153kJC7QkZ8fO5nqU/f6F1QA8+fjjiX1pfao5gBjhXU/+UD2poaqcf9beSsWxdS3M
	 +6arkKj00as/84ja2/D1aGnU61QssuIIFK7OfGJqd7ZCnOWsGWHrZoTg+jJ9uraOj/
	 7rTR3ns343WzdnMxE0//5snVyRFsp+MsobgShH3pj6s/RrhVyh88LyQvIwmVCXrYDo
	 1xBb+YOfYPYdpNFc884gwjpsg/FOSr/L+iwnXjIHqrHzdnTBSlIG55aMNpViet5qs4
	 WcYYxmTqT1MBA==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b727f452fffso360252666b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 12:10:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVW7rn0OgAuqRBjZ3nDS1vmsuC0P8wiKk1wPHFP8wPrNGsL9N+U+sYVLStHQ4+mGR0WnsPcnji7Lp7nL9JE0q2X@lists.infradead.org
X-Gm-Message-State: AOJu0YzHau8NchqOGpb+/43c65GQtO8l8wgRoS3oJk0m4U34UnPAIWO/
	4i4Pw/jj5Txnf9E5ODL5lZpwp1fU7f9QUu3QnaDIV/l4r4Deq7IRWwJ+5dnyJ0CEi6frNsBMddM
	2t31cIczN5AqcQyG5abPngcr/WuwFpg==
X-Google-Smtp-Source: AGHT+IEWcso0Tnf8qe72vO8BkFVooAKgs1PSHRAVZTJGZfHsd5GMBoa4Ex7+q1SOboQ2YL+MeIVhXMxTH82k0CgWVFM=
X-Received: by 2002:a17:907:1b08:b0:b80:344b:421a with SMTP id
 a640c23a62f3a-b8444f43f86mr807433766b.18.1767903006462; Thu, 08 Jan 2026
 12:10:06 -0800 (PST)
MIME-Version: 1.0
References: <63f19db21a91729d91b3df336a56a7eb4206e561.1767804922.git.chleroy@kernel.org>
 <7708243d6cca21004de8b3da87369c06dbee3848.1767804922.git.chleroy@kernel.org>
 <20260108190203.GA780464-robh@kernel.org> <8a8c8a31-ebe8-48cb-9836-c69c6d65a545@kernel.org>
In-Reply-To: <8a8c8a31-ebe8-48cb-9836-c69c6d65a545@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 8 Jan 2026 14:09:54 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLTPOFve5v-V2mmoSqiO9+Woh9vhq4Kof7pMtuVFp2C+g@mail.gmail.com>
X-Gm-Features: AQt7F2r6GjuLRCY1szfRMCPd1iuSpzfSLJ-3dWB8YNgbFdjDgn4XP8KB1EDvxjE
Message-ID: <CAL_JsqLTPOFve5v-V2mmoSqiO9+Woh9vhq4Kof7pMtuVFp2C+g@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_121008_823126_3666654F 
X-CRM114-Status: GOOD (  26.03  )
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

On Thu, Jan 8, 2026 at 1:44=E2=80=AFPM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
>
> Le 08/01/2026 =C3=A0 20:02, Rob Herring a =C3=A9crit :
> > On Wed, Jan 07, 2026 at 05:59:10PM +0100, Christophe Leroy (CS GROUP) w=
rote:
> >> The QUICC Engine provides interrupts for a few I/O ports. This is
> >> handled via a separate interrupt ID and managed via a triplet of
> >> dedicated registers hosted by the SoC.
> >>
> >> Implement an interrupt driver for it so that those IRQs can then
> >> be linked to the related GPIOs.
> >>
> >> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Already? On a v1?
>
> This is extracted from a previous series, here:
> https://lore.kernel.org/all/67987bbf42344398709949cb53e3e8415260ec09.1758=
212309.git.christophe.leroy@csgroup.eu/
>
> Should I have called it v7 even if it is only a small part of the
> initial series ?

Probably. Otherwise, b4 might think v6 is newer.

Regardless, the history matters.

>
> Ack is here:
> https://lore.kernel.org/all/20250818-babbling-studio-81a974afc169@spud/
>
> >
> >> ---
> >>   .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 51 +++++++++++++++++=
++
> >>   1 file changed, 51 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/=
fsl,qe-ports-ic.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-p=
orts-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-port=
s-ic.yaml
> >> new file mode 100644
> >> index 0000000000000..1f3c652b1569d
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic=
.yaml
> >> @@ -0,0 +1,51 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F=
%2Fdevicetree.org%2Fschemas%2Fsoc%2Ffsl%2Fcpm_qe%2Ffsl%2Cqe-ports-ic.yaml%2=
3&data=3D05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6e4c1b33836d4443b5c608de=
4ee86aff%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639034957294961534%7C=
Unknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXa=
W4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DmH5SPbAw48C6BG=
cazDPJMtoiM71TXswUGBvSZf15dUQ%3D&reserved=3D0
> >> +$schema: https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3=
A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&data=3D05%7C02%7Cchrist=
ophe.leroy%40csgroup.eu%7C6e4c1b33836d4443b5c608de4ee86aff%7C8b87af7d86474d=
c78df45f69a2011bb5%7C0%7C0%7C639034957294990994%7CUnknown%7CTWFpbGZsb3d8eyJ=
FbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIl=
dUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DRhD807Jcx3MerOAXGWuwgwHkATpTzTkDIQC7lO3=
t1AA%3D&reserved=3D0
> >> +
> >> +title: Freescale QUICC Engine I/O Ports Interrupt Controller
> >> +
> >> +maintainers:
> >> +  - Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - fsl,mpc8323-qe-ports-ic
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  interrupt-controller: true
> >> +
> >> +  '#address-cells':
> >> +    const: 0
> >> +
> >> +  '#interrupt-cells':
> >> +    const: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - interrupt-controller
> >> +  - '#address-cells'
> >> +  - '#interrupt-cells'
> >> +  - interrupts
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    interrupt-controller@c00 {
> >> +      compatible =3D "fsl,mpc8323-qe-ports-ic";
> >> +      reg =3D <0xc00 0x18>;
> >> +      interrupt-controller;
> >> +      #address-cells =3D <0>;
> >> +      #interrupt-cells =3D <1>;
> >> +      interrupts =3D <74 0x8>;
> >> +      interrupt-parent =3D <&ipic>;
> >
> > This doesn't look like a separate block, but just part of its parent. S=
o
> > just add interrupt-controller/#interrupt-cells to the parent.
>
> I don't understand what you mean, can you explain with the extract below =
?
>
> Extract from device tree including the parent:
>
>         soc8321@b0000000 {
>                 #address-cells =3D <1>;
>                 #size-cells =3D <1>;
>                 device_type =3D "soc";
>                 compatible =3D "simple-bus";
>                 ranges =3D <0x0 0xb0000000 0x00100000>;
>                 reg =3D <0xb0000000 0x00000200>;
>                 bus-frequency =3D <0>;
>
>                 ipic:pic@700 {
>                         interrupt-controller;
>                         #address-cells =3D <0>;
>                         #interrupt-cells =3D <2>;
>                         reg =3D <0x700 0x100>;
>                         device_type =3D "ipic";
>                 };
>
>                 qepic:interrupt-controller@c00 {
>                         compatible =3D "fsl,mpc8323-qe-ports-ic";
>                         reg =3D <0xc00 0x18>;
>                         interrupt-controller;
>                         #address-cells =3D <0>;
>                         #interrupt-cells =3D <1>;
>                         interrupts =3D <74 0x8>;
>                         interrupt-parent =3D <&ipic>;

There's not some overall QuiccEngine node/device? I guess that's
qe@e0100000, so this is outside of it and is fine. Just move it to
bindings/interrupt-controller/ since it is not part of anything else.

Rob

