Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1C2C55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 18:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PknnHsN6cYkEV2qshK7jMvnLf1tIvHLs47/Frwf5Bog=; b=Xb5SiSg04pwAtpD5xyUauPgE8K
	FBik8UtEfcW9Gia12gnNwQssavUoFbXxl3TqwB4XansympRqt2/w6+17/2FnqDod9310jKv0PbhVU
	ywpuHHgFh+jrbFO0+y9L/sz+7T+uBM6GnS5IY/+lTj4RWRMylmG92VfAnV7Co8TJV1Ig/RsuH6Fkl
	vhtBhNcBFvCdE5o6C11cZf3cuY1NyTrJ7sIT1bbzMpoghVnHK2gm1g1SvBVBRkfn7a2eokolB6NRe
	rLBId6Yq58B0x7GYCjUvBi597Qy3ghn9Sh0sUcBcMno9i4rTQa2e8SocnGnntXNNkIt2ohmyjf1T1
	s6zI97Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqEFW-0000000Ews3-2ILh;
	Sat, 01 Aug 2026 18:15:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqEFV-0000000Ewrx-2z9F
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 18:15:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 25FA741239;
	Sat,  1 Aug 2026 18:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85ADF1F00AC4;
	Sat,  1 Aug 2026 18:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785608153;
	bh=PknnHsN6cYkEV2qshK7jMvnLf1tIvHLs47/Frwf5Bog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QwP0T/OAFIfXj1w2mhnw1eQ1/59mXM1FqKZ9Eo4DkhFUwePJCID6otQ6dvbzbobC8
	 Z/32MFsNQXqFSLM+7EZqPjojs/LzcWZtxouWuqQZvvkoWpcSNextYNinyFSvmYPnZs
	 Jf55wfCKkYia7yHamXBicgJLdPmnEWqdgNc+A3KKgAM63vn/Ee+rcNmVqcPfzf0TzQ
	 9ScoDEGXzSm1rhWCnZfv5n8vFAOVlgaZ6Pg64Zr5SqAm7hQUM+sPoBATTVrINXArxW
	 v2wyzxWWTv4gXJZnPM4/zy56b6OTKbdaLidFh4inlAidn17HfleX0+riILkKy3Mhnr
	 aPtI3ivAXoscw==
From: Sven Peter <sven@kernel.org>
To: Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/9] Initial Apple M3 Pro, Max and Ultra device trees
Date: Sat,  1 Aug 2026 20:14:29 +0200
Message-ID: <178560804761.33352.11895011679898131857.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260724-apple-t603x-initial-devices-v3-0-bbeba0420603@jannau.net>
References: <20260724-apple-t603x-initial-devices-v3-0-bbeba0420603@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 24 Jul 2026 20:16:40 +0200, Janne Grunau wrote:
> This series adds device trees for Apple silicon devices with M3 Pro, Max
> and Ultra SoCs. The M3 generation has fewer devices than their M1 and M2
> predecessors. The only non-laptop device is the M3 Ultra Mac Studio. The
> Laptops are the known 14 and 16-inch Macbook Pros now with M3 Pro and
> M3 Max SoCs. The M3 Max variant with fewer CPU and GPU cores has
> additionally only a 384-bit wide memory bus instead of 512-bit of the
> full M3 Max. It has a separate identifier (T6034) and so there are six
> laptop device trees.
> Another difference to M1 and M2 Pro/Max/Ultra is that the M3 Pro is
> distinct SoC design and not a smaller M3 Max. For this reason both M3
> Max variants and the M3 Ultra will use "apple,t6030" as compatible
> prefix. In the M1 and M2 generations Pro, Max and Ultra SoCs shared
> "apple,t6000" / "apple,t6020" as common prefix. There is currently no
> known difference but M3 Pro and M3 Max are not as closely related as
> previously.
> 
> [...]

Applied to sven/linux (apple-soc/dt-7.3), thanks!

[1/9] dt-bindings: arm: apple: Add M3 Pro/Max/Ultra devices (T603x)
      https://github.com/AsahiLinux/linux/commit/f3a01f769afd
[2/9] dt-bindings: interrupt-controller: apple,aic2: Invert #interrupt-cells condition
      https://github.com/AsahiLinux/linux/commit/6545de50dc94
[3/9] dt-bindings: interrupt-controller: apple,aic2: Add apple,t6031-aic3 compatible
      https://github.com/AsahiLinux/linux/commit/c3157833d661
[4/9] dt-bindings: arm: apple: apple,pmgr: Add t6030 and t6031 compatibles
      https://github.com/AsahiLinux/linux/commit/6fe9f80cca52
[5/9] dt-bindings: power: apple,pmgr-pwrstate: Add t6030 and t6031 compatibles
      https://github.com/AsahiLinux/linux/commit/5b4f03afdeaa
[6/9] dt-bindings: i2c: apple,i2c: Add t6030 and t6031 compatibles
      https://github.com/AsahiLinux/linux/commit/225d33916d95
[7/9] dt-bindings: pwm: apple,s5l-fpwm: Add t6030 and t6031 compatibles
      https://github.com/AsahiLinux/linux/commit/b7ccb1b0bc73
[8/9] arm64: dts: apple: Initial T603[124] (M3 Max and Ultra) device trees
      https://github.com/AsahiLinux/linux/commit/396331cc6447
[9/9] arm64: dts: apple: Initial T6030 (M3 Pro) device trees
      https://github.com/AsahiLinux/linux/commit/0f259b86d9f8

Best regards,
-- 
Sven Peter <sven@kernel.org>


