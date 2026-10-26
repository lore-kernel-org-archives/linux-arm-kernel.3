Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76AE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 14:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S6uX9Wji
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Su/NSRv3Sw/2MP6PmrgJEPefQQ31VIPrx3FkQ3Apx24=; b=S6uX9WjiNKssiH
	0M9zRVnueks3h5fyGk+JQjpbvV/ABdIl3nDrZ96LbkYY1m0wA4lF88Z4sglUPJ1zzelgaVjK5QqVK
	+0wws/Bxh2J+KgL+AKuuQbUBQAoRe95S4S3Fu/cdbi4hqbEWb8BlpqHxmgCwP/aEiioxiC2aGRCa7
	MVEvz+JMsYYzxnkJxtjKGJzQV3DnScoa6+pwk8F7M+nUWn73QmsoILtyxxw6iXcVjVk2lP30+lcsG
	GaJbvpwcrwCHXq7k8+OwenKngHNVx4Cwous5nYnCeo+p6stgPFvYZEyNKTNxdjlg0QN8s+Oa3jwG6
	IBVH3zSqCNccvOxXwXTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM7v-00000002iw3-2rje;
	Mon, 26 Oct 2026 14:56:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM7Z-00000002iY2-0mGh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 14:56:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C588644017;
	Mon, 26 Oct 2026 14:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFEF1F031E0;
	Mon, 26 Oct 2026 14:56:16 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/DNI 11/11] arm64: dts: renesas: ironhide: Enable PWM
Date: Mon, 26 Oct 2026 15:55:27 +0100
Message-ID: <d28846258918d12122704debc70b7c9bf9553053.1793026273.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793026273.git.geert+renesas@glider.be>
References: <cover.1793026273.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pulse Width Modulation (PWM) instances 0 to 5 and 16-Bit Timer Pulse
Unit (TPU) channels 0 and 1 are wired to PWM CN (CN48).

Note that TPU channels 0 and 1 are mutually-exclusive with PWM instances
4 and 5.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on out-of-tree pin control support.
---
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
index 5d919953efe4970e..c2d814da9fd97802 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -242,10 +242,87 @@ msiof6_pins: msiof6 {
 
 	};
 
+	pwm0_pins: pwm0 {
+		groups = "pwm0_a";
+		function = "pwm0";
+	};
+
+	pwm1_pins: pwm1 {
+		groups = "pwm1";
+		function = "pwm1";
+	};
+
+	pwm2_pins: pwm2 {
+		groups = "pwm2";
+		function = "pwm2";
+	};
+
+	pwm3_pins: pwm3 {
+		groups = "pwm3";
+		function = "pwm3";
+	};
+
+	pwm4_pins: pwm4 {
+		groups = "pwm4";
+		function = "pwm4";
+	};
+
+	pwm5_pins: pwm5 {
+		groups = "pwm5";
+		function = "pwm5";
+	};
+
 	scif_clk_pins: scif-clk {
 		groups = "scif_clk";
 		function = "scif_clk";
 	};
+
+	tpu_pins: tpu {
+		groups = "tpu_to0", "tpu_to1";
+		function = "tpu";
+	};
+};
+
+&pwm0 {
+	pinctrl-0 = <&pwm0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pwm1 {
+	pinctrl-0 = <&pwm1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pwm2 {
+	pinctrl-0 = <&pwm2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pwm3 {
+	pinctrl-0 = <&pwm3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pwm4 {
+	pinctrl-0 = <&pwm4_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pwm5 {
+	pinctrl-0 = <&pwm5_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
 };
 
 &scif_clk {
@@ -263,3 +340,10 @@ scmi_rx_shmem: sram@1300 {
 		reg = <0x1300 0x100>;
 	};
 };
+
+&tpu {
+	pinctrl-0 = <&tpu_pins>;
+	pinctrl-names = "default";
+
+	//status = "okay";	// Mutually-exclusive with pwm4 and pwm5
+};
-- 
2.43.0


