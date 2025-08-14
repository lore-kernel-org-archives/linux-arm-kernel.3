Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79BFCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbR4eavo+UWsC7orzrkKTILPFvXCBJmRNvGulr+5qiU=; b=IRfi4KHdPMJq8Bru0kgNd4IvJn
	GkerkesdTowb1HkqWswj73s+5jnoRiIVJzyYG2nEOVO+6Uyll6e6FFWfSdql5EjbhQW+vsVsdm2rZ
	V3RHKOlRLdmUU96IRulB9Dx05RL9ds327WFKHkuR1iDzjQ4qP4SDmdSTZZ5p8RoZueb2JYu7rwwcK
	PDPS5mRhn9XoA2dIKthZIay7KmaJ/UzLImRwOsoHRtp6VYXJOISNS2psMLvJMFWcx1jAYv2CtjM+d
	xycRBIaGI1rIchOO/04sbxjdTrFQ6EYbYMTXtid2sy6I7P/w4MDxd+VSFuB0TGMMfWjWprZbdlwAm
	S+UNWFoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXoU-0000000H0GQ-2xRD;
	Thu, 14 Aug 2025 13:16:14 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVd2-0000000GgAf-3k4y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 10:56:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umVcq-0001YI-AE; Thu, 14 Aug 2025 12:56:04 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umVcp-000EyL-36;
	Thu, 14 Aug 2025 12:56:03 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umVcp-000Hxp-2o;
	Thu, 14 Aug 2025 12:56:03 +0200
Message-ID: <7933061270daa3f9c53021064f92f7431fdac9de.camel@pengutronix.de>
Subject: Re: [PATCH v12 0/3] Add support for AST2700 clk driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mo Elbadry
 <elbadrym@google.com>, Rom Lemarchand <romlem@google.com>, William
 Kennington <wak@google.com>, Yuxiao Zhang <yuxiaozhang@google.com>,
 wthai@nvidia.com,  leohu@nvidia.com, dkodihalli@nvidia.com,
 spuranik@nvidia.com
Date: Thu, 14 Aug 2025 12:56:03 +0200
In-Reply-To: <20250708052909.4145983-1-ryan_chen@aspeedtech.com>
References: <20250708052909.4145983-1-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_035616_927172_5C00D22A 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

On Di, 2025-07-08 at 13:29 +0800, Ryan Chen wrote:
> This patch series is add clk driver for AST2700.
>=20
> AST2700 is the 8th generation of Integrated Remote Management Processor
> introduced by ASPEED Technology Inc. Which is Board Management controller
> (BMC) SoC family. AST2700 have two SoC connected, one is SoC0, another
> is SoC1, it has it's own scu, this driver inlcude SCU0 and SCU1 driver.
>=20
> v12:
[...]

Applied patch 2 to reset/next, thanks!

[2/3] reset: aspeed: register AST2700 reset auxiliary bus device
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D9c50f99c1353

regards
Philipp


