Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1B4606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 07:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qucyd5d8;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mxvH3xC7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P7y3vziC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7rtfGXo/TB8ISBwac7W+3ybFN3lhXlHO2Ccp13EvnM8=; b=qucyd5d8fURK/n
	Mu0CaAhx/FeE0DoqIrrZSKrF4FsghtnMmWzXa5NxIXW2ZPKFibeiJRB35CUg3ZQTYL7uFdwZDnlx4
	vcpyew2Pwq0yZGBPWrvsQTfzmbbP8Tkl6wr10dXhokaO5S5/5VkhbGJOLB3tR69Nfk7+8CCia6TUn
	btWAOUT7IVq3dBnyj5qn3hKHusyAm0Ki6WEqd9fAfkWDavxWA4gBm4omGgSI+662a9W5B1Vb2mUhP
	L0gKezuXL6ZW0VLmMwXKmvjoHVgtC1pa+FzdtUpewhufJVXUV2gJJ7s3NM5mQxLqy7mkSZXRfY5cB
	WD8SRJFYuwo6V0rlAHyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmWN-0000000Fkub-0W8c;
	Mon, 02 Nov 2026 07:31:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmWL-0000000FktL-0z5n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 07:31:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24Cdct1811590
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 07:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7rtfGXo/TB8ISBwac7W+3ybFN3lhXlHO2Ccp13EvnM8=; b=mxvH3xC7D5Mew46+
	j4x3MNjMuy5cj00HffYxb7RN0JMKomOaCVUJgTOGVI4+bW+Wx0S4FKy3g0xhM9AK
	kZdN3GO0rIbo+KSnKmKV9JiCLA40CdCaK9v+AUSfAKfG5UKjzaisju3OGqK03DJm
	63rKYZBs8T9S3faBKPDUAbH5Gk+I1O/9ZqlT6ldTXRKEkpfB9BKn4coGlVScNcvs
	93zjqJP4+I9CMxkcsyQ/7nw7vI4c8Tz0/QZKb+9FKOK7HE3ohsfmzER20jRDWT6w
	24JYsLYODje1vxW8mEh6vAlL7quflK9OjWY2IlqczbLaud37fRyFvxP9P/fC7CY7
	tsLcog==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rgkpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 07:31:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea446ea8c9so29986105ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 23:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604716; x=1794209516; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7rtfGXo/TB8ISBwac7W+3ybFN3lhXlHO2Ccp13EvnM8=;
        b=P7y3vziCFhmrFKM0cd45Xa1XnlNh20hqSJAwhtIkwBN9KyjwDg2eYQjBMXpqu7NjG+
         Yb9XmH9ABzswf7Pcew+tl6CZfJDB12yK4dxwqVYzBAdInBzL17qih+tenGYRGuIHlPx6
         LO0mZAgN76FruST+7on4Q2KpDJojFetc1TcbWO3pCYPBCHouaoVZNTzBGkl7rXHY7Ddr
         hJx4Sp92ilh+D0kMyRgDCkacsXqrRebxWUbvN9cvKh4Fu7y9xAk+Jp7Lwq1sP/VY1tVq
         vrophgSZ9hlbjPGT66KZx6jYv/auZxAD5pXeltRo8MDBC3CCsfwUjiFjQrAEwt0yRH7Q
         NUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604716; x=1794209516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rtfGXo/TB8ISBwac7W+3ybFN3lhXlHO2Ccp13EvnM8=;
        b=ttref8D/Z8MB4zVx8GlDHLvsk5k5DWWzSzkfZfxmFplgGd6fO6HCbuzMj1lXAEqyEO
         dq3+B4mUdUM/8gw7rz410UyE31BSY3Pim//9QRgIF25HuIFfkeR6v+CL54L05rQdGl96
         tM/yAOwe56I5Vz6seF9FKINQkV+DCCCRnl+07F309eFJT4QRa7uPL3taNPIS54npAJ3f
         Xo/K6OyeeiUhQhO9AAyDYfwZIhdOp9sI1m4Lb6NZRVNfYGyD+3mkiCoRVwYAn8WkrnEm
         jrKff/SfDnXn6TGeHkNAwCBrPFm96lJY5QUvFEca0IB2dFnxpSzftuL/7ns6UlODtD1a
         +CKg==
X-Forwarded-Encrypted: i=1; AKwUvBw8HJ/V3190cDVVLBlsSSmZzfya8JZu0ZcV50OuVDIgDMeM79BEZTzhhNb14ipvok7L+vyBTm3LExn55Urab/L4@lists.infradead.org
X-Gm-Message-State: APuU4Z+NXTe0s+uw+DiBZMiAYCO7n74LLXAmfoU9MB3W6p2kwkd6dX0b
	u9Li2bDnVXfeA9PixqSymS3FVAkZbJQ1iSXjvrWyo2NC0KRFIXltjNwHhSj0hPI+iPgHWqHpQmg
	puOvbcpW5PaqztikZ77IlY0M5RgBb344Wr2oRByxYE1jEhId0Jv3nh8NWyM/hUbTgJy9Hze8IAx
	VykQ==
