Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CA5F8E4AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 06:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j2zHQiwS+fAyZ8BA4NB+rKHXCimGldG+ejgu1ghuEGI=; b=yrv6X80BtTbuHrDCpvoZbfFqNR
	RSM5uFtDd2jTZGdQHu9j0E8MfgNP8+3JvqWLChZFHkqcLz0p1nqTjqVpnnjhCG66tivoegECelzp7
	88tGb2qRaK9MG/N8xorXXI7XapUCMW+gfhh1jmaSuu++LtB4kuhGFVz7a3q4b3rFcN9SXPybapyaZ
	i2vlbNbs6a47QHE6FXXVdx8CULWu3YAKBZsHKQMcl1O0jUhv0eN53xiRIYN9d1vkQ7xc4VlS/Zqxs
	EJzAkIsN1GHN2DKlDq9vTCcrb74r0qcqGq+Q9MhT/QhGLqgQlVcDro5x0P8TUCe7PQ04P3SsLyj5L
	LjPnV8EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDctk-00000003YQ9-2fm5;
	Fri, 17 Apr 2026 06:41:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDctj-00000003YQ2-1kSz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 06:41:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC4116012A;
	Fri, 17 Apr 2026 06:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74632C19425;
	Fri, 17 Apr 2026 06:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776408110;
	bh=5ILW9ovCD9rkcdvfce9O9NVrQf0affa8qsElbU+IUSU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=NBGoPoO/ysm/6kB1rqLeSuI0cda6XCijr57MuJr48/DLaikWp+TxXklLuhWiur8aa
	 ZW4UxAwNr07BWcxpa3h8hYtNuVx+znRS+lHzb031Jrv8UJ/X47I54EUj1J20R16pz4
	 7155x4O7LNQ/Zb78Nv89nGwmyjtvP1+oedUrIDKzT4QEAs23zsZO5LbeiiJgvp+rdX
	 OebX2KXEs182I3WZ3hCOaYbYb846LkCdyMVaIor7Cod1iUgWbBwZNP8F8y5gNuQa/Q
	 MXM7JO4hm8ZnoxoW6TFxhv3dAHDx1gkv2PG6/kn1Xk1DVe3inXml88N9/7uAcx29RH
	 yn8kZSaE5C7LQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D51F8E49D;
	Fri, 17 Apr 2026 06:41:50 +0000 (UTC)
From: Rex Fu via B4 Relay <devnull+Rex.Fu.amd.com@kernel.org>
Date: Fri, 17 Apr 2026 14:41:49 +0800
Subject: [PATCH] ARM: dts: aspeed: anacapa: add interrupt properties for
 PDB PCA9555
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-anacapa-pca9555-irq-v1-1-9a6d28b1b656@amd.com>
X-B4-Tracking: v=1; b=H4sIACzW4WkC/yXMQQ6CMBCF4auQWTvJFKhNvYpxMZRRx0WtLRISw
 t0puvyS9/4VimSVApdmhSyzFn3HCnNqIDw5PgR1rIaW2jP1xiFHDpwYU2BvrUXNH+zI09ibunE
 E9Zmy3HX5Va+3v8t3eEmYjhRs2w40R47BdwAAAA==
X-Change-ID: 20260417-anacapa-pca9555-irq-3090d4120270
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Rex Fu <Rex.Fu@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776408109; l=2007;
 i=Rex.Fu@amd.com; s=20260417; h=from:subject:message-id;
 bh=o8qWPDdSQIz2wmiJKXl6X/Ju2Iig3de8Ah1xPVk1Lb4=;
 b=9MQxnVgP2xpf8cl0ReSJT9bCAGSgrGLhuJrX1lJDGwcxn2Z0N5+8gjRkpTj50taQzIWiLxU4L
 Rb3uKLvuM8zCiSq+XVL/I8mP31UxsiKnatCzhTZShNcZeUVeGzJucDu
X-Developer-Key: i=Rex.Fu@amd.com; a=ed25519;
 pk=26ECoh24fxrbXDKgA4hCmgg0xjQ+IxU97kXb46ovwgc=
X-Endpoint-Received: by B4 Relay for Rex.Fu@amd.com/20260417 with
 auth_id=738
X-Original-From: Rex Fu <Rex.Fu@amd.com>
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
Reply-To: Rex.Fu@amd.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Rex Fu <Rex.Fu@amd.com>

Add interrupt-parent and interrupts properties to the PDB PCA9555
nodes in the anacapa DTS.

Signed-off-by: Rex Fu <Rex.Fu@amd.com>
---
Single DTS update for the PDB PCA9555 interrupt wiring on anacapa.
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 2cb7bd128d24..7319f2319bb7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -481,6 +481,9 @@ gpio@22 {
 				gpio-controller;
 				#gpio-cells = <2>;
 
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
+
 				gpio-line-names =
 					"RPDB_FAN_FULL_SPEED_R_N", "RPDB_I2C_TEMP75_U8_ALERT_R_N",
 					"RPDB_I2C_TMP432_U29_ALERT_R_N", "RPDB_GLOBAL_WP",
@@ -500,6 +503,9 @@ gpio@24 {
 				gpio-controller;
 				#gpio-cells = <2>;
 
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
+
 				gpio-line-names =
 					"RPDB_EAM2_PRSNT_MOS_N_R", "RPDB_EAM3_PRSNT_MOS_N_R",
 					"RPDB_PWRGD_P50V_HSC4_SYS_R",
@@ -529,6 +535,9 @@ gpio@22 {
 				gpio-controller;
 				#gpio-cells = <2>;
 
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
+
 				gpio-line-names =
 					"LPDB_FAN_FULL_SPEED_R_N","LPDB_I2C_TEMP75_U8_ALERT_R_N",
 					"LPDB_I2C_TMP432_U29_ALERT_R_N","LPDB_GLOBAL_WP",
@@ -546,6 +555,9 @@ gpio@24 {
 				gpio-controller;
 				#gpio-cells = <2>;
 
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
+
 				gpio-line-names =
 					"LPDB_P50V_FAN1_R2_PG","LPDB_P50V_FAN2_R2_PG",
 					"LPDB_P50V_FAN3_R2_PG","LPDB_P50V_FAN4_R2_PG",

---
base-commit: 76b4ec8efdc3887cdbf730da2e55881fc1a18770
change-id: 20260417-anacapa-pca9555-irq-3090d4120270

Best regards,
--  
Rex Fu <Rex.Fu@amd.com>



