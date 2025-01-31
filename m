Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2481C02193
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 20:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5H6l7E3aEB09Gr5Jf/JwrLVFXYb4G8ESjD4h4tWwSZ8=; b=D2E/vkL9YK0C908+trjjDYqzYm
	FM+71ERZCXIQKiU3WJUrUrCobdD2dJf1xSUel+HJKqrnYx3CUFeWQfdOlCLtZt/+GPUhvJ3CSRrHC
	nLDNDS5/2sPShILQ2j46rDB4G0mXe8p4EsBqN1EfqIxZc+5cgUat5O36I0yLLFC/tSw3TwxuZP2Tw
	NKqowRSuIpHN4VGNKZ7TIVna1kRod5CsY5uAKZlnyc04Pee1T1Yxt4yDXLOdBRqfwXakMazpjR6nm
	YgCID3EhXO0GJC2ZinUuWPTE7QFo1VWU1iob86zBcq3J+tKR9b2mBF8eAaBLhlRjso6cyACpZ66kE
	4NYr3VFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdxJB-0000000BLka-1jxM;
	Fri, 31 Jan 2025 20:08:09 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdxGf-0000000BLPO-0dtp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 20:05:34 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738353916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5H6l7E3aEB09Gr5Jf/JwrLVFXYb4G8ESjD4h4tWwSZ8=;
	b=louedIrhltO6zW6cURWyNiMUL7cviQQgu9NZtF/LIhyyvvEmkSV/hFPwaeBQy9obxK0YQk
	yZCCtF8i8eAi+qWv88jwnm4ciwmP6IBHJ+HD38ujpcKUHhEXNq3NBCNIGzhpCYoISEc+5Q
	5Hn8fzD2sYYXh1Y2aS8VQdX6iCkMzX3ex7IxFf+v3f8GGEPBHgLw3pLh/YRDp0RUBka81u
	/NXIlDw+lqYh0chABIANQyKzZ1Bwq5TRhCSB51JFqKHnFDnqMBJ+qEVVIBabxFdAtX7ivf
	DRnmDvaESEw9eaWr8arXbXJdETroANgev8G6V2H5osolpftI2DrLub3k6cvKQQ==
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	funderscore@postmarketos.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Artur Weber <aweber.kernel@gmail.com>,
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH 0/2] Add support for Xiaomi Mi TV Stick
Date: Fri, 31 Jan 2025 20:03:17 +0000
Message-ID: <20250131200319.19996-1-funderscore@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_120533_324582_F3C4E610 
X-CRM114-Status: GOOD (  11.66  )
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

From: Ferass El Hafidi <funderscore@postmarketos.org>

This patch series aims to add initial support for the Xiaomi Mi TV
Stick.

Xiaomi Mi TV Stick is a small Amlogic-based Android TV stick released in 
2020, and known as `xiaomi-aquaman` internally (in the downstream kernel,
u-boot, ...)
Its specifications are as follows:
 * Amlogic S805Y SoC (believed to be mostly identical to S805X)
 * 8 GB eMMC
 * 1 GB of RAM
 * Android TV 9, upgradable to Android TV 10

There are multiple variants:
 * 1. Green PCB, manufactured in 2020, known UART pinout (helpfully 
   labeled on the board)
 * 2. Blue PCB, not much documentation about it, presumably manufactured
   between 2021 and 2023
 * 3. Green PCB, manufactured in 2023, known UART pinout, some layout
   changes compared to the 2020 variant

Among these variants, there are many boards using multiple different
Wi-Fi chips.  Supporting all of them is out of scope for this patch
series.

As of the time of writing this has only been tested on the 3rd variant.
It is believed that software-wise all three work mostly the same (if we 
don't count Wi-Fi), but testing on the other variants would still be
appreciated.

The devicetree is based on the Amlogic P241 DTS.

Ferass El Hafidi (2):
  dt-bindings: arm: amlogic: add Xiaomi Mi TV Stick
  arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../meson-gxl-s805y-xiaomi-aquaman.dts        | 311 ++++++++++++++++++
 3 files changed, 313 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts

-- 
2.47.1


