Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A49CD6E6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 13:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJFtaWMA5FGk91knb3fRmn30tp58iM1CDxHQbqtZ96s=; b=bMNpvO5PGIJDf3I0xT0W5/FYSm
	VTyR+2JwQK3cbzWUJXZFStU1bImDJXZNWFikYrUDe1soz+TKbGK+us0GaUI0deaaym37zz+tMmgXz
	a2bP7XZ7Ho6H1VjxodhMbbFXq8G5B/rhAes6BgXjIjKAvuIfJ4GaDDwuEgjM85flXlacQkLR/9TzS
	wpWx7dZlZdAlHHi15VMHGOrJcsfCnc6k90R/PSeWDG/SZuQCSxnSEsdhju297H78/RItiiNH1j032
	BHwBBP8AoKyBXjKmy4PZwToz+/5FhvlqGRR9D4cNBF+KgH0+dlrGqjA1uPBwOfTPbnfX6kajORLlc
	lLv/lz7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUP7G-0000000D5p5-46Th;
	Tue, 02 Jun 2026 13:25:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUP7D-0000000D5kS-0wvB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 13:25:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15926445EF;
	Tue,  2 Jun 2026 13:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC0BEC2BCB4;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780406705;
	bh=l4tZmoa0x3aA9qC0egLepPeLCCFRw16PSq7HETSLkJs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oL3XWzqy3UUHWlkZ5VcQ2vB1BF2u1m5l5OR6A64AMDFOoMejaoeUm8R4nhGHN0P3u
	 P9SsbCW0jLqRAOlrtRIaM9uYOEnvzlukeIqTQ/+xxpcBoY+A1qQQ0M1pcBiX72CsFs
	 nLTQ6CZiDAdpQJztCXOdpfOhNnAptcEuosmgTauYxaGY2ue4P6dXVqaTy1QpOlDC1G
	 cATA9EjoZ0FdNK+M7KdfJl4kgi1EmDfbHMQLR1d2fN4amb5n0VH4gRUr5IiyWed59D
	 0EXrNR0MqmA0K/kSyA9fhG97SzSV5rhsxkiREdoDuomAGGW0TVIPIqlMjdmnVhd5Ww
	 Wn6OZLQpYg0tA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E38B6CD6E64;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 02 Jun 2026 21:25:02 +0800
Subject: [PATCH v3 7/9] ARM: dts: aspeed: anacapa: Align PDB fan GPIO
 numbering
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-anacapa-devlop-phase-devicetree-v3-7-7c93c5df8d9b@gmail.com>
References: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
In-Reply-To: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Rex Fu <rex.fu.amd@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780406700; l=2161;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=gT219DNuHxVGx46EEdxGOjRGMVdr1IWCg5Am0KC7qdQ=;
 b=GzMK2oG6vuFeC3uQWCKA8E6WjSBtprj2by4f31yoAWzXwveSQgkzHLNUkL2Th9P3LQzVQ9201
 eD4oRty2efECbLfuHWorPxbBgoqF1Fb2jyuPY65OMkdD3vHvGOIO5NF
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_062507_405228_F37CC75A 
X-CRM114-Status: UNSURE (   8.75  )
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

From: Rex Fu <rex.fu.amd@gmail.com>

Update the LPDB and RPDB fan GPIO line names to align with the platform
fan numbering scheme.

The LPDB fan GPIOs are named FAN0 through FAN4, while the RPDB fan GPIOs
are named FAN5 through FAN8. This keeps the GPIO line names consistent
with the fan inventory and platform-level fan numbering.

Signed-off-by: Rex Fu <rex.fu.amd@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts  | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
index c703d64edfae..29df10697613 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
@@ -510,11 +510,11 @@ gpio@24 {
 					"RPDB_EAM2_PRSNT_MOS_N_R", "RPDB_EAM3_PRSNT_MOS_N_R",
 					"RPDB_PWRGD_P50V_HSC4_SYS_R",
 					"RPDB_PWRGD_P50V_STBY_SYS_BUF_R",
-					"RPDB_P50V_FAN1_R2_PG", "RPDB_P50V_FAN2_R2_PG",
-					"RPDB_P50V_FAN3_R2_PG", "RPDB_P50V_FAN4_R2_PG",
-					"", "RPDB_FAN1_PRSNT_N_R",
-					"", "RPDB_FAN2_PRSNT_N_R",
-					"RPDB_FAN3_PRSNT_N_R", "RPDB_FAN4_PRSNT_N_R",
+					"RPDB_P50V_FAN5_R2_PG", "RPDB_P50V_FAN6_R2_PG",
+					"RPDB_P50V_FAN7_R2_PG", "RPDB_P50V_FAN8_R2_PG",
+					"", "RPDB_FAN5_PRSNT_N_R",
+					"", "RPDB_FAN6_PRSNT_N_R",
+					"RPDB_FAN7_PRSNT_N_R", "RPDB_FAN8_PRSNT_N_R",
 					"", "";
 			};
 
@@ -559,11 +559,11 @@ gpio@24 {
 				interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
 
 				gpio-line-names =
-					"LPDB_P50V_FAN1_R2_PG","LPDB_P50V_FAN2_R2_PG",
-					"LPDB_P50V_FAN3_R2_PG","LPDB_P50V_FAN4_R2_PG",
-					"LPDB_P50V_FAN5_R2_PG","LPDB_FAN1_PRSNT_N_R",
-					"LPDB_FAN2_PRSNT_N_R","LPDB_FAN3_PRSNT_N_R",
-					"LPDB_FAN4_PRSNT_N_R","LPDB_FAN5_PRSNT_N_R",
+					"LPDB_P50V_FAN0_R2_PG","LPDB_P50V_FAN1_R2_PG",
+					"LPDB_P50V_FAN2_R2_PG","LPDB_P50V_FAN3_R2_PG",
+					"LPDB_P50V_FAN4_R2_PG","LPDB_FAN0_PRSNT_N_R",
+					"LPDB_FAN1_PRSNT_N_R","LPDB_FAN2_PRSNT_N_R",
+					"LPDB_FAN3_PRSNT_N_R","LPDB_FAN4_PRSNT_N_R",
 					"","",
 					"","",
 					"","";

-- 
2.34.1



