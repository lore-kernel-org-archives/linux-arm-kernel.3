Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78D1C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3QVEMzQj1M1qoOvwBQVP/gPdLVcfo7m2wgq/noupkP4=; b=JtP7LQMah6Knowv11HAdkGfdBI
	M9VcA27RBJrQrAWAZdEx7pNa/GhMumf9rcOnGqmWh9nDx0zEkHktCAQlg8ZwzsceL8FeKgVqkQnWM
	XVAfw4JMUBtnP673Fpxhb1q4VifhjvCA6SoEaigh8GgPJ3dkUzKNOepYjYyBhj8Yya//7KC6t/Bc/
	Jz6XreLsvpYgt1ytntdr8ql5/c+6uSl8vpcIYRB4xBS5ORpPYqQ6rnBRoYEGtbdoHBS36mCUsstOL
	BxjnpfoC42efsrB/oVTtCAi4B12MDywTCrlmYzGqbG7At0ZPXHiLyFnFgZLHUemWQdFma+9PsbfBl
	mEb8GnsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnnc-0000000EEdq-3C5p;
	Thu, 12 Jun 2025 19:41:20 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhnV-0000000DLy4-1oyV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:16:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uPhnS-0002jo-Lp; Thu, 12 Jun 2025 15:16:46 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uPhnS-00389B-1F;
	Thu, 12 Jun 2025 15:16:46 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uPhnS-008vXS-0v;
	Thu, 12 Jun 2025 15:16:46 +0200
Date: Thu, 12 Jun 2025 15:16:46 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 4/4] arm64: dts: imx8mp: Configure VPU clocks for
 overdrive
Message-ID: <20250612131646.be2mad2hqeh33wqx@pengutronix.de>
References: <20250612003924.178251-1-aford173@gmail.com>
 <20250612003924.178251-5-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612003924.178251-5-aford173@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061649_467313_336015E1 
X-CRM114-Status: GOOD (  10.97  )
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

On 25-06-11, Adam Ford wrote:
> The defaults for this SoC are configured for overdrive mode, but
> the VPU clocks are currently configured for nominal mode.
> Increase VPU_G1_CLK_ROOT to 800MHZ from 600MHz,
> Increase VPU_G2_CLK_ROOT to 700MHZ from 500MHz, and
> Increase VPU_BUS_CLK_ROOT to 800MHz from 600MHz.
> 
> This requires adjusting the clock parents. Since there is already
> 800MHz clock references, move the VPU_BUS and G1 clocks to it.
> This frees up the VPU_PLL to be configured at 700MHz to run
> the G2 clock at 700MHz.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

