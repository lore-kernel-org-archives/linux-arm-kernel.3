Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A753CA9ED5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 06:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5DUbNHbfdO2NvLPpm9JhksvV3MQmLBoMqotanmPHU4=; b=OfC//VRL7lQVQOGjDAH3OwkAir
	H9pHOZTlrXLxnrt/ZpwsNUzmcLYv74APn9IqrP1GRXnSFp9G3P7T9/Iry7ywIqnjiQ0IP3StjcYgX
	PeTdb3VwLXWGDOGm/sPPenzEVvkTy6Lzb2KBSpyLNEc+AC9lEaQlpnONzdQhq2MBde8e0Mrhr+4XO
	sptnOAt7Vd4221UM23PIXxjmoKdU7Lk5ctvTqu+4+OQCJnkSrw1Ie18GTjsa4TcxBPaN+DXBvBBbk
	1Npt1HZfrKPYFrrwUsq4vF8SaQJ9fu2E5gdHFsVkmpjLXzv/0dQRY4jIGl+iqlozMFez1Ljpb2d5L
	iXOBvl/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9Pm-00000009imj-4Bg5;
	Mon, 12 Oct 2026 06:21:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9Pl-00000009imW-37QW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 06:21:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F03C409A3;
	Mon, 12 Oct 2026 06:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4D61F0089B;
	Mon, 12 Oct 2026 06:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791786096;
	bh=c5DUbNHbfdO2NvLPpm9JhksvV3MQmLBoMqotanmPHU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OQyIGVRZn9vqhuhSndfwp2Gq3htsPqYpG7dQEZuvmGihJ+mlreBMokPpZSatwgxM4
	 iDawDbeIy36rJuZOq30rk/m58c2eewSQTDT8ugyJfehQ2tb696/7Hr4Bya7O447k5m
	 MQ52mYcrKvxOj7qtXqwH4DpIIr+ofRXYtnEy6u3GXLePpBPIOaW7MphezlU1Gd7vBm
	 8YeODqif1ACa3S+RKloVlp+9IcxwHasRfbEeCII0qUWEz8G1tHSG05j5lDcP3BVtkK
	 WzPSw/+J8S3kg0fNRioSp1Wr3/zmoL5puqI0FThM39vuITvb9s/Z4xA89aavE70p0Z
	 itsyiiJGLfJ7Q==
Date: Mon, 12 Oct 2026 08:21:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raghav Sharma <raghav.s@samsung.com>
Cc: s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, is.gandhi@samsung.com, 
	ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: Re: [PATCH v2 02/14] dt-bindings: clock: exynos8855: add top & peric
 clock definitions
Message-ID: <20261012-gleeful-stimulating-skunk-ae1db9@quoll>
References: <20261009120137.2801911-1-raghav.s@samsung.com>
 <CGME20261009114337epcas5p4493d8845a2ecd69331a415c1c7fee50c@epcas5p4.samsung.com>
 <20261009120137.2801911-3-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009120137.2801911-3-raghav.s@samsung.com>
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

On Fri, Oct 09, 2026 at 05:31:25PM +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_TOP & CMU_PERIC
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  .../clock/samsung,exynos8855-clock.yaml       | 115 ++++++++++
>  .../dt-bindings/clock/samsung,exynos8855.h    | 206 ++++++++++++++++++
>  2 files changed, 321 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
>  create mode 100644 include/dt-bindings/clock/samsung,exynos8855.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


