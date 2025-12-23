Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4AEE6F086
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RsZ/b29xaMtiiysVAEoW4yek99qbTnvtAM0lssnx25k=; b=Awcy3pKu5yGZ6IktRCFUiljoK/
	i/5DEiWIdyYNAhsYqrrBt873BJLpvMJk2BizWBpAUmkws1kORIMlrBYnZe15dreyWmzbnk7jorh29
	lt5DJmNd4u48pO54fL0rWwKliv4ulaIO2z52ybGPV1UU1qy7ITvrZtdxx6GuhD9ZQe5dkmxNf1OGu
	MoskA8QzLNkxRjCnWEXoNYga6eDYLMo4BnNpdVcsi08S/Lq5QpcBrJJ+vMos6PlgHZN+SG1EoJT4t
	oBx6DWHi6pq7lTzwx2yYha/mfinSRHJkklvZz6pzc19S0cdYupqnz2o9Jvax7M1YAjuj17mz41YRG
	/Ycx6ydQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6Rh-0000000FrFp-46DN;
	Tue, 23 Dec 2025 17:45:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6Rg-0000000FrFN-3u9w;
	Tue, 23 Dec 2025 17:45:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5EBFC60146;
	Tue, 23 Dec 2025 17:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5D7C113D0;
	Tue, 23 Dec 2025 17:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511916;
	bh=IREpsCbPDjPXBUeM3hVpkzTdgens1z8F0+oisTuZVws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s3x4O61lW7g72WQyjOgA0jnBkV5RQhLAD5XHp8bwr9tmAIpAE1UGIxrfc5/+v6jlG
	 4aNHfOiPZf5XqAtci5PZLnaZQkMQRYtdi7dvd1mSn1wiPTXw/CDxq4IPl5wWR0iM1n
	 j0SIw6vABuVJ9X46iiSTEmLe0Rlvx/zhVRr9OvS3F5IAUHpC9A/MkSlG9w2j+Xtp36
	 QGOMfkcPkVifbVoVa60ppQ/yNNg483VPERAIgKEmRygWWyM9TbaUfu9LOeFH0jSrAI
	 vrzi52ZmBIxKhIVeq8UYtuswy5ojifLhrSpyf+9PUNs7AEdc4qRHbYfxNuzQCbxWNV
	 gtQfC+pUwHzfg==
From: Vinod Koul <vkoul@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sven Peter <sven@kernel.org>
Cc: linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin <marcan@marcan.st>
In-Reply-To: <20251214-b4-atcphy-v3-0-ba82b20e9459@kernel.org>
References: <20251214-b4-atcphy-v3-0-ba82b20e9459@kernel.org>
Subject: Re: [PATCH v3 0/3] Apple Silicon Type-C PHY
Message-Id: <176651191159.759340.7918107926279417342.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:15:11 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Sun, 14 Dec 2025 11:51:33 +0000, Sven Peter wrote:
> This series adds support for the combined Type-C PHY found in Apple
> Silicon machines and required for USB3, DP-AltMode, and Thunderbolt/USB4
> support. As in the previous versions, this is limited to USB3 support so
> far since the other modes need further work in different subsystems.
> With the dwc3 glue driver being upstream this is however the last part
> required for upstream USB3 support.
> 
> [...]

Applied, thanks!

[1/3] soc: apple: Add hardware tunable support
      commit: a722de305eacb382a5d306f9f8e502f81bab682d
[2/3] dt-bindings: phy: Add Apple Type-C PHY
      commit: c1538b87caef6b2783502c820457be092a7266be
[3/3] phy: apple: Add Apple Type-C PHY
      commit: 8e98ca1e74db2ae051c9b545d42b879efa5a2f6c

Best regards,
-- 
~Vinod



