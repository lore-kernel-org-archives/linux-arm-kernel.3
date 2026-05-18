Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F84CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6YOePkzpKdtcaeSkD2ei9bKN6cTmuB9GBSIuGfGIbww=; b=jxysZu5TnSVyvPq/Oztp1yOY3U
	kfBnn61yB47KqWUCj0ugD6yTzSELBH235lDJ4yuZPWg+aaEg+tkmEvSWyqP8WdFj+QLIqwAy8ZoHV
	ZJ4KcS3bMjltgkNho8pUuX35HjKc5q/LP7AoxY7s13PboxuVmTog7WVWnQC2XqotjR7yuu8J7JMbG
	/Q/L4+t6CA5+pFBFdAAFoTq5GJ3cFy1WUGmktlbdwkyURzcx899ZG8uk/0BYchm226YOJSFbO5uXf
	C5qcjauu+3dAY5V/EO8bdg4FGNbJsOibs9eHnPee1+yrXd1kxKY3wpB5R5iQ+TWeb4eOV99nGKOo+
	phg4e6ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuv4-0000000F9sR-1jby;
	Mon, 18 May 2026 10:09:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuv1-0000000F9rg-22zS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:09:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC00F43E18;
	Mon, 18 May 2026 10:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7E31C2BCC6;
	Mon, 18 May 2026 10:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779098989;
	bh=u56jg7DlcON9+DXGEF4UUjo0mA99ELeWFFq/Ike9RM8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=nAy4SXupexX5Yd/Jh65iRzTGGKibrwsVMx4Do553FwQOWDk8pNtcdeQiEYw/M1y1R
	 2SOnNZtpy+5SgAR/UTPBE4m8hjVxGSdEUbt8WvJSeb8B1yYuFNRDAlglFqHBHRvNvW
	 LJhMVt2nhI0SjNrBzmKBkv6E755upD6Yg+qxgyzaAuDuWiAD3NQL9/iqv1/z5yDSCg
	 C4UPn298sXtznWOIpRevUfjk7j7bJ1BmpnEdD5QP4JwDMCfqnHEvF4jy4pM0WuR4EY
	 vIQF/SIgRVbgrx2BqHCyHOeS9ws85RQFblwxJOdRTp5yJ2n1iRZo1rT/CCT0j7jJZL
	 CeVlWEg1KkpwQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965C3CD4F54;
	Mon, 18 May 2026 10:09:49 +0000 (UTC)
From: Rex Fu via B4 Relay <devnull+Rex.Fu.amd.com@kernel.org>
Date: Mon, 18 May 2026 18:00:40 +0800
Subject: [PATCH v2] ARM: dts: aspeed: anacapa: correct SGPIO names for
 monitoring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-anacapa-sgpio-edsff-thermtrip-v2-1-e43b1847b2dc@amd.com>
X-B4-Tracking: v=1; b=H4sIAEfjCmoC/42OSwrCMBRFt1Iy9kmSfhRH7kM6yOelfUKbkMSgl
 O7dtm7A4YHDuXdhCSNhYrdqYRELJfLzBvJUMTOqeUAguzGTXHa8qTmoWRkVFKQhkAe0yTnII8Y
 pRwqgjJbyql0nNLKtESI6eh/9R//j9NJPNHmP7sZIKfv4OQ4UsXv/bhUBAqSzLV5kU7eW39Vkz
 8ZPrF/X9QvqpmBx2gAAAA==
X-Change-ID: 20260430-anacapa-sgpio-edsff-thermtrip-acb228bf61be
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Rex Fu <Rex.Fu@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779098465; l=4551;
 i=Rex.Fu@amd.com; s=20260417; h=from:subject:message-id;
 bh=R6pEDyauTB50Fmhvxn0QsYGtV2og2/4FKpGrDbJds/8=;
 b=RC64u2ytJ72iyOUFotIilIIvQnQwyvi5OfqMn3hKP+rzzxF8q2th+T0U1TtU6hXd+NbgacbZ0
 kRDPXrW5GeECk58Ywm1UgI3Pjx7idCfONhNhX9W2thRQSbad/63mm9J
X-Developer-Key: i=Rex.Fu@amd.com; a=ed25519;
 pk=26ECoh24fxrbXDKgA4hCmgg0xjQ+IxU97kXb46ovwgc=
X-Endpoint-Received: by B4 Relay for Rex.Fu@amd.com/20260417 with
 auth_id=738
X-Original-From: Rex Fu <Rex.Fu@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_030951_577792_55412825 
X-CRM114-Status: GOOD (  15.19  )
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

Update several Anacapa SGPIO line names to match the existing platform
hardware design and the signal names consumed by userspace monitoring.

The previous names did not match the actual Anacapa SGPIO usage. Some
lines were named as CPU or CPU power-good signals, but they are wired and
used on Anacapa for EDSFF presence, EDSFF power-good, boot EDSFF
presence, and thermal-trip assertion monitoring.

