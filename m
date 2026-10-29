Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7035606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KjaBjYbn;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=km4EiAhP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WKoIHNQScpy/6jyYcISkmFBovpn5jhX4t3E1zsauVh0=; b=KjaBjYbnNyAtAnUs7dvyV5w8Z5
	qD8m56fxYK9Qf5yfA9GGdoQnoySAzLjWyBGrFPtb6RTzinctyDhsuW1CcCeqhNOghDuxR3YvbJIWi
	OwvleqBNMPl0OyTXIKVz7o7l/ZyNA4VQjOv2k60/56KZo9Am0iFhtc34f93Cs7LHlnJGO2HCchQ4h
	lCBdndANDF3L65h09HkdGwwVkCinQ3FlVR3KTtpVG7aYZ558dxMHRcUkrT/iGFSeNj14victpSNmT
	KhF6hB3SGPwL6QBE9xVj5cEEUuKMt9UQAzzIArxaGfALtfUOCU2lqofCTNyyLsKQ17kLvlvbSF00B
	roetYydQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMTk-00000008r1n-0f2Z;
	Thu, 29 Oct 2026 09:31:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMTY-00000008qvV-1NLb;
	Thu, 29 Oct 2026 09:31:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FD0760232;
	Thu, 29 Oct 2026 09:31:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793266271;
	b=TXyNMuaCNeNaO8Qucc7LjDBuY7zMelV+v8QgpClXxeJns+SF9YdMl91uxMK/hXoO/PiG
	 I4Bwt25+59bbIX95YJDyrYbqQFOBGuR3f2jnH2VNui8c3MnuFkTwZgCqJ9A1IvwMPWV9x
	 0kKMVp9gjqZkfkHhjBdZKo3s4RwzhZxaGQKKK2MgtOEReiYfm4eybSKNHSX6jlaqU/h2y
	 TeAhMH+44zp8P8SMfumZnCQQPRIacNwgAB5OPzdGlGPTWxmw8Tp1FgH1Ddu37L5dREome
	 9srnce/LforvBidzZjQmDJdvrDIUlorDO8Gtp/iWmTKC/92o9DJ6Ba5bpryINPCThbg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793266271;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WKoIHNQScpy/6jyYcISkmFBovpn5jhX4t3E1zsauVh0=;
	b=M+mMdog7vJZC6BXpCtNAXbPKW2DuncWbmDdDTN2k9QV/KXLVBzjGtrhmEXWNXq05UBsl
	 c/q4dr5eJGFegYC6vimv3DrE6tLK6NjPORXe188OLXkwkaIYmXpzAhF/7f+F2t9580wod
	 qelInBhl5IUMKwLiVYm+Yrd2JrgZDmoWHvC4NN7+lyS2ddKRwHP1aKQHga58Enk3uq07C
	 xabeNCi5CbvxiPvwaMH5C/VsR15XI0kMILiChkhHh52jr3LdAxjBKjE6Dd5OVDrqFBPGh
	 gANSx0yWDTi8lorTF5U/6eZ2jK7USvAdpovUd8nIREEJWkWXO41GsOOuxiqY38+L6iw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 944F91F031E6;
	Thu, 29 Oct 2026 09:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793266271;
	bh=WKoIHNQScpy/6jyYcISkmFBovpn5jhX4t3E1zsauVh0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=km4EiAhPzDgplHhs85Mbi1mEkL5f9DckOs5PV9ke8Obtgb7nilljYsYdFSRK1gRvH
	 JJO78ZM5GeEvCGJ4dLz2BU62LzYuxxZez3uOLhxDp/TxkMYWb/wyJR0BVGmqxAueW1
	 YfUc8jy8wCtv8DBFegzAYQyDrhdDZM0cG93fPoJRLZbS4zriMZVkXLlioFrX5Pj74Y
	 /NsDeAABzxqaQ4I6yC6HPW2ufqEp5+hKhMM4bq2FpCvIa3CJXIAE/ZkLbxKF8TfrXb
	 xuiIYIrDDaPC/OVt41Uo9YcS8CNIXBYYm8Kz6YHAXTMzZ4BxSSVTydEDG84PPpXiOz
	 qJ8ydD9HmdcFw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 27799457A7;
	Thu, 29 Oct 2026 09:31:09 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Thu, 29 Oct 2026 17:30:52 +0800
Subject: [PATCH RFC RFT v2 1/3] dt-bindings: clock: amlogic: Add PLL
 pre-divider clock IDs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261029-meson_refactor_n-v2-1-ff4ac74e527b@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
