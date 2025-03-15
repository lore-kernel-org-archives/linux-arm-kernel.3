Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2D9C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 09:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uan58mOfGqXZewfSHTwsCfMcl2WyGEJDtkSijiVP71Q=; b=S1TuPm30w433RGQU/Fh41pnAHf
	RrfekKSfkPUT4Ka5xjyv1SNv+LgUpbNhkqsfOgcFI1tSO2eeVe5bZh2LBLuuN2mkyLV3B804UGqjn
	kguyMYAUIbbZxihpJwQubkuONguQ6U3F8zoyhb8S6lR0Y7AwAr1JuQ+kM8VxzeCWZ8Icj7xG+FF7k
	FtKiVEiosBUQLTQx07rpXTuDXBO/9m6G5WYIvEBq7POJQURDWe8EGFa/E7+kh8UUVoSCurNXyuO4t
	WAGZvdZbDFSpoo8aFM1YPQEIX0kH0CIjo95I889aDjdlWDPLMPB1hkU/+TfAVwnT9ayO8jjFYcyeG
	STI0JzxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNoM-0000000G8cu-3DnB;
	Sat, 15 Mar 2025 09:28:06 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNmZ-0000000G8JU-3dMp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 09:26:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1ttNm1-00047n-9c; Sat, 15 Mar 2025 10:25:41 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1ttNm0-005qTX-1t;
	Sat, 15 Mar 2025 10:25:40 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1ttNm0-00EwMG-1T;
	Sat, 15 Mar 2025 10:25:40 +0100
Date: Sat, 15 Mar 2025 10:25:40 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Julien Boibessot <julien.boibessot@armadeus.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: opos6ul: add ksz8081 phy properties
Message-ID: <Z9VHlE-5lvtoYFYb@pengutronix.de>
References: <20250314-opos6ul-fix-ethernet-v1-1-1c0172949b40@armadeus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250314-opos6ul-fix-ethernet-v1-1-1c0172949b40@armadeus.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_022615_900445_303EC5CF 
X-CRM114-Status: GOOD (  14.62  )
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

On Fri, Mar 14, 2025 at 05:20:38PM +0100, Sébastien Szymanski wrote:
> Commit c7e73b5051d6 ("ARM: imx: mach-imx6ul: remove 14x14 EVK specific
> PHY fixup") removed a PHY fixup that setted the clock mode and the LED
> mode.
> Make the Ethernet interface work again by doing as advised in the
> commit's log, set clock mode and the LED mode in the device tree.
> 
> Fixes: c7e73b5051d6 ("ARM: imx: mach-imx6ul: remove 14x14 EVK specific PHY fixup")
> Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>

Looks good to me. Thank you!
Reviewed by: Oleksij Rempel <o.rempel@pengutronix.de>

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

