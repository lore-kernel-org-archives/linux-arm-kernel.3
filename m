Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5144FEF06EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 02:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W04FKCAxLhNFy3iwSX/rSfkVv6Uymhr9kMr74RcYrSA=; b=j62HyEM/XY4Wy/frjeAzr4hU4f
	p08SL0GI6Q6VY1fPUCkecU2AN0E5cM1jeZkhmS72p4Reo7onA22qRVH6SZn02Bb2Ce/hZFzcSHQ1i
	r2ndB8ehHpNL5E5gu12PiCJSdl71RZxxj6aXw6RPXhsL0flxScH1mwxlgQ8kYHVtpJuv0OO7Eje6H
	bB1mENXwfEhDaTDpRrWuIfk0e9hVN6TmlYAGmHPOTPh1BMzrzWXcTE7zQlBlTyncjK8TW/VlC2IQU
	2VUG/scbQltrc6IeAECDIzFS9n1fLJ8/LSapJlUObsOLSkgTvb2a7nwq60N6LZhD51vrRIcQffpWo
	kWDHnWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpGyT-0000000Eh6d-2eOJ;
	Mon, 09 Feb 2026 02:26:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpGyS-0000000Eh6L-0Kvf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 02:26:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C7987600B0;
	Mon,  9 Feb 2026 02:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74B29C4CEF7;
	Mon,  9 Feb 2026 02:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770603962;
	bh=8FNcFMom+IQpEysPGE9C9NRqh6IjFoqhAG6EdKXGcmU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=iOjgjMJLTXGgtRIyHRiPlhacB0NWJjGddSIVKVYhIz++j1oeLQBwdspz5Z+tQY7i1
	 ArwBPPrdmtiaUurrysIgelccH+hpp7eoV3IpC4zm6f1vLngwwwL61deJ2G+E5wvdj0
	 ty8gfCvp2ZMiezH1wHFKqK4DOhDhm7/kedcRKnNERzWqAaPZk/p4GnajkfyBj7bgmR
	 55+tZiCAHhEvshKGOZ5Hg1B/Hg1ZV8vCk9u2jtWvPZLXRjRTMv84qdqwWnL0VA2HRA
	 oAw8SCe7nnziRlE/kpgtwleYzThuEJSlHbZoHDC318ngI9pxebx66c/k9mSjol1g9T
	 48SCSIH97UAcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA26EF06EF;
	Mon,  9 Feb 2026 02:26:02 +0000 (UTC)
From: Carl Lee via B4 Relay <devnull+carl.lee.amd.com@kernel.org>
Date: Mon, 09 Feb 2026 10:25:59 +0800
Subject: [PATCH] ARM: dts: aspeed: anacapa: add NFC device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-add-nfc-device-v1-1-748d1a98b2b5@amd.com>
X-B4-Tracking: v=1; b=H4sIALZFiWkC/x2MQQqAIBAAvxJ7bkElg/pKdFB3t/ZioRBB9Pek4
 8DMPFC5KFeYuwcKX1r1yA1s30HaQ94YlRqDM240zkwYiDBLQmpyYuQgYofoyUeBFp2FRe9/uKz
 v+wHAUqHJYAAAAA==
X-Change-ID: 20260209-add-nfc-device-eaff14b5d5bf
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 carl.lee@amd.com, peter.shen@amd.com, colin.huang2@amd.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770603961; l=1030;
 i=carl.lee@amd.com; s=20260203; h=from:subject:message-id;
 bh=fAioY0/uBa8OFcIA56wyA/W2gJNy1rdRQAUCDykPe7E=;
 b=he7DbyjQeooaxxeK62Gnonp0ve5OOlWEu63CG4Dw+dnDtFlATMjIVxFTXipgfGB1C+smjB4Bh
 ojMR4pX3PcvBYSKqdYCsaux087oN5zOjEO1cODH5RIkYk7ZYMO2Kn4B
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

add NFC NXP NCI device support to NFC tag reading

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 221af858cb6b..7349d25434e6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -802,6 +802,16 @@ i2c13mux0ch7: i2c@7 {
 			reg = <7>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			nfc@28 {
+				compatible = "nxp,nxp-nci-i2c";
+				reg = <0x28>;
+
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <156 IRQ_TYPE_LEVEL_HIGH>;
+
+				enable-gpios = <&sgpiom0 241 GPIO_ACTIVE_HIGH>;
+			};
 		};
 	};
 };

---
base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
change-id: 20260209-add-nfc-device-eaff14b5d5bf

Best regards,
-- 
Carl Lee <carl.lee@amd.com>



