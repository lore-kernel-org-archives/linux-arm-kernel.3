Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDB0CAC589
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OwlWDc9HsT0dfJHWEYI5wkS0XuBRiuAZGmVjr3F473s=; b=PW4/wLy+WAnN6IiQDj2mQ0ydjk
	vH9W6bQgfIfCYY6ej4Vsx1RU2ixYDbMLpEmuCEY4YtZjdT7ZddBdzndFnYi/PjaR1usAFlrQ8WxUg
	YmRAXZanuU5ZNH6/fPhrxKs2PehTNCkv07gkNnz8oUcMT1kXHzpxC2Uclx7kB5OVkc7IDWcEz9bbR
	b1T1UoOMLDHr9RnQgs2wFsB5hujvXsZE1qbORNG5kkVeDk6eHaALzb0e6qU8oBWEM/At4o56G+EKd
	fsqgXnazmMcktT+C4qbVPlJt+5jx15KNqe5g48uQjh5p4EhO3jyJ+WD/KU//XYV3Q7aGvPeLTZz0P
	STmBb56A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBW-00000004oem-0lv5;
	Tue, 09 Sep 2025 06:50:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhsh-000000020Hd-3cER;
	Mon, 08 Sep 2025 19:50:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F2B7B60051;
	Mon,  8 Sep 2025 19:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97FBCC4CEF1;
	Mon,  8 Sep 2025 19:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757361026;
	bh=Xa2A8wUs8DU/Qpi2eBoE6S8SjRM3jIuTJh0HvFOCRxg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=oTzG4AlDbpncPrHEebeStdQ+k/OZYSVISXsp0J8Ti0XyTpL8mYdFX7GqqOTijrHnj
	 PC7zEqRFkWk+SCisRBfiue6QvyXrr+EAFA3oLof3us3TFPjReLHjO38YW9xKyZM3b3
	 1FCw1pZ8v5dcbU3kNuiwNY7jPCAPaIQMtG3okicuHft5Us1vQ7EQ+rzpsrwzji3Onn
	 Lr7qa2YwlQHQzF6gAolmL6p+IMdP2m4bF0Hjz7vG12HcMhMgjtme9JWQsnxx1JjyL4
	 FgT5QHTfEiixv/qoY6NqrNaDhG6ikTr1xb+cTHOtZQ/Ul+ryhtI81kHKRAA+WHmDGG
	 nWChdMTLZ+v1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F232CAC582;
	Mon,  8 Sep 2025 19:50:26 +0000 (UTC)
From: Valerio Setti via B4 Relay <devnull+vsetti.baylibre.com@kernel.org>
Date: Mon, 08 Sep 2025 21:50:03 +0200
Subject: [PATCH v2] arm64: dts: amlogic: gxbb-odroidc2: remove UHS
 capability for SD card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-fix-reboot-v2-1-354d0e57c855@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAGozv2gC/23MTQqDMBCG4avIrDtlEvwhXfUe4iKmYx1oTUkkV
 CR3b3Td5TvD9+wQOQhHuFU7BE4SxS8l9KUCN9vlySiP0qBJN2Sow0m+GHj0fkWqmSZnlLFMUAa
 fwOV7Yv1Qepa4+rCddlLH9S+TFCrsWmoPSzc130e7vWQMfHX+DUPO+QcGgIQ9pwAAAA==
X-Change-ID: 20250907-fix-reboot-04e0fc919ae0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2045;
 i=vsetti@baylibre.com; h=from:subject:message-id;
 bh=BJc4SXxGYBhMfaPaAFk61MykLFrvMDIrqRdHH0rt9IY=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDBn7jRuDXn3+sOHcgT2cDKu9ThrvSJgZ9VuAP9956mm9K
 rNPfIqNHaUsDGIcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZiIdhUjQ8eu7/dYbVV89FJ8
 JDoFqtsmSq7tVWzIrV2loFGjF6IjzvDfZ97m1ZYLFvRJ2yT5vAq8z7zmp3f339s5Zzv4zBP3y/5
 jAQA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-Endpoint-Received: by B4 Relay for vsetti@baylibre.com/default with
 auth_id=515
X-Original-From: Valerio Setti <vsetti@baylibre.com>
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
Reply-To: vsetti@baylibre.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Valerio Setti <vsetti@baylibre.com>

This is meant to resolve reboot not working on this board.

The problem is as follows. In order to be able to switch from HS to UHS
mode the bus voltage needs to be reduced from 3.3V down to 1.8V and this
is achieved by the "vqmmc-supply" regulator. The ROM bootloader is only
able to manage the card in HS mode (3.3V) and the switch HS->UHS happen
at boottime in the kernel. The problem appears when the reboot command
is issued or watchdog expires because in this case the "vqmmc-supply"
voltage is not returned back at 3.3V before rebooting the board so the
ROM bootloader will be completely stuck.

Therefore this commit removes all UHS modes which would cause
"vqmmc-summply" to switch from 3.3V to 1.8V.

In terms of performance the main drawback of this commit is limiting the
SD card bus speed to HS (25 MB/s) instead of UHS DDR50 (50 MB/s). However
this comes with the benefit of being able to reboot the board, so it
sounds like a reasonable compromise.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
Changes in v2:
- Re-added vqmmc-supply to sd_emmc_b node.
- Link to v1: https://lore.kernel.org/r/20250907-fix-reboot-v1-1-7606fc91254e@baylibre.com
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 959bd8d77a82ebc78c5e0592d7613e692e4ede4e..12e26f99d4f080a216e305981dc4291a49063b60 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -348,10 +348,6 @@ &sd_emmc_b {
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	sd-uhs-sdr12;
-	sd-uhs-sdr25;
-	sd-uhs-sdr50;
-	sd-uhs-ddr50;
 	max-frequency = <100000000>;
 	disable-wp;
 

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250907-fix-reboot-04e0fc919ae0

Best regards,
-- 
Valerio Setti <vsetti@baylibre.com>



