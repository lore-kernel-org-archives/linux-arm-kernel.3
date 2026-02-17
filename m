Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E0AE68158
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 09:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggPH5Y20hoWNO8lI+FCNkaDwu2pNsKAXw0sa+ZPU0LQ=; b=1D2lMM5fYGZE9nMlN2jH9NL3YS
	MiV1zN/YgzVRwqiPa61yjtlvORV6TGSnSnIZvROyr72W9488wX3DYdzW9+UQ4N6jT9634RPerugny
	XY6dVrgP3t6Mrte0FyfjTEbaBdlLePWT0JHvtCTwEyK38fQto3MJobIHeo/zqXFwZ8jwdy26/0K4j
	9nMSxG6aa/u7CE9SAVmd7SQLyAuDnJPbHfPLm7AyZQKLumIKpEkosDt60axOhcJF1rLskJm8BxUzM
	OmvpQs3F4uZWfUr+8QYzsokRodssmnAOlFMsrTJnBI3UjdnUqRySzTypqzeNSGIY/9aD/1UQbS0pc
	JvRbAS5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHm4-00000007yk7-0yqM;
	Tue, 17 Feb 2026 09:53:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHm1-00000007yjB-1giD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 09:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ggPH5Y20hoWNO8lI+FCNkaDwu2pNsKAXw0sa+ZPU0LQ=; b=Dn0hrzvM/VJdeQsAGjqG1czRZm
	pnpIslEfGJ2Qn3LVa2VS0/aVSgJ0mVSIq4o8w3E20nWcK683vbm7ojtr9TS7yfiZvgAIeIHEH2eGI
	Rt4UIoUkkNXN3GpzZ6l2IflQQxGDpFxR4x7am3yA1JMoCeuwj+Q2dSY3TX0DVVX10gp8QZnOPvWoP
	juGx6mXJ3jAYX8L691jz3Wo7qqm/crGWYOKZ09BsHvbyVwdwxp/kGwkVGyqJY997OqQQBWaD+2PLf
	xh5spBVW18Iq3mrnZDJi0/V81dBnbegBstYT6/3sJYgHLFqch7cj8JNtiCBS9iXaYnLu7q3Dc9Y4b
	ciakkJBQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41366)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vsHlu-000000007b6-2njy;
	Tue, 17 Feb 2026 09:53:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vsHls-0000000017p-1Ns6;
	Tue, 17 Feb 2026 09:53:32 +0000
Date: Tue, 17 Feb 2026 09:53:32 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>
Subject: Re: [PATCH 1/3] soc: tegra: Make ARCH_TEGRA_SOC_FOO defaults for
 Nvidia Tegra
Message-ID: <aZQ6nF9NJA9bqjSD@shell.armlinux.org.uk>
References: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
 <20260217-soc-tegra-arch-kconfig-v1-1-81bf5674d032@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217-soc-tegra-arch-kconfig-v1-1-81bf5674d032@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_015341_444949_5D1DD52F 
X-CRM114-Status: UNSURE (   8.70  )
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

On Tue, Feb 17, 2026 at 10:16:36AM +0100, Krzysztof Kozlowski wrote:
> By convention, only one globally selectable ARCH_PLATFORM is expected
> for given SoC platform, defined in arch/arm64/Kconfig.platforms or
> arch/arm/mach-*/Kconfig, because we target a single multi-platform
> kernel image.
> 
> Platforms wanting different granularity, e.g. due to size constraints on
> their devices, should be sure that globally only one ARCH_PLTAFORM is

typo: ARCH_PLATFORM

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

