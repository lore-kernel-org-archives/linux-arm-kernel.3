Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B350CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 09:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqCuPp9H8HI1+6gmMgoIdl2q4ASSXdaZj3EL+jeW6CU=; b=t+DsgXWhZrbURIz2y8C+3JEV20
	GOvAlYCMmCCuGkU/hmgeOpyp0YXiMQunPqXcgYJcfgrgJ5zhmIOMIfh4/lVAam5eK82eWFWcq8mCW
	UUgPERjZcFI9/GfRs1JiCKw1v6ol9iomfUX9hbUdTraiGOVCXW30CGPL0xtjbTv4GHwsEHzT4xnCO
	SQm6QMbP4+UZLnQUAy5S6xgwDAbOLahF3zv3H247Hrge5ZLDFOgDmzzF3abM9E+iKtUwDln/7FrWk
	yyLF+vDvgDfBCObJ4hXJ77EnMMhWz2q5rHN9/B5VeP8jNVz/anmCGjOUCmfjSMUilFuJjDNpYR4Dv
	k8CGfkBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7BM-00000008SwH-2Ifk;
	Wed, 12 Nov 2025 09:30:28 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7BJ-00000008Svr-3JKy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 09:30:27 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b4736e043f9so87529266b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 01:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762939823; x=1763544623; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqCuPp9H8HI1+6gmMgoIdl2q4ASSXdaZj3EL+jeW6CU=;
        b=b4noCFo0083aAk0zcUzN/FhnHjeX1Mba/bLMDphHXNejMWp+r9qWHg5aIkuH3Bg99h
         CxjmOJ3C1HFgScFUiGSCeFYDRcZubSWwOqLuJr+7e+T1KnSmhSkAoarAcIk+/78ys7DI
         JNFdgRod+nwZ5VMfEPo1x8tJSW6BJuoehHHPKyzN0sHUTrY0xEJDguyW6vochBg0RZQX
         PvoS4nmOBSikrSCJjaPiYhUm6MBa0VWS9fqHG0C7pY8HJee3NtzD1EtIbn5XdYklGWO4
         XLtRPFJ5IFIdoIQpBUD5QmS8q8H5SWCpj7ZbYcNNT1JAJ0k5k7NPi3fvvGajZFoY6O8O
         m6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939823; x=1763544623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lqCuPp9H8HI1+6gmMgoIdl2q4ASSXdaZj3EL+jeW6CU=;
        b=OuQ9jf+bS9HEmHewABDLQxD8j9LeJRTKbPFFdBBS5/RCjmn1Xd+4XjBHCLzceH5SQM
         GPzuxxZOFwiKrkyO/oRT1slqiPs/gvk8eVUE3yV7Eebc2wIz+RZiXGvrxkmkxbWlK+Yx
         6UqvSSkAFd0hGtMEqjXEVG53PYCBHXj8Q2VCLs7aKruAb30WTUOuk9bmriUyKcMKQam4
         DReUTxGByBDb62hG/iKtR+c6dbeiWFDrYiF9ts/lCU9kVkXPu1XVzA84PAP/jhL9URCi
         O6aelNWz0gYSW4gABJxDxo9+TtGv067OhyTtLz8A2T38Q2VUk/NtEfP0AY9MJ6BRH2gs
         ArDw==
X-Forwarded-Encrypted: i=1; AJvYcCXLil9UvYuadrwZw7Wag8VDk8e782EnsgmOma2OlmfF+vuI9FK9EP5ogBUl7qdRe3+hWEPmp7QHDARitGRjMZ/T@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6IjvR6sHbigcfj54KNnfW8CB9Wz4FywksAgTTU2Fs7bfAeVnv
	5vgfaFPwYcmp1Tg0SMsvissuWYUCM9e4YfAGybEyXh6z+nL17t3gkSrf3WyKJaP5PsrK9amrnTy
	8Zu2m8cdGWE0pK5uDJgH8InihglEPR4k=
X-Gm-Gg: ASbGnctvHOGiYB/hZ2jQKTS/IifNzNx+rIJiS5ANJRF+bLaVC0YKnpRvSRqdzj7Q/q/
	11ZoN1eXiItUp9qxyaSiCGmQ6s3nC+1ciucvrrusAWz8voI9nogy1pJ7IpTfsl/t4A6REWdOm6h
	KT5OM/03qskWsiDFzF1ZTuCIneKcZXr1p9EYLvPYmPQHUH9blwgmzAsO5eZbkELIbRFHw5YM+gY
	Sz5mCxCaRCWoi1ECU/4fo/bYz/e/8CBVnHHIc7cPZ01EzELb/qG4/tmuw==
