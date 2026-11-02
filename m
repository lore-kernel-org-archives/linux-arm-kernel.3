Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30808606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 07:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cFLNMRXz;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ECVnDx16;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ffcfGA86
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=; b=cFLNMRXzIMdL5D
	R1CMdjubSlBdTTy8nbmB8agNSRN14nhNAqkTfwc2vcwpHcMgIDlNp2W1CbmjsT9LmxDbHF0FGJ9qk
	gfhdyqY/2FOtga/+Q5wxwCO2+3jydMesyOdAuYSt/BRqTWyX5JDtv/m103M14xYcVVHOku9D7/NYo
	WNSV3U2M4tf4NcYwUbQBZ/0hbgLV9OhOFv+kEKFyUE83cU27q33IFuOmX5JuBlRKn5ym7/lZhXtlD
	uOjWHYWsgVg/RxUAPD0fZ/2qEfO2DfGLa6PGgWWnAw6NfCvmP4iHtu5Toc0CXm/i8/lP5YjwfM+Dq
	yz1F+ElWV7Wxu9FF9t0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmWT-0000000FkyI-1nZd;
	Mon, 02 Nov 2026 07:32:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmWR-0000000Fkwo-1Tbe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 07:32:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vKpa1676192
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 07:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=; b=ECVnDx16ojKqciTl
	aFtETWePWgQQSu1XOdEdYR83o+iRIZmzEHKXQ1n+uC/jUvME7ilK8evp4fRBE9+0
	9q5lMBHTTQZtXMQQjL8sKQfQtQ26fEo3ex7k7Kq0ZA54/jU1iuGpxdIp0ftxxOez
	jxbbRdF6ElB+E6l3C3N44PD6kQdjhAtAb+f762LxsbC8+TESabAdi7upVTFDacQS
	OCHhVqAxuaIumMHHKqBXCa07XoX5MDJTkzXJolSm6IVq+vcZYR0ACPPxsWLOtUdH
	UFo1qDE10DhzDxRPwbcC/+A3tiesYn6lc1sYlGXIDIIJHJk3LNfuCuqy2h56l5wi
	Ju0CWg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7wp1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 07:32:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso112315a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 23:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604721; x=1794209521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=;
        b=ffcfGA8658fi0SS5qi/l+bmJX633/3B03BTgI1t2o1EHSp0AtIum9QduSLXDOIw8Em
         x5c+/APZsWfG9bUyrG8MCWW9BVAwXqp/xkbZKpf6EPdOCsD8ZRGV6n/jJtzMP9upko9m
         L1vXg3y1hY8QPYwszYHPXwoCmggySjmbsiIVSN7f7El2j0MVzgXO0nO1VP5h+1wSU4h6
         59ESANgQC0jwvpJVRIjHmNFJQVbovJwOjXzUZqzPQDvlwVQ9xdoz16iNuTkqbCJlv5Ba
         HgxNtgl3AfpwDqXnXMKBNhxHvc1swOt+p5RV923wTdBhdH+genYbVnHU/QuuDi9Bsm6T
         jbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604721; x=1794209521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4fHyco4oWCPtLj+CaOGX9Pm5z9d4WkHpTNmqJ1OmtG4=;
        b=JVcY0K7TYnadlhSpzux4sk9HjLev2OnzmSCqREiBDhxozeOrjYhYDUrwRVokQHyT6w
         zYdG2SmLTZ2nwTBigxSE8Jenqj1XK9Pm072NcoWWoHjwlCkMs3+IRAzdcdk01tK7uwZM
         g2p0YkK0FgPC+I9mzApGmqRGVAewNKp/7XmhGR21QRFXgEKe0yE8vMBQPvdFxHphAZSs
         +DsZJZAu2eMTng1I2kiyV27LIY0xAfXygOyJAhHM5NMiiiYFL5vEJZ+vGNgHSQeLc/rj
         5pi8r3POWy7idAQBz4C6QVjZ3CRISgtAsDVusBpROCG4x156TR9mQA5qpYFXCtLYNNso
         L0pA==
X-Forwarded-Encrypted: i=1; AKwUvBzzkzKO0qR8qXeeFegtFGmdpQkB1txbdOaGFflkmv1G50z18ARxCCPHHgXdTOuyl95KqGFIZYCM1dXjkXfj5+by@lists.infradead.org
X-Gm-Message-State: APuU4Z/x1yNrwEfGMA1l3aNoXT9Z7dCexR/w/KL/7jCThgzSbRRKdETD
	9DtyfsBh2uoEkwRMmtonAit2WU9b3jqx2eL/JR51hjWWdPaOE5xXOQAAo+Jp1vacDb0ZcWi364j
	oFlIDuuqnukTnSedwRCBvp1akGajitePndvPmgaZlKHVnCyGQy7O8r8r7mb0Tit4m7sDbsETHrt
	8M+g==
