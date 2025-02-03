Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5C0C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 08:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRjbn6U3FQPXkyS2qDd2d9UidCrrWbdz9+kxShMj7Y0=; b=aI3Wxdr4vRtkOQ5swkCxOpwjMz
	mkFJsLxriiSC5GenQIfT9Pxin2ifDPXOC5yPgZ9e4Cweyf5neQSg/O7c0zc5UNWOdwOXmwAKX2Fco
	LokUor2FGyTlBxyBdfZgyT7a+l+F74r+zxwcV2+3lZi3W9T7gmlkmIVfYZRLim1J/sT1g9IDP8eHJ
	IFrUqeoG0VWYmxyIY275eRWZ7M2GSejZjWfCCKr3/hPsTkQE+W0XBNSHBWlx4dX2OH8Bt96GF6IrK
	aAlgk0qaBhQdPjl510ZhTo8LMcv/V19NVA7pjiEUVw4nV5FMbqPbGQ5dRX3m4f2HU9RwF4t58I9cY
	eJd0m8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1terfi-0000000EoJs-2WRb;
	Mon, 03 Feb 2025 08:19:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tercn-0000000EnVA-2KKO;
	Mon, 03 Feb 2025 08:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IRjbn6U3FQPXkyS2qDd2d9UidCrrWbdz9+kxShMj7Y0=; b=trnxp7F1jFSGLF53R57hKnbCv7
	yRMlVGnJB16IuQG9Skd0/3dlCnrRF8SiCgef1xARTDjYbeb9hcB7Rmo/bAEU0rlmeLDS3oXledwBd
	mka0SVqqvzQsiXr66CdjvPEkF15P0Rp2p3QBHgOtg4385bVkfLRX1buM9Q2zEiQgwuEQrKsL3kVYJ
	MpEl2zuYR6Vpgu7c6lz6WvrWIDxeKgDXRylwKDuw4+U0cct9pEuFRfhyrY8kjLmWoGQK+qPLwX8mm
	ww0wsMfrofV1QkbPMtVpUtwd2TiyCNdx7cYv718DWYeRBb2OuIqf8C7XbxBFmIQI/yAO1cwfsMxJg
	IUixtIBA==;
Received: from i53875b5c.versanet.de ([83.135.91.92] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1terck-0005Vr-Dx; Mon, 03 Feb 2025 09:16:06 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	didi.debian@cknow.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH] arm64: dts: rockchip: Describe why is HWRNG disabled in RK356x base dtsi
Date: Mon,  3 Feb 2025 09:15:55 +0100
Message-ID: <173857053622.78657.16352325923556757290.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <6b272e2f8f916c04b05db50df621659a5a7f29ab.1733149874.git.dsimic@manjaro.org>
References: <6b272e2f8f916c04b05db50df621659a5a7f29ab.1733149874.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_001609_613164_B6639D6F 
X-CRM114-Status: GOOD (  11.43  )
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


On Mon, 02 Dec 2024 15:44:06 +0100, Dragan Simic wrote:
> Despite the presence of the hardware random number generator (HWRNG) in the
> different Rockchip RK356x SoC variants, it remains disabled for the RK3566
> SoC because testing showed [1] that it produces unacceptably low quality of
> random data, for some yet unknown reason.  The HWRNG is enabled for the RK3568
> SoC, on which the testing showed good quality of the generated random data.
> 
> To avoid possible confusion in the future, [2] let's have this described
> briefly in the RK356x base SoC dtsi.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Describe why is HWRNG disabled in RK356x base dtsi
      commit: 5afdb98dcc55917df4a8568fd07a119844a7d391

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

