Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7E8C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 06:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYRzu3jfMNhVYgtIHP1isRYc6+bNrNrmupKTKDOzriE=; b=BRnHjYqnfS571p+uxUdpFGXkSM
	8boNCczn0RnQ9T2jJxR4ethAD/u+621Mn2YO0IeTuPIWN/Nf5c8N1jM2lYJFsUd600/c53rwKrOSb
	4H7fR5qOv2Ry7eKnPltf4M1Uk7IGXb0jLvEVfSc1IWQiN3/moU1oUffzwV+PNhZ10wYNhwjDWKzXZ
	sGT0Y/4CKbGfMvSzBOlIagdnzCziaU8Oy5uogNmXz/WMtRQrJmC92HHOMzv/JwZ1uVvdT4k4xtssI
	18OzNkY+XjVTuHiPmQIa3j4DvAgiFzm4dbn+K6ivtg+pxPfwISFZkK1fhDz3Tcdyvhmog9SFs7MuO
	qUmm8mAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEMIW-00000008TG7-0Rhx;
	Mon, 12 May 2025 06:05:56 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEMGS-00000008T56-3Ixn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 06:03:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uEMGB-0008I9-Dc; Mon, 12 May 2025 08:03:31 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uEMGA-002JtD-2f;
	Mon, 12 May 2025 08:03:30 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uEMGA-000RAK-2B;
	Mon, 12 May 2025 08:03:30 +0200
Date: Mon, 12 May 2025 08:03:30 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Denis Benato <benato.denis96@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm: fix imx_* defconfig
Message-ID: <aCGPMvP6F6r-57KF@pengutronix.de>
References: <20250510011806.13470-1-benato.denis96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510011806.13470-1-benato.denis96@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_230349_000379_83DB6536 
X-CRM114-Status: GOOD (  20.77  )
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

Hi Denis,

On Sat, May 10, 2025 at 03:18:03AM +0200, Denis Benato wrote:
> Compiling the kernel using affected imx defconfigs lead
> to a hard CPU crash that reaches a state where each register,
> including PC ends up in 0xDEADBEEF.
> 
> That is because the SoC support depending on CONFIG_ARCH_MXC
> gets disabled since CONFIG_ARCH_NXP is not defined while
> said feature depends on it.
> 
> The default arm defconfig is unaffected as it defines
> CONFIG_ARCH_NXP=y correctly as excepted.
> 
> These patches solve the crash causing my confusion:
> https://lore.kernel.org/all/c84e8246-8104-4409-8d95-389d61bc07af@gmail.com

In this mail you say you want to start a ARMv8 i.MX8MM board. The
configs you are changing are for old 32bit ARMv4-7 SoCs.
arch/arm64/configs/defconfig is for you.

Sascha

> 
> Denis Benato (3):
>   ARM: imx_v4_v5_defconfig: define CONFIG_ARCH_NXP
>   ARM: imx_v6_v7_defconfig: define CONFIG_ARCH_NXP
>   ARM: imxrt_defconfig: define CONFIG_ARCH_NXP
> 
>  arch/arm/configs/imx_v4_v5_defconfig | 1 +
>  arch/arm/configs/imx_v6_v7_defconfig | 1 +
>  arch/arm/configs/imxrt_defconfig     | 1 +
>  3 files changed, 3 insertions(+)
> 
> -- 
> 2.49.0
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

