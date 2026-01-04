Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B940BC2A062
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 19:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSw1IaweIkWmZgcN12gmjxMT6CneZYi7udZOkO6OjGE=; b=c4pM/mZZFkVEJL3Hv8hkCSusVe
	z73hYHUmLcqGyBSStsDLCGNWcqRC1txLeokOSFCLzSaW4WUNFuPCFO3m7zkN9bNIZ0/WXKrmL3Wlr
	HvDAEDgeboXN/6CF7TFeblq+zE6YnmnZYxbugGRvQxmCMjp49Wv8cG/Ebhe265uz5FiJPRgFnUgHL
	UXSjYmX6GopgKNAOP96DA7dlisYIpQpDtcZ8nluWlNFYqAAw7yh7xpWYwFtWJ0x0gJ5rAnoNrf3KI
	r4DNWk2E/vcTJKDi+44KCcfhk406U4P6l90phvJBXiCPRpkv57E7bTGs4skiAF15rcwDBfdt6qJSb
	r6WuCjdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcTZK-0000000AOlM-2Mzs;
	Sun, 04 Jan 2026 19:15:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcTZI-0000000AOkF-3hMb;
	Sun, 04 Jan 2026 19:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HSw1IaweIkWmZgcN12gmjxMT6CneZYi7udZOkO6OjGE=; b=jMwbMgItlE8qpkXB8+AiS/ok5o
	JzM1QdT/kl5uE/tL8Jtt8qFAOJUEBfDdDsSVoUl1BHeB/RQ60C7u/MOxMq5lVfNVdmTfYL6EgPXtU
	nSym/ocgFUNikvsMpawhgXXC5muLZC4jol3Fy/QaqwUgK/Uu4NbxeMcntGWxc13uzLGG88410mZ7L
	5MMnFYxWtQwWx5dZY3MkBEl88bgKTvoiSxEi8iUSWoGNu67O5aeUsaxcQeYrISyUFaI66HjIAWtDw
	pcoUEFCS7ndtjNXKpf7BlbbEoQrQ+nq0VJAqcIolfxeiInsRdAi7xRYO/yHsn35eymkUclVzyujyf
	TbRZ/ghg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcTZF-00000009Kyy-3ESg;
	Sun, 04 Jan 2026 19:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=HSw1IaweIkWmZgcN12gmjxMT6CneZYi7udZOkO6OjGE=; b=xy8zIJpAk7m1GpF2Bkk3AECZCe
	LKk6E0njVq1w5pJ36IxnE+1tb7mLD52w0SgJxFINIE3wYmIw3fLwuNXpk3+gmW+VAOJr5R+GCK7sY
	RqpCJYtgaXYPBQuC0wpdCp58wWzlbwf+z3kyVstq8WjOm6fQNIiq2Nyzjekk5sAHm84s39IlVU+XM
	Ric9GhEp09mRkW7IMbiZIYrHPUpX/QQN8BgIGBosSYPyQh9iiK2JZrwmx19f4Tv0xZhGk822G6QK6
	B/KdyhtCHLSN+DgDHmGAIH1rsAf9e+mWHCdfHDYeDuSoMxYLvm7ku9wWLzZLJ9GqKvQr5APp/JQ9z
	CfA+wWag==;
Received: from i53875ac4.versanet.de ([83.135.90.196] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vcTZA-0012Mf-DJ; Sun, 04 Jan 2026 20:15:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	uwe@kleine-koenig.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: rockchip: Fix the common combophy + SATA on QNAP TSx33 devices
Date: Sun,  4 Jan 2026 20:14:45 +0100
Message-ID: <20260104191448.2693309-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260104191448.2693309-1-heiko@sntech.de>
References: <20260104191448.2693309-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_191509_868209_7ECA6286 
X-CRM114-Status: GOOD (  11.49  )
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

The common used SATA controller on all TSx33 devices is actually SATA2.
So move the SATA controller + combophy enablement to their correct
position between shared dtsi and board devicetrees.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts  |  6 +++---
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts  |  6 +++---
 arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts
index 9a7d58e7ccc0..e76502180788 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts
@@ -18,8 +18,8 @@ aliases {
 	};
 };
 
-/* connected to sata2 */
-&combphy2 {
+/* Connected to usb_host0_xhci */
+&combphy0 {
 	status = "okay";
 };
 
@@ -93,7 +93,7 @@ hdd2_led_pin: hdd2-led-pin {
 	};
 };
 
-&sata2 {
+&sata1 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
index 02d0974d79be..708e7f1f8d0d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
@@ -28,8 +28,8 @@ vcc3v3_pcie: regulator-vcc3v3-pcie {
 	};
 };
 
-/* connected to sata2 */
-&combphy2 {
+/* Connected to usb_host0_xhci */
+&combphy0 {
 	status = "okay";
 };
 
@@ -151,7 +151,7 @@ hdd4_led_pin: hdd4_led-pin {
 	};
 };
 
-&sata2 {
+&sata1 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi
index c372ca40fd50..482d8584ec88 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi
@@ -112,13 +112,13 @@ vcc5v0_usb: regulator-vcc5v0-usb {
 	};
 };
 
-/* connected to usb_host0_xhci */
-&combphy0 {
+/* Connected USB3 on TS133 / SATA1 on all the others */
+&combphy1 {
 	status = "okay";
 };
 
-/* connected to sata1 */
-&combphy1 {
+/* Connected to SATA2 */
+&combphy2 {
 	status = "okay";
 };
 
@@ -484,7 +484,7 @@ &pmu_io_domains {
 	status = "okay";
 };
 
-&sata1 {
+&sata2 {
 	status = "okay";
 };
 
-- 
2.47.2


