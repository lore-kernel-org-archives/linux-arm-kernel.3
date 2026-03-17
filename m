Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1246F33809
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 07:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2mRgm/rmNxdepSAxn9jhMVjlXGzrsCROxDYCu1SZMY=; b=Kv4sMP2SfXGH3fcFh3PTcVTuQl
	7Urw75EPg7+5x5HUpiHEqa/6MqRsoJ+7N+E91UcydImiOftbRO7AB/y10/GuyFN51g2LukPCvvtbw
	LQSRc6x/TKMM1gVGv5aMRCaVzd0iwiU2j80pLcEugMWqarfCrKUIsk9MN41+TP3zNpxy+HDrETnfn
	AiHFT6Bk5685UIwSouQkYoqcj75rmA64SY+WRZN1h8JuPlVyYqzP2BIG6D3NyApF+t/80vrelJITQ
	zioAWgqmyVONnb3oV7QvgBfrUI4p9dhJ+IeLRAiLIUCfVspsvKmu5Q6Xw58e9XqNsYerxqEzlU9jM
	I/rFikTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PDP-00000005fCG-2vCq;
	Tue, 17 Mar 2026 07:51:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PDN-00000005fC5-3asN;
	Tue, 17 Mar 2026 07:51:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B09560018;
	Tue, 17 Mar 2026 07:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7E7C4CEF7;
	Tue, 17 Mar 2026 07:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773733905;
	bh=DTgKQOjGOjxInuU85/citXraFmUYvI60GQFWFQGivGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qidu3F6xPSfyzd49HdwXhZO4pHv3E4IMKdNXYKJRWJDnrrjGfZ6zKmNIp3YuNIvn1
	 xRthSNUdTN5K1NGxXK1q9ikCfuHkUp1qJWxoQrL8zvDh6ysHlC/Un8cdYmmAcYD6sC
	 j1IlyzbNC/T4gKOfnJEC5FNxuhJrVtQmG4rbsT6YFOETIca6whLACWPCJaR5+HrMDK
	 Nd/YPO1TbpJJM99NXX6MytiTDAIHh2vrZdBBCiD+d9nRlOWgzoFxqvp4kyd50f9LGi
	 R0UyvTH1Pu13WcrqAP7YNJxE/jKpaVzgPnTqGHX2fttbHI7aRc1ArlKoGxk1GcMh4C
	 mRbuS1VaWc8wQ==
Date: Tue, 17 Mar 2026 08:51:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Alexey Charkov <alchark@gmail.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH 1/2] dt-bindings: ASoC: rockchip: Add compatible for
 RK3576 SPDIF
Message-ID: <20260317-accelerated-mosquito-of-experience-e8cc7a@quoll>
References: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
 <20260316-rk3576-spdif-v1-1-acb75088b560@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316-rk3576-spdif-v1-1-acb75088b560@collabora.com>
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

On Mon, Mar 16, 2026 at 07:23:00PM +0100, Sebastian Reichel wrote:
> Add a compatible string for SPDIF on RK3576, which is similar to the
> one on RK3568.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


