Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1421260A2604
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 07:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=26OuDHoz;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JlZcZHBn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q8lkH8Xp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=; b=26OuDHoznJG+eJ
	z/pLMjsiogjFkbQ+l71bqPbUjPwCQQV6N+yEyC6ZAcarl/bFxGYIElwbcW43SfVseHJlGPNzgYZAX
	g8WRYIt3YH+pJ2Sn6hRunft/lb9NhbnYP1sPxBvaDbr26gNnD3GAdDIhpe0ut0JZynEOmdQF3S1Jz
	NSEe0yCS/OaZFSJyuoC+MHt0TXa3I34+dBrpNF30JFg4k8bZmA/3vLp3Fkto6ioT43JBd3Ydy+CKS
	AWvKWzoWndkJoUvQBUyjwRdfyFskIrYP9DliI2KsrwBNjQLtibGtcDzLD9zTmXXBedAcnoIXoIEQb
	n8b10v0m58XCZnivZqrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmWd-0000000Fl6l-3hb7;
	Mon, 02 Nov 2026 07:32:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmWb-0000000Fl4S-2HXI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 07:32:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24Cdcw1811590
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 07:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=; b=JlZcZHBnYVF9GeA2
	8p1OtVdC9+8fuWyNSfFzTA3ncvHWrtZ0zIFm6DuhxWD1w6mfws+bVF7hp4Ufc4Dc
	rTypKhBbdBadyXrLdrU1/q8MJ3EuTT1qTdudmHnQAsA6YcMO1yy/HI+uLj9IEMDN
	QAZurUkLd1OrqR3NfdWEExNGY13FBQ6MWUl7+DJi8Ba5Th6Ct80N6OR6z8XOlSFj
	qCm5SG/GGDMJew8AQ12QAyRmOB4X5VPIGun/KkXGDCfsMVawr3CEvNrxUoVnBxGc
	7712yvVHFeZ5bUL3d3zXx0HspBMtDlGlF/Cxy/oibzNX0eeTZ8YxUbOd7LHUGRD7
	gSgC7g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rgkrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 07:32:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e818ca61bfso29398925ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 23:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604732; x=1794209532; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
        b=Q8lkH8XpO0GxdrfCAnTP4207ZHArQ6j6KGxs0hV/j9NpZl22BcpGaFjvntp9c3lirF
         /cduaERi8FDpPmvJIUz3RH1eMclsndLFxSFoIBoCyOPo1dlWq7Z/eUriSbuOf3vdeNRR
         QR04L8mD0LUR5z9N6w5WDTCs0uwTFV3fZw7BPfp3WEN6DC5BBkmL0iqgLIn1ymfGhtlg
         aCP3tuzXg4Xu9aqRv1DuUT9ghjLVODfGm1yBMn5puBPN4wNfoqNXg6OfpTyByJf3nGj3
         3sIpJSpGul2a2fJj2CQSv7mEcar1tQ3SCnu2kMf6bFVPIMobZmEnGHtaeUeaFWv3CRYA
         IZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604732; x=1794209532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
        b=RfCn1ADkYS11PKyCUIf6o0O6XJ5mTkOxf9xl9KYTt832eLDkC8BxMeGA+081AcXLgo
         X1cznBbUyR9Aqem07NfKU96HpeccqQvRIHASz/NrvuOX0tri+t6dbUttuSgZSYz3g6Ii
         ivkknAhZOr+4S5R4p6bb+0XqNj2ci7J172P8iva+DJHq5cV/td4qluVcoPcLpLDOgLM1
         rLyenHECeDAnPvmqjmo/vJkOknAiXe8HuCEk+43Tw33z5LiZ3OZonWzWncgobR5uRx5S
         PPOdNG9kDfe4y2U0/mrHqN2dG+BgX1seG3cN+WMS0k7B/AmGUyHuiZcC78J+owB/zRvF
         Y7PQ==
X-Forwarded-Encrypted: i=1; AKwUvByx/nIRS4RNIcAscB6dVx709W4w6m/9jQQdhqntuVEAO5nqL5lpw4KnbMllpV6DOvwzeIo/gv3eZSxWzTvEetMt@lists.infradead.org
X-Gm-Message-State: APuU4Z8rgEyKzZYEif8yKsntqYWMAxvRKFt48JRZBKB7WAn+v3+45IKo
	aRUAWcyQ7ZS7CSKdF01iLbvndjZwAD9hKKatP7ACaC0PxvLkbIQ6/VaD02JzQVhjpbIe4hNGUU8
	WQyHVh3FT1ieFR+8x8KN3KgiiXSIRRHVjWQ3tyHXM4stSBenFndHE9Bc57VVJcI1BBnlM3iR7uy
	4X7Zt0Y05ejg==
X-Gm-Gg: AYBFou2GSXDuVJ5qSGTH/7CGMSeLi3C4RgvwZfw11K4gf2suBlGiXWF7k75eSSzgquL
	XKc8CJEnUGMP24qatWXkT3LftpIrVCJi1gxX8sfWIAhH2je+A8E66k6lB6RXkM5OAruJudyLLX1
	D2bTFhtKdAee6YocEoljgKQrkWVcqTbdSssBb+++r8xV8lOXzNjXDhKnB14GYntjm04qzOGijXs
	3FT58W6rHlFSBtrHM/DtXKngtHxusakXeWpytc7OSthcn4MkgePu5IUDp4G4rS9tNdSOur/UfsJ
	KAOJ4jyCcZte9wvfJ3AW/Y6eYk1yeyVZs/dWJZyDnQiE5KYGPBaKr62iK86jvjGPnxzRAuTxWgY
	dQ2876JvwS3EVG88U2ymU205h3mLyNeP2n6ee3MMd2IWO2CF1+ZUddaK05BLT2tW1c9at/HmTp7
	dG3jmc
