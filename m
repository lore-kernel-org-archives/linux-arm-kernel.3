Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CCBE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 16:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43M8YHtNhk2Xdxg4hLigQDIcOs/dXZUzLlbnLzrCM+A=; b=lQ1atK183ySzSMc17NtSXBtz5C
	Q1mkj54q2sLNuhVtYkTGnBvIxPAORoHzk8ayGZorOkXUZJmNMTotdNMGZE5B3f7viKC6DikgBXo/d
	IRiPqh6skIQDU/Fh1g4ou4RJh7BCwOoFUg/T5T6h9Q8q4swJR71OexOh+vfkRFtpIc8sd5MBcRit+
	mnJamghlHytDv+LJ59/0yl9o2bRB6Bo/tIv3KuUdmVhIcw/PcSPdn8KWOWPDFf/mPC19ZsAJnccQC
	QXvrEMRetV4aKWjMOitNIrlu0nNi/PPBBGIKBF+QrPYz2003EComVzyHoCJckESJ/wq5bXrOjxVql
	DyYG7Ktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOg54-00000005UfL-41Pi;
	Fri, 20 Dec 2024 16:42:26 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOg1g-00000005U8k-0J8X;
	Fri, 20 Dec 2024 16:38:58 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 78FDB605C0;
	Fri, 20 Dec 2024 16:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1734712731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43M8YHtNhk2Xdxg4hLigQDIcOs/dXZUzLlbnLzrCM+A=;
	b=VqUYyH1+hZWrrOx7f9RH3XCpnLtKTx4hXf6XZ4o7/FS7KOwBYrGWCoCD9rk8mFZ4mz26I7
	JoW7iF7Yv4qcwdQUoKskak0mLOaDmMfqzVimMgvcouXPPOKyybKaEUPkLQ7B6QGlbw2IyF
	yx/+nVwg3ceiuR7845j79zWOsmvRi6s=
Received: from frank-u24.. (fttx-pool-157.180.224.233.bambit.de [157.180.224.233])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id BD93110009B;
	Fri, 20 Dec 2024 16:38:50 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v8 2/2] arm64: dts: mediatek: mt7988a-bpi-r4: Add proc-supply for cpus
Date: Fri, 20 Dec 2024 17:38:36 +0100
Message-ID: <20241220163838.114786-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220163838.114786-1-linux@fw-web.de>
References: <20241220163838.114786-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: f655c619-a270-4ee5-8faa-af6a92ff2d4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_083856_264052_D4649D95 
X-CRM114-Status: UNSURE (   9.31  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add proc-supply property to cpus on Bananapi R4 board.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
changes:
v3:
- change commit title to have prefix for r4
---
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts     | 16 ++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi        |  8 ++++----
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
index 27edc6b84f80..6623112c24c7 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
@@ -35,6 +35,22 @@ reg_3p3v: regulator-3p3v {
 	};
 };
 
+&cpu0 {
+	proc-supply = <&rt5190_buck3>;
+};
+
+&cpu1 {
+	proc-supply = <&rt5190_buck3>;
+};
+
+&cpu2 {
+	proc-supply = <&rt5190_buck3>;
+};
+
+&cpu3 {
+	proc-supply = <&rt5190_buck3>;
+};
+
 &cpu_thermal {
 	trips {
 		cpu_trip_hot: hot {
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 7a5e16a97476..88b56a24efca 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -16,7 +16,7 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			compatible = "arm,cortex-a73";
 			reg = <0x0>;
 			device_type = "cpu";
@@ -27,7 +27,7 @@ cpu@0 {
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			compatible = "arm,cortex-a73";
 			reg = <0x1>;
 			device_type = "cpu";
@@ -38,7 +38,7 @@ cpu@1 {
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
-		cpu@2 {
+		cpu2: cpu@2 {
 			compatible = "arm,cortex-a73";
 			reg = <0x2>;
 			device_type = "cpu";
@@ -49,7 +49,7 @@ cpu@2 {
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
-		cpu@3 {
+		cpu3: cpu@3 {
 			compatible = "arm,cortex-a73";
 			reg = <0x3>;
 			device_type = "cpu";
-- 
2.43.0


