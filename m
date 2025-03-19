Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FC3C36001
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 19:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y0Eo0e6YOE9ilTmD+cbKmf0J9gx2iyifBh05aUNn6ks=; b=b+LXSbgluZkWZ6x2eIxSt3rhef
	eS8tOUCQ8QvCXMtrAtjLpT3xiX3iVxUY2gls+i6oOpIEolIrMOqcBmRaKcvg1iyIKzBEKvbIHkh7C
	pMYKCU12WRL6sSLfu68PczQsDA2w8XysAFWeRuXzujpisUV6Q9iFAcHGwUvUh/zSP6kS3G33btJkr
	jdLPzL12Nby1lm3ztq6ENuCjQw4NWieFr7A0QnowrFSOIVPAVhPHwMoq9Z1VuGiu3tXRAKj7+NQub
	vVyz3B1HJCf+KcDPcORE5CPTwXhqRGzzAMhd3xLLWawyE3/Z3nldXC1UbODdBU0aNNeGVLHbZdrJE
	Ltq5So+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuylu-00000009uhI-3TBR;
	Wed, 19 Mar 2025 19:08:10 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuygx-00000009u0T-28uV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 19:03:05 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1742410971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y0Eo0e6YOE9ilTmD+cbKmf0J9gx2iyifBh05aUNn6ks=;
	b=HTFNVaXBvtCpqdADiDu6dLds+9rJtE3cC135zOWlGP8GMkavL7UwCTSERgmI1+N/YbR2zL
	IEHVqcG0Ic2MFqL7auYiwTlyVD8keAw+htKk7GJuN4DzbNCH2Cko10va7mRpEuJaDmCwo3
	zaUHPoRovRpxt8WQxgOMuey4tk5bJmHb0lrfFOTmNryDn3127qOtzJi4576EkBAMJNvUrn
	LfZu6ckscoZdk0CAxEkR4QpLULUkEFdl9CKmeu09AUKlURN5rD48ONoLo7e0ltMKPghWBY
	Z+9phY67o6B/BEwg1BX7rGu/6O6nXMGmA+Yfg7gufFmUAU55rA52nIYgKf9ArA==
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
Subject: [PATCH v5 0/2] Add support for Xiaomi Mi TV Stick
Date: Wed, 19 Mar 2025 19:01:48 +0000
Message-ID: <20250319190150.31529-2-funderscore@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_120303_691610_E60B6E25 
X-CRM114-Status: GOOD (  17.37  )
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
 * Wi-Fi + Bluetooth
 * Android TV 9, upgradable to Android TV 10
 * Google-certified

There are multiple variants:
 * 1. Green PCB, manufactured in 2020, known UART pinout (helpfully 
   labeled on the board)
 * 2. Blue PCB, not much documentation about it, presumably manufactured
   between 2021 and 2023
 * 3. Green PCB, manufactured in 2023/2024, known UART pinout, some layout
   changes compared to the 2020 variant

Among these variants, there are many boards using multiple different
Wi-Fi chips.  Supporting all of them is out of scope for this patch
series.  However, there has been some work identifying Wi-Fi/Bluetooth 
since v4.  Some variants use a Realtek module while others use an
Amlogic module.

As of the time of writing this has only been tested on the 3rd variant.
It is believed that software-wise all three work mostly the same (if we 
don't count Wi-Fi/BT), but testing on the other variants would still be
appreciated.  Sadly, booting Mainline linux is slightly more
challenging on some versions of the original firmware.

The devicetree is based on the Amlogic P241 DTS.

Changes since v4 [1]:
 * add Acked-by from krzk
 * Wi-Fi on sd_emmc_b

Changes since v3 [2]:
 * typo fix (`vbus-supply` in `&usb`)

Changes since v2 [3]:
 * fix SoB/From mismatch

Changes since v1 [4]:
 * remove useless nodes: cvbs-connector, ethmac, internal_phy, ir
 * add `amlogic,s805y` DT binding section
 * add S805Y dtsi: meson-gxl-s805y.dtsi
 * adjust DT `model` to "Xiaomi Mi TV Stick (Aquaman)"
 * explain the changes being done a bit more in the commit message for
   the DT patch
 * drop `clocks` and `clock-names` from pwm_ef (background: [5])
 * change sound `model` to "XIAOMI-AQUAMAN"

More information is available on the postmarketOS wiki page [6].

[1]: https://lore.kernel.org/all/20250203174346.13737-1-funderscore@postmarketos.org/
[2]: https://lore.kernel.org/all/20250203091453.15751-1-funderscore@postmarketos.org/
[3]: https://lore.kernel.org/all/20250201193044.28856-1-funderscore@postmarketos.org/
[4]: https://lore.kernel.org/all/20250131200319.19996-1-funderscore@postmarketos.org/
[5]: https://lore.kernel.org/linux-amlogic/20241227212514.1376682-1-martin.blumenstingl@googlemail.com/


Ferass El Hafidi (2):
  dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
  arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick

 .../devicetree/bindings/arm/amlogic.yaml      |   7 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../meson-gxl-s805y-xiaomi-aquaman.dts        | 292 ++++++++++++++++++
 .../boot/dts/amlogic/meson-gxl-s805y.dtsi     |  10 +
 4 files changed, 310 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi

-- 
2.47.1