X-Google-Smtp-Source: AGHT+IGyBC+BBxL1KaIi5mi0ySnjGyT9eGbf3VfoXUYHbfCWS/PwYWYo/VnJObXv4/YPosnSNepi2Bx4++0gAs1GJ6k=
X-Received: by 2002:a17:907:3f0b:b0:b73:2df0:9fa9 with SMTP id
 a640c23a62f3a-b7331aec6fcmr200176166b.59.1762939823249; Wed, 12 Nov 2025
 01:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20251109214515.121742-1-rpimentel.silva@gmail.com>
 <20251109214515.121742-2-rpimentel.silva@gmail.com> <9d48a54c-0585-4524-b9d5-30696f5ecc8b@kernel.org>
 <CAEnQRZCvpXzGt=7NGv7-s+y0gvOg7Jx4OqbfbW3uv8jDp-jroQ@mail.gmail.com>
 <CAOMZO5CU09fcBB8oUOO=qC=Du3Q9gnJOQacK=6v+pnSQViex3g@mail.gmail.com>
 <CAEnQRZCHKemw2YVT=WVJvUMr9CCWoZ3MORt_mU1V-62C53n-3w@mail.gmail.com>
 <CAEnQRZBBJ4PGDOk7hBP_qsk7bBiec8pHb0DYKs2mhOAahNyKww@mail.gmail.com>
 <baafb460-fb65-4cd2-9911-89d828199d9b@kernel.org> <2e160fe1-bcb2-41cf-817e-ac2a36959b16@kernel.org>
In-Reply-To: <2e160fe1-bcb2-41cf-817e-ac2a36959b16@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 12 Nov 2025 11:32:44 +0200
X-Gm-Features: AWmQ_bk_gSFa8QTHeI1JrrzB0W9QZ2CPKTfJSvtyKPLDEFBLVYzLq3Nt1FpD5Yg
Message-ID: <CAEnQRZDg0yAjR-a-4J2ZKAjh3mm8NeQCA=o2kyNJtXMAFCMLAA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, Rogerio Pimentel <rpimentel.silva@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, 
	alexander.stein@ew.tq-group.com, dario.binacchi@amarulasolutions.com, 
	marex@denx.de, Markus.Niebel@tq-group.com, y.moog@phytec.de, 
	joao.goncalves@toradex.com, frieder.schrempf@kontron.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, primoz.fiser@norik.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiaofeng Wei <xiaofeng.wei@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Joseph Guo <qijian.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_013025_878965_C1ECDCD7 
X-CRM114-Status: GOOD (  24.71  )
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

On Wed, Nov 12, 2025 at 11:14=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 12/11/2025 10:08, Krzysztof Kozlowski wrote:
> > On 12/11/2025 09:15, Daniel Baluta wrote:
> >> On Tue, Nov 11, 2025 at 2:49=E2=80=AFPM Daniel Baluta <daniel.baluta@g=
mail.com> wrote:
> >>>
> >>> On Tue, Nov 11, 2025 at 1:50=E2=80=AFPM Fabio Estevam <festevam@gmail=
.com> wrote:
> >>>>
> >>>> Hi Daniel,
> >>>>
> >>>> On Tue, Nov 11, 2025 at 5:45=E2=80=AFAM Daniel Baluta <daniel.baluta=
@gmail.com> wrote:
> >>>>
> >>>>> In addition to that, Rogerio please read:
> >>>>>
> >>>>> https://docs.kernel.org/process/submitting-patches.html
> >>>>>
> >>>>> At this moment I think you should keep the original author of the
> >>>>> patch.
> >>>>
> >>>> Right, but NXP makes a total mess with authorship.
> >>>
> >>> I cannot disagree with you on this, let me clarify it internally with
> >>> NXP colleagues
> >>> and sort everything out.
> >>
> >> Hi Fabio & Rogerio,
> >>
> >> Checked internally and to track the correct authorship and development=
 work
> >> here is how NXP would prefer to get credit.
> >
> > Sorry, but individual contributors do not need to give any credits to
> > NXP. If NXP wanted to sent the patches to have credit, they would do it=
.
> >
> > Did sending happened?
> >
> > If not, then any contributor is rightful to take the patches from
> > downstream and send them only, ONLY with their authorship. That's what
> > DCO allows and that's what established practice as well.
> >
> > NXP had a chance to upstream. When they decided not to, they forfeit an=
y
> > rights to claim they want any authorship.
> >
> >
> >>
> >> #Use git commit --amend --author=3D"Xiaofeng Wei <xiaofeng.wei@nxp.com=
>"
> >
> > NAK, there is no single patch like that from above author:
> >
> > https://lore.kernel.org/all/?q=3Df%3Axiaofeng.wei%40nxp.com
> >
> > Remember, downstream code does not matter. Does not exist.
> >
> >
>
>
> ... and because last two months there were two or three cases where
> vendor companies bullied individual contributors, I will be quite strict
> about that. Vendor company does not receive any authorship on patches
> sent by independent contributors which the vendor NEVER submitted,
> unless author really wants that. But I will treat any such insisting on
> authorship by vendor like NXP as bullying and working AGAINST the communi=
ty.

I'm sorry that people use "bully" in this context. We are just trying
to help with
the limited time we have and create a friendly environment around NXP
upstream support.

We (NXP) immensely  appreciate individual contributions from everyone.

We need to be fair, the v1 of this patchset was taken from NXP
downstream without
respecting the Developer Certificate of Origin.

E.g there were commits pulled in from our internal tree without
keeping the S-o-B tags.
As I said keeping the original author is a sign of respecting the
initial work of NXP developers
and a recommendation from NXP.

What is your suggestion on moving on with this? Would keeping the
authorship from Rogerio
and adding S-o-B and C-d-b tags as above work for everyone?


Daniel.

