Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD995CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 16:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3rjYwyXp9LVnLG0ToWc25PWAKwvGflge9Yq+toMptA=; b=tCJ/kbnGGhpxG5Tjx5hZ7+UhgZ
	t9RhzhNM0I69lNrc7oHtE/L3sBa6cP7fOHEr149WQDsEdlwVlCWn1KFifzVdnpBgOKK/gSVkxCroa
	eyItdgaYZgHth76xArq6hSJEcA5mbO+/0F/aH1GVzNzv68dhs1Lu0LicRA/TUVxrXWIqxiVpjKA6n
	z8jWPtRrad3UTGlKzyD0ruW3Gpsr0YeMTT3qzMPJoR6ckkSXTb+PznE/CsWIHTK6Urp/VlyAQSSo0
	ElFdosCAZdpPT56CYInSm2UyLt6uJOg3VnJ/2LmIoAkDPf26z76QN/9t/N6EtLbbsONCFIqfZq6J3
	kU6OVuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabm1-00000002kwX-3Dcf;
	Fri, 19 Jun 2026 16:08:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabm0-00000002kw8-0kEY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 16:08:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 48FC5601E1;
	Fri, 19 Jun 2026 16:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B361F000E9;
	Fri, 19 Jun 2026 16:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781885331;
	bh=g3rjYwyXp9LVnLG0ToWc25PWAKwvGflge9Yq+toMptA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PiigFRnMAgWqZbRw8JbcDuSyWN/DDDNft2XfAW1edDrOHtPgypB6APfPuGmIhLHu1
	 xidrGAjPub7xmEhPpv1ekZfWyczoaWbpqZTAK/KzcOr0E4KfwB2DcrpD3CdyY0owFy
	 /j5YhXdsrBRlZBxASaxKu1Z3s2+GqIRNdq34COVmnlFLHKIdtSDbXOmMFdKsM6xc++
	 05I6mBEafF6I9VrpOgGSAkdHdO7/yaqfEkuYXGHivIExGArF4ucv3FWG+vGvVlhFLA
	 zc5Iznd/AAZlF+q/kau+VlvD6cfyfYH5y2fpPQTcAHNfaYM6SxZNmplUeHGccTBJJv
	 ME0pKRKGCXJ1Q==
Message-ID: <7d946861-c3cb-4512-9d5f-9f4cb9b7ee8a@kernel.org>
Date: Fri, 19 Jun 2026 19:07:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] ARM: NXP: Drop NOMMU platform support
To: Frank.Li@oss.nxp.com, Arnd Bergmann <arnd@arndb.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Stefan Agner <stefan@agner.ch>, Fabio Estevam <festevam@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hardening@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
References: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hello Frank.

On 6/19/26 18:40, Frank.Li@oss.nxp.com wrote:
> Commercial users and hardware vendors migrated to Zephyr or other RTOS
> solutions years ago, leaving the NOMMU platform support effectively
> unused and unmaintained.
> 
> Remove the obsolete support to reduce maintenance burden and simplify the
> Freescale/nxp platform code.
> 
> Some driver code still be kept and may clean up later since it is possible
> reused by other SoC.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

This change is a bit too early to happen, I prefer to get it orchestrated
by Arnd. So, as for today I NAK the change for its NXP LPC part.

> ---
> Frank Li (11):
>        ARM: dts: vf610m4: Remove NOMMU platform support
>        ARM: dts: imxrt1050: Remove NOMMU platform support
>        ARM: imx: Remove NOMMU platform support
>        clk: imx: imxrt1050: Remove NOMMU platform support
>        pinctrl: freescale: IMXRT: Remove NOMMU platform support
>        ARM: imxrt_defconfig: Remove NOMMU platform support
>        ARM: dts: lpc: Remove NOMMU platform support
>        ARM: mach-lpc: Remove NOMMU platform support
>        ARM: configs: lpc*: Remove NOMMU platform support
>        clk: nxp: lpc: Remove NOMMU platform support
>        pinctrl: nxp: lpc: Remove NOMMU platform support
> 
>   .../devicetree/bindings/pinctrl/fsl,imxrt1050.yaml |   79 -
>   .../devicetree/bindings/pinctrl/fsl,imxrt1170.yaml |   77 -
>   arch/arm/Kconfig                                   |   12 -
>   arch/arm/Makefile                                  |    2 -
>   arch/arm/boot/dts/nxp/Makefile                     |    1 -
>   arch/arm/boot/dts/nxp/imx/Makefile                 |    2 -
>   arch/arm/boot/dts/nxp/imx/imxrt1050-evk.dts        |   72 -
>   arch/arm/boot/dts/nxp/imx/imxrt1050-pinfunc.h      |  993 ------------
>   arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi           |  160 --
>   arch/arm/boot/dts/nxp/imx/imxrt1170-pinfunc.h      | 1561 -------------------
>   arch/arm/boot/dts/nxp/lpc/Makefile                 |    9 -
>   arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi             |  543 -------
>   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts       |  273 ----
>   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts      |  236 ---
>   arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi             |  540 -------

NXP LPC32xx is ARMv5 and it has MMU, hence it's plainly out of scope of
the proposed "dropping NOMMU platform support".

-- 
Best wishes,
Vladimir