Correct the mappings as follows:

  PWRGD_PVDDCR_SOC_P0     -> L_PRSNT_EDSFF0_N
  PWRGD_PVDDIO_P0         -> L_PRSNT_EDSFF1_N
  PWRGD_PVDDIO_MEM_S3_P0  -> R_PRSNT_EDSFF2_N
  PWRGD_CHMP_CPU0_FPGA    -> R_PRSNT_EDSFF3_N
  PWRGD_CHIL_CPU0_FPGA    -> HPM_EDSFF_PG
  EAM2_CPU_MOD_PWR_GD_R   -> PRSNT_EDSFF_BOOT_N
  CPU0_SP7R1              -> L_EDSFF0_PG
  CPU0_SP7R2              -> L_EDSFF1_PG
  CPU0_SP7R3              -> R_EDSFF2_PG
  CPU0_SP7R4              -> R_EDSFF3_PG
  HPM_AMC_THERMTRIP_R_L   -> AMC_THERMTRIP_ASSERT
  FM_CPU0_THERMTRIP_N     -> CPU_THERMTRIP_ASSERT

The left-side EDSFF slots are numbered as EDSFF0 and EDSFF1 to match
the platform slot numbering used by userspace. The thermtrip names are
also updated to describe the asserted condition monitored by userspace
instead of the raw active-low signal names.

This is a naming correction for the existing Anacapa hardware design.
There is no new board revision or underlying hardware change involved.

Signed-off-by: Rex Fu <Rex.Fu@amd.com>
---
Update the Anacapa SGPIO line names to match the existing hardware
design and the platform signal names used by userspace monitoring.

The v2 commit message now explains why changing these userspace-visible
GPIO line names is appropriate and lists the exact old-to-new mappings.
---
Changes in v2:
- Reworked the commit message to explain why these userspace-visible
  GPIO line names are changed.
- Listed the exact old-to-new SGPIO line name mappings.
- Clarified that this is a naming correction for the existing hardware
  design and not a board revision or hardware change.
- Link to v1: https://patch.msgid.link/20260430-anacapa-sgpio-edsff-thermtrip-v1-1-2fd5e72435d0@amd.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts  | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 2cb7bd128d24..e898bc11e6f5 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -908,11 +908,11 @@ &sgpiom0 {
 	"", "", "", "",
 
 	/* G0-G7 line 96-111 */
-	"PWRGD_PVDDCR_SOC_P0", "",
-	"PWRGD_PVDDIO_P0", "",
-	"PWRGD_PVDDIO_MEM_S3_P0", "",
-	"PWRGD_CHMP_CPU0_FPGA", "",
-	"PWRGD_CHIL_CPU0_FPGA", "",
+	"L_PRSNT_EDSFF0_N", "",
+	"L_PRSNT_EDSFF1_N", "",
+	"R_PRSNT_EDSFF2_N", "",
+	"R_PRSNT_EDSFF3_N", "",
+	"HPM_EDSFF_PG", "",
 	"PWRGD_CHEH_CPU0_FPGA", "",
 	"PWRGD_CHAD_CPU0_FPGA", "FM_BMC_READY_PLD",
 	"", "",
@@ -934,7 +934,7 @@ &sgpiom0 {
 	"EAM3_BRD_PRSNT_R_L", "",
 	"EAM0_CPU_MOD_PWR_GD_R", "",
 	"EAM1_CPU_MOD_PWR_GD_R", "",
-	"EAM2_CPU_MOD_PWR_GD_R", "",
+	"PRSNT_EDSFF_BOOT_N", "",
 	"EAM3_CPU_MOD_PWR_GD_R", "",
 
 	/* J0-J7 line 144-159 */
@@ -957,8 +957,8 @@ &sgpiom0 {
 	"PDB_ALERT_R_N", "",
 
 	/* L0-L7 line 176-191 */
-	"CPU0_SP7R1", "", "CPU0_SP7R2", "",
-	"CPU0_SP7R3", "", "CPU0_SP7R4", "",
+	"L_EDSFF0_PG", "", "L_EDSFF1_PG", "",
+	"R_EDSFF2_PG", "", "R_EDSFF3_PG", "",
 	"CPU0_CORETYPE0", "", "CPU0_CORETYPE1", "",
 	"CPU0_CORETYPE2", "", "FM_BIOS_POST_CMPLT_R_N", "",
 
@@ -984,8 +984,8 @@ &sgpiom0 {
 	"HPM_PWR_FAIL", "Port80_b0",
 	"FM_DIMM_IP_FAIL", "Port80_b1",
 	"FM_DIMM_AH_FAIL", "Port80_b2",
-	"HPM_AMC_THERMTRIP_R_L", "Port80_b3",
-	"FM_CPU0_THERMTRIP_N", "Port80_b4",
+	"AMC_THERMTRIP_ASSERT", "Port80_b3",
+	"CPU_THERMTRIP_ASSERT", "Port80_b4",
 	"PVDDCR_SOC_P0_OCP_L", "Port80_b5",
 	"CPLD_SGPIO_RDY", "Port80_b6",
 	"", "Port80_b7",

---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260430-anacapa-sgpio-edsff-thermtrip-acb228bf61be

Best regards,
--  
Rex Fu <Rex.Fu@amd.com>



