Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E706BC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 14:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsTlftYkKCeipenMXUveAq4+33NodqfLnatqWiT1P1s=; b=DevOxNI9wKotkKfS1cebFLOHpQ
	iDi+royZzlJqsXNjJnBatprWhlQ7RhlqqsKMnsUD75dn0mMZPhmHE9d3xz+472B7bH+q0DLNcrJrG
	ZbEOjL0ir8L2G/P0fQNAvPxyvOJIF2tX/5A2YNWaUzLVJnFjIHWe7rMRmYlM7vAmEpn7/lTaSm1mk
	D57Yq0c1AQW/6cQlXHvCS7CICayD0NhZ9OVykaNKHV1mlZrcuu+/Z7XmmVK7z8QR/Fy+RwJs95cuJ
	saYuFGaDY53tA1c07rhOSYD/UkSxX2OgFmG7OelVwRpDnDZD8xLyBixuff43hDAhajMIStaGF4z6h
	VJLh3E8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpThJ-000000055dP-2qYo;
	Tue, 04 Mar 2025 14:56:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTed-000000054qw-1hb2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 14:53:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1E915C5DF3
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Mar 2025 14:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2505EC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Mar 2025 14:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741100034;
	bh=HsTlftYkKCeipenMXUveAq4+33NodqfLnatqWiT1P1s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iQZjmslbg1vFFJ4PTdTy19G+W1Rjw1PtEov7AIip06DVoW1KqELK+wZJrQLg/M20k
	 QWf348+vVS0vUKmR1VKvUVIZlKBhoVhSseO3OzyGyPBwwNx6YEL9AnfZYaesa9qRsG
	 TaDQWT7Ncx/huzWdUrN9/xyPNSZA2b4C3t3X7acNG8XYc6LAbNKEfM1ebyYCxhRRLX
	 +fiDqB43o77Q4FjuXWeJy8FRSm74g8A9TyMOBDDJMYWJVB+MiLNs8rmUAIYZ/EVH0G
	 XoKeHsmTOdTezWjGrvuxMq0QsseuvB2uAbtppJ5wreBzOuzuGtiCqSpU4Z1POrM5Zq
	 3u3E7zD4RIvdw==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e539ea490dso3415713a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 06:53:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbmj7Td0SR2S3qQjTlXXdE1kMgmPZte2rZusboSIvYGMtEP79su9ZcKf77SOzjkcRPNsRTNNaAWSSOrhiOl5qj@lists.infradead.org
X-Gm-Message-State: AOJu0YxU3Y7kaDnrGka/d/j/iNyEV6tgWiBjrbG11pMAEUlKQoLSedYQ
	gNNbe5GZ3HXJTMpKOnxz0SauRWgWW0JcIAOi6hMD/6ckypBfTqpdcgpGAd1RfvfXTTg5/z5lO0a
	bU+v6rhjFPqrvmjJvdkyDrZIM9Q==
X-Google-Smtp-Source: AGHT+IE5mO4/8XgjI8KQ2e5F+7omKuYNfycraNBEqmz3SlLPHhy1o9Ys5IwlzPRSfa7418Cy7GqCZEdMwYx2hxIjsjs=
X-Received: by 2002:a05:6402:278f:b0:5dc:caab:9447 with SMTP id
 4fb4d7f45d1cf-5e4d6af3a69mr47248954a12.18.1741100032682; Tue, 04 Mar 2025
 06:53:52 -0800 (PST)
MIME-Version: 1.0
References: <20250304093127.1954549-1-ping.bai@nxp.com> <20250304093127.1954549-2-ping.bai@nxp.com>
 <20250304131314.GA2441686-robh@kernel.org> <AS8PR04MB8642D20F0F5A7E8622A7685F87C82@AS8PR04MB8642.eurprd04.prod.outlook.com>
In-Reply-To: <AS8PR04MB8642D20F0F5A7E8622A7685F87C82@AS8PR04MB8642.eurprd04.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 4 Mar 2025 08:53:41 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJd06AOJKXFiDq=rihFa7qWnLciBeHKCKwkRUfF7AJTMA@mail.gmail.com>
X-Gm-Features: AQ5f1JpxHqjc804-H4q0nUUAZsYT3JdBkeRI39RJP2dCndrM526cVcfcNMXQa1o
Message-ID: <CAL_JsqJd06AOJKXFiDq=rihFa7qWnLciBeHKCKwkRUfF7AJTMA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: dma: fsl-edma: add
 interrupts-extended property
To: Jacky Bai <ping.bai@nxp.com>
Cc: "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_065355_526218_3835FC87 
X-CRM114-Status: GOOD (  13.94  )
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

On Tue, Mar 4, 2025 at 8:40=E2=80=AFAM Jacky Bai <ping.bai@nxp.com> wrote:
>
> Hi Rob,
>
> > Subject: Re: [PATCH v2 1/4] dt-bindings: dma: fsl-edma: add
> > interrupts-extended property
> >
> > On Tue, Mar 04, 2025 at 05:31:24PM +0800, Jacky Bai wrote:
> > > Add interrupts-extended property for edma that has multiple interrupt
> > > controllers used.
> >
> > Did you try using interrupts-extended? No. Because either is supported =
by the
> > tools already.
> >
>
> We need to use interrupts-extended property for i.MX94 because for the ed=
ma's
> interrupts, some are connected to irqsteer interrupt controller and some =
are connected
> to the GIC. make dtbs_check report error, so I add this dt binding change=
s.
>
> Sorry, Which tools are you referring?

dtschema

The schemas specify 'interrupts' only. The dts files can use either
interrupts or interrupts-extended. If that doesn't work for you, it is
a bug in dtschema.

Rob