In-Reply-To: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793266267; l=6174;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=NhD9+CXL9tRSS4fVfLHNmQWwe4J418AMvGpnb3FP5WA=;
 b=qAdesZJO1XCIOuoxCthYPtYVCo//JFzOXPg6eLoiDq5SqM4tdOsTBeMKe903dUHAe45fXUDQH
 wR++V2WYoz3AzsI7KyeaGUYvUXtaJ43E210hr1gczcj0HSFwSrE6UXk
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: jian.hu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jian Hu <jian.hu@amlogic.com>

Add clock IDs for the PLL pre-divider clocks. These IDs are
required for the subsequent conversion of the PLL pre-divider
into a standalone divider clock following the PLL framework refactoring.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 include/dt-bindings/clock/amlogic,a1-pll-clkc.h | 3 +++
 include/dt-bindings/clock/amlogic,c3-pll-clkc.h | 3 +++
 include/dt-bindings/clock/amlogic,s4-pll-clkc.h | 4 ++++
 include/dt-bindings/clock/amlogic,t7-pll-clkc.h | 6 ++++++
 include/dt-bindings/clock/axg-clkc.h            | 5 +++++
 include/dt-bindings/clock/g12a-clkc.h           | 8 ++++++++
 include/dt-bindings/clock/gxbb-clkc.h           | 4 ++++
 include/dt-bindings/clock/meson8-ddr-clkc.h     | 1 +
 include/dt-bindings/clock/meson8b-clkc.h        | 4 ++++
 9 files changed, 38 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
index 0dfc5e78a2d5..c09f215bf75b 100644
--- a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
+++ b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
@@ -22,5 +22,8 @@
 #define CLKID_FCLK_DIV7		9
 #define CLKID_HIFI_PLL		10
 #define CLKID_SYS_PLL		11
+#define CLKID_FIXED_PREDIV	12
+#define CLKID_HIFI_PREDIV	13
+#define CLKID_SYS_PREDIV	14
 
 #endif /* __A1_PLL_CLKC_H */
diff --git a/include/dt-bindings/clock/amlogic,c3-pll-clkc.h b/include/dt-bindings/clock/amlogic,c3-pll-clkc.h
index fcdc558715e8..771be7d53bc0 100644
--- a/include/dt-bindings/clock/amlogic,c3-pll-clkc.h
+++ b/include/dt-bindings/clock/amlogic,c3-pll-clkc.h
@@ -36,5 +36,8 @@
 #define CLKID_MCLK1_SEL_EN			26
 #define CLKID_MCLK1_DIV				27
 #define CLKID_MCLK1				28
+#define CLKID_GP0_PREDIV			29
+#define CLKID_HIFI_PREDIV			30
+#define CLKID_MCLK_PREDIV			31
 
 #endif  /* _DT_BINDINGS_CLOCK_AMLOGIC_C3_PLL_CLKC_H */
diff --git a/include/dt-bindings/clock/amlogic,s4-pll-clkc.h b/include/dt-bindings/clock/amlogic,s4-pll-clkc.h
index af9f110f8b62..e194185f5be8 100644
--- a/include/dt-bindings/clock/amlogic,s4-pll-clkc.h
+++ b/include/dt-bindings/clock/amlogic,s4-pll-clkc.h
@@ -39,5 +39,9 @@
 #define CLKID_MPLL2			29
 #define CLKID_MPLL3_DIV			30
 #define CLKID_MPLL3			31
+#define CLKID_FIXED_PREDIV		32
+#define CLKID_GP0_PREDIV		33
+#define CLKID_HIFI_PREDIV		34
+#define CLKID_HDMI_PREDIV		35
 
 #endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S4_PLL_CLKC_H */
diff --git a/include/dt-bindings/clock/amlogic,t7-pll-clkc.h b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
index e2481f2f1163..69c90bc0be0a 100644
--- a/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
+++ b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
@@ -9,20 +9,24 @@
 /* GP0 */
 #define CLKID_GP0_PLL_DCO	0
 #define CLKID_GP0_PLL		1
+#define CLKID_GP0_PREDIV	2
 
 /* GP1 */
 #define CLKID_GP1_PLL_DCO	0
 #define CLKID_GP1_PLL		1
+#define CLKID_GP1_PREDIV	2
 
 /* HIFI */
 #define CLKID_HIFI_PLL_DCO	0
 #define CLKID_HIFI_PLL		1
