Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD79C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 06:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chmXwA64MAAzTh+Y3uuSjRyk0/eZPBPU5XbIWQeCSMw=; b=QsRVqrtMs0zb9fxeqVP6yx17LK
	sML3tNLBx7Ud/rYIus4Zmc1n5vVmxUh20Rt2G9d0JBT3/9SWNvfvZqUEuJcV6suloZ3bxtsJrbaYO
	fdodkYhv3IupTyavQJXc/F/Ts9YHNwyCN5P1sdGQAAWFywXIf2dqFuvr/ovcf1pSfL364Q1uhME1B
	3+dWysJ7K47y0atJ9TxKgWztQnrbrXf53WpIJSfoMPSiS6+zjrsHvZPHgAsvekoJQiaOFLaN2gY1+
	MmcVbpLji267gVRE2XRo6+4cYWQGhztxXoTFVdY6Up3pAHBL8pRugY0u5O4BzBGTvpPyRqgAtStM5
	mEfnW54g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYMM-0000000ENpk-1AhZ;
	Wed, 07 May 2025 06:34:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYKO-0000000ENWW-1dBt;
	Wed, 07 May 2025 06:32:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=chmXwA64MAAzTh+Y3uuSjRyk0/eZPBPU5XbIWQeCSMw=; b=V6f3LQ9R9uxfhZ2w/mBMAE8m/w
	FlCr6+I3xzE6kTeN6IG2RmPb1Ibcc/7n0puf7RYyWeO1xQVuaaEtNu4mqWNG8S/pBRNs6KKMLvkjj
	3ZtbnI3nXhmxGCnAl2mu0baSDoz96hEPd3VGg64O0Q5slKYdYeiG9v9/cEsc5c8k43fwrx8g4rM0B
	MNaWkk4CYgxVxUfU3tDU5BkzYr1wZk3xoqelQvF4cCzZvcE1sO7pB+m3Dtqjzm2vgH33lMT0zkSpT
	yrouMwx6oJC0s7sbGYUawdbcf+5E4828BFVQZbpo3nfMBrrnic0D+I68a/Thb8MHiuIrQzVChP0xq
	tRramUNg==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uCYKB-0008As-Bd; Wed, 07 May 2025 08:32:11 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Peter Robinson <pbrobinson@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-rock3c
Date: Wed,  7 May 2025 08:32:01 +0200
Message-ID: <174659951055.1528016.5792676162591810152.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250506195702.593044-1-pbrobinson@gmail.com>
References: <20250506195702.593044-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_233224_445388_09AE5245 
X-CRM114-Status: GOOD (  12.52  )
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


On Tue, 06 May 2025 20:56:55 +0100, Peter Robinson wrote:
> As described in the radxa_rock_3c_v1400_schematic.pdf, the SPI Flash's
> VCC connector is connected to VCCIO_FLASH and according to the
> that same schematic, that belongs to the VCC_1V8 power source.
> 
> This fixes the following warning:
> 
>   spi-nor spi4.0: supply vcc not found, using dummy regulator
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-rock3c
      commit: a706a593cb19796f31d3a888423ef1a71885ae72

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

