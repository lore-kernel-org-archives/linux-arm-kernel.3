Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1B0C55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 15:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LOtk8BiHe80gN1O9VLee4uMtRfmQY4koPNnBTZALEY=; b=RCtfZbmUBqxePu7SgDM8Fb0NMD
	R3So4TMIz5rdqfssMx+4IC2BbZ7K5EsghG+ETOAalW7Jn0Xp1ZFgynVNFkMSTotlZ9ni0+2kNqClu
	RYsOVDSuAiIJguRx0cex2DxAtIikJ7rtOwS8MgNtn/4ZDpWOkRde69KrMYKa065jE2WCj2PxA2RKA
	U17WNlBYqrJIRqC7ffbOk8ivXNw4QCzVGNHWep0Zh0SUHeX9dLNMTB1X5sAHr2U0k40x7wcBWVp5i
	Y6fSE6gky4k0jqXistTVOIKe7DoIOWvl6ZMITx//uekQE9w84jS24U8q/hj+VRSwvUVB9RL2Uqwkw
	cvd709ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBOI-0000000En39-1wgC;
	Sat, 01 Aug 2026 15:12:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqBOG-0000000En2b-3MsB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 15:12:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2281D41706;
	Sat,  1 Aug 2026 15:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710321F00AC4;
	Sat,  1 Aug 2026 15:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785597164;
	bh=3LOtk8BiHe80gN1O9VLee4uMtRfmQY4koPNnBTZALEY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WwqO+CHLro3El+QH5/ls4R1+gzuS/CRTQDrWuyO6KUrWqaMjvK4Tbm2aK5qhe14YM
	 AAxA8v+PhYkEjSvNeO89UJL+dP9zWcuSp0e/Z9yc2dMAUtOpH/lrnjKN/l5jKQbAfA
	 YTgRO8RUiu24JdGSHoiRVRQ34fOa+iQRVUlM0fxvIkioHvIX0yv4CZQ7P1J3zzl5gb
	 1knmQV8rbrTlfJjjA4lEyQZ7yAf1EsSdfElcNnM2acF8SEX6fSBfu6HZ93Kq6R/Far
	 zJccMewodLJQgy7XtfGlODR+I0P9Q4W0aZeycwRlMSEfMVOXtFbc0Vn2cwbiEi7O9R
	 yMjFKSbeq3MVA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, 
 linux-media@vger.kernel.org
In-Reply-To: <20260727092451.43570-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260727092451.43570-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] MAINTAINERS: Drop redundant lists from various Samsung
 entries
Message-Id: <178559716090.66839.4580869609570192881.b4-ty@b4>
Date: Sat, 01 Aug 2026 17:12:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
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


On Mon, 27 Jul 2026 11:24:49 +0200, Krzysztof Kozlowski wrote:
> Individual driver maintainer entries (not subsystem) do not need to
> repeat the generic subsystem mailing lists in "L:", because
> get_maintainers.pl will get them from the subsystem entry.  They only
> need to mention additional lists specific to Samsung stuff, like
> linux-samsung-soc@vger.kernel.org.
> 
> Drop generic lists from almost all of the Samsung entries where all the
> files are already covered by the subsystem entry.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: Drop redundant lists from various Samsung entries
      https://git.kernel.org/krzk/linux/c/f839968769b64bb81878a626d34097959ab79295

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


