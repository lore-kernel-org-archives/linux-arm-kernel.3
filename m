Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76287C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 17:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BysLnX4V94oEOm/FshwYJ672t6TvLR/+LyLZLC95y8o=; b=RSWqANzBTrMxA5
	yLOZgV/UVJQA7MKnKJC361FQZLlEZMF9LjdW7z3QP8atVtqnXDlVSP5FIkR+0jGXJlCZWg9zAzJhJ
	r/EUqofs1Kqf3Afm+u6T5bcG0eUhRaiACaZ9cPoyVUhxKrgqqyLoML2jaiUpSd5GeWNkRKbng+mYj
	zWQU7XTQQ0PkwwfCKTBDcsVgxSyJH9Z2xXOJgGMVm05uoBrZQ6ahj5CS7AHGOJ3OTqVlTRRZ6TnHt
	MqCYXsHgJp/aXOP0bugFQ6ek5iu39aL6o+TWooDPQSM+3RWkC3RG9N8oc7aJjMNdti8w43JXtlbyn
	nKi0CpysO/yktQmCnWNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twlHK-00000003kla-3r5T;
	Mon, 24 Mar 2025 17:07:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twlDs-00000003k2O-4BWe;
	Mon, 24 Mar 2025 17:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742835863;
	bh=5kYi8rB59tsd+qkVDJfncnPdyMyZuWc5phF2+nfbC5U=;
	h=From:Subject:Date:To:Cc:From;
	b=FUnEuuvf9PXpYxGtocUa5dPFGqWiX6wXhfsjHqqlHELLRlbkX0Bk/CaO9sP8uuTs+
	 2rgdcprIcB0wT/SbMlAtyEnkOSo2vhlL19gwliqoKoSVSAIz7/KJkujLNPslfHV9CK
	 PWg/Nf+eUgA07r234Q5lq6PJMyJiPWKHmfrNIkS9MOZZuHNAVyrwtpV1tiOHKYVvCW
	 YdaoHW6HayYfsjgzXkZQ6INiuP6lzkyONlIJEL7MtGjyXISMLuvZo7TbKdZLGA2Qq7
	 uKHJILJ2JiV6XMvBQ31FCPq2RSi9j8/JhPWJ7B6Brhh8Cx/3yYDwVKBqoar8PEmpiV
	 dYnuv0xcvlkSA==
Received: from jupiter.universe (dyndsl-091-248-188-184.ewe-ip-backbone.de [91.248.188.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 33C3217E0C4F;
	Mon, 24 Mar 2025 18:04:23 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D5B3D480034; Mon, 24 Mar 2025 18:04:22 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 0/5] arm64: dts: rockchip: add ROCK 5B+ support
Date: Mon, 24 Mar 2025 18:04:21 +0100
Message-Id: <20250324-rock5bp-for-upstream-v1-0-6217edf15b19@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJWQ4WcC/x3MQQ5AMBBA0avIrE1SpQmuIhbKlInQZopIxN01l
 m/x/wORhClCmz0gdHFkvycUeQbjMuwzIU/JoJU2qtQVih9XYwM6L3iGeAgNG7qpNlYpa5rSQkq
 DkOP733b9+35EzsIKZgAAAA==
X-Change-ID: 20250324-rock5bp-for-upstream-fd85b00b593b
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=sre@kernel.org;
 h=from:subject:message-id; bh=5kYi8rB59tsd+qkVDJfncnPdyMyZuWc5phF2+nfbC5U=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGfhkJawCQI4XLraZ32+UGUEQ8dIBGyHdv77y
 hKcblymMCyUIIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJn4ZCWAAoJENju1/PI
 O/qaSogQAIWUmw/Vgp0mj/l/Py2GuQ8gsfM8Y+aJdjYhhJG6c3vwZTJmsowhngtQKuKmDc84OGM
 v1AApCEiJh+omnn2uPRiG20091Bxj4b5udgG8qxyXAxxLNxOgLaiSXfiCAxKGNoUWdWueEbOwJK
 y5jrJ44cJNDYNNFeZVOiayrpVQ1AhV34iZmE3/ZyR5za8EZNSZrZXxiazJdzijFxKIQlZkFWQ1C
 RMfBEdADPpB/oFjPWA/Wv5730P6BPvbHYa5WCEuWT5NaZgcCrfXIdKM0LtePRAofjfNmZerFcqA
 waup3lgOX8tTLsvypbCiG9eAHLLRksELk98rsawaO32TohdL9TMO/4j5qohUdhW5N8j2+I+hNbq
 INEFfHqTgAu4inG9/BV1r6ef+d5OHz3B1TnBn8uVmoagPmcKNqxvZPPc7k71YhBdzvPHn0ksBNI
 pMGJe23nQQ5nYl2weM+Z4/2M5mbvdbBlbpBFB2fqbeespmo+PrM6e70OifK7IqEZDeGp6VoGs+z
 72k82Cx8Mn1UOVs3uRPcPCqVIFyJbN5rgJGAkn1eUMdoo4IpsLZcZNTQT4OCAUDR5fgGpOQmyO5
 r+jMdgmqYMFXRrFoHQEnh9gCi3U9LPz1J4d3WiQspFKf9xoDoBMiRgMddBmaRN3hbf5vZS+P2ZR
 OxOBhQGarglwyjs7jYmoi6w==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_100425_184703_709DFE68 
X-CRM114-Status: GOOD (  10.49  )
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

This series adds support for the ROCK 5B+, which (as the name suggests)
is an improved version of the ROCK 5B. It also adds initial USB-C
support for both the ROCK 5B and the 5B+.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (5):
      arm64: dts: rockchip: move rock 5b to include file
      arm64: dts: rockchip: move rock 5b to include file
      dt-bindings: arm: rockchip: Add Radxa ROCK 5B+
      arm64: dts: rockchip: add Rock 5B+
      arm64: dts: rockchip: add USB-C support for ROCK 5B and 5B+

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      |  117 +++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |  952 +----------------
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   | 1087 ++++++++++++++++++++
 5 files changed, 1220 insertions(+), 942 deletions(-)
---
base-commit: 76728fe54f547950f73c9dc446beb2e31604abd7
change-id: 20250324-rock5bp-for-upstream-fd85b00b593b

Best regards,
-- 
Sebastian Reichel <sre@kernel.org>


