Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED627CD6E69
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 13:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8rCmjVhRLE0S2TkpRZErRcljPxkEcd9q6l0uI+ZoBU=; b=OgDvjCwcCN5vJLD3v4Hz6Nrffu
	mu9OwUZZpz78Nzk3LUEtvAHV++t9Vg6IkkATiGJf9cr7M8DhjFVOD6Jxjnmy2KaHLWNN2vjW+hB0a
	OL0EUNUwTO6Gr8M9JyReS1li/EE4+baYqB+eYl0QIkmFanf5qOgtL+Han8xvaZeHT6NhdVDnVNcbo
	oLvpP0thQ8V366LnhdJ5peB9hhuvjxpOmwdbl3py7NNszcMcGyjTTa6csw8/OBzucMUP81lDtthfa
	CjQeAZ5OF2LMRLpONn1fWi43VRkCbzCpOUWBdkAgPpdKTsMMRnFkjhpFESGBKsR4CVJoCwXZ6H+ZD
	nlEmSukA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUP7G-0000000D5oB-0qCa;
	Tue, 02 Jun 2026 13:25:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUP7B-0000000D5j0-3Qic
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 13:25:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01B2D445D8;
	Tue,  2 Jun 2026 13:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8C27C2BCC9;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780406704;
	bh=3ed5WDh67ZmrdDMWAl2i4i0yB2nF51yxl2zoDD6sv5s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tXJ0Byt/PHQPE8/FDCvAh8mTP7xPSEdTrQWIEiQOKU54erj8Yg7Y0Cjtm3Mh1/7VS
	 OZu9ft/f5M+cFVu1pYshTZsWShIPDUNVTH3SMvMVlkmqeCWP6ZoHBcPzFFpWo+p9Vl
	 BHIeh4vEYogQfWOe8h+dNvq94HOGIDmXA8gt5vMG/yynaNLDU845WTSfFDGJq/Fqau
	 yMVR/qqjOPJmeySMDoAPVkHW6dq3lJQnKWKN/h/1qph5kYDhDjPFqWF7NrKlVbWMuG
	 pc8vQ4Cz3Ec8Z59BBUdEVEjuX+RGAuKhdebgAIBzbzhyN0Xg3N5sSUUATapVPYmcWD
	 4FeKMTPl9HPBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17AECD6E57;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 02 Jun 2026 21:25:01 +0800
Subject: [PATCH v3 6/9] ARM: dts: aspeed: anacapa: Add eeprom device node
 for NFC adaptor board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-anacapa-devlop-phase-devicetree-v3-6-7c93c5df8d9b@gmail.com>
References: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
In-Reply-To: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Carl Lee <carl.lee@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780406700; l=743;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=D5HvAIWQSyP7NcKoy1Ha10lyJBsgyfKjuJ5CFfeZIDI=;
 b=QzyrVnxSf99t5YiqaOWqpNMfQmJ2V9skDS/JmOyMUIjlrZY/oeUKnOYWUbvYjnjZP14qVnBTi
 NfExFhYHSPTANDJRe4FuM7FTnhTE2uwlvWWG54UMmvrMbFXfL8H8IPd
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_062505_923635_3BF74941 
X-CRM114-Status: UNSURE (   8.68  )
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
Reply-To: u8813345@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Carl Lee <carl.lee@amd.com>

Add eeprom device node for NFC adaptor board FRU.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
index 1d2f46e83be8..c703d64edfae 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
@@ -845,6 +845,11 @@ nfc@28 {
 
 				enable-gpios = <&sgpiom0 241 GPIO_ACTIVE_HIGH>;
 			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
 		};
 	};
 };

-- 
2.34.1