X-Gm-Gg: AYBFou1G+7v/4xtR6AOjr/n7om/2uiLy6oTcwhBWIXmql03dajYDVe10qm9PuaQiC4F
	U8BT4VS3zvunZWwUS+1fnymWEAbk8QshHfAyaXUd54k0nKi3AQumbR1EmLH5PpdU937nFbLMq6b
	Cb+BpzPE/J3AGHDkb+PRXN4Rfoxpvjm2RIZMmhLHafzxHN/qRJE3heXEoUXtKnUWOSE9g0i6ZNn
	4tGRpRJrBu5g+6OteAhzgIfQ4vfenIQu9M9vqMpNjqvh9rl9a/ln3uH/S/HUrYsSwZwducnbU3M
	vggL/K1NfOw9g7g8XHKVl7DdHLRV87GKXTZGhviqhuGLwsnw+1pVxndieef4tbKmhSOlrF+WEUf
	eNGuFSagJCeSWBnUPdw2CEmZ1z1TlgYwHU8v30sXK930H+o96yY41zcNqvrY2lwc7SVGjARVfii
	4PlbeZ
X-Received: by 2002:a17:902:fc4e:b0:2ea:1b5d:9efc with SMTP id d9443c01a7336-2eb1ac94a4cmr85989995ad.34.1793604716061;
        Sun, 01 Nov 2026 23:31:56 -0800 (PST)
X-Received: by 2002:a17:902:fc4e:b0:2ea:1b5d:9efc with SMTP id d9443c01a7336-2eb1ac94a4cmr85989805ad.34.1793604715487;
        Sun, 01 Nov 2026 23:31:55 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:31:54 -0800 (PST)
From: anand.tiwari@oss.qualcomm.com
Date: Mon, 02 Nov 2026 13:01:31 +0530
Subject: [PATCH v3 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD
 HDMI bridge support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-lyra-display-upstream-post-v3-1-7f660c3b622c@oss.qualcomm.com>
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
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=3495;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=c/btaoFjC+NBLbevmkWGLPKcoYIxbxomlzBuPs/Q3lg=;
 b=0XlJkb24TOgG9iCVnuBbICGT3W5HTCvI2ti3ifJncKWA/Vu2671oZW4n/Hbh/DRusvJPsN9kO
 yWoHGl+/Pw2AACO1pwhCfh5dzLcOdSWwdCwTCtSG5OzaPQZUN0HRwaI
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: b50fWB5B9zeYHHPgdDF9mcO7XM7sBdgp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX2vZj4cZvISUq
 RNeNjsrWFpV4agiLMFX7HVTaZqsYRu4IrHbUyhmcaA8asBJGqCLpJuDO5nTVrVjlhU/VosgsHkq
 I/QpKZCMFjnXAtr4biUc3u/Dt0r84h3HHLcwR1hxHhp9i4usUEvcGsYISwRGGPghTYooE6AxQ0Q
 IvtXwPxTEeEhZoEGGM/NvOahSow5IfPayWopiQh2pbVAeyp28MsR646nYuVFCh9hLcEZaE+h5iQ
 WrOI+AhBDxJ11U5egPhZIoHz0P6o/rHn1VB+1ml2Q5JLH9lfdYm0/vDfALL7MdpNomU7yCRDocd
 AhtTY3RL8E02098pP+f3nhM2ylKaq5BdEfP/cjchfRy1Swu+SGZyLzKdl2HpaPK05tLKyly7zdL
 BT28RL9ddfrXf1LA+PayTk3Y5WxQDK0JkQy3BcHSRGZG00hW1fZnzLWHn1h9G2PRlfBKzUoPDC4
 +CsRGqGEvH9GXM/ruMQ==
X-Proofpoint-GUID: b50fWB5B9zeYHHPgdDF9mcO7XM7sBdgp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX8CrVfuH8Yrca
 zvd2QGlcKZcxkdkfescJg2J6gvWXY9CJgI6AwA5uZ8bTPt0X1Cf1ecHV2Q3cDVVFk0kRt+GJdh3
 4OuCBg5byed1cV8GahnSUdX+UdsjZ9c=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae83c6c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=UC1zgfPQo_wEPMHxqsYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_233157_280255_13168534 
X-CRM114-Status: GOOD (  15.79  )
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
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 100 ++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index d4468e609911..6a13f04a9055 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -4,6 +4,7 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "talos-lyra-evk-som.dtsi"
 
 / {
@@ -11,6 +12,10 @@ / {
 	compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
 	chassis-type = "embedded";
 
+	aliases {
+		i2c2 = &i2c2;
+	};
+
 	dp0-connector {
 		compatible = "dp-connector";
 		label = "DP0";
@@ -22,6 +27,65 @@ dp0_connector_in: endpoint {
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
@@ -74,6 +138,21 @@ &mdss_dp0_out {
 	remote-endpoint = <&dp0_connector_in>;
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l11a>;
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&hdmi_bridge_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vcca-supply = <&vreg_l5a>;
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -95,6 +174,27 @@ tpm@0 {
 };
 
 &tlmm {
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
+
 	dp_hot_plug_det: dp-hot-plug-det-state {
 		pins = "gpio104";
 		function = "dp_hot";

-- 
2.55.0


