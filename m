Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD686EA8542
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 03:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sA52qrXzcfenfeGOzgFUA8f9DpEVmjszboj+PTFMw7c=; b=vk+7ghFNcB6JwHw5ndy93IuYZb
	yUvCNDf822xQd0YHY21Otz3uISLBHLGHKpHFQsQOQAjQ8nNAJ47prdS9KIwIKPWbHkf1uYmwkSntW
	gRUuXdbF1vtXc111upv4OjEg2e9+szRyMQxOKGL8ILkOSrNkd78zhZjqvPF+TSP3PTnoE8eBkfXtB
	ZMzBuDOuCw8kUPBA6EgrSkvtymwIBqVgM5x2zQJQS+Rf4aBsOaEd/ZtQWa4+A77NT3Ss09w3zLJsp
	Cu9tBH205jVmqY2ZiNj09o8vbVHNta7npp6ei67u6ztNTGVlJFZCWAvH8MDmQROVmZz87qbtyoaAh
	rphCGWyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzRZc-00000006bvq-48FP;
	Mon, 09 Mar 2026 03:46:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzRZb-00000006bvk-0yNU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 03:46:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D36E600AD;
	Mon,  9 Mar 2026 03:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFFDDC4CEF7;
	Mon,  9 Mar 2026 03:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773027985;
	bh=1IhSqdUsmlpzA1CB+FcAASjNKWK/YwHGfbAD/QtT1K8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=CdeQteGmrqEvJnO9ae2KWJ3HftTY50UNrkCWXTK/dmjZZsweW3ou9cMEMFQsyrKIQ
	 dwe6TDSpa6G5ZENg/veo4M2IE3L6RYJ98u2Om3b8XICONw1H98iGboYB0fGOm7J0LV
	 8coVYdKoVKj8Lhktu5h7CarMERWIs7AUx4gTnUU/TogX+DHzgQfxdXxasu4Bte8pTL
	 OhzTBg2DaEGAHfUS5Ya1eHZXbhB4MBaI8Jkg3Jrk8AMgE1DlyX0DxyqqtztFo6DU/R
	 P8m95YJOQ8XPke1ENCEprT2G9PhUrpP33otbTrerEV2eQjFMXQXPAR20jOM6DO0M/3
	 yPMkpX+clJ8CQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DF1EA854C;
	Mon,  9 Mar 2026 03:46:25 +0000 (UTC)
From: Carl Lee via B4 Relay <devnull+carl.lee.amd.com@kernel.org>
Date: Mon, 09 Mar 2026 11:46:17 +0800
Subject: [PATCH v2] ARM: dts: aspeed: anacapa: Add eeprom device node for
 NFC adaptor board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-arm-dts-aspeed-anacapa-add-eeprom-device-v2-1-91c7dde4b79d@amd.com>
X-B4-Tracking: v=1; b=H4sIAIhCrmkC/52NQQ6CMBBFr0Jm7ZhpkSa48h6ExdCO0gW0aQnRk
 N7dyhFcvv+T9w7IkrxkuDcHJNl99mGtoC8N2JnXl6B3lUGTNtRSj5wWdFtGzlHEIa9sOTKycyg
 SU6hv1VhBVsyTkOG2m6DqYpKnf5+pYaw8+7yF9DnLu/qtf0R2hYS3jnrdKhIS8+DFXW1YYCylf
 AFca4/l3gAAAA==
X-Change-ID: 20260309-arm-dts-aspeed-anacapa-add-eeprom-device-a1aabe06a35b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 carl.lee@amd.com, peter.shen@amd.com, colin.huang2@amd.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773027984; l=1346;
 i=carl.lee@amd.com; s=20260203; h=from:subject:message-id;
 bh=4s2WZE7z3QJxXI/iwi/VjWJKQZJpdVWFD4P2EAdFysk=;
 b=NpUojOD+pYSQF7vSOrQb0hN1vZm56HiHxHGz+afcDYeGmB1rM7LVBDX2hAgXGEKrQpaX8Lhot
 4rC5mTqDpcECGWKDsWLyuIEAngdgoTW/wK9VHefT7DqR8dA2EJBgn3y
X-Developer-Key: i=carl.lee@amd.com; a=ed25519;
 pk=pyq7QaQvoxMg806KVkRwpCbiah+7ncWr4MBpK1AEyjA=
X-Endpoint-Received: by B4 Relay for carl.lee@amd.com/20260203 with
 auth_id=623
X-Original-From: Carl Lee <carl.lee@amd.com>
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
Reply-To: carl.lee@amd.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Carl Lee <carl.lee@amd.com>

Add eeprom device node for NFC adaptor board FRU.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
Add eeprom device nodes used to store FRU data for the PRoT
module and NFC adapter board on Anacapa platform.
---
Changes in v2:
- Remove PRoT module eeprom commit since it is already included in another series under review.
- Only include NFC adapter board eeprom node.
- Link to v1: https://lore.kernel.org/r/20260309-arm-dts-aspeed-anacapa-add-eeprom-device-v1-0-45092310e0e6@amd.com
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 2cb7bd128d24..69c41532fdfb 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -815,6 +815,11 @@ i2c13mux0ch7: i2c@7 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
 			nfc@28 {
 				compatible = "nxp,nxp-nci-i2c";
 				reg = <0x28>;

---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260309-arm-dts-aspeed-anacapa-add-eeprom-device-a1aabe06a35b

Best regards,
-- 
Carl Lee <carl.lee@amd.com>



