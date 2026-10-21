Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6992606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xrUrz9SU;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHtg4h9j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C9OrqpqY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3dL9uTkc6EWmdkUwWGzaHGP3/aR2VFgtn/iK0yNyYs=; b=xrUrz9SUF6dR1aggrG0iFKppDt
	XafOz5GtNVCHLJIVhu3uUgUq1GDb86ovyR1RsmoP9qpaB45BAQxZzOXD+7u6n0SaO3z94psDnNL8A
	IjBlm2Q0DqzCxx9IgfomoMW6AX/TCQ7dOtdf97T6AzgI2WlGyynqpqBt7Pz0UEMAhWM6zuIsvXmFv
	VoHDRfj13zG1yeySLe6acry2MO8Y/5pPzEx+PZHVy2DTWVDSskWKS3WdtLisLDYV/LKKV9dNI3YeU
	353/H8tG/y45X/uQlpklpxqiNNTaHKoOcvDilB8K1J8IS9c0u4K3VPXpbL8YKJfoBsO+s+w1W0sCY
	SjD9512Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXJH-0000000C6FB-0rzG;
	Wed, 21 Oct 2026 14:28:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXJE-0000000C6Er-2jDs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:28:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEG2Dx518857
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e3dL9uTkc6EWmdkUwWGzaHGP3/aR2VFgtn/iK0yNyYs=; b=aHtg4h9jPUy85u47
	Mz5ILS1BosjBZbw0KYqZ1opBPpkpdYX848GwIxikzS+GZzprJsP1IaqN+TPN230B
	/vKMeeWfLee7k13RtJJtuEoiyzJPYwfiYqvTE8d/CEAZ2giu36ttkB1Dd1uTuOkh
	sRvJbKvTvIwOw0XXAaGiGPlcECRetB1hMBNtnSBtnNpUVDcvM5XQjZL/KUt7SYn1
	NsP1W6a6KyPDl1aWofKXsQ4d+bBkXFMo0mywhOX63DufvgRTN/Jmpd8e6T8SyyzR
	iboBlwFqdEOXS/U5EXJO2rl/cl4dCYKj4lHFEreHNsEeaNcpRvWyr85/bEXYIn8f
	u9ztIQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vr967-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:28:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5360b8cf8f5so2105351cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 07:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592931; x=1793197731; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e3dL9uTkc6EWmdkUwWGzaHGP3/aR2VFgtn/iK0yNyYs=;
        b=C9OrqpqY+6GJ1AID63A0hnjUUbjh/lnz6EnwuEk2PF2MDGYnNSfPAAX5XaSHBcNIn1
         YugEjA7bQPtx2gcrgvMk6qUS+g9fkHtGC+nxyx86p+GAQIfiSIUgOw4/6Gyhmua4+yMh
         LqjaPdCnaA6D7c/Gkq1OOB42yqA40jUDv8c2Kt58End/mPg6f+REAbaq4iBO9UuyvLFs
         cV7dJREVTe1z0xaS1xeytnjz6VoYWzeCo4Nf3c1iYa6Zf8bbHJcPFhkcJwCygjXO3IJr
         stUeViR2j9FtueQ+HseEHJrvIkWDqqWrlTj6Sc+WXP8qv2I6DsbDOIhGRJJ67KmPhfof
         5jbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592931; x=1793197731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e3dL9uTkc6EWmdkUwWGzaHGP3/aR2VFgtn/iK0yNyYs=;
        b=W6vVCMd1G9yYEy6vEHqWxE+pzr+d/1nhNrmOX1UGELNYS6z7zfuW1iiVZsxS6rrV55
         joxDWBlFpp6oO892qdbAbst3nGof/z4KVidFRzcJ+IF03FDvoj3gc++H8mn0mOypX4tb
         /0Cnb7WkCW82cTt+y5V7UocJQeRzgG2xWvwq4pUUargDWzqcAlY3sqmGMZi/Lf08tLBu
         i0k8lXNOoksghlzWZrjZZwbkvzCFKIb8WciGM45hqPCiNtDpmF1ryBkrMyGLe0LgcXlg
         bmwfkt/xk0u0/v0fGas8atyJNcJNOXNsw8bTUHyyP8teuWdZ4LWLh42MB45TlnBQdshV
         WVcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTJlsLIHh4JH+HBWGZiTGgOJwZgnCE30NmcHDQGi4lhmPNB2JgxxjKoHZ0YnzIA62Y916yFVy6Ya642K5Wd8wG@lists.infradead.org
X-Gm-Message-State: AFq9FYI3AYXWfRJGAgH8xzENXhV/4elaRQu8Oi+BEA97Pz6eMTHzXXsX
	ku4ZLDk710kz4fivniMTGOo6MlSzXz7SWU0gLm8EVT3mMg64p9H6PVbzKYhq+o2YniQnh/LlDLw
	L5RILPClOayuCpcwKW5uRKFcKsD2KKZRg/ruc9SDHEN3WYAezjQ/DXTO4gqYrdNYgjoCD7Cx4R6
	H4R7FjJO2BlQ==
