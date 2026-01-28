Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9067ED35691
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 08:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3R30d+5fKmqKbAPWypPmQzkA4SsVPnLS8LHH+omZd8=; b=nQ4L6n0Vo2JZbGnA9A174CtFbM
	809pkkN/i6/H5qH7YA8AFP3e/wwNJTnOqguKdSpf6oG58UHNnpOkPl+Mxraq1d4VSccl3MoXJQLrq
	K4hs0ic9CQd1hqZ/IcbZQuK/T8Wspn0fXNUKDjpCnAlJzgaEKiLyBn3RSQOtzqMcfmpLtNVqw9xU4
	xUDpBNeganrzcrakgSu/XlE2dY9XT06XR08U4bEi3ZTtydpQWIBFo8slUTUYV/C6rWOUUQQP9qSkI
	06UKHXasnGmzauGkMZp75105CDdZLqN0TlvxuXS31Oem8jh4d/w9Qi1/TfpDZXg+10pbgERDbFOTJ
	KZkChOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0yL-0000000FflU-1VQ3;
	Wed, 28 Jan 2026 08:32:21 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0yI-0000000Ffkk-3KeR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 08:32:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44FDA109759;
	Wed, 28 Jan 2026 09:32:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769589136;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q3R30d+5fKmqKbAPWypPmQzkA4SsVPnLS8LHH+omZd8=;
	b=HVnfX9MW9g5NgVjIht5pFJzcmD9sGDIMGDHhxvBZS12lucHWLpph3c7P2bIexJZ6bvAnUK
	aVtXvA6V5cX8Eos4cqgh5Ru7SGAl/Pm6+Uj6THKrjD5UimXi4Y3Ls8ve8lS8nfgddDCceE
	qhmMlgCxs0N5SEtcqs/k/S35olcIjwr6XnFcUg8uWp4sl7gvag6gEUvnQ4yYG88t8FBs2E
	9JLUKSDOkg5WbmuMm33L6FF8SOx/unto9rk1BbCZGVq+ojkucGhJmONvnR/Tw1fy0bHUir
	dhDcG91qxmkc7cuaj1vu0665gWFh8P7I4TZvd8zEZ6oLIFFbMIRNLRsus3djSA==
Date: Wed, 28 Jan 2026 09:32:07 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Peng Fan <peng.fan@nxp.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Abel Vesa <abelvesa@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3] clk: vf610: Add support for the Ethernet switch
 clocks
Message-ID: <20260128093207.6b4c864b@wsk>
In-Reply-To: <PAXPR04MB845936115A4DA73A9042650C8890A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260127085150.3040586-1-lukma@nabladev.com>
	<PAXPR04MB845936115A4DA73A9042650C8890A@PAXPR04MB8459.eurprd04.prod.outlook.com>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_003219_057420_4E19CAEF 
X-CRM114-Status: GOOD (  22.52  )
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

Hi Peng,

> Hi Lukasz,
> 
> > Subject: [PATCH v3] clk: vf610: Add support for the Ethernet switch
> > clocks
> > 
> > The vf610 device has built in the MoreThanIP L2 switch. For proper
> > operation it is required to enable ESW and MAC table lookup clocks.
> > 
> > The MAC table spans from 0x400E_C000 for 0x4000 and it is necessary
> > to provide clocks for each AIPS1-"slot", which size is 0x1000 (hence
> > four separate entries).
> > 
> > Those can be enabled via clock gating CCM_CCGR10 register
> > (0x4006_B068).
> > 
> > This patch also adds VF610_CLK_ESW and
> > VF610_CLK_ESW_MAC_TAB{0123} macros definitions for L2 switch.
> > 
> > The VF610_CLK_END has been removed from dt-bindings, as its
> > number had to be increased when MTIP L2 switch clocks were added,
> > and defined locally in clk-vf610.c driver.
> > 
> > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> > ---
> > Changes for v2:
> > - Squash clock DT bindings to this single patch  
> 
> Sorry for not being clear in last comment, dt-binding
> update should be in a separate patch. So please
> separate into two patches in one patchset.
> 

Ok, so I will add dt-binding as a separate comment and as Andrew asked
I will add comment to vf610-clock.h about VF610_CLK_END being moved to
clock driver as a "local" definition.

> Thanks,
> Peng.
> 



-- 
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic

