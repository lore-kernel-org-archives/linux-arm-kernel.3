Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48C9C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 16:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnwL1qE9Ii+6o4b3xylYjzog1iBzviBOstSmwGrUzpI=; b=e7McTRGqnT0bELY0GMlQmp8lpF
	PL7u0rFjrBtvuQacRUstIOBuYKwho1qiJf4XWdiKdMLlaFwO31Aowc0xWoQ3REkIDtFYzikvaqGfr
	Ves2JYbZulUNoG2zox61GhEQAR6kU46TH11Q/DV33L5/y2oI3BuiM4FWnb9TMf+IkCiRi4kaoFSm7
	V9YpJD1c5QISgyPBlSEtzJDPnOjVgKURqAS3sOfWpCR5aXnMDuQTM4dvmvhM6S7JPFGnCrkIWHgsl
	6+ScAHH+CQu7oHlTfJkdTXDZtqv516stT1UWKRaZN2PyOFQx+dGAkd2x7kW3x4W2FKo8JgpDHTWeu
	GUdV/Mtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnfJD-00000000Xb5-39UJ;
	Sat, 25 Jul 2026 16:33:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnfIv-00000000XYV-0ZOg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 16:32:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99BA643C82;
	Sat, 25 Jul 2026 16:32:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848BE1F00A3A;
	Sat, 25 Jul 2026 16:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784997168;
	bh=qnwL1qE9Ii+6o4b3xylYjzog1iBzviBOstSmwGrUzpI=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=fHSBlDwPLejc7JEPCJUJw4FHSYmN4gZrs4RpHBUX2+7ARj9GmQQhxpcItSas6Ccv5
	 qxDsmWPlNO0HC/m3ikK3f6XObQwHsEt2e9ktQtzIgsJV5ved6KYcnzTIGCZhME/bq3
	 n2QReXwLbWCeWclPfkb40BJjxyRwJo+fZp0+sgQSG5Qzz1bCfdDHdTS4NCVsiOn+oy
	 q813qxRSHKXzDV+4Ddd+BoJ6oJyEU9qPUEiUp4RvVV3Qb/aMRNsO4ob0Vq/tzchBZH
	 PsH0OkHK3CdtFW9Q+ezOs3roHYXw74YpxBcKYdMxprNZyUJc7iQhAA/suLXzYy5HSx
	 wc0EzzrOHxJ6A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706101843.341339-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101843.341339-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: microchip: at91: Correct indentation
Message-Id: <178499716505.107055.13231791672359944674.b4-ty@b4>
Date: Sat, 25 Jul 2026 18:32:45 +0200
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


On Mon, 06 Jul 2026 12:18:44 +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).

Applied, thanks!

[1/1] ARM: dts: microchip: at91: Correct indentation
      https://git.kernel.org/krzk/linux-dt/c/b364559b491ada54eefdd948606767621d2cedde

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


