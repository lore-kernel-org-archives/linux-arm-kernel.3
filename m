Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D076DC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 15:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTWZ3fHGa7D6q7y60m0EG2fACXLmItVUIq7xJ4IjjQY=; b=0hjT3+yODa7/IaKlhCpqQvMl0o
	glLY/Xg1HiTkRH5p/Tv3qEk3rqp8xIVtqfbOkjE+GqBQMxjGjPM8IzjdqOEdXF3UriRn035gIgt7/
	5zjKgTCzGF0FjXPpRLmWqLX25+AGs4gvPpzeeiKg5bbpJbOF2ssYrTIan80n+k/6TPt2a/PscXYgm
	aGZqs3AjYM1i8eFuUnOs5r753+QeRQUixdXMcd5MUvOmwL7RUwmbPxHhJR3wrsb+yNmE8ACu+FZLe
	g3rqVRZuRVc3CTR6vNHR3lg85VadjQx513kXnRt3Hh4c0H6CTPNnGOA3DIq3ojxkpM8pqXZso6XFr
	JBsXTj7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdN8-00000005xFE-1hFy;
	Tue, 01 Jul 2025 15:58:14 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWblQ-00000005eyy-1aCI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=BTWZ3fHGa7D6q7y60m0EG2fACXLmItVUIq7xJ4IjjQY=;
	b=U3CnYPmPEVwCoaI0np4ka5Gsdc2I4ORmD17aTa2WfYQDoNSHi9mdV3lbg68Sjk
	4vQ2dmezvfuCeJRm9pLq4AAGmbVAZaOeQi6zLmghRQrIx3Ww/OaGDjWfAULoj3Ar
	6EC3XChsX8k1tCEaNfiAbYisoRRFRr9tZ01RSZTiEF/Cw=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD336hg7WNovcABAA--.3851S3;
	Tue, 01 Jul 2025 22:14:58 +0800 (CST)
Date: Tue, 1 Jul 2025 22:14:56 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	andrew@lunn.ch, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: freescale: imx8mp-var-som: Add EQoS
 support with MaxLinear PHY
Message-ID: <aGPtYHLk+UbRscnk@dragon>
References: <20250609160949.35654-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609160949.35654-1-stefano.radaelli21@gmail.com>
X-CM-TRANSID: Mc8vCgD336hg7WNovcABAA--.3851S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr1kKFykCry7XrykKFWxJFb_yoWDAFbE9F
	W3Xr48J34UtFyfGanYgrW8JF1Fkan5XF10gr4UWr93taySvws3AFyvqa45KF4UXayftrsx
	Z392krWFv34rWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjVbyJUUUUU==
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxx9ZWhjvz7WaAAAs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_071513_414067_72CBD00D 
X-CRM114-Status: GOOD (  11.82  )
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

On Mon, Jun 09, 2025 at 06:09:48PM +0200, Stefano Radaelli wrote:
> Enable the EQoS Ethernet controller on the i.MX8MP VAR-SOM with the
> integrated Maxlinear MXL86110 PHY. The PHY is connected to the EQOS
> MDIO bus at address 4.
> 
> This patch adds:
> - EQOS controller configuration with RGMII interface.
> - Proper reset timings.
> - PHY power supply regulators.
> - RGMII pinmux configuration for all data, control and clock signals.
> - LED configuration for link status indication via the LED subsystem
>   under /sys/class/leds/, leveraging the support implemented in the.
>   mxl86110 PHY driver (drivers/net/phy/mxl-86110.c).
>   Two LEDs are defined to match the LED configuration on the Variscite
>   VAR-SOM Carrier Boards:
>     * LED@0: Yellow, netdev trigger.
>     * LED@1: Green, netdev trigger.
> 
> The RGMII TX/RX delays are implemented in SOM via PCB passive
> delays, so no software delay configuration is required.
> 
> Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>

Applied, thanks!


