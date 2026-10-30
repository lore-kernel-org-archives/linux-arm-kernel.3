Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EC260A2600
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ljueZB5H;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=moD8h8Tp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jylCRf0B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GcXqbPEHJFGrGJfbAknS9hjSRjQJhsi3SXUnT5jLmBA=; b=ljueZB5HtMg2Zn
	UzrNHwMqE1d31FtnoncYXb3gFJkANg/2eBegnDLx7ebIbF6A8ZOkyT8+N3fVNJrhvU30flIX4IavX
	IKQc/SR5v96o7BPK0svdsC6UhmDqs/gLyLVrgbyM2DJJNeUx5QF4R0AYTzdscyN5AHQOzLUSTFc/W
	cOHl+FkAqcXi52MOr1RX2CBWCGqBvcG2EyKjaG2h1y9ytB4itLFvvI+x8dvI9y4Q4sYGLbpQ0Qgng
	zioKQRz+3ViaGmcqmPO/hsB3q+2SNfAGGC/SKVIWNpy7DUz2AhIVmaM1ulA9othTzh9lf7dkFamBU
	4c9ANDoYkxnkM/cdp9Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj69-0000000BG7A-2ztv;
	Fri, 30 Oct 2026 09:40:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj5y-0000000BG2D-1FA3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 09:40:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8EqCT1761600
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GcXqbPEHJFGrGJfbAknS9hjSRjQJhsi3SXUnT5jLmBA=; b=moD8h8TpD3TQxju8
	t0/NdMyCXjS269zF8q7cAPEVOTitV7YmjuqFbm/i6w8lGxOSf0mg5nyGTz+o5Lir
	lW7zcY43NirFfRjFOOJIwi5cKas2IXdvRaDA9Ko/EZ0fNr3qgYXGsq2pNqFCGPfU
	fixSIdIqlgo/qekekjfGynaX2BOV39/h8nV2HLZhwtfMJFL/hgx8QlAPgm8uxn83
	mVy/4BYS8h/Fd/sz9Li3QW7R6UgI9J1N6cT7DUKcIZeCXiaV87YfzljR37oA6NSB
	ZG9Mp64b2Fq+HvpvP4MhA3rUNqEwxTQPzFLH/UmsEv86w14+Vvs8c+LDt4rUTKDl
	emgfug==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pa7yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:40:21 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so1639700c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 02:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353221; x=1793958021; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GcXqbPEHJFGrGJfbAknS9hjSRjQJhsi3SXUnT5jLmBA=;
        b=jylCRf0BtdhicDBPHwKFaNIou+kBXeeQrSmzVUzgXhNi5g9sJiPgoAs+qrEWmq/Km+
         zZYTfQkAZ/RTUsTkp8MEZshmu4zqdu97mfnj4Bbzxzbw3BaX5QLmF/OFIicRVh/E4eG6
         YcR+SOlQ2Sk+b8Rf4KhVo0Uiy6CYi0k+1da9mGK/XpF8eA3ydjs9rylPNWWm7MHSlT07
         N3lokk7zeAwmeG1YEsUVJCchesgieTWEk1n30S8T5sDjVj8+X7G+XO+5YCkFK9QnpJMC
         rOm30khsgwe8mOvHdRNpT9+GKRZGGgJOC2rcvo3qDX7JvZkxZ8hCRoh0NG1hpA0gXbrA
         GYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353221; x=1793958021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcXqbPEHJFGrGJfbAknS9hjSRjQJhsi3SXUnT5jLmBA=;
        b=OYxpI/z3PD1KUW8mdMZGmpuc/cHh268VeKtr8gsD25AcE5FtAsPQovfSOzuu22uOaN
         E9qZXijMSUVH7r4j1fbVIwj1rtkZwe539TzCteZk5GE885fnJ4/uEkqSkDr6KIYPtEm9
         7R69pNnDQLubxfsMVtIZa1q97ZalaLKn0AxX+xyrK6VLatY3G9c4dbmnu+J/sQ+Qj051
         dR3peJEhqENOcy1GOSMts6bTnhfg1nJUKIMdkzjQjM4VE0w59o5WNVzD3tXkix6pQUbP
         AjV6/Lfdzq52iS5HpwonsTE2X1od8VuuZeTUd5H+YEzxMA8q2KoFh7pYzcV2Vd3t4ljz
         YVqA==
X-Forwarded-Encrypted: i=1; AKwUvBxogmgHADelaSjCRAugvLyVySVVOy67fSAkbw/aKYCvKkbuD8zX83uWzX310LxBxnglGvyfc+jcB+18o2tn4dkT@lists.infradead.org
X-Gm-Message-State: AFq9FYK7P2jh7HCeL0l4Taht8CqIJq0dnaPfM+59VJGg/c3H15opNaCU
	m6+liDzMqsWbbTdE/Oi8Qw4WYDD3BbndZVygQp6OtENRK8+gK/r3ZXkO3qdrmYOre3ehSUqX+pl
	4hUnjAPWexCV0OpfpOu1adazZEC/i81twFIpfL8xWL+npJxIpLfUgl+FR78v71zkIGiRYsr7SLu
	P6NA==
