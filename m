Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87EACA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKdkz1BYvLrQk/8aMA/M0VzHCoi8lQfFBU94QLV8ZrY=; b=y3s6vWN0A8gm7TZUfTMLNJCeEJ
	rCMLQe3bbbFG3dBczLZ0mkcBcq2uZIlTuGhXhllWx3gXKa+JIUtt87AAlv63PXMTC6SCREzqnsKco
	HBYwpFJIoF9aLvnyY77E2XYD4sZJCNuzW1E8vS5rO72CwgvIuDyAuWr4Q1qHqj4DXi6fAzaE0OXQg
	MhXB0xCVEKh4vRvtZKyS9Fpxts09xmxcjSdTYfl39ypx4CESDXCxn5gvs7dgYWicwHsIXdfuD8pCa
	j0nIJI9vmvRg6Zlj0irWLoqMDUOAn7IK+9RSQMC7Ev51NsdLN+oy2zRnpicmlmOkGxoG+hLqa1oUn
	vARwGV2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwCz-00000006VFF-3lDP;
	Wed, 30 Sep 2026 15:27:01 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwCw-00000006VDm-2kcG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:27:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6B3D24E410D7;
	Wed, 30 Sep 2026 15:26:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3B8C860749;
	Wed, 30 Sep 2026 15:26:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2917103281E9;
	Wed, 30 Sep 2026 17:26:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790782013; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=WKdkz1BYvLrQk/8aMA/M0VzHCoi8lQfFBU94QLV8ZrY=;
	b=YCigCSQ/jqKVGvnheb3+DGcKvvYgGY5QvVbgPml2ZqdCs1fe0uap+hqMvnedjqX5RbmJo/
	0+wacTSCNn+VDU+AanMmOpoloFY86p0C8dQd8Y0XKYpmiIvRdm0V2L3jOlWOFgWJUl6ocx
	U9n4cEtex4QKLKEXj7ItBIF0T7hKcE6RynSirU5B/lclASfld4seim4lyBTYwguZ+SDnB6
	VLpiUKoHPhqDbqsCNkPK+/ogSn6TbkC/4pitlJe+zVLBV1AQTgv6Nfo1yzdrsDBd8zcT/Z
	ZYwSGoAaqEW+n/RnuMbDmHmK/kt7Lge14ZjxcZ+r+KzyCYnH0eQuWGI7PqkFgA==
Date: Wed, 30 Sep 2026 17:26:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue6KaGOiBbUEFUQw==?= =?utf-8?Q?H?= 1/8] dt-bindings:
 i3c: Document the AST2700 I3C controller
Message-ID: <2026093015264653e04d9e@mail.local>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
 <20260901-b4-i3c-hci-ast2700-v1-1-19909e7cbd7e@aspeedtech.com>
 <20260907-imaginary-economic-oyster-57cdd6@quoll>
 <20260917154754dd1eefbe@mail.local>
 <SEZPR06MB7237179374D186C39384D9808B812@SEZPR06MB7237.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEZPR06MB7237179374D186C39384D9808B812@SEZPR06MB7237.apcprd06.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_082658_834518_FB83C0FC 
X-CRM114-Status: GOOD (  18.37  )
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

On 24/09/2026 05:39:47+0000, Billy Tsai wrote:
> > I guess we need to make them generic. Probably nobody needed them yet
> > and not all the controllers will have support anyway.
> > However, I would like to make sure we get enough commonality between
> > controllers that support setting the timings individually, can you
> > check?
> 
> I went through dw-i3c-master, i3c-master-cdns, and the AMD/Xilinx AXI
> I3C driver. Every property in this set has a direct counterpart in at
> least one of them:
> 
> - Open-drain and push-pull SCL high/low: dw-i3c-master has
>   SCL_I3C_OD_TIMING/SCL_I3C_PP_TIMING (high/low count each); the
>   AMD/Xilinx driver has separate SCL high/low and OD SCL high/low
>   registers.
> - SDA/data hold time: the AMD/Xilinx driver has its own hold-time
>   register computed as a percentage of the low period; cdns has a
>   data hold delay explicitly there to meet the MIPI I3C tHD_PP
>   minimum "regardless of PCB balancing", their words for the same
>   board-variance concern we have.
> - tCAS: dw-i3c-master's own comment says its MST_FREE register
>   represents tCAS in pure I3C mode; the AMD/Xilinx driver computes an
>   explicit tCAS minimum from the spec value.
> 
> None of the three expose any of this through a DT property today.
> They either derive it purely from the bus rate, or hardcode one fixed
> value per compatible (cdns's data hold delay is a flat 10ns baked
> into its per-SoC match data, the same default we picked
> independently). So there's no existing naming convention to be
> consistent with, but the underlying quantities are clearly common
> across implementations, not something specific to our controller.
> 

Thanks for the investigation, then let's have them in i3c.yaml.

> Thanks
> Billy

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

