Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBFBE69E9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 23:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BChGZI6+CUoQhFa8aZUCtl71jkoFFpifvlCc4sRJtqI=; b=2aN/3JeA2wdG5EIfCfQe6HmYTy
	Is2rlqnExMId4DYehRa98ydtFE8XmHMz0TWQ7dBADd5b22TYPL81E/WTFr8cZb0v/Osx6dhgdZzeN
	vi7+voE2nfZCt86FMSluHSnd2vOrwICf+8lp3eM0c+HBTMdZK6gBE6wzzTA0rQ3/C5mSjNJoinE+1
	7iYkTJP0i84owbfwSTgoI6WnQ/WGiqQwpdZJd22HgPqsFbC+LVsrH9TPkFiIhHZynX2ndXYAGYnsy
	mTj5XNl9SjpnWufRrgoavQDhIMgh3BlT3k0FauBoAkFsCe1IEuIB+RQh5j157f2jBCaeKZ1mgbSKH
	66tpXZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIFt8-00000007j1I-3rN6;
	Mon, 02 Dec 2024 23:31:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIFrC-00000007ife-0x5b;
	Mon, 02 Dec 2024 23:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BChGZI6+CUoQhFa8aZUCtl71jkoFFpifvlCc4sRJtqI=; b=cIL9VA43cBBzteiJD+6dunHlot
	AP+1d54xkDHCIuxb5h+4MWzBikXAyUa3Zjs6TZZQgYAxXfp4Ys3O3uM/NY/bw84Kbryn0aqumR/RG
	Oqly4Ej7sdSGV/pNkT63XPIJRo48ky4LqOuhgbVh62ybVG2Q5Fu47RAPhUSQyKeF4MExfM0ogMLsN
	ZHVNHHnpJhv8Hh9dmym8JzPEc/BNMOHvBcBxKOpm1vArBVpxSoxOV5goeUSwYDbb+laia/t1+JTKb
	AELbqtaYXuNXF5qiuHpZJalEo8ijGkEGH1/C0DHgqCmzsAiauyznmbGSKwXdKgvVr5IrnkSRFUobW
	yCEOlWRg==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tIFr7-0000OB-UQ; Tue, 03 Dec 2024 00:29:30 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: rk3308-rock-s0: Fix sdmmc access on v1.1 boards
Date: Tue,  3 Dec 2024 00:29:17 +0100
Message-ID: <173318214614.1403925.10666094873905910081.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241119230838.4137130-1-jonas@kwiboo.se>
References: <20241119230838.4137130-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_152934_259877_4B3211FA 
X-CRM114-Status: GOOD (  10.96  )
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


On Tue, 19 Nov 2024 23:08:36 +0000, Jonas Karlman wrote:
> BootROM leave GPIO4_D6 configured as SDMMC_PWREN function and DW MCI
> driver set PRWEN high on MMC_POWER_UP and low on MMC_POWER_OFF.
> Similarly U-Boot also set PRWEN high before accessing mmc.
> 
> However, HW revision prior to v1.2 must pull GPIO4_D6 low to access
> sdmmc. For HW revision v1.2 the state of GPIO4_D6 has no impact.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3308-rock-s0: Fix sdmmc access on v1.1 boards
      commit: b89a4235eb8cdf1b4bd2f9e4ed096d8adf8994e7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

