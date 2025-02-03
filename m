Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7F1C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 09:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LAvNIFwT6eJl2TJJB5CO7XsRCIXELrpv+C++Li8Acbs=; b=T8BCB+Wr4yQOUqMFtO8agp3Mh/
	mwcctO0BmJ0rIR7pXWbHMtyb3WDc4X5Xkn9CvJwGYhZn417vS3aGri11ligsuO1z2S4jcnqh5vH7p
	SuVkpe7dOOe48irFlHy+suRZ21dGdGmsJ2qizzoRoUz61Q1nQmXCS9KxkD1ztqjZ15kSNr2t+Qc/O
	Wave7dZ1zXrNOBlBtq+Z43ELsHBraWumC2zle2uGT86gCmaVcWRKxtoTl7cvJuGHtALan92R1d4H+
	8V6R/ng1x/MPgsTyvwqo3nQ4hZ633oUo4+VjTke9/8A7PR7sQK1tu9HNbxM9IyNPlUEmYclmNJxRg
	rVwewAqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesbL-0000000Ey4h-3ntT;
	Mon, 03 Feb 2025 09:18:43 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesYi-0000000Exe8-3AGc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 09:16:02 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738574143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LAvNIFwT6eJl2TJJB5CO7XsRCIXELrpv+C++Li8Acbs=;
	b=MnNTZ48FVxUSvN/Uj/sac/5spztCo+eWbmyhtSirbuGJw/Lt03SaC+fTLazSW1GRhpuTgO
	iOc6h8V+nVCTpxMgxArJvuYXcf+N0LafpMbAw7WZpMmb1cGSX9OSSdGCZlSXlebSrTKUqC
	2mtnnNRW/GY3ymDmoDbMwnb9KAXeGAZBQrFtYWJLdDVX8MCPFz1/P4C9fGw6sSDZhwqhWi
	vP4qtVAYpx+TVDRPIOCxce9WQ55bj7z/Svlq209E2AanPsY4CzQWGMvDoRIEtJ/o3f8FC9
	yC8o8cKIpaMPdoTfkRAtsHG5O9nVxacKMjoxSRY2qxSJVMOfC47EUe5kZDwKzA==
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
	Karl Chan <exxxxkc@getgoogleoff.me>,
	Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v3 0/2] Add support for Xiaomi Mi TV Stick
Date: Mon,  3 Feb 2025 09:14:51 +0000
Message-ID: <20250203091453.15751-1-funderscore@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_011600_934717_24E29F1C 
X-CRM114-Status: GOOD (  15.04  )
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

Changes since v2 [1]:
 * fix SoB/From mismatch

Changes since v1 [2]:
 * remove useless nodes: cvbs-connector, ethmac, internal_phy, ir
 * add `amlogic,s805y` DT binding section
 * add S805Y dtsi: meson-gxl-s805y.dtsi
 * adjust DT `model` to "Xiaomi Mi TV Stick (Aquaman)"
 * explain the changes being done a bit more in the commit message for
   the DT patch
 * drop `clocks` and `clock-names` from pwm_ef (background: [3])
 * change sound `model` to "XIAOMI-AQUAMAN"

[1]: https://lore.kernel.org/all/20250201193044.28856-1-funderscore@postmarketos.org/
[2]: https://lore.kernel.org/all/20250131200319.19996-1-funderscore@postmarketos.org/
[3]: https://lore.kernel.org/linux-amlogic/20241227212514.1376682-1-martin.blumenstingl@googlemail.com/

Ferass El Hafidi (2):
  dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
  arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick

 .../devicetree/bindings/arm/amlogic.yaml      |   7 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../meson-gxl-s805y-xiaomi-aquaman.dts        | 288 ++++++++++++++++++
 .../boot/dts/amlogic/meson-gxl-s805y.dtsi     |  10 +
 4 files changed, 306 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi

-- 
2.47.1


