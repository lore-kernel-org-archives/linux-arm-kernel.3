Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBFA606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 21:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k6zS463o;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eNPwtMQR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vYe8GiP6hKBNXwq/bmbj0sq6IXWr6LLeCLyGCfiUVAo=; b=k6zS463ort1U20
	BX7663QCsm1lAtJ87Jjg31p+/L5X8Xp8+JUx+l7aZpXsj+cVNdDMSxsYE3nda8QgjKrlpSvY89DUv
	f0POE9unv0Q6gN0gPrecPU8guMiUBIU/doF4Nn1dIBS2k8BL21RjWTC/xDiyLHq3CE04T90ESrtlr
	Cko2LF5jpgd8x+Az9DIVPywohglF0FIWbbloDYUfZS3bsTizBnUKH3czE8ISLhrGNpwGapnexsqbp
	bKk/OJbZkDakE8+R3JZHXmpvKZDRXY3jJ0Ct0jm6whRxBUteWnkHMooDLmvzBTWHCrhvw6yO2q4HL
	dicIck8gvrFBBF7yrPRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSVp-00000003Jyi-2m0H;
	Mon, 26 Oct 2026 21:45:49 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSVU-00000003Jfh-0IzC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 21:45:29 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-18cdcfc05ffso4238155c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 14:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793051126; x=1793655926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vYe8GiP6hKBNXwq/bmbj0sq6IXWr6LLeCLyGCfiUVAo=;
        b=eNPwtMQR9f5sc4b8+z+QYdZB4pOP+FAZcyPQ5LS2kpbGkL+C6zRRolX6tjF/pnLt6q
         ZtN5ns272NvKsn3tyiZLpCOjxOzIe7o/ZrRyk/s9rVznlSbP35nsxgixKDmkT8RdrRCc
         /jINT5XHAkKCHS4TeSeyrgtC0Crx8aa37lztI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051126; x=1793655926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vYe8GiP6hKBNXwq/bmbj0sq6IXWr6LLeCLyGCfiUVAo=;
        b=XMufUZd+ohpfynPwmayGeRzYnoXViv56PeyUXVP71KBtSe0MnR/enePQfiRLJr7f7y
         nUngy6rH/SnzgBUXDT+sA+vCCgPV33bZY9+Yghuz0ye6XCp/Yr9Y7LOFYbHjpTbObVU6
         zvy8+Pn7YgUn9I+lyo2ZbHkzATf++RMvkRUvldxE73/uDG08QKHKFpGjvqSyRw4m8p0x
         2BiNVlhQ6VZvIoTOsUi7LFBLk255JouBXe6hivkZmiPR1rs62glgyuxNmQKmlGkIOP3R
         6BaOL6tL6GXCNmtds/LMfCUKyxgBvvw/9TVOfV+C1nzIbl83Gy4wfmAh446D/XoF3kgh
         BhlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOLdFn9pqmgnRX2RXzSlEDFgfnWeE/gTtpgyasH5GX8rcHbxLMHZKKxesgsBiR3xuY8d9cQOdlgzRsHLv6jZCt@lists.infradead.org
X-Gm-Message-State: AFq9FYK84K+MQEFZFTW8s7obyzrl8nEqZSH4+EOAH7g85vf3chG0ASBw
	WeNQ/NyJX4O2Aw9ItvZQq7HUKFvzBKmnV41r5uMq/fUxB00WhPM/Nwp1ZMf03vm4Gg==