X-Gm-Gg: AYBFou1dYcovQy/vqXFnylYC4aOXMJPQ7UASNgygyOLHYq3PDAlugwfTMax8tH7aE9G
	2a2BkinXFGWZcOQBpD6AWGgrRtRZvebBBfLzOiNPE+AjCX5iH9Zt9i04dqfOf4OkB9WlB3j4HXW
	1BqEngBPufTeZ9hCothOqsNRL5rxxdEdmSDC2UIT+Smy4ejNzd5A6f8v+PkBqTxxPr0XUAFD9SV
	ITq6lJT9YV6L5IeRcgXzDQ2uh8PFD76kNq6YntbFDRkuuAErOIyhH5zpobSql+zT4h4qGqnhmEp
	uoE9OqU74aaK8la7M1oq3q4GJHTCUn0ZGxWoT9GbL/UOyQ3ixfLbKsA5tqr+Jry7fYXgnPHGMc0
	JLjf+gfM6srt5Of/1UqaNwiJr+Q/HXkxCRziPfUepmg+dnOGfWC3bPcnBQUa/NqwFRpFQYwgqvp
	QCR14W
X-Received: by 2002:a17:90b:2d50:b0:3a7:96c1:f6f6 with SMTP id 98e67ed59e1d1-3ae6effc303mr9304059a91.34.1793604721271;
        Sun, 01 Nov 2026 23:32:01 -0800 (PST)
X-Received: by 2002:a17:90b:2d50:b0:3a7:96c1:f6f6 with SMTP id 98e67ed59e1d1-3ae6effc303mr9304044a91.34.1793604720766;
        Sun, 01 Nov 2026 23:32:00 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:32:00 -0800 (PST)
From: anand.tiwari@oss.qualcomm.com
Date: Mon, 02 Nov 2026 13:01:32 +0530
Subject: [PATCH v3 2/6] arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697
 panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-lyra-display-upstream-post-v3-2-7f660c3b622c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=3295;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=SEdAsyTt418trjKLHtxucoXBRSy/JerrxkxW9XWhnj4=;
 b=0qJj4A2u59oReDexzdM9x3eaVTMCYzBR2drMDK5ONPsUDXgsZ9Vbob+7xYOi3xcEqtfis2HWt
 9heqCNRD7a0Cm3/6qk+7mHd4Sd/AdilVE0ywKoK67r+el8NW+Sg85QO
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: N2xlgnicDT-1USwBYQ_wbZQ8Ep_Djedj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX5kvC5OEj6Csl
 VCrQGHFTEjC2gNvkGqrdrTEX/2IaZ0vcyozV089a7XceWvx8M4hhlFPZwqCHPHtHEKFtwfC383a
 /EB4t3gmZ0hVHdFFwz7a0vkBjk+K+No=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX3HDIzDkM3il1
 zQNLBxkZ9gXzsgX2xxrwKcuXaQxv4wN5f9rYsns9Wgn0ta1i9T3jMys0RLRL0udA5sslYVdCbog
 XR4lKyuG77/oyN2M2hlXA7R1rVdzBePi+hFjQ8g/wiMLWj2uXPoG/sEMW0RimIq4uHL7uVMpUbN
 L51eHPKJUP1+AqMAZ74UI1Gs2eC4Xj198jqtWHt/pF+GfajtcNT7xy+Lu62Zm+tsw5QtEZLp2uT
 m6zqI7Xaotn8sc+POS0E0mBJQbEicNafIAv3sKiHUGMm9AwGolnqKUg1pWIarJcPrKwfmzKXoAn
 +D8JxAxTXvHWMPaQZo95GoHXHCyyijfvFsUM/L+BgD2ZoWWl3O3iIorhHw5vkc5eN0oSR9MKxU4
 zvEbYibh31NZQKSkDZrn4Gb1tl6GJt+VWjL9GKteinwLFzebOL1hEMbIYm1hZlNJjxkI91SVaM0
 TiqOUZLrIBuulndA5oQ==
X-Proofpoint-GUID: N2xlgnicDT-1USwBYQ_wbZQ8Ep_Djedj
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae83c72 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mwcz9oGRgcW5ZIR5_CEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_233203_502999_D2A88B2E 
X-CRM114-Status: GOOD (  16.67  )
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

Add a DT overlay for Qualcomm Talos Lyra EVK, to enable DLC0697 panel
when DLC daughter card connected to DSI0_B2B on carrier card.

Configure DLC0697 reset GPIO, supplies, pinctrl states and GPIO
backlight controlled through TLMM GPIO 2.

Disable the default HDMI bridge and connector in favour of the DSI
panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
 .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      | 77 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 243231692866..709a96ece14e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -476,6 +476,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
 talos-lyra-evk-el2-dtbs	:= talos-lyra-evk.dtb talos-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk-el2.dtb
+
+talos-lyra-evk-dlc0697-dtbs := talos-lyra-evk.dtb talos-lyra-evk-dlc0697.dtbo
+dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtb
+dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso
new file mode 100644
index 000000000000..b79e54459725
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso
@@ -0,0 +1,77 @@
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
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
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
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
+		backlight = <&backlight>;
+
+		vddi-supply = <&vreg_s4a>;
+		avdd-supply = <&vreg_disp_3p3>;
+		avee-supply = <&vreg_disp_3p3>;
+
+		pinctrl-0 = <&panel_rst_n &panel_te_pin>;
+		pinctrl-1 = <&panel_rst_n_suspend>;
+		pinctrl-names = "default", "sleep";
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
+
+&tlmm {
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio98";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio118";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio118";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.55.0


