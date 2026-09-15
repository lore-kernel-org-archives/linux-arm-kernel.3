Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D59C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 06:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sbu+/WbQu3pdOwQDlDnrwv9zUnsRT7Rl41y7tZPm4ng=; b=pTkEiryR2gibw4XuS5ij/KR+uG
	sWhJNuAYlmUJIiQzSYaIvpboFFpgWix7BN3cjLB/2AlV/VYYYncU2qCZ5A4IeFUTQw0mh07exqqfS
	0lPCSIubxCUhJGALCIKXSjLhWhDiiY8iJT62tBMyztbe4jLUREM/JF6e8XuiBYxMQ2x0wSdMWVvWf
	JARLdHymeyTHcWIS2Y98smXZh8Epl/6iI3Sci+0FJj08i+9+92glQtB9VphPznuyzJWCqh2h0181w
	JLHUXYkjMLEuukzD1QBbn8IKEtASkQvimH+Z7gLIDXkKDsvVAKsgBqvYThc+N75x+kSNHww265buQ
	b1hp08Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Mye-00000005Ngg-2fuS;
	Tue, 15 Sep 2026 06:49:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Myd-00000005NgT-178Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 06:49:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B29F43624;
	Tue, 15 Sep 2026 06:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409181F000FF;
	Tue, 15 Sep 2026 06:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789454950;
	bh=Sbu+/WbQu3pdOwQDlDnrwv9zUnsRT7Rl41y7tZPm4ng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=L+/UvwwA1MOrGfGwMGB4/UwKWGWQyQjLkbIdbX01TmWlMMszKpPSOFowMOEG1Sq3b
	 veynuymebifVhvaGEO77Oms/6JJJsiSQu6L+ZSlG+YLsWzt//h8gLajdfzE/pN6REp
	 uWGxOpHGv0DoP0PlBVl3bvvd9fVrLlxTY3JghTCwZyi/OuoPxjH3hlQVZ6Yrq8VPg5
	 JNQ3/NohKDfIBqqILYwwa127ZhTOZQJYdT/rYye7Hy5Dr5y+VjjtYAmD6GIUr+tL9b
	 tF+wiwNUpwXvh1HoQWMrvD3I9e5jz39FPFHJbVLqE1vhq89LL9TJugRNRGh4g6GJtR
	 uOTj7/uxRKjSw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: semen.protsenko@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, peter.griffin@linaro.org, 
 Thomas Turner <tturner@lineageos.org>
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, thomas_turner@talktalk.net
In-Reply-To: <20260909194450.183693-1-tturner@lineageos.org>
References: <20260909194450.183693-1-tturner@lineageos.org>
Subject: Re: [PATCH v4 0/2] Exynos850 GPU support
Message-Id: <178945494682.36945.3330317622213793582.b4-ty@b4>
Date: Tue, 15 Sep 2026 08:49:06 +0200
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


On Wed, 09 Sep 2026 20:44:48 +0100, Thomas Turner wrote:
> This patch series documents and provides basic GPU support for the
> Exynos850 SoC, making use of the Mali G52 GPU through the panfrost
> driver. Only basic support is provided here and as such lots of features
> are missing. This series only adds the GPU node for the Exynos850 SoC
> dtsi, but keeps it disabled, so it stays disabled currently on E850-96
> board (The only user of the Exynos850 SoC dtsi upstream).
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpu: arm,mali-bifrost: add exynos850-mali compatible
      https://git.kernel.org/krzk/linux/c/5a881e2dfce03d6426d81beb35e68089a02aad89
[2/2] arm64: dts: exynos: Add GPU/Mali Bifrost node to Exynos850
      https://git.kernel.org/krzk/linux/c/3d7bf30480f3a34fe530213da9e5bd0aa406929d

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


