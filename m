Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466A6C982D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSgU08nb+q4FuolsETVIvRO98eu8IGESlxKBYfU1D0E=; b=IDYuqZOqXCC2btl5vUpP8iWLCv
	uwMPGOv/IAaUk3mmXZ3MCOoNPS6GVxxIzKy7adV66vfHFM8nkIWo9poaiVrSqlbu/+azU1NUxUJvd
	yKPjGat8T7rU3FlbMD0Ca9tXK/IoVZJ76CX6qAiMt3APeiklMGr27pnHg5mh7932CLoG1lVKTfsbs
	X2UvaLw7/MFPLdR6sCD2Etgo91sy3QSRjSx/XH6coqntFy6JP1cxLXgho0k30sB+ZnfltHFKdD1BM
	lZpZ+cLgEnlXkhd0Po6jQ1+/1v2ThQkcsyqngg6pl73uxps+6tWHrFAB3dKxRDqd+ZGrB4suyQGkx
	piMhCxCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7W3Q-0000000E7Nu-0Y7H;
	Fri, 18 Sep 2026 10:42:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7W3O-0000000E7Nd-3ctI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 10:42:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C3E343902;
	Fri, 18 Sep 2026 10:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0569C1F000FF;
	Fri, 18 Sep 2026 10:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789728170;
	bh=uSgU08nb+q4FuolsETVIvRO98eu8IGESlxKBYfU1D0E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TS9kWaMiulIJFAq14xfelAoe2jz6mmbD414V1LzF6K9SqF8Y7g/etuj6I1Fi3O7TQ
	 am9qel0/cIRPvUt1RUGXGO1hNq1wJHfBza2a7rZfvpfHyF5Td6yXDnWHPGSGDGWXPm
	 TjPtA/eETvdlweDtBeq0GGXWjWouJifAu0lYSbvtYsTdSFT88RyOzTG7OhyFn6z1/X
	 RtTB/86vpQAJIhVxiGo+Ue5eJKrseq2d7nTwxyNB+s0lbtj/UI7f0kQQkaeGwhyTo1
	 V3U7E/syM+VcHjyMPyWc7PMa13d29iGCNmTmqbwHFmwx/o9+r+b77+WvwZzVBgdxZg
	 mRMSQ3EQp0i0A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: peter.griffin@linaro.org, robh@kernel.org, conor+dt@kernel.org, 
 semen.protsenko@linaro.org, alexey.klimov@linaro.org, 
 Thomas Turner <tturner@lineageos.org>
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916205522.159393-1-tturner@lineageos.org>
References: <20260916205522.159393-1-tturner@lineageos.org>
Subject: Re: [PATCH v3 0/2] Add Samsung Galaxy A21s support
Message-Id: <178972816670.83665.1520186497443894150.b4-ty@b4>
Date: Fri, 18 Sep 2026 12:42:46 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Wed, 16 Sep 2026 21:55:20 +0100, Thomas Turner wrote:
> This is a small patch series which adds support to the Samsung Galaxy
> A21s. This device is part of the Exynos850 SoC and its device tree is
> very loosely based on the e850-95 one.
> 
> Thomas Turner (2):
>   dt-bindings: arm: samsung: Add compatible for Samsung Galaxy A21s
>     (SM-A217F)
>   arm64: dts: exynos: Add initial support for Samsung Galaxy A21s
>     (SM-A217F)
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy A21s (SM-A217F)
      https://git.kernel.org/krzk/linux/c/1a672a79f917c9d5322b42f30efe27e1679c1612
[2/2] arm64: dts: exynos: Add initial support for Samsung Galaxy A21s (SM-A217F)
      https://git.kernel.org/krzk/linux/c/3836879a69ffe2b06ddbbb1cd0a98928a1ef6dd1

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