X-Gm-Gg: AYBFou03UxsrDrH4fD2r07ymn/cwwC+K4wPcA0NsKBTE0xIvjGfcfcU5+evo9xlfWlx
	37BXvRGerI0SIJYqks1azpCAIpS8QAo35aSarvuAJo8YvPxty99bytwX4WLt1FFhLG7wUi7DUhC
	OACO0a2/fv3qfI9uQTcIC4NOtV4J8ODNABL/vDnCBU3ajkgfQSbkZntTHJG3VFlbVReDiHZEx09
	ynaCLY06YOEoDXViML99Ug3FuOiSLRMg6jSSbp1G3gBzKQfOMZ3orjkswIqbDfK/ZxyI0h0lKm8
	PeS5pEdTxptmo39rL86zEbAdI7J9tAIUHuRPv6xePUc+STXBuTM31OUNCykdLNsjtpP4TOlMysN
	z6PlvlPaIyTrNJQdq/OXrtueCLJrjPWwqdeP7t7Mm6NBV3claECYT8w3kewJEJQrktYDZwJFmN1
	pWpdM0
X-Received: by 2002:a05:701b:4244:10b0:188:ed6d:ebc9 with SMTP id a92af1059eb24-1ac5e6f5225mr2448081c88.38.1793353220742;
        Fri, 30 Oct 2026 02:40:20 -0700 (PDT)
X-Received: by 2002:a05:701b:4244:10b0:188:ed6d:ebc9 with SMTP id a92af1059eb24-1ac5e6f5225mr2448041c88.38.1793353220039;
        Fri, 30 Oct 2026 02:40:20 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:19 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Fri, 30 Oct 2026 15:10:05 +0530
Subject: [PATCH v2 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD
 HDMI bridge support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-lyra-display-upstream-post-v2-1-906302159392@oss.qualcomm.com>
References: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
In-Reply-To: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
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
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=3487;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=smMOiJGRXLe6vyzF3EXDVDCQHvPs18b0QYgi9/GYlL0=;
 b=NsXFVb5awnoQh4919cBqRkuvUzwXyUh7/DiD9hpttwt/QucRhVzzxzqb9/MFQvxT3gNhYtSIR
 r9B4uaQT7ClDVFBTwK3N5P1RMDGc+HDqM33y6HT7eIWZ31xs5l98VIZ
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX9aIr14g42aye
 9OxOo+7PWxoVMSIp7Unvs02GCPt3XjwCzVrwq5jMl4yRQDy730H8w3ypV1iebcUIlxqkyB/Qize
 2uf17jap/pHyHLlYNDNTMwJlQdA7Eeey3fkjzSDtHPt78/FYEEkqImtut/S89zaoObRKPTHIJGx
 QY2Wn37bP/jcglDDttXOjZNczs/724zz13EEDktkyHDeCr3GwjMAFkecthXtQtZf19SL4PWJfg9
 V0SL9zAkvlAYloY8XFkC61ww6ecdQsypg6Z4iE0Gh6bnbRVNlesmX64BPKVSo2Fi1mq7dLx/STe
 SALECeRVjICJk+pERXR2/jQ+KeA06OKMvcZ3mdG5jcYS819T3AtcnzyBRR+KqJEgy4gLEwu1AU9
 CToeuskWFpK3T+xtf9Mh0LcHBPtx0ijwq/Jjd4lsRsETB7FjdlqsVa0JIf+JRlLpp8I1q4pOtEk
 9YjN9kJ+Jq2JDrChiXA==
X-Proofpoint-GUID: NujBVZ10ZquSp_ENfi391omajSsvRLvD
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae46605 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OCdZN1uXOpAY9Qk72D0A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: NujBVZ10ZquSp_ENfi391omajSsvRLvD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX7er0RFcv1tpx
 H+yr5ezqATwVRFGqCka1LLndbkBROpzquiZQNqXmIxAj/VQGL4LEAUITGZpEL5GkyE/FleANckf
 DMmoQSnB6O2EtKInA3Kp1raR5TPrLJE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_024022_349290_3E5486F7 
X-CRM114-Status: GOOD (  14.79  )
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

From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

Add support for the Lontium LT9611UXD DSI-to-HDMI bridge, enabled by
default on the Talos Lyra EVK base board DT, to provide HDMI output
on the DSI0_B2B connector on the carrier card.

LT9611UXD is connected through I2C2, with reset and interrupt
connected to TLMM GPIO61 and GPIO60 respectively.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 105 ++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index d4468e609911..eeb8e903b03b 100644
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
@@ -22,6 +28,65 @@ dp0_connector_in: endpoint {
 			};
 		};
 	};
+
+	hdmi_connector: hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_out: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
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
@@ -113,3 +195,26 @@ &usb_2 {
 
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