X-Gm-Gg: AYBFou1yk67rkJGk4mg3y+puPoMyFMlyzUdY4v2acFT0T1L9E/sE1kWUN443MXg3P0r
	1+R61Je9ba4AU5wsyfcVdhsUE6mKkRDGIeWTzajnhUB5otF6+MGmbbzpU4E3waL/JSKKWBmXy76
	Kjb1s87QndbIQwlOxXhhipD6nIadD8Mdaq4cW8QYsgWmN3tEp6ahpU28PLH8BQB7kTtOTw0Pknz
	SrAXJNIY3XJEDcJS2VRDoaGYTEH22++leh3dxV7dCxJ7xXyCRFeWSGjNCm1i10m+S2WXEAAg+xm
	sULXB5sQye9qLSe88sVMPbrMsfX+8h8Qow1eDo6xSlVPb1QCVS8VCZla7l6ZZghhxqDwpYJ8f03
	XfrKS9oVrBNITFp+YnXZWqVPQ5fXUSR/z4DPo1ZREEASZsKHengTNdq1VEir2qzdNRG6diZhNvH
	a9Il0pJQtO/43A+WCPvfgNk6aQcJyhfm2xqgO4iXjGhKO7tUJxEHdUqMpHrYFGfSWVpViqC8ILD
	Mnt7Qx/VmCjwSL4JyTBg8IA/LubpUaotKlmdzPBet6tVY66EZO/aM52xErrdDgVOwTCGHe1Xxe4
	5FGMKFDja5p3FAAUOytt
X-Received: by 2002:a05:701b:290b:b0:192:74cf:1db2 with SMTP id a92af1059eb24-1993505e004mr10316882c88.11.1793051126391;
        Mon, 26 Oct 2026 14:45:26 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:79c5:9cd3:db14:7468])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36a002a486csm13039391eec.22.2026.10.26.14.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:45:25 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 8/9] arm64: dts: google: Add Laguna CPM node
Date: Mon, 26 Oct 2026 14:43:46 -0700
Message-ID: <20261026144346.8.I4778aeffbdc796147efa8114431efcb201063b59@changeid>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261026214359.3122870-1-briannorris@chromium.org>
References: <20261026214359.3122870-1-briannorris@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_144528_133867_DE9A031F 
X-CRM114-Status: GOOD (  12.73  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Central Power Manager (CPM) is a co-processor on the Google Tensor
SoCs, as used on Pixel phones. CPM supports power-management and a
number of other features.

The Application Processor communicates with CPM over a pair of mailbox
channels. CPM provides clock, power-domain, reset, and interrupt
services, so we include the appropriate cell-definitions for those.

Because this also adds clock, reset, and power-domain support, we add
them to the UART node at the same time.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 arch/arm64/boot/dts/google/lga.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/google/lga.dtsi
index 6ceb9ea6a100..83b2361c5f00 100644
--- a/arch/arm64/boot/dts/google/lga.dtsi
+++ b/arch/arm64/boot/dts/google/lga.dtsi
@@ -7,8 +7,13 @@
 
 /dts-v1/;
 
+#include <dt-bindings/clock/google,lga-cpm.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq-cpm-google.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/power/google,lga-cpm.h>
+#include <dt-bindings/reset/google,lga-cpm-reset.h>
+#include <dt-bindings/soc/google,lga-lpcm.h>
 
 / {
 	#address-cells = <2>;
@@ -356,6 +361,16 @@ abl@be000000 {
 		};
 	};
 
+	cpm: cpm {
+		compatible = "google,lga-cpm";
+		#clock-cells = <2>;
+		#power-domain-cells = <1>;
+		#reset-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		mboxes = <&cpm_ap_ns_req_mba>, <&cpm_ap_ns_resp_mba>;
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
@@ -423,9 +438,14 @@ lsion_cli16_uart: serial@db62000 {
 			reg = <0x0 0x0db62000 0x0 0x100>;
 
 			clock-frequency = <200000000>;
+			clocks = <&cpm LGA_LPCM_LSIO_N LSION_CLI16_UART_CLK>,
+				 <&cpm LGA_LPCM_LSIO_N LSION_CLI16_CFG_CLK>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&cpm LGA_PD_LSIO_N_CLI_GPIO>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
+			resets = <&cpm LGA_LPCM_LSIO_N LSION_CLI16_UART_IC_CFG_RST>;
 
 			status = "disabled";
 		};
-- 
2.56.0.307.g5fe7bd680c-goog


