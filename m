Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8DAC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 08:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAiHq+xguJpa7DgogLPbFgMp/g76RQv1ZbsletpzmXM=; b=2LuC6DFyX5wN2/e4iVXPXfQdFd
	f3TDHesb2WWQTAjiC7yNnebX4psmGfmDsQBbVNBcgth1cPwCHn+kPEPUXC852evY8j8iU8omTECTs
	lQakmZbRX2cZdB2+AsOgp5qzhu/nu0aiEr9c7q8H5aB/yvh1I1T2BkdumRa1Dvr4pXxUx4IAEydvd
	qoWyLKJcJFQZM7lVAsaok3P4WkCzPc7Ye5IsvveevCsiYUK9VgjIUQCBQWLLDl0cGBTq2w0KF6nSX
	r/77/LsHmosSfFdyiPK8vmropcn2vkBYBO6hchqZwdOpirs/59WUNXVQ/hQ+O/kO6WUIPU2mxjkvc
	eWtJhezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNhS-00000006p78-0Bf7;
	Mon, 11 Aug 2025 08:16:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNKV-00000006lKd-3kWv;
	Mon, 11 Aug 2025 07:52:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=JAiHq+xguJpa7DgogLPbFgMp/g76RQv1ZbsletpzmXM=; b=L4ozjTwyfMcjPYnRFixEbHH4ir
	OtDGYzXskLFxRTpqzreCLs54DL9ozxjpg9gYOxs+glSCKvRrcs1ZqsLoMtKToiGM9/Oi72eblV8kJ
	pYMXRcsBQItns1JNSFHV77FOK5YgbE41UyT59SrLZycFedRpMi1DOoo8o232Laf6IuESpYNHwUiEh
	nZh2HY0HfwZcWT85YJKjPS7MoiJAgLjUf/j916tNXYbQy2thG2dBMvlDbs2KEKnisCnZBvDPLeaBE
	WAd3LxFq4zWQnOmZUU5rx8+L6nEObF56UNfsH6jUXG/PjQLuKGNk6+/eCzjY09k2vLx6Zq0OovrL2
	aHmDC1eQ==;
Received: from i53875a0c.versanet.de ([83.135.90.12] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ulNKM-0007Ro-Pc; Mon, 11 Aug 2025 09:52:18 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3399-pinebook-pro
Date: Mon, 11 Aug 2025 09:52:05 +0200
Message-ID: <175489870467.808197.16352396043488314840.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250730102129.224468-1-pbrobinson@gmail.com>
References: <20250730102129.224468-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_005227_929662_0760AE1E 
X-CRM114-Status: GOOD (  11.54  )
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


On Wed, 30 Jul 2025 11:21:26 +0100, Peter Robinson wrote:
> As described in the pinebookpro_v2.1_mainboard_schematic.pdf page 10,
> he SPI Flash's VCC connector is connected to VCC_3V0 power source.
> 
> This fixes the following warning:
> 
>   spi-nor spi1.0: supply vcc not found, using dummy regulator
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3399-pinebook-pro
      commit: d1f9c497618dece06a00e0b2995ed6b38fafe6b5

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

