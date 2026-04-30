Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D8BFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 05:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v46Ws/xOIgw8gSDlJIUPyTMQ4uJtu1hJ8VMz+R6vOkM=; b=41bcceTGjCvKwz9epnx8xZu5ID
	9eP/V7OiXYbkB6CpvlUQMzhBkULbUtHNgzZnAlsLTwZfguCKMMX06KY8UAC0r9/QQ5Z+pSLQSYFzw
	9/rSCKUp60yrLwPN+k0N+eJFzEEKn6Ny9+b+zA8b/sIYWfBLg8NzJrztjKH+KasgU0A9JlDlfa1aI
	QztRlVXysikR4ItHreKmYpHYWYOydaZ+l6p19D44ZQo8BFT6Bcu+kJq7qey87rnQ2xv7FsshbrHRY
	Xz6eOHxkxgkiFEpPqGNsuBx6D1nEMbnjt0IRee3Ewld0JkECfcBJjzb8B0m2gK7ILgYFGHoARD2Uw
	1iTzDPww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIKDi-00000004j3C-0HIE;
	Thu, 30 Apr 2026 05:45:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIKDf-00000004j2q-0cFr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 05:45:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AB20405DF;
	Thu, 30 Apr 2026 05:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59C40C2BCB8;
	Thu, 30 Apr 2026 05:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777527948;
	bh=/tkgJeqOmmrJzR3XxdwYwLro87tsKaNd19RouarTTO8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=r3ViC7bHBo9vMLgWRlcm7dJWyLccD4DRD5a+PsvyS4nO3o0FiaJZix6dZ/FOPw8ho
	 tUxT3Hxfv0YgQa8Jt19t5Tn2eBX4DbYCkon7RXKwbE6j1+pX0Udf6eh2UHBWJJZ8wt
	 b5Z/IztnygykkV3Usd6898AC8PzhXYaUZCR24RRDiwcE3+afSlNq+xeTbqgjdJlMJG
	 iiTuYOTLLF1S1cv74OvpDdn2SqsodGr8oqPADn/fgb35wbFx1Ya/MKSmWBx31FgNE4
	 LSdEWZH9FHyysPBKdhwONZByHWLFO2zfvN3BxM1mKDDNQsuDf5XKzeNcQTGzVgXNRJ
	 Qw9GS0ZJb54uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47279CD1297;
	Thu, 30 Apr 2026 05:45:48 +0000 (UTC)
From: Rex Fu via B4 Relay <devnull+Rex.Fu.amd.com@kernel.org>
Date: Thu, 30 Apr 2026 13:44:28 +0800
Subject: [PATCH] ARM: dts: aspeed: anacapa: name EDSFF and thermtrip SGPIO
 lines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-anacapa-sgpio-edsff-thermtrip-v1-1-2fd5e72435d0@amd.com>
X-B4-Tracking: v=1; b=H4sIADvs8mkC/yXMwQrCMAwA0F8ZORvoqgzxV8RD2qVbBLuSVBHG/
 n2dHt/lrWCswga3bgXlj5gsuaE/dRBnyhOjjM3gnR/c5eyQMkUqhDYVWZBHSwnrzPqqKgUpBu+
 vIQ19YGhHUU7y/f33x9/2Dk+O9Uhh23ZG96kXgQAAAA==
X-Change-ID: 20260430-anacapa-sgpio-edsff-thermtrip-acb228bf61be
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Rex Fu <Rex.Fu@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777527924; l=1868;
 i=Rex.Fu@amd.com; s=20260417; h=from:subject:message-id;
 bh=FKvzsI9xHFmGcGo9UHVCAjhAhv7ytsitasP4Y5ub01A=;
 b=GPiFDR+/ibGE0NwGTxGFGmQdcKyr+YrgZyfg43LrcwIi2ZH7TGSoZmO77kXGMks/g4aHs7xEr
 73Dk+5T4CraD5T71ecP2h9D4jP6C68jM1Nj8r/ozRB7Hvh1j+k7MeL/
X-Developer-Key: i=Rex.Fu@amd.com; a=ed25519;
 pk=26ECoh24fxrbXDKgA4hCmgg0xjQ+IxU97kXb46ovwgc=
X-Endpoint-Received: by B4 Relay for Rex.Fu@amd.com/20260417 with
 auth_id=738
X-Original-From: Rex Fu <Rex.Fu@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_224551_242720_1676B641 
X-CRM114-Status: UNSURE (   9.69  )
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
Reply-To: Rex.Fu@amd.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Rex Fu <Rex.Fu@amd.com>

Name the Anacapa SGPIO lines used for EDSFF power-good and thermtrip
assertion signals.

The affected lines replace legacy or unused CPU-related names with the
platform signal names used by userspace monitoring.

Signed-off-by: Rex Fu <Rex.Fu@amd.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 2cb7bd128d24..fe960bb7bc27 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -912,7 +912,7 @@ &sgpiom0 {
 	"PWRGD_PVDDIO_P0", "",
 	"PWRGD_PVDDIO_MEM_S3_P0", "",
 	"PWRGD_CHMP_CPU0_FPGA", "",
-	"PWRGD_CHIL_CPU0_FPGA", "",
+	"HPM_EDSFF_PG", "",
 	"PWRGD_CHEH_CPU0_FPGA", "",
 	"PWRGD_CHAD_CPU0_FPGA", "FM_BMC_READY_PLD",
 	"", "",
@@ -957,8 +957,8 @@ &sgpiom0 {
 	"PDB_ALERT_R_N", "",
 
 	/* L0-L7 line 176-191 */
-	"CPU0_SP7R1", "", "CPU0_SP7R2", "",
-	"CPU0_SP7R3", "", "CPU0_SP7R4", "",
+	"L_EDSFF2_PG", "", "L_EDSFF3_PG", "",
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



