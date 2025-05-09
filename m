Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0347C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 21:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVdGvQl7I4jzamIx+mGrMWIjkTZGB9PGkkLFZVwWjA4=; b=FM/LXMfuUSxZgjxNPKn7wbUUdA
	xjTsXq9F/73fHX599RQITC4B0+J16/JxQRV8Qorug/6RPx3hf3S4NcPDrmzi98JmI1PTBE+OSUBWf
	J0f/23k5tYAVk0JQ633qJCyW/H4B5+ltiNU5cKOJD81QoJv4YD6BomyGmgFQNBEg8MjnGUhE4PBG5
	mJOhqvD5WTMBdhsl9fPBlLTx9C3Opfm179dI45mRqew1fP0EFNggSu1KDP8qe/rb1Yyeu39NvASjD
	FGvhJWtjy2b6mQQHHLMJNX7+plbkVXKu7ezL/AG8gvSAupCoPC9+BUJPcCyxabgNw7cFtQ1UWVl4y
	JfelwNIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDVJr-00000004xzy-2W3E;
	Fri, 09 May 2025 21:31:47 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSMg-00000004YkD-3DwX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 18:22:32 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-708b9b5299eso21899337b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 11:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1746814950; x=1747419750; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVdGvQl7I4jzamIx+mGrMWIjkTZGB9PGkkLFZVwWjA4=;
        b=pMnjuGfTm8YUyHlTv9elCkvRUopuBjJW9WOzldJUgctt4pUsGpggGYnMEZAgHXZG1O
         rrumHOiVa+Ho8h7+jVkW78neYp9zBx1ICkNJYkYBS83p4ZDkBRHNIPNLCV9JL41RnbjC
         v5WE28HzUTwiGvPt8ldXw1Bm8tyZq1KNz/thY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746814950; x=1747419750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FVdGvQl7I4jzamIx+mGrMWIjkTZGB9PGkkLFZVwWjA4=;
        b=ZnjgIWiON1w3+fCbQfnUA1EVANM2Y8q+3QyOcArM8tNbTj5HMElCuq6Zq2LeIz6kbI
         /mvxKlui1b3eYce8Sle3iw+P5RIlVkmgM73h/WCps1GfaKPdu7kjDuI43hHq+s2OuGV/
         xNeZ6dnAUddTXysTH5cXojNZplTrpgIMznvjghvWDEFmx0uyWnnCoPx/3+RPJRTKvE/4
         264NbShUWSQxhZKv96yQaL1xYE1fsB0rUPVotNgeauP0IqFxCiJ/740EawzufXCwV1fF
         qOv5LxhOn4BauGS1gcre1IgGefJMZdy1I+SKTI8RFSQuEimmAEKQKZ9sKXXbVoOzEGhC
         ZlnA==
X-Forwarded-Encrypted: i=1; AJvYcCXWfaz/NJZ5RLxEfQwNFfwNkxbBoCrRujWBpc/x7D1/M7OSLw7exj6JOAr4VMDtWpY/w28wRiCW1w793TmhW3pr@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6pN6GADwx7eTOgDYF5G7gpb0IPbO20ISXNGxdfKkm3A6Nytxc
	MPqki1mXfUbuZFP2OIUVRRKMLTOdoyBYO5k4n/E+wyi/X2iOE9zKbB9cfVcgwgBCfdKDX7mKOwZ
	2slgd3jZNKCrvvsOzhhMn0IZjG7+4R8WOhVj2Ow==
X-Gm-Gg: ASbGncuHIq1uLIl+aTbjX74m5WpFE/yIDLulpw0NoKwkchP9ZiZ5aeCbDMtVqgCloy8
	eRvcnxOw1EI8rAgQgU14bhrK01iS4o5Xt+JZQPmb5ZQB6rG22dn1+dd47aWNBwuEthujOhUh1DG
	7SGNmZ3/SVKtOUDDY6NMWChHuaPj3q
X-Google-Smtp-Source: AGHT+IFhuGu6cPIv6shqVcKb5yMcaEsKd2xMo/nKwn74VQkFfSO8SSLUGFFj0iY8SWc7yPYKJguYvy3CEdCdcbkRiBw=
X-Received: by 2002:a05:690c:7007:b0:708:ab81:ec26 with SMTP id
 00721157ae682-70a3fb75af8mr60732477b3.33.1746814949659; Fri, 09 May 2025
 11:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <20250424062154.2999219-17-dario.binacchi@amarulasolutions.com> <20250509162546.GA3704130-robh@kernel.org>