+#define CLKID_HIFI_PREDIV	2
 
 /* PCIE */
 #define CLKID_PCIE_PLL_DCO	0
 #define CLKID_PCIE_PLL_DCO_DIV2	1
 #define CLKID_PCIE_PLL_OD	2
 #define CLKID_PCIE_PLL		3
+#define CLKID_PCIE_PREDIV	4
 
 /* MPLL */
 #define CLKID_MPLL_PREDIV	0
@@ -39,6 +43,7 @@
 #define CLKID_HDMI_PLL_DCO	0
 #define CLKID_HDMI_PLL_OD	1
 #define CLKID_HDMI_PLL		2
+#define CLKID_HDMI_PREDIV	3
 
 /* MCLK */
 #define CLKID_MCLK_PLL_DCO	0
@@ -52,5 +57,6 @@
 #define CLKID_MCLK_1_DIV2	8
 #define CLKID_MCLK_1_PRE	9
 #define CLKID_MCLK_1		10
+#define CLKID_MCLK_PREDIV	11
 
 #endif /* __T7_PLL_CLKC_H */
diff --git a/include/dt-bindings/clock/axg-clkc.h b/include/dt-bindings/clock/axg-clkc.h
index 442162822b88..798b92919f60 100644
--- a/include/dt-bindings/clock/axg-clkc.h
+++ b/include/dt-bindings/clock/axg-clkc.h
@@ -144,5 +144,10 @@
 #define CLKID_VDIN_MEAS_SEL			134
 #define CLKID_VDIN_MEAS_DIV			135
 #define CLKID_VDIN_MEAS				136
+#define CLKID_FIXED_PREDIV			137
+#define CLKID_SYS_PREDIV			138
+#define CLKID_GP0_PREDIV			139
+#define CLKID_HIFI_PREDIV			140
+#define CLKID_PCIE_PREDIV			141
 
 #endif /* __AXG_CLKC_H */
diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index fd09819da2ec..d2aa3df14149 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -287,5 +287,13 @@
 #define CLKID_MIPI_ISP_GATE			276
 #define CLKID_MIPI_ISP_CSI_PHY0			277
 #define CLKID_MIPI_ISP_CSI_PHY1			278
+#define CLKID_FIXED_PREDIV			279
+#define CLKID_SYS_PREDIV			280
+#define CLKID_GP0_PREDIV			281
+#define CLKID_HIFI_PREDIV			282
+#define CLKID_HDMI_PREDIV			283
+#define CLKID_PCIE_PREDIV			284
+#define CLKID_SYS1_PREDIV			285
+#define CLKID_GP1_PREDIV			286
 
 #endif /* __G12A_CLKC_H */
diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
index c0ce5e9c4151..e2e1ec60285d 100644
--- a/include/dt-bindings/clock/gxbb-clkc.h
+++ b/include/dt-bindings/clock/gxbb-clkc.h
@@ -212,5 +212,9 @@
 #define CLKID_HDMI_DIV		204
 #define CLKID_HDMI		205
 #define CLKID_ACODEC		206
+#define CLKID_FIXED_PREDIV	207
+#define CLKID_HDMI_PREDIV	208
+#define CLKID_SYS_PREDIV	209
+#define CLKID_GP0_PREDIV	210
 
 #endif /* __GXBB_CLKC_H */
diff --git a/include/dt-bindings/clock/meson8-ddr-clkc.h b/include/dt-bindings/clock/meson8-ddr-clkc.h
index a8e0fa2987ab..ce97a15c28a9 100644
--- a/include/dt-bindings/clock/meson8-ddr-clkc.h
+++ b/include/dt-bindings/clock/meson8-ddr-clkc.h
@@ -2,3 +2,4 @@
 
 #define DDR_CLKID_DDR_PLL_DCO			0
 #define DDR_CLKID_DDR_PLL			1
+#define DDR_CLKID_DDR_PREDIV			2
diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index 385bf243c56c..c4fd127dca1e 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -221,5 +221,9 @@
 #define CLKID_VCLK2_EN		215
 #define CLKID_VID_PLL_LVDS_EN	216
 #define CLKID_HDMI_PLL_DCO_IN   217
+#define CLKID_PLL_FIXED_PREDIV	218
+#define CLKID_PLL_SYS_PREDIV	219
+#define CLKID_HDMI_PREDIV	220
+#define CLKID_GP_PREDIV		221
 
 #endif /* __MESON8B_CLKC_H */

-- 
2.47.1



