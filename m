Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDF960A3822
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H6aJE8BK;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UcxVNumr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H70xXxkg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyMSVKtr9EdhNtGJmdy/pJkUsP+zzVnpGR0dFTR6NX0=; b=H6aJE8BKGm3wwp1j5h7tjUOvQ4
	dEgF8y7dxmYO18njJGRdgZKF8RN+MxQI3ZaScd+51W96cxrYIZwm6fMUuDqCQktL0q8M3RtTQH0C3
	BqhB+RiTzIN2PRkBX3thqBZkcLy1ZPl1hWUKxPJDSLg4vkEiEmgy2PM1959U3N7ZaW3I3kS0d5cjv
	8hGZgJ7BxJSg8UzuEmRDqkbs57UL6/ePS79S1yIh5PQsgNoISZeLkDKcyUp9JMooXJ2mAYUlryqPX
	BNecduLvt1bAKGzAGVgS2rXvnDRnmDpcIwurkW3HfOQSM0/DJCRkaxEEY0xQqwPRp0H4n6/2sPSwQ
	67S83HXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXDQ-0000000C5El-1eK8;
	Wed, 21 Oct 2026 14:22:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXDN-0000000C5Ca-0lmt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:22:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF4m03558054
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HyMSVKtr9EdhNtGJmdy/pJkUsP+zzVnpGR0dFTR6NX0=; b=UcxVNumrX63VcLiC
	v4I6Gdy54rqPExcF/+P2rr40vXKgHoHwH+xmr1n/2jHcXwfTSCi+Um7TxqgEo0Yl
	qtV3RP00iXn8xvph2GkaeDh3jvmbwfbl4p0ntJZZumQi5modkAwWAFEFF0sNjoT6
	zxyUvVCisUMCRAlW4ReFtKPI6Ked/vwDIFS2oesQFO0VCBHJgZ9ctjsKHceKixkJ
	k7bwAWgV9bmyoMmJrI39Rn1SNY+jOYUckRiH47vn5ns2g7UWWJTEwxB3lWB4tPhd
	HZq88JpxhBhJmnfeELD1NmfYbkjU+E9Zfrs03VWvT0684WB5Ozy+MDyxjlKhHkNJ
	Yziudg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy79gb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:22:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35179e7f081so71103eec.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 07:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592568; x=1793197368; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HyMSVKtr9EdhNtGJmdy/pJkUsP+zzVnpGR0dFTR6NX0=;
        b=H70xXxkgbPoxEeTnHfhmvRK7AwB0U7IycLNfN9GqAAB9X0tLbE2TE/WT1XigQWzpaF
         IOfVKY00JEIsCHBw23+K/zMcfk7qS7pbauGa0WkHmybTHD+CGMLvqrgVHsF6gSZSdj79
         Hh4AoPGV55Gpa4wbaPsrzJbFaLr0pMgfghJ+as7vbfaK4OFnpPRus+qvnaASHYgLU8/l
         9rTOSIYBsYBW9XqIrjIR3dDSB5o8El3xYRWjUFdSSOH/TpFAjNIwow9ikJiqjXzoaPhq
         fxHNixZcNlBHgndaWX2FX4pV6I7tFhDJSpCoHfUg95pPeTwQA9JVStRRupjzjJVnrZu6
         RDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592568; x=1793197368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HyMSVKtr9EdhNtGJmdy/pJkUsP+zzVnpGR0dFTR6NX0=;
        b=aIAsSRKaZzZCz6RgLbW7vWBtwm7WQQwRojgHymz+ARHzQBXidqaKUFtYu2TgDSHDC0
         neXRIaTfF4M/HyQfvEZ1Nl1iG7rCQCpLqGmqAdN6spVuAcYW6xPtV2jxr2BHKrymDqKI
         a183m8Bapr01Qgacx7usaR83WA2ZnQwAssjid68Je3qru9U7x/vqmupMPhelimQwuygf
         w35xCRdu4OrlULbtglcnv8BX5egHMbd7S+7kjmGDSUulP2E+y/Vf9dkov+nI5GjO0w9B
         NZFnVBWr1OmV+5qVIB4PctFlxRt+3XlY5tUamLdMq6WrQgNtARaj/rOZvjS3kE3oX+bF
         Batg==
X-Forwarded-Encrypted: i=1; AKwUvBwf7Cdu+mQqwuElCEqAlDIuq8yMLKFv2NkbWgMKgFOU5eStGUWxUun7AKu2oP4r8q5ZkEOIxAPJLoj7em8yK0f0@lists.infradead.org
X-Gm-Message-State: AFq9FYLFEEPRCcJEhmMqt+ResUcHSPtMBH50CLf+GVxvUDhVBxMx7Etq
	TPGCpAdToNeymy6JtfX33u8d7AjFqnTgeXTBWtHXoBS1/52cEjlzZGQnlePBRgOEg+l/AHLwSsi
	AUlSQGTBSi09PtQf1YGsRZnbGmyWhCN26TEFFmWte+CAfpaB/geMQUf2KllUcUfwy4bKzjxIzPq
	/uyA==
X-Gm-Gg: AYBFou28nROaqY/jcghAUD2yNMgfzTJo61EPenA19Cc3Iu21gfIR6kWWnbNLght1QiC
	GxaHux3yTmXDV3/nGX4eDplZD8IF6Uu3y33m3CmXky9J4ahppAnY5DRjYp6qzESB5rJI9EKXXUI
	H60XkZAKHCI+j088xtsoxsUJl8fetx1nEUy7H+/8d+9/gYihRk+0DwOktMu7GOhgUz7XNIg0yei
	MWJOZiQ+00H+U3FaRo6Kb5u9lyEzKvoTXBKCXzCns7UYEYryQEDZm7GwbrJ3JyR9ttAeF7axH3R
	jb15yxVrjcBovu39aAEJN+s6nDLcHX9Hz2OSX3gIHvUlLuQuM4x/bRiEcKbsv0gEI59rOHgYcAn
	2KLTYD3gXFkkuEJMMLyrDY45Z3CQLBN9PvmX14vO5BcpTrRmJf2tuXokMaVtNWz57vWUtsOCXe5
	9WoUUiPyS1EGqsZp286Phw69M5OKUZwEO6L6MjmhJlIXVstmn3pEc=