In-Reply-To: <20250509162546.GA3704130-robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 9 May 2025 20:22:18 +0200
X-Gm-Features: AX0GCFudXK-0LsSuEXf0ommGdIrbGEzxESxhBMaUX-8mIu528WIhNrRmopexvqM
Message-ID: <CABGWkvq4a73hvCWG-P_+arc3R-pnr5NVfcGPDTGEoW1doPt2qg@mail.gmail.com>
Subject: Re: [PATCH v12 16/19] dt-bindings: clock: imx8m-clock: add PLLs
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_112230_820507_7B753198 
X-CRM114-Status: GOOD (  22.72  )
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

On Fri, May 9, 2025 at 6:25=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Apr 24, 2025 at 08:21:46AM +0200, Dario Binacchi wrote:
> > Though adding the PLLs to clocks and clock-names properties will break
> > the ABI, it is required to accurately describe the hardware. Indeed,
> > the Clock Control Module (CCM) receives clocks from the PLLs and
> > oscillators and generates clocks for on-chip peripherals.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> > ---
> >
> > (no changes since v11)
> >
> > Changes in v11:
> > - Fix conflict while rebasing on master
> >
> > Changes in v7:
> > - Add 'Reviewed-by' tag of Krzysztof Kozlowski
> >
> > Changes in v6:
> > - New
> >
> >  .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
> >  1 file changed, 21 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b=
/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> > index 4fec55832702..e83f08abd44c 100644
> > --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> > +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> > @@ -29,12 +29,12 @@ properties:
> >      maxItems: 2
> >
> >    clocks:
> > -    minItems: 6
> > -    maxItems: 7
> > +    minItems: 7
>
> Increasing the minimum entries looks like an ABI break to me. The .dts
> files not being in linux-next confirms that (from 0 warnings in
> mainline):
>
> arch/arm64/boot/dts/freescale:859:50
>     122  clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_3=
2k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too shor=
t
>     120  clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_3=
2k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too shor=
t
>      61  clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a req=
uired property
>      61  clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is =
a required property
>      60  clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a req=
uired property
>      60  clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is =
a required property
>      36  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36],=
 [37], [38], [39], [40]] is too short
>      36  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[24], [25],=
 [26], [27], [28], [29]] is too short
>      32  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35],=
 [36], [37], [38], [39]] is too short
>      28  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[22], [23],=
 [24], [25], [26], [27]] is too short
>      26  clock-controller@30380000 (fsl,imx8mn-ccm): clock-names: ['osc_3=
2k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too shor=
t
>      17  clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a req=
uired property
>      17  clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is =
a required property
>      14  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45],=
 [46], [47], [48], [49]] is too short
>      14  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[23], [24],=
 [25], [26], [27], [28]] is too short
>      13  clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a req=
uired property
>      13  clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is =
a required property
>      12  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[26], [27],=
 [28], [29], [30], [31]] is too short
>      10  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[38], [39],=
 [40], [41], [42], [43]] is too short
>       8  clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[22], [23],=
 [24], [25], [26], [27]] is too short
>       8  clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[20], [21],=
 [22], [23], [24], [25]] is too short
>       8  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[34], [35],=
 [36], [37], [38], [39]] is too short
>       8  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[28], [29],=
 [30], [31], [32], [33]] is too short
>       8  bcrmf@1 (brcm,bcm4329-fmac): $nodename:0: 'bcrmf@1' does not mat=
ch '^wifi(@.*)?$'
>       6  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[41], [42],=
 [43], [44], [45], [46]] is too short
>       6  clock-controller@30380000 (fsl,imx8mn-ccm): clocks: [[24], [25],=
 [26], [27], [28], [29]] is too short
>       4  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[43], [44],=
 [45], [46], [47], [48]] is too short
>       4  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[40], [41],=
 [42], [43], [44], [45]] is too short
>       4  clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[36], [37],=
 [38], [39], [40], [41]] is too short
>       4  clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[35], [36],=
 [37], [38], [39], [40]] is too short
>
> Please fix the binding or drop what's been applied so far.

Abel and Shawn are already aware of the issue:

https://lore.kernel.org/all/CABGWkvqfyH=3Ddcuw6EDZaFVVebj8SZhJF0P944+mmzL5Y=
K3-Pug@mail.gmail.com/

Thanks and regards,
Dario

>
> Rob
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

