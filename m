Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDCF606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jNuVpT7x;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hm9N9EiQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r+j0RfWA0Q1IHyR7Tx9qo6ls3aMcfhBj57nHBiaWQZc=; b=jNuVpT7xdihwjY
	F9V/dirEQPeLw9Rtq1B6CQN1/XCCksYbjo069CtEXawvoRr7LkwFOjvGT/eRJtqsY7KzIE4mzaDMF
	V6oQCLdAbscVJDlTHImtQCj6uFlGj2A152JXTa7AN/QTSX5BQixs5nUyTIhGrlbYoilmkStayjnbA
	R6Y6blypte8YR3nZFfyyzdR22qVzpbScyLty8+aESzVCjta30HiWimoZavCeI7GDCATjY7CGoTSEp
	ZOTQ7zbxS+9YA4pfVHTjXjpzr5A93wQOmQYT68O/SIm82NWwvgz6fK/YQIVGHtKyvmlbjMxTWQ+HP
	Iw8dqWZRxMD6t2/gmT5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtUQ-0000000EGvR-3ubr;
	Thu, 22 Oct 2026 14:09:54 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtUK-0000000EGrA-02hY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:09:49 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48e10a70540so1160427f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678186; x=1793282986; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+j0RfWA0Q1IHyR7Tx9qo6ls3aMcfhBj57nHBiaWQZc=;
        b=hm9N9EiQ+hBrKvyy+kLDIeTTnUIIfQJ2UsSPKmM0Wb2Lp/HLs8zzDmvihLjKgbx58x
         NkUeJHc1eHRb2X2fEXinaSMtB9mucIhSLByO2WDcVF5tSqgKjQyIORXLQJT/p79VBooR
         J3DwFlPavm5YiQ3iffsTj8mH461QddeXzaWmgYn9w8cUrf1dY5c03U5/FqEvX3VCwe4S
         C5GpEmpxHOVCWH1Zd2Y9ioelc4cxo8KhuYxRNQifk+wRfDe1zgGrxSP10DAZ+uGHOdVf
         YKBtMcPCj0u90ulcnhEnQIZcQI3pu8mvcQgQXLgOJNnXixgXUIN6Fc0I8C6KnQPEafvL
         FrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678186; x=1793282986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+j0RfWA0Q1IHyR7Tx9qo6ls3aMcfhBj57nHBiaWQZc=;
        b=gwQ9817jsTSGg9IU19VBVY2TF0hCHd8p+xiYHEsAUQr2PfbrXgCaGKJ5ZkpIkT5ign
         G3d+ysLD3ZIRHk1wx60tPte4fZJuN40Poay2ZOF2NsaFnBKX9BhG3D46hjPYWzJYraZn
         mLoPHLG+gdDNzmEdt+lHi/Oi/7HColu75t+qNOibCtqTRVVLM/Q+TgTTBEYXCHU61wwN
         G3wcMloioBJDpGVrAmfdMqLMCwH/mLn9hI5avCCtZVfCGRlfm+KcugIgv2ALbL2Chdhe
         xor+MaEx3YtgD+iaWVD691LTZTlUbKJZb/hbN/NnNVHSmdfpZNdPnqOlFWxsPhKM9qDC
         LW1Q==
X-Forwarded-Encrypted: i=1; AKwUvByEVcf0ctF7hFLEEHHMD1CLMLebt4LrXfpHfexNdSDrCxwxGLQTgYz1kftTPzAbd4EiF09MTtGk/gZv1zLpMaCs@lists.infradead.org
X-Gm-Message-State: AFq9FYLsCxwIBr6HHjl063nNmb/9Kf+E5lle0AcqCJKM8+oBnzojQL+h
	SGmgHWP77X/3+GVwcJAWouJ2tAxtMtwrnCTN92ADCpSUBXPaimg1RzRW
X-Gm-Gg: AYBFou0cCSzt6MTjKN/lX9Ue1N9LHaqTrgVCcvKAnteYOFvF1VnpAE4r5E0vKjNHvs7
	Kev1m5XOSne3LxFFZVdUdsBH4yFvbRQubSqQnMl+Rsqp1QqaT1j5sAeYtADW6/12LIRLon/XKWj
	ez/ar9UPvrsQUuQ4h8Gg/SOkn3PNNv2Gw0JAEV7swTb5EKTKUMnpoe4WQFkMKHzmOt2/gNLltbn
	y3Vo7+4ptL+cAPmygfQL0/ud5AGVrKhFjU1vLSfVrL/gQeVxba8FVE8oOLW2dhRGYL25a8F6Nb7
	9CeK8L6K15tGFPqiJPEn6fMideDRGbz/YbGj1h3uviYmmARUv5MM3OhlsH/Vrs/gg3InGh00CG9
	v57zHXW5qa+QWyElRlVq+FnzCQdGrJdmAWONeqQfe2ZLuL4HJWJdzDonC9pUFGceVut1rJICbEB
	ZMxl3i5kBUC6DezeocmpSwrZ3VamOgvl8JynS61NAk1+2LP9cjbMVaBXwOKYt/O9Qq+y+fjpS+h
	vQb4fCRz39AgHLs/rAnnTf28YaIxZW+7vAVLJTCRdhNOxzpsohJWRxd6lTmCbJjUk8trzSE8l0c
	a6P0DzGq4HvDNPaB1n6ElucPYIGI8UAfclO9J1i93GOfXPkerfm4pwdGq5LlU1XdCJQBwv/qK82
	E
X-Received: by 2002:a5d:5e88:0:b0:48e:f14:61bd with SMTP id ffacd0b85a97d-48e2649d869mr10539606f8f.14.1792678185088;
        Thu, 22 Oct 2026 07:09:45 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:44 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:37 +0200
Subject: [PATCH v2 5/5] arm64: dts: freescale: imx95-toradex-smarc: Add
 Cortex-M7 SER0 overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-v1-imx95-overlays-v2-5-c769d6eb54fd@toradex.com>
References: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
In-Reply-To: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_070948_086668_6B5364DC 
X-CRM114-Status: GOOD (  13.06  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

SMARC SER0 can be assigned to Cortex-M7 firmware. Label it uart_mcu so
the shared imx-tdx-uart-mcu overlay can reserve it, and combine the
overlay with the Toradex SMARC iMX95 Development Board device tree to
provide a ready-to-use DTB. On the Development Board this removes the
Linux RS485 port on SER0, while the console on SER1 (LPUART1) remains
available. Firmware must configure the UART and its pads for the
intended MCU application.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                 | 2 ++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 12786932858a..68db39369e45 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -972,6 +972,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-navq.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-osm-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev-ser0-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
@@ -991,6 +992,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
 imx95-aquila-dev-uart4-mcu-dtbs := imx95-aquila-dev.dtb imx-tdx-uart-mcu.dtbo
+imx95-toradex-smarc-dev-ser0-mcu-dtbs := imx95-toradex-smarc-dev.dtb imx-tdx-uart-mcu.dtbo
 imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx-tdx-uart-mcu.dtbo
 
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 641573c9943e..f3504b40ebb2 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -619,7 +619,7 @@ &lpuart1 {
 };
 
 /* SMARC SER0 */
-&lpuart2 {
+uart_mcu: &lpuart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
 	uart-has-rtscts;

-- 
2.43.0


