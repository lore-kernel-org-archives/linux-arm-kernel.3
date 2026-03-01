Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EBBFD0045
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qY6PlBb/3IYoWMzMwgb7jsc6BOKnIQQHL1ZfsUkv5rQ=; b=OLxkgd7WlEbGXi/lkqBjCX2CGD
	ncu2MXOoF/5LWNvSmw9GA5Uexbu6wtbbz2Na5a+7LuC8c2F++Ejc2H/1iJv+Msqx35nScjCabWEHM
	3NLc4i1piZE7pehSTdSN0kwXBW6wDtURVjauCNFcq2Wf0CBEEQvmkZaW3GVOojoTEhgliBehjqIDl
	OANVxvTi5uw+HoAhXNYHOj9m8UZ4gZzcqF5Syd/CrZtqrHrAGyqBo3DgvoGTCVsLtaXX3QfbJmLJ8
	ozCwgut1WIv62T0DoJ+XB3RfMWxWSVAObBGJl3oBMhd+QN6/eeryu8SZK7mY6BI1QSp6rqS3ndycN
	A+kWkrwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVek-0000000AYaw-0TdS;
	Sun, 01 Mar 2026 01:31:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVeZ-0000000AYPW-0p1v
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:31:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9072140215;
	Sun,  1 Mar 2026 01:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7221C19421;
	Sun,  1 Mar 2026 01:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328686;
	bh=3aQtDx+2cCjgV7uZVtTouLmMk08pqxbkGzltDW3hhO8=;
	h=From:To:Cc:Subject:Date:From;
	b=SUSRy5ILxsKJjN/ZLMe11Ubk4PmgWFwrqXsbrSofGCOyiqkMjFZKzu/R0kLDXLMvq
	 w0/ut9MO0BfirkqvExSivsCBMuIH67GtOGfoA3siCKYqVfGsK23CmYQPq4bNV2y1+n
	 Odyt9AdtcC8AvD3h1Kz70N+5Rjs1+hjbv2FObDgcov8kIsJb0fAo/vwEyPWcf+mpt4
	 vgHI6v+IV0A2nGxjVQh1upwtDrRzBrLYRXFj6eCd/JqfwVCePwsYCr7sCd4NhQnJLm
	 sfivKHLI0ZOyFLUP6MNvn02dqSXdP7VdnZz0+SnxpSiDNy/GzEEle6k88jIR2sztOq
	 MUGdIaMMCni/A==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	j@jannau.net
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: FAILED: Patch "arm64: dts: apple: t8112-j473: Keep the HDMI port powered on" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:31:24 -0500
Message-ID: <20260301013124.1689908-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_173127_281985_15998E9E 
X-CRM114-Status: GOOD (  15.09  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 3e4e729325131fe6f7473a0673f7d8cdde53f5a0 Mon Sep 17 00:00:00 2001
From: Janne Grunau <j@jannau.net>
Date: Thu, 8 Jan 2026 22:04:01 +0100
Subject: [PATCH] arm64: dts: apple: t8112-j473: Keep the HDMI port powered on

Add the display controller and DPTX phy power-domains to the framebuffer
node to keep the framebuffer and display out working after device probing
finished.
The OS has more control about the display pipeline used for the HDMI
output on M2 based devices. The HDMI output is driven by an integrated
DisplayPort to HDMI converter (Parade PS190). The DPTX phy is now
controlled by the OS and no longer by firmware running on the display
co-processor. This allows using the second display controller on the
second USB type-c port or tunneling 2 DisplayPort connections over
USB4/Thunderbolt.
The m1n1 bootloader uses the second display controller to drive the HDMI
output. Adjust for this difference compared to the notebooks as well.

Fixes: 2d5ce3fbef32 ("arm64: dts: apple: t8112: Initial t8112 (M2) device trees")
Cc: stable@vger.kernel.org
Signed-off-by: Janne Grunau <j@jannau.net>
Link: https://patch.msgid.link/20260108-apple-dt-pmgr-fixes-v1-1-cfdce629c0a8@jannau.net
Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index a05951e91a022..bfa959023a0db 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -22,6 +22,25 @@ aliases {
 	};
 };
 
+/*
+ * Keep the power-domains used for the HDMI port on.
+ */
+&framebuffer0 {
+	power-domains = <&ps_dispext_cpu0>, <&ps_dptx_ext_phy>;
+};
+
+/*
+ * The M2 Mac mini uses dispext for the HDMI output so it's not necessary to
+ * keep disp0 power-domains always-on.
+ */
+&ps_disp0_sys {
+	/delete-property/ apple,always-on;
+};
+
+&ps_disp0_fe {
+	/delete-property/ apple,always-on;
+};
+
 /*
  * Force the bus number assignments so that we can declare some of the
  * on-board devices and properties that are populated by the bootloader
-- 
2.51.0





