Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A26606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=swDPzmKI;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=QV5zVbqx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1aOQMD6JlTDLVsQjQedtpJM3c2lEIuqtDtE0HdhEhiI=; b=swDPzmKIgp2n8j
	Y167wE2x/0sB+MSSbLzF4w9fBUy1cCA64CAdgwRRiVKbxpBqG3vpSS8gxU5HSrFSBn1+lTf9YZ5pE
	GjLiSGGrCuuJKBZr4qEcr630T0Jh0v6x6Z99XW0UAs23C5m3avvKtIHECJkGOt77dC6k5m4eKHygu
	05pfcKDsiIC4rRgMVuC1sKSYn6vI2/llQbnxkdKkDBXr18nDXB6hiKjbS1oJukjG6tkyh4OrVCdmn
	roFxuWI9JBJcFzho0aS1JAfE/jdnlubdLHUJ9PIzF6i2aFFFNEKylsEZTQkypcZ3Z40BQ4v4nsKuS
	cVkXGiovQ60pT2Dshslw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTk-0000000C0XP-3P2X;
	Fri, 06 Nov 2026 10:47:28 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTa-0000000C0Aw-1gzl;
	Fri, 06 Nov 2026 10:47:20 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07M1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:11 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07M1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962032;
	bh=1aOQMD6JlTDLVsQjQedtpJM3c2lEIuqtDtE0HdhEhiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QV5zVbqxanNS1CeFFjg+76A+oNaXC5XKw8wiH1xXRkYtRe6w30RTfhZ/lm6yVCNUK
	 uBitPPczjeZRTuRgC9NDz4yfT+smLsMEWnP8Yau3JEkJEoSGdsvmGgVhlnJpcQl0qN
	 5bHlOfkk7zDvwrfnC2HNZxwLbNrZoyhPACg5rrpY=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 07/10] arm64: dts: amlogic: meson-s4: add the GE2D
Date: Fri,  6 Nov 2026 11:46:56 +0100
Message-ID: <20261106104659.54656-8-christian.koever-draxl@student.uibk.ac.at>
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
X-CRM114-CacheID: sfid-20261106_024718_656498_65C1C26E 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

Add the GE2D 2D graphics accelerator, compatible with the AXG one.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 1e8b845b80c3..8bbd70e52a29 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -199,6 +199,16 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		ge2d: ge2d@ff040000 {
+			compatible = "amlogic,s4-ge2d";
+			reg = <0x0 0xff040000 0x0 0x10000>;
+			interrupts = <GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_periphs CLKID_GE2D>;
+			resets = <&reset RESET_GE2D>;
+			power-domains = <&pwrc PWRC_S4_GE2D_ID>;
+			status = "disabled";
+		};
+
 		gpu: gpu@fe400000 {
 			compatible = "amlogic,meson-g12a-mali", "arm,mali-bifrost";
 			reg = <0x0 0xfe400000 0x0 0x40000>;
-- 
2.56.0


