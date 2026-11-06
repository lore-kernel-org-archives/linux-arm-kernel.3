Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914F2606D839
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ar350JuR;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=dCSUZjxD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TlLop1f5KLIoXxFGbo5pP4WCmCI9XMrzolGtBjxYqxo=; b=Ar350JuRZBh9DN
	As1k1P0FtafOJ6t3I/s2AFGN3KibN4QorEVP8n2iG6yRSQLC3fuP8TNGG6dHwJKRrxzkylaQkkfnX
	SeG9ZO8nF092mKxe7KuZi/YSnEcLeY5yhj9Qo9cOgWGid8Uen86ThKHBaMtG4nxJ1oETkFAgUkWtG
	Bz9/BUh5TcaO91TjkpDqGGNbw1iulk5o5SsBRwzsSetoFGZf5IbX/q5PGO2ezkERw95UrelLWFCVk
	J+lhpHTAhUCN+w4XT5z1kYegbie9IV0Q1nbiAwVlFcG6sMRNfPGuQeA9iCnHBfkKxzqgEi/0QZYb9
	AXfAUQdKpRlG2cEn8AXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTe-0000000C0KG-1DaS;
	Fri, 06 Nov 2026 10:47:22 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTY-0000000C06i-1I1R;
	Fri, 06 Nov 2026 10:47:18 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07K1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:09 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07K1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962029;
	bh=TlLop1f5KLIoXxFGbo5pP4WCmCI9XMrzolGtBjxYqxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dCSUZjxD1QrtEmx1pU2Gc2RTo4R42OPJhTa97VP7hTZnmS6Swf7aBXFQJu8qPa70B
	 dwatHvO2BfEleR7En2RKeVPqmvqxxKUujbeaHWaorhx2y2VrEnGMyOQeV1oYMZxSG5
	 mxNBPws9phn6tbSsb3QXYhZpBF19L+RKVH3LOV0w=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 05/10] arm64: dts: amlogic: meson-s4: add the Mali GPU
Date: Fri,  6 Nov 2026 11:46:54 +0100
Message-ID: <20261106104659.54656-6-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024716_716195_8B2B0CB3 
X-CRM114-Status: GOOD (  12.52  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Add the Mali-G31 GPU with its operating points. The GPU rail is not
switchable, so it scales by frequency only, over the fixed fclk derived
rates the vendor DVFS table uses as well.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 55 +++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 793c7bb9512e..69105c8abf12 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -126,6 +126,40 @@ vrtc: rtc@fe010288 {
 		reg = <0x0 0xfe010288 0x0 0x4>;
 	};
 
+	/*
+	 * The Mali rail is not switchable on this SoC, so the GPU scales by
+	 * frequency alone. Every rate here is one of the fixed fclk dividers,
+	 * optionally halved or quartered by the mali divider, which is what
+	 * the vendor DVFS table uses as well. Its 850 MHz point is left out
+	 * because it needs GP0 PLL, and the mali mux is not allowed to
+	 * reprogram its parents.
+	 */
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+
+		opp-124999998 {
+			opp-hz = /bits/ 64 <124999998>;
+		};
+		opp-249999996 {
+			opp-hz = /bits/ 64 <249999996>;
+		};
+		opp-285714281 {
+			opp-hz = /bits/ 64 <285714281>;
+		};
+		opp-399999994 {
+			opp-hz = /bits/ 64 <399999994>;
+		};
+		opp-499999992 {
+			opp-hz = /bits/ 64 <499999992>;
+		};
+		opp-666666656 {
+			opp-hz = /bits/ 64 <666666656>;
+		};
+		opp-799999988 {
+			opp-hz = /bits/ 64 <799999988>;
+		};
+	};
+
 	xtal: xtal-clk {
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
@@ -164,6 +198,27 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		gpu: gpu@fe400000 {
+			compatible = "amlogic,meson-g12a-mali", "arm,mali-bifrost";
+			reg = <0x0 0xfe400000 0x0 0x40000>;
+			interrupt-names = "job", "mmu", "gpu";
+			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			/*
+			 * CLKID_MALI is only the system bus gate. The core is
+			 * fed by the glitch-free mali mux, which is the clock
+			 * the OPP table scales.
+			 */
+			clocks = <&clkc_periphs CLKID_MALI_SEL>,
+				 <&clkc_periphs CLKID_MALI>;
+			clock-names = "core", "bus";
+			resets = <&reset RESET_MALI_APB>, <&reset RESET_MALI>;
+			operating-points-v2 = <&gpu_opp_table>;
+			#cooling-cells = <2>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@fff01000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.56.0