X-Gm-Gg: AYBFou01v8yx568Fud9FfNPBt0ZZpGkpp6up+JmIYl6aSUYQZB/u1WWhArf/neeKY3v
	8DD72wUKRfX62PDiSjRNX/14YjqRC7++rko3/9iiZINPVVDfycxkXYEHcBKAQThHKG0FyRN23xp
	/gZwn7Xv+ZqkKTS2KSlFZiCzCKPCBti8OdVzNekiGoivhsjUMghxcSj2BPTcYxmwr3cuyvgBnQE
	cWTsvNhcw/cvWV8bWNOmNVe6SGMKtMpcKrVem/6Q+gUghNxA/yGSiobxz1IinRvtnJaERCYLcw0
	kq1rRi8x8dLQ0zNJfDMVGkaTSzjJidKBj9Tw+bnjigNPOhzuRSD/SsnD7dq+VZmGl38z2YPnk47
	TGbDLJilIHRuwZYk+n4gFYlG6XFH5Hc7iXkTATn3zP49GMnsaezU+3B7k1e/AqoiMgXer6LZCDz
	u/jyKEFfC8JMLiH/rDbM3zhiENR0QN8Ugfog6TkgjRNSkLpes7JgE=
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr44161621cf.0.1792592930616;
        Wed, 21 Oct 2026 07:28:50 -0700 (PDT)
X-Received: by 2002:a05:701b:4301:b0:190:e602:c769 with SMTP id a92af1059eb24-190e602c831mr3703951c88.1.1792592532053;
        Wed, 21 Oct 2026 07:22:12 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:11 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 19:51:45 +0530
Subject: [PATCH 2/7] arm64: dts: qcom: shikra-iqs-evk: Add DLC0697 panel
 overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-shikra_display_overlays-v1-2-adaea735999f@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
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
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=3273;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=1SdHP9LACk0zrDPfvaQwBE6ZycQteOiJa836MOYqgp0=;
 b=I4yujSDJotRgm+XlQ0DTv2AC5PGAmrmvjGab61NjGbGkJKrrIzD8JOlrVeoR1yQNj3qUQtwzd
 0+7enpsLH3VDLkmY1Ald/kXDlrFtl4hpiMJ3r5rFY57KPmt5oNphk7M
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: 20eCZH_dbGjGEaESfmZpEp978oRTBdvK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX2otzIb66bjM+
 ZCIqC2nDVp91RuouI3wNxC74HQ07/gLe2RqJi+b047gAPaQbINQC8FETRhcPHQVV7XQEJMAAtDY
 Vtn9pASYjMVW5xIRMv7ZgNhw/HCIQF0=
X-Proofpoint-GUID: 20eCZH_dbGjGEaESfmZpEp978oRTBdvK
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8cc23 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=P5YriGW4VMDCbuAXzasA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX46+oEbWnZNUV
 yqTyoMUJtOotCagu7KMXUdceT14wHWZ+T/CcP3Dgb/CdPFyKKRvMXQIL26vBBLjcMQxFMgjpRtk
 VkT5U7TGYtS7V7D9ftizjFVTo2G+cI53j51jGDVU3vS/2c5IfXRZcaD/8of5o0dwCRRtjX8zPjd
 dH7JFaGznlw1os7R3Gcjq4n6fT+9FT2f1ebnWrySw+dJS8Bkbf6tfjvzgISMjWQ+EGzB+Twzmf0
 QBSHrDB/J6hJ9PPmeDUqf9ll+Rm+F1EBrWRprygB4A14CVtVuSIe0rmaDBkDImDJcYVZjJyAFKM
 +M9rm6WDNcT00OznuAEHoPo4dKfVtt2ysp26i2cf7dQ5VDZ59It1AVt5leYPSSwgZUS7DCP8xpy
 1y9keH9ukpbEdcY1X2mOnr2TRhclvZEvfl4s8Ksaap+LkWzYdljLv/keatu9C97nG/Ke8eDr7pi
 UVC/9xC9A//Qwdv1fZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_072852_822135_466F56E4 
X-CRM114-Status: GOOD (  16.80  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a DT overlay for IQS, to enable DLC0697 panel when DLC daughter card
connected to PDISP1 DSI0 on carrier card.
Configure DLC0697 reset GPIO, supplies, pinctrl states and GPIO backlight
controlled through PM8150 GPIO 1.

Disable the default HDMI bridge and connector in favour of the DSI
panel.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../boot/dts/qcom/shikra-iqs-evk-dlc-panel.dtso    | 78 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index c8907e77c893..0c5a7b7f694b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -380,9 +380,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 
 shikra-cqm-evk-hdmi-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
+shikra-iqs-evk-dlc-panel-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-dlc-panel.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-dlc-panel.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-dlc-panel.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-dlc-panel.dtso
new file mode 100644
index 000000000000..2542abe59d34
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-dlc-panel.dtso
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	model = "Qualcomm Technologies, Inc. Shikra IQS EVK DLC Panel";
+
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
+		default-on;
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
+		backlight = <&backlight>;
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+		vddi-supply = <&pm8150_l15>;
+		avdd-supply = <&vreg_disp_3p3>;
+		avee-supply = <&vreg_disp_3p3>;
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
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio86";
+		function = "mdp_vsync_p";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.34.1


