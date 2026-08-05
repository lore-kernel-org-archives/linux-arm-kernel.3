Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9CFC56205
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 13:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z703ha9BCDZwd9WOBQAY2H7qH7O087rLCV8nVIAwz7c=; b=dA9rtCjIG4jFcFc+6HKe56o2oH
	AXty5zGaq1kLoglX5cUlL60whQH3kSCJHAPorbm5bBj60vKQ2RDkKMTTVcud/b0+Xm+VtAkrULzqs
	lEBnxTy3u3uby8CCjAPc3czftb3ct3Y+WotihGM7t4dMsioVkP6Ie7FOhd+cwwtTcmzJWtb47jCFk
	BloGNH0KXv1dHBPunXYXGn6LSktPR1SnTDKfvMQL2FzskgxTkoBS8pL8T2XdtQjHOwiDHcjAQ5UxB
	4q59gzr5k2JVUnCM+iCMlpnvEj/gkH1MhVQZ2AINsI0KOzE6DI9wGlxiBSMkFq4I4SedrA8QnuTXF
	uz+F6OkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrbH6-00000003xTj-2Owi;
	Wed, 05 Aug 2026 13:03:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrbH4-00000003xPA-1n2K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 13:03:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 64C5743B5A;
	Wed,  5 Aug 2026 13:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47479C2BCFC;
	Wed,  5 Aug 2026 13:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785934989;
	bh=k65C478t9LS6ybUmJ6TjN8D7vgzFZCksmeumxEQZ8Wo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Fxm5/cThPIOZevQ5H3UJS6ntN6TxdyemxKhBvJmyM8u0MsBV6hddkD/Ur1mSSd3Sl
	 T/J5Mhbxp00V3RaGs8ZMlEsI4+vrh56u5Oe6FF1s0k7xc6I6ZTxK8xK5Dess2ohh7E
	 do6/v73W8GXYHPJANpuXFET1Jdb9blfCJyCBbMogbNsLMDUoIxALwh50DZE4OcpzJ1
	 Nb8+cDCLmsF7SnZbG15MZVyeYnYfmmZ0or8T6GwPzi3D7pYB/L2A9wLbTFfCqSSwd6
	 CIvR9QYd7/ncACUbY8cVf4HUfTb2hONMzZIPrMmWSbrLr1t4WA1EdK9uTK00RxC1ry
	 ssnE+D1iHpwmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335F5C55ABA;
	Wed,  5 Aug 2026 13:03:09 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Wed, 05 Aug 2026 21:02:35 +0800
Subject: [PATCH v4 07/12] ARM: dts: aspeed: anacapa: Align PDB fan GPIO
 numbering
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-anacapa-devlop-phase-devicetree-v4-7-5d67e0efa6c5@gmail.com>
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
In-Reply-To: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Rex Fu <rex.fu.amd@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785934963; l=1875;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=3/IZc5ckSnwOY8uhbyA0jZSDZ3Dvh/PJORxqtTJG7yA=;
 b=O5IL2KSFBxgc8QKzSuEQthUwjyEZXJA7+1rRi8koNG46B/9VSFv59zU4WETzBSUE2UmRLIpNh
 In/jcJiv2YZDfHvX/UaW8z4IjDi/+VKmpHKJCx63UyyLW8D83EwJP7w
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
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

From: Rex Fu <rex.fu.amd@gmail.com>

Update the LPDB and RPDB fan GPIO line names to align with the platform
fan numbering scheme.

The LPDB fan GPIOs are named FAN0 through FAN4, while the RPDB fan GPIOs
are named FAN5 through FAN8. This keeps the GPIO line names consistent
with the fan inventory and platform-level fan numbering.

Signed-off-by: Rex Fu <rex.fu.amd@gmail.com>
Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dts    | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
index c7bffa7c6557..ff393ad7cdb7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
@@ -8,6 +8,39 @@ / {
 	compatible = "facebook,anacapa-bmc-evt2", "aspeed,ast2600";
 };
 
+// MB - PDB
+&i2c8 {
+	i2c-mux@72 {
+		i2c8mux0ch0: i2c@0 {
+			gpio@24 {
+				gpio-line-names =
+					"RPDB_EAM2_PRSNT_MOS_N_R", "RPDB_EAM3_PRSNT_MOS_N_R",
+					"RPDB_PWRGD_P50V_HSC4_SYS_R",
+					"RPDB_PWRGD_P50V_STBY_SYS_BUF_R",
+					"RPDB_P50V_FAN5_R2_PG", "RPDB_P50V_FAN6_R2_PG",
+					"RPDB_P50V_FAN7_R2_PG", "RPDB_P50V_FAN8_R2_PG",
+					"", "RPDB_FAN5_PRSNT_N_R",
+					"", "RPDB_FAN6_PRSNT_N_R",
+					"RPDB_FAN7_PRSNT_N_R", "RPDB_FAN8_PRSNT_N_R",
+					"", "";
+			};
+		};
+		i2c8mux0ch1: i2c@1 {
+			gpio@24 {
+				gpio-line-names =
+					"LPDB_P50V_FAN0_R2_PG","LPDB_P50V_FAN1_R2_PG",
+					"LPDB_P50V_FAN2_R2_PG","LPDB_P50V_FAN3_R2_PG",
+					"LPDB_P50V_FAN4_R2_PG","LPDB_FAN0_PRSNT_N_R",
+					"LPDB_FAN1_PRSNT_N_R","LPDB_FAN2_PRSNT_N_R",
+					"LPDB_FAN3_PRSNT_N_R","LPDB_FAN4_PRSNT_N_R",
+					"","",
+					"","",
+					"","";
+			};
+		};
+	};
+};
+
 // SCM
 &i2c9 {
 

-- 
2.34.1



