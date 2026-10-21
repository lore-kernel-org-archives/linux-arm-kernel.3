Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BC560A2601
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H4lbaWCy;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6T02ydL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YLJONQvo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsNPFcVHAGUVN0e2Hq2ckPVw9HP9Dj29QyVKGoAqQNE=; b=H4lbaWCy6tnRgFSAZbkRFTrMs0
	meYV4FLtW9c6We1Xlzu2SLmzeOsAls0izjzODRTSVr6KIG2yQn65+YbPvf8zj6TLIZFTp86q1h96r
	q20Xjy7agHGiF+7U6hGLsSo1sXhTHQ8GPDwHbLDvbAkNC+GvQmb6+UMvr8WB80hXPNlbwBjXnpLx4
	zMYCbucUJE0OV7SXQ8v2YXyO3pNjdkgUNgNFbQVzpjfpATheVMyGo5uAEILsa+kfnvWAnkH0j/reI
	xW6Dlw4g1wyortAhVM+hvzzhTfqwsJ2qLxsfbfbHCLus8QhEIxqOz77clkfedows7qVPV9WJeNzJX
	+YsfblEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJY4b-0000000CE6x-2n6P;
	Wed, 21 Oct 2026 15:17:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJY4V-0000000CE4n-2DBZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:17:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF5Bg3558071
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 15:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VsNPFcVHAGUVN0e2Hq2ckPVw9HP9Dj29QyVKGoAqQNE=; b=j6T02ydL//Q8S078
	kUngjU4oZAzoRfXAYuzFVRh1i5xj5apfsUtC8t9nwK4JaQhhV3wbegcpR9jvUFDP
	2ZKXfh1HFjTdxw1LHmH3B2EGDfIAyAFs/MCdFvm/+/iPoTENLAOxJEbxXBRsrc+z
	3PcSSv5C4Gxxeu60p3Z0h33znQfhtXqrzH/gEb6m7hwYzxXKoPxOJQU96z/wAlTo
	v4muCzfWi+AlIbawFD9tX3Co6Z7P07aXx0ofnPO88TsyfCm3SrrZ/N94aJ7hjLKW
	9InweytC+M7Cxs7jL+MkDrJkEcYFDcmPg/G4VUplOvtGFOh6jIiwKJRBzBsFdUw5
	HspCwA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy79rjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 15:17:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so1319552eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 08:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595862; x=1793200662; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VsNPFcVHAGUVN0e2Hq2ckPVw9HP9Dj29QyVKGoAqQNE=;
        b=YLJONQvoiwVsI/V/EB4QfdVJ2PSNWdvMlu9TOdCE+tz7pneg7fGIXzO1mWtoKhCA0W
         hW63ngO6luaDaahqOAVa0Iw/sUJf3FjOuBXTf3nMIR0VhZd4Z8Zc/ZObcNNx0zfokLHz
         u4EPXyLnniKXu/DJW36B7qQOv/fGHNuSfKhmZULopyatRqcNNlwAixqvGf5wEHaDtSSG
         y+PsVTIW4p+C0W7S2a7SqCXLaPk0lgtxljHZBQexOP9HRAfZKqT2qg69VdSc3IKjIJmO
         20bVxgg8kuW9/RsHatl8l4x2twBhzVB8xE8y5ZOazTNdrYquLbKophQyby/9FoCTfyqU
         /J8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595862; x=1793200662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsNPFcVHAGUVN0e2Hq2ckPVw9HP9Dj29QyVKGoAqQNE=;
        b=qinsDmjudPHTPdtp4Gp1N9CMesSth7YBa424CjaZ+JRCJlxLH+rxZ96CEa6/+koipP
         qUkz4r4IcspOfRx5PqqQSqMlvoPtNQ6389w4DJk4ym9KQg7+8jAZpxlvzRgD3qhmXZ8W
         DttQWdr0xX9IAuqlAdWTb19iCNlEickEg4JzkOgvnSKctLvs8LfPKs1FHd8mmfM94wI4
         +ZYOr1ZJTjDUnRH8UjZXi8v9gn99/Vb53MeoqE0qKWvCldqgXr8Bhr5JmOEnGHTuxws0
         YdQLSPJZRwM+QSBHLCymBzDEc9aWlsBrDJtRJtxdRpPlRfAgrgf54F/tTiSLpM6I5pfe
         NJew==
X-Forwarded-Encrypted: i=1; AKwUvBwd4roITHoeLn8ZGrbzbKWYpuIS6ilAIHlU9jNmZ2+M2UFNW7v1TiZ3pv+lHFFmKAYX7afWZTQICpqkuCYyoEvX@lists.infradead.org
X-Gm-Message-State: AFq9FYIQH2i2mPLjxjIiHVozd+vPrjAp05A4U9DCPz8qzNB2lOZ29YDB
	8IIojKxQ6Tuq0njj3iaurQkaPFJvhl7qLXrcZuzY/uBa9JkoNC2nbX0H403dX9jI55Kh56Ehc1C
	dtUGEJA/zUlPtgdAul5izu8IRrleA0NVJqV7tOjnBXrGCgUSU6u9fMexVosPE5qU08JUktu4hSz
	d1Tw==
