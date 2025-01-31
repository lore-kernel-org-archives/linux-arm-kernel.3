Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C708AC02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 21:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DL4+SjpuEbgS7jYoDt1dzd0hHvwyJCsp/ut/pk/cvRY=; b=YQ70yJxhQv6Sh4
	1cjsGFa9fX6nFWXCRV3BWiaZmcYCe7UbPX7iIJj53NyWGyu0SQ1kNkLWCX8Ej7g5AIeoVXzzs6cog
	P+CttYC+w0A4ratlkVYDD1R5EFgXJ6SZfXeDoghlRWys1fJCWO3f7me4atBPqaqtFRaSeqxH10VCh
	MNmLJtJe3Pu9bxM23nmAqhHQ0XZoBNNrByMWEhp9Yo5Ay1yX1Fg5ZLN5Aru5pyoLoJ64bPfzxpRiF
	gbk9WJslWWzM5eHIzMPCbhMRXLGWuqx89+blNL2oszOiSmTnYjfPxmCkYJ7iXMHPA/u5c9HxEpzKh
	jExioG1R1pnYwGgNnePQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyGa-0000000BQQQ-3M3H;
	Fri, 31 Jan 2025 21:09:32 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyAD-0000000BPgC-2dkW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 21:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=DL4+SjpuEbgS7jYoDt1dzd0hHvwyJCsp/ut/pk/cvRY=; b=Li0kCz
	c37HjadIUaa9kXRc7n7AEaEED/Y+95ZDSxtp5ALylz70w7TWcpMswkoqcncZS85x
	QRKdyq3GtLpdN8AnJvz8Lbe6ITDRHa0FPrqldVHfmgReI1AT5gBY5hiReIRhiit2
	FXbBTi9Kp3i9fd8+Wi/rg14wbu3JvYHXeS43n6BreZ0Bzw8l5a4AoT6zEMp+Ldoe
	VBxoqiJsoFLw16JH9Pbq3giVZZNG10Mkd/LFkQQa6Rwj9zissubEmpr1Xslu56Ze
	Ze232E8mb7IiIdgdLLAeU5S2WN0EeYKh/IKmvOToLItq7zESX8kUihNueLhPkvYj
	dfufnUUwS/5cRPow==
Received: (qmail 1802151 invoked from network); 31 Jan 2025 22:02:54 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jan 2025 22:02:54 +0100
X-UD-Smtp-Session: l3s3148p1@3SXI3QYtrOLUph5e
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] ARM: dts: at91: usb_a9g20_lpw: use proper mmc node name
Date: Fri, 31 Jan 2025 22:02:39 +0100
Message-ID: <20250131210236.36212-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250131210236.36212-6-wsa+renesas@sang-engineering.com>
References: <20250131210236.36212-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_130257_937971_FED35531 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Adhere to DT schema. Found by 'make dtbs_check'.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts b/arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts
index 19e377020d56..4d104797176c 100644
--- a/arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts
+++ b/arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts
@@ -16,7 +16,7 @@ apb {
 			spi1: spi@fffcc000 {
 				cs-gpios = <&pioB 3 GPIO_ACTIVE_HIGH>;
 				status = "okay";
-				mmc-slot@0 {
+				mmc@0 {
 					compatible = "mmc-spi-slot";
 					reg = <0>;
 					voltage-ranges = <3200 3400>;
-- 
2.45.2