X-Received: by 2002:a05:7022:f519:b0:14b:edb2:c3bc with SMTP id a92af1059eb24-1909acc857bmr3804231c88.0.1792592567631;
        Wed, 21 Oct 2026 07:22:47 -0700 (PDT)
X-Received: by 2002:a05:7022:f519:b0:14b:edb2:c3bc with SMTP id a92af1059eb24-1909acc857bmr3804095c88.0.1792592566027;
        Wed, 21 Oct 2026 07:22:46 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:45 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Wed, 21 Oct 2026 19:51:48 +0530
Subject: [PATCH 5/7] arm64: dts: qcom: shikra-iqs-evk: Add RPi 7-inch DSI
 panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-shikra_display_overlays-v1-5-adaea735999f@oss.qualcomm.com>
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
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=4163;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=TpPaO2PqcD2nRBXi9HeZ1MgR6queUrnw4CleGf0Oa4U=;
 b=JCHF6IH0fOz/TzfRiTH479RpPk3hAQvJpaGk73C28IV6VwzvYMD4F0iGzghoRuJXrKX5SzHw1
 jCCG6ER6/eGA+iCgoLOSeE2JMpWHXtx/gDR8leyCFeMSnru8v8KLzbJ
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: lz7YP_3T5ZFwca7MwvqkEevQHjnXBzrZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXxRvAX2yq3RGf
 CVcCkBOyZsy0atmhZeaRnWeh1kjpinUVB0+5Bpku7F8j2Vv1x5BzZ0VMgpgOoKRprN1UXYNyfOX
 4Lo+sfv1M1scIsC91wBaTDemqCkxReOER7tskVWm5Ckge4ENtCDxJ53YAWFnubuHTlKecEs7c74
 r9Va13YCpJm9yrzMyqB1yoaWpt7U8dl9ytgw45Ae7NZ8V1fXUM2CCoZFWSujQTzLbJ31B46zQOS
 iyBGWiXg6xgTSL8g0Q07DmWcMBOorjtTS7hMsQ04uZA1zR2cxI+dir6yQ8TwfxvWkil+gDviTWO
 tyX2LxurVNDPLfsMvJyj2jwKoLE94A8pO/f6VjnoaYt2hKLN3mM3rez3iSrhLRGhXNBHXJK3J0/
 HA3mFUgQheJp4jdF2I3YdDLmX/8VNfo/Ues8KtnPoxBsye5lVElBaydaiJnmVjr0nTS3r/ElQ4j
 ZW6bBGLwu4L/5oYiGqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX+JOo3uTRbD8a
 yWjpNrsNpeCM2G4hoScC0MS+10uRSF79laeEXlffttf8YBvh8WDSOwQVw4BTtXZ+oCkt4RdPqYU
 BC77VB/vyKIpnjdtJxYSUIq3UBVVkUI=
X-Proofpoint-ORIG-GUID: lz7YP_3T5ZFwca7MwvqkEevQHjnXBzrZ
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8cab8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5MclNqnbmWmJdBvsS10A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_072249_234808_30EFE35F 
X-CRM114-Status: GOOD (  17.65  )
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

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay to enable Raspberry Pi 7-inch DSI panel connected to DSI
22pin on the carrier card.
DSI0 from SOC is routed through MUX which can be selected by DIP switch
S1016.5 ON for enabling this 22-pin JDISP1 DSI0 connector.

Add the regulator and backlight controller at I2C4 address 0x45,
Goodix GT911 touch controller, panel power and reset control, and a
2-lane DSI connection.

Disable the default HDMI bridge and connector in favour of the RPi
DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../qcom/shikra-iqs-evk-raspberrypi-dsi-7inch.dtso | 91 ++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 610fe640471b..6d64e7ce197e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -382,11 +382,13 @@ shikra-cqm-evk-hdmi-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-iqs-evk-dlc-panel-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-dlc-panel.dtbo
 shikra-iqs-evk-lvds-auo,g133han01-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-lvds-auo,g133han01.dtbo
+shikra-iqs-evk-raspberrypi-dsi-7inch-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-raspberrypi-dsi-7inch.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-dlc-panel.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-lvds-auo,g133han01.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-raspberrypi-dsi-7inch.dtb
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..383dc5aadcfd
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,91 @@
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
+	model = "Qualcomm Technologies, Inc. Shikra IQS EVK Raspberry Pi 7inch DSI Panel";
+
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_display>;
+		pwms = <&mcu 0 255 0>;
+	};
+
+	reg_display: regulator-display {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-display";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_dsi_touch: regulator-dsi-touch {
+		compatible = "regulator-fixed";
+		gpio = <&mcu 1 GPIO_ACTIVE_HIGH>;
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <50000>;
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
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	mcu: gpio@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		AVDD28-supply = <&reg_dsi_touch>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+		reg = <0>;
+		reset-gpios = <&mcu 0 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_display>;
+		iovcc-supply = <&pm8150_s4>;
+		backlight = <&display_bl>;
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
+	data-lanes = <0 1>;
+	remote-endpoint = <&panel_in>;
+};

-- 
2.34.1