X-Received: by 2002:a17:902:d50a:b0:2e5:cf96:9340 with SMTP id d9443c01a7336-2eb3648bb2amr87352015ad.18.1793604732243;
        Sun, 01 Nov 2026 23:32:12 -0800 (PST)
X-Received: by 2002:a17:902:d50a:b0:2e5:cf96:9340 with SMTP id d9443c01a7336-2eb3648bb2amr87351735ad.18.1793604731764;
        Sun, 01 Nov 2026 23:32:11 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:32:11 -0800 (PST)
From: anand.tiwari@oss.qualcomm.com
Date: Mon, 02 Nov 2026 13:01:34 +0530
Subject: [PATCH v3 4/6] arm64: dts: qcom: talos-lyra-evk: Add Waveshare
 8-inch DSI panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-lyra-display-upstream-post-v3-4-7f660c3b622c@oss.qualcomm.com>
References: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
In-Reply-To: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=3607;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ep0DWydVmKj6o+MB54eb4vl9AakC4YjRhLn758mEY0w=;
 b=VLid4p+cOMuzaN+XR84jqTFFsdpcmhmMe/PF5bm2EuqoYZ3OZao77ehvpHeGJotoRMaycLjTo
 DyfAp+WLPCqA73b8lRyA3GjCp0X33v2irTJrya/+e9XPvLcuHFzOS7D
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: -AH_UlwcdULFNal-c4LQbMdzSLx_yHsT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX8qM4S20nhW6M
 ZSxSO82ev3bGcy2HhomoYx/GQvD/XZDCBvMiS58IJcw7zbEVw8nb1EmsvMzH2UJDK2fs36rR8kw
 nIBWoGH0u/DxKbeU9GIMfvv1ZeE8wY4hMiGrp0qrOgJgpCynV4v/h8aVLFsx5SLS8KKgp3hb4DM
 gpJ0DwIdpqQ5o6yIYcwcFLd5NeFAUdE9iOGltEfuc7FXT9Ikj3F0VbMmqzw7+nXuTKlGGelVhFk
 U5JqBQ4la61Wynha4LZzuPB7Aq/DkdcJgGwr+ZEoAEje5wfrZV7+ZW03ueKgVcYRF2vpCm3+nxM
 qwhqIyJiWwdP6LpN45cumshlbMKDTLqmxYaR01dgKG9I0Th+2qqMG4CHxY/UAiB58x9PsAZWwC3
 POUjn3D36G2ovgVpBnDh1OxlHPPdfbNEH+ibE3cPRPtlUrOmrY2a2Xow0M1pfZm+b2xE6HS+o6i
 j9RvgCxfX1c0KSSEeRQ==
X-Proofpoint-GUID: -AH_UlwcdULFNal-c4LQbMdzSLx_yHsT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfXzV8ARSNimOJK
 2ttBOq/ufeZjGtpcYUhhDQCHSS7Ld4pkWWJAm6Zy1Bm71RKks+RS/sPmqKDPk9E5lyVgt0NcUit
 w1i6jTJMh9FSsJ0D68tUvu/VG40GQ2I=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae83c7c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=CsxVdn2IL-oTZ3OAgFMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_233213_592949_09E409C4 
X-CRM114-Status: GOOD (  16.99  )
X-Spam-Score: -2.8 (--)
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

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay to enable Waveshare 8-inch DSI panel connected to
DSI 22pin on the carrier card.

DSI0 from SOC is routed through MUX which can be selected by DIP
switch S1016.5 ON, for enabling this 22pin connector.

Add the JD9365DA-H3 panel, GPIO expander at I2C2 address 0x45 for
panel power, reset and backlight, and the Goodix GT9271 touch
controller.

Disable the default HDMI bridge and connector in favour of the
Waveshare DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   | 75 ++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 298054f47046..b6a61339914d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -485,6 +485,11 @@ talos-lyra-evk-raspberrypi-dsi-7inch-dtbs := \
         talos-lyra-evk.dtb talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
+
+talos-lyra-evk-waveshare-dsi-8inch-dtbs := \
+        talos-lyra-evk.dtb talos-lyra-evk-waveshare-dsi-8inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-waveshare-dsi-8inch.dtb
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-waveshare-dsi-8inch.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso
new file mode 100644
index 000000000000..e9a8fdf0c179
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	panel_avdd: regulator-panel-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-avdd";
+		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_iovcc: regulator-panel-iovcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-iovcc";
+		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wsgpio: gpio@45 {
+		compatible = "waveshare,dsi-touch-gpio";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt9271";
+		reg = <0x5d>;
+		reset-gpios = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+		reg = <0>;
+
+		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&panel_iovcc>;
+		vdd-supply = <&panel_avdd>;
+		backlight = <&wsgpio>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+};

-- 
2.55.0


