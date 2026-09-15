Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE6AC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 06:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IW+WfSkPhtezIjFB1ttK9J7KCiVxh6V1t2vdBtFn5aE=; b=QUwvjH8TAILs95rqwh7vq1xBYi
	fx2p8+ZwpiahKwp7NL9ixej7ngNBTHlKmQJpKQ5M0RibAuQ53sQlyuqmslA/usGKB6Lcb8vamIATv
	1ZNAHcgDDzdDsrebOaoNMcLQ3ilVNQmhEMBABlp2MCpT+htmagMFJ8Kuy+RSfoK/TZe46hn+Ia+gY
	M/EFXwLSUciGls8xW7k02DGqupzRWiQaltMTTjB3PT9tkmAbQu+tf7pYJdldapC9fmUEuc8ZNzRpk
	RoKpLcAi6yrXljJd3ILYf5hEUxaPEa9HK1JemcDkCLxROFzcXPIcP0RKsXVxp9nIFMNA5cNZ0hdmn
	9ySKFxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Mwn-00000005NMz-3t17;
	Tue, 15 Sep 2026 06:47:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Mwm-00000005NMi-2WYr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 06:47:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0435B438B8;
	Tue, 15 Sep 2026 06:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693BA1F00893;
	Tue, 15 Sep 2026 06:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789454835;
	bh=IW+WfSkPhtezIjFB1ttK9J7KCiVxh6V1t2vdBtFn5aE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iuy/T4Q3FaiJLSDqC4UAzjteph6/bH9iTwpPHWV5eMCywt9KXhF06u4ciIRo3HDcT
	 ZSiP8ky3z2ByQoMZISqHn0+0qqHZ2i4+6YV725/9BUVcUMX7JnuO2dbFtR9Jbaaolh
	 rxy7/Ag7chmlXrmxJ8CyBfAmc5sHnVyl/vPvQp7THwqinngAbpE/StZqFp/HJw3sWy
	 CTGI5algOIUjmuNFeWXjal5JagW3cEGDHvFydZlFcu6JYS8IZHTRJtjk8zDyuUG5iA
	 whmJTo6rLFq8K/3KUlZenw3XK9HzUXtdeXsTnJ+1yFU0T+RVogXB+Y1UDcMZUBNOJ+
	 PSAZBjuPrlLeg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com, 
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
Subject: Re: [PATCH 0/5] arm64: dts: fsd: Cleanups with new dt-style-check
Message-Id: <178945483213.36246.17124860030489038402.b4-ty@b4>
Date: Tue, 15 Sep 2026 08:47:12 +0200
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


On Wed, 09 Sep 2026 16:17:51 +0200, Krzysztof Kozlowski wrote:
> Only a few warnings are left
> 
> Best regards,
> Krzysztof

Applied, thanks!

[1/5] arm64: dts: fsd: Fix indentation of CPU nodes
      https://git.kernel.org/krzk/linux/c/ee5e4efa733d63fe145a953e16be77633df8a222
[2/5] arm64: dts: fsd: evb: Correct node order
      https://git.kernel.org/krzk/linux/c/d8b0a2d87beeb794b4b235ca6407a7483c747776
[3/5] arm64: dts: fsd: Move idle states out of CPUs node
      https://git.kernel.org/krzk/linux/c/5fc349ef1f37de7d87940c35c25ec2bb0ca5bd6d
[4/5] arm64: dts: fsd: Re-order nodes to match coding style
      https://git.kernel.org/krzk/linux/c/04a4457e3a0dc9a20c516435f8e0e87774df2b7e
[5/5] arm64: dts: fsd: Re-order properties to match coding style
      https://git.kernel.org/krzk/linux/c/b724971c200ca17e565906ad6b248558b3c62e92

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


