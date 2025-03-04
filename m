Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFA0C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 14:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Gqyom2Qw8VXFf3AYIpGbjCuS8c9RY7yiAyJBWvJUfc=; b=yQVNYfg+9lSbpJjOhkRxF1LBp9
	EdRS3nMUWF1TFDVXUi3jqQCTvhUttE2EJ/B2Ew5KyC3vJn/f+yEJnbfoyApONtc5Ife0wDPM3RG7x
	D9TmTpg4hsZkyKsyk/v/il4hPxdsPsU9MW5AdbbxhO9fW/CELQ4DTSCRhXppVzobq2Iav6MkR18FV
	/zVZL+5RGsYbHveETYVuRw97trk/V/CQ6qku+2j4VbC030/pyYffk2uwRDkEjbWvvn2ruzyJ1zmOX
	scw9r+EMJ87ZDdG2SbvwGhKWET0Q0hOwDOq4wOPUhdKBaV+xgB2r5AsVRgjDsROwsiTVJLsZTO1y3
	czTAxjJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTNe-000000051FK-2mXJ;
	Tue, 04 Mar 2025 14:36:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTM4-000000050u0-3CkE;
	Tue, 04 Mar 2025 14:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4Gqyom2Qw8VXFf3AYIpGbjCuS8c9RY7yiAyJBWvJUfc=; b=KTdCEV/zTusAeUlTIrBuBAb6SW
	QOPuOTIm7BL/bYx2YPLJAYBFDF28jitg9fxcPZ6HfAEBuQ/bthkTDwK5mTWRX18uOq1FNvKIvh7J6
	nTZB1nFXW3Y9YXExh4df+JzoAmiG3am5R5qRJ7iGejoN6o5z8ZsxZtlZXjVud8XaTZOA/wZPmNnTU
	gyqZTRpr2ewIXAoPpKPAfT8rwGqDQ6/IUPt7HnGhQrwTp9dhdUv2IhbA+BD94/tn+iAIwwDt931X8
	61QfDmBDGVaoGcaaRbJJCC8q/qOP13pFtoMMx9v14XgF/L+KL4Bq5OYk1nh6j816lZCTw6sCXW70X
	Ucn1A1wQ==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpTM2-0003uT-SQ; Tue, 04 Mar 2025 15:34:42 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: Add ES8388 audio codec fallback on RK3399 ROC PC PLUS
Date: Tue,  4 Mar 2025 15:34:40 +0100
Message-ID: <174109881585.132749.2987468837584062976.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250304104200.76178-1-krzysztof.kozlowski@linaro.org>
References: <20250304104200.76178-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_063444_803331_4D3628F5 
X-CRM114-Status: GOOD (  10.47  )
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


On Tue, 04 Mar 2025 11:41:59 +0100, Krzysztof Kozlowski wrote:
> Devicetree bindings for ES8388 audio codec expect the device to be
> marked as compatible with ES8328.
> 
> 

Applied, thanks!

[1/2] arm64: dts: rockchip: Add ES8388 audio codec fallback on RK3399 ROC PC PLUS
      commit: d83f6c32d70f96037cb187e63785e7a58f9e751b
[2/2] arm64: dts: rockchip: Add ES8388 audio codec fallback on RK3588 boards
      commit: ced36c336d241eafbc812fed27e6a52908d249bb

Thanks for the heads up Krzysztof, about the asoc patches getting accepted
for 6.15.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