X-Gm-Gg: AYBFou1a8iWc2SOLZ15Jz5ZQLBqSZ/km7ynRgJTkLSjdlmptu4380U+Apnb0ymJhAyk
	NIS+CZfNoOVIoGNuZw4dv2W6BboRjIvXpkeiihzy49ZvSA4hfGfM81awhLT5LVCarRa8p8VrD7P
	UgvzUMzWIveZdyvgDqJ8mESG2mm7yUwQ/hd9oxaGlbqBOBQ3BwOLNOICPQF6k60AAOI4iEpmPJG
	kxsWBmEL0I2SMFT9SckeBYAH/h0NPs50Nc9YFNBT0OC2aqe6tB1bwwUikFTjoBgcNGSPuFSxz2q
	1l6lw58uaS73QHa/z4lOs530ICLKlIkHfD2iU9RxM0ihKdmBPQUIgELnqWmlsjkb1epSAJIK4MH
	9AnC41d+86MLj1Jn2GaMUwav9TBzuK8vw
X-Received: by 2002:a05:693c:8942:10b0:34d:96cb:d75e with SMTP id 5a478bee46e88-3674e3571bamr3403381eec.27.1792595862145;
        Wed, 21 Oct 2026 08:17:42 -0700 (PDT)
X-Received: by 2002:a05:693c:8942:10b0:34d:96cb:d75e with SMTP id 5a478bee46e88-3674e3571bamr3403342eec.27.1792595861379;
        Wed, 21 Oct 2026 08:17:41 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:17:41 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Wed, 21 Oct 2026 20:47:25 +0530
Subject: [PATCH 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI
 bridge support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-lyra-display-upstream-post-v1-1-585caa39cd7c@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
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
        venkata.valluru@oss.qualcomm.com,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=3427;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ZxgrAd6nafolyG+/7GE/vBa/duxEvCqREClsUHxUoec=;
 b=kKaVoiWy9u76Iu3oh5yB6hy5Toxfkqe7KfqzADnMEQkwgLwX8J/n75fSu8ezTkeNBsWxBQ4sz
 kfD8BvytvZCDQMg9niDMfamu6MRqNExRW0hGmaK3Zbvjf18292hO2+O
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: EyI-lZDSdMfk7wWRGZp0YL8edSvGQ3QZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX0no0gysjMtKk
 Ykpke6oOstiBFci7t7218xgyEnYkBFxj9PH6iD0o/ltSM3mDxyhLTD3xaF7DugWK24mOZIqj8qu
 pVFwaCLAhqfS4JvyDS4QrwZzM9/YPvDDAYzjVEQfiaqUTa0eCmbrKYfxuK304xdZuIyMFn/cpng
 D/U1jSWPDWZVHGFCSqTV/l4SgiV+iD147ppZDenXKNq+zQ+khM2gcMS9yfHuDm8ersxl3AKrfh0
 wQOsr6TRuD7GEGfb+O0FM0tACx+JEcFuC6a5rUrGaIPszeo4+BRWQdpIlgRRZ74/vMOqgzPdySp
 08IzLJFSUvmdLLGVbNkMQf0nTgY/i0iSSaOek2hI6mvQ1nIzN+B8N7uqN1Y6rAb3PUtvQyqmn67
 XgzvquxWmqBOjrnRNdM3oTS9Uc9yul4pVIWnlUyf9YalmknfcSlOa2k336JBR2MY1VmtxXNkK6H
 yDso32A+nAL7UnhHm6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX2wngI4nBHY/1
 8YbpBy4JcpnlLl0Ra0J1r7D2j1G3s20mkhjeCRlGGKA4ojli8CmfVRulwgINPc9MKlpcBKYMgkf
 9ptFkzmVxdU8YRHuCpzXoJ8/6UlrBkE=
X-Proofpoint-ORIG-GUID: EyI-lZDSdMfk7wWRGZp0YL8edSvGQ3QZ
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8d797 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ggSE_kt-BB5Ld93xFnEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_081743_608376_238F2B42 
X-CRM114-Status: GOOD (  15.67  )
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

From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

Add support for the Lontium LT9611UXD DSI-to-HDMI bridge, enabled by
default on the Talos Lyra EVK base board DT, to provide HDMI output
on the DSI0_B2B connector on the carrier card.

LT9611UXD is connected through I2C2, with reset and interrupt
connected to TLMM GPIO61 and GPIO60 respectively.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 105 ++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index cfb563658fe0..ec5c10a40521 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -4,6 +4,8 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "talos-lyra-evk-som.dtsi"
 
 / {
@@ -11,6 +13,10 @@ / {
 	compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
 	chassis-type = "embedded";
 
+	aliases {
+		i2c2 = &i2c2;
+	};
+
 	dp0-connector {
 		compatible = "dp-connector";
 		label = "DP0";
@@ -25,6 +31,65 @@ dp0_connector_in: endpoint {
 		};
 	};
 
+	hdmi_connector: hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_out: endpoint {
+			remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
+	vreg_disp_3p3: regulator-disp-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+
+};
+
+&i2c2 {
+	status = "okay";
+
+	hdmi_bridge: hdmi-bridge@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 60 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vreg_disp_3p3>;
+		vdd-supply = <&vreg_s4a>;
+
+		pinctrl-0 = <&bridge_irq_pin &bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_connector_out>;
+				};
+			};
+		};
+	};
 };
 
 &i2c5 {
@@ -74,6 +139,23 @@ &mdss_dp0_out {
 	remote-endpoint = <&dp0_connector_in>;
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&hdmi_bridge_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l11a>;
+
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -135,3 +217,26 @@ &usb_qmpphy_2 {
 
 	status = "okay";
 };
+
+&tlmm {
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio60";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+};

-- 
2.55.0


