Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAB8606A322
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IhWLepeA;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JgCi4c+l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQG8PMv6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=; b=IhWLepeAYudVAY
	GvIX3Zow3jegtwmGu97eRfdErV63eWYdqcjTLyi558SXiUostrRzy3pZ5LMwS3LU7qS6Mb7vwfxOx
	vYmdGW3kBYbISr723pwK/etxtyzcIG6YHvGOQ6hPDep4AnLdvbYsze1H33njzV6CFbRmKzOrcVh0A
	OoEAV9c6s0L3i/bHoor2UuVHr6/O2cdJnO+zt0GcdeXmsoKKiaGSwVgcyzyD+aiD/xzTTFZaVLn2M
	o8jsSZOZowAqb9U7ZZSH4NlC0uHmRYlrIB3Y/nYDwSiOe1wC9r+zJscGaILzrMHoscr5/yY40PM5u
	txVH7Bmf7eSJxBxTgxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj6U-0000000BGMd-1wFu;
	Fri, 30 Oct 2026 09:40:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMj6E-0000000BGAF-0mWR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 09:40:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8Exmo1761704
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=; b=JgCi4c+lCujG10/2
	/wblWEv7Hpb9yxZohCorfY68XaIr+Sj1bFbHb2tBFrY4LQSLN+DdSJO79aXubwTR
	GJGlCJvfTzhqLStBtGGUEZ2TXqzsKHV5LXqZDu8NSsoVY/Jai7w1v1IibTHPvrdD
	nYrQysBaPlyS5Ai26ggYqZzRn3nW44P2kMN40l7oS2VxuMJIGrRb7OmER09rVUzE
	uzLZFsNAIbFOlxvWqE2RvUYm/deAJ6/aWE/WrsfdI8WPiZ/DznwM+hP0QkUUpRHS
	w7UEcvkTOvWYVTaDcVX7dLwOt3wu22YBai4486FWa5LTGJOfHZR5HRpRKSWlpolo
	kWqAug==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pa80q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:40:37 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-147be78cd56so1774143c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 02:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353237; x=1793958037; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
        b=FQG8PMv6fvuoZDWPUlPRCzwDvtabuAhm3rbiPKMt5rMx8bka2i6fJSCBYClyd0AxXl
         X0sOYckfEBuCrGIV+ZYuffDSgD1syCewL+R5souzCodF3tzhypbE7hdhVLuk8ZZ0hq2H
         CTp6o0Z8rE1z8Bx5BmTMnJRxJPFk50K/oTiBMC3tUFc3oKAkkrMQ9MtD2QQu/LVJuGR/
         r6S5ipiVbb4gvdZgk4r3icVTZKJvlcb5nHQ+OPu6rHKY/GdC0k1zjJBJcOgUJkQOy3g3
         m857G5lK8tyx94+i38JtK3yCdBWbNE6nR74fqQdfepxxnR1KiB/dMQeVSUDf3rzb3TAv
         odSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353237; x=1793958037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
        b=SEel/R9p6OCS2gOaJBFufbY/9DB3vZKb4Kfu6PYJzxrWelznD+DXNZZqY4pvh5b+4m
         u09P8cISaGq8eKV46LCieTYTeMa1NNOBNqpKemHc0nkJetuNbB2kyvMnHYx09VyNrOFH
         u93CUFXa+2SRD5Ex7j4hURr1NUXrngqxYWGGvmtJWINFbqQIddQ6gtAgsxSGgc390p+e
         1WphMxPKAQ3Uk2NwGk5dGN3rrpbDS/AuVO8ZCCYWq9dZ6IL+2/LxIPP6YGQrYASvq6X1
         4Cblb8IxEQRYgq/0w85zsEKd76RPHwWrZLi7Hmwcmg6nV/WpoRR5K9DB/0YSGgbDk94w
         Qpbg==
X-Forwarded-Encrypted: i=1; AKwUvBxeQSI4kDcU4s6RFYXqKczDCD3O4Y+9sBe/J8/jUGI5CQynC1NYfIDnAEi+RhYmNNancDx0yUos7HGI4SfaPTDA@lists.infradead.org
X-Gm-Message-State: AFq9FYK+CSqtgCNPIM82HixmLJlNnLkkuZffSHEgOfNM+23azCvKPgY8
	SC0UF/K+t02lCyA60EEnKctdkIEms6GKcydu4QijSTvIV79YEvVsq14OBHVTxw17qqlDCRc2R3Z
	bY5zsvwMJHG1R/aM0koN7sC2/lwBhBq6pPZYiteAlkqoRhzBrkSDFfCb2HF3id12z51Jj5AT2wF
	vmJA==
X-Gm-Gg: AYBFou3WbRa38VqgW4bvn5sMK0p3pMxnDK9OJGf3iS+CkN0oR4ln4T1+yKVn3tI7HHV
	IotMEfoO+K6bKOPqGz8qQNPbNSV/U6/q6y6rLeyhf/bfiM2N7YJ66ikZ2gPm5bR3LCIkGWCRb6K
	l7K/cZ+9veIXyd3OeDRFGJmsDfcETYpHvunM/mDAWFsrvqioOwmv564ECHfrvJb5L/qXhjWvRND
	CgIqfmgfNuRA/WRGyN2ZwBcQOQaHPizhBZOOGz6UJ8qwpdbNzqwjO1yKoDHsyzO55V1GZVAoEGB
	7qNdZxqdPcqh23Z/5xE3/Y/oMe+8G86jMRpxW51r/rpkCU9YtYkT/lYn6GC4NnyjWFwemP/44zE
	PMCV0X9u5wRekkwVFexiI9BXEX9G+xUA74tM+Y/yAUUbqxfIo/3ELso9BPt7YTiNUCptwUqEK0j
	Csk9uC
X-Received: by 2002:a05:7022:1181:b0:154:e9d2:d741 with SMTP id a92af1059eb24-1ac5bbb4870mr2248826c88.8.1793353236506;
        Fri, 30 Oct 2026 02:40:36 -0700 (PDT)
X-Received: by 2002:a05:7022:1181:b0:154:e9d2:d741 with SMTP id a92af1059eb24-1ac5bbb4870mr2248785c88.8.1793353235780;
        Fri, 30 Oct 2026 02:40:35 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:35 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Fri, 30 Oct 2026 15:10:08 +0530
Subject: [PATCH v2 4/6] arm64: dts: qcom: talos-lyra-evk: Add Waveshare
 8-inch DSI panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-lyra-display-upstream-post-v2-4-906302159392@oss.qualcomm.com>
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
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=3607;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ep0DWydVmKj6o+MB54eb4vl9AakC4YjRhLn758mEY0w=;
 b=wYTMEsgUVYO0whhO2gojRLKPeuIrfFxFXHSVh20w30m9pH52rzlRdjc7korVVTHAdaNMpAonk
 55mKCoygj7CDuxvIdmAw7kxTfwVShzIEMmwQG0AKVnURR9zzKoNQrWE
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX6DCKbjKjFxDn
 cCoDQOewp/ToO5QUrMZo0JJsb2YJTzZ56LmDXMTYKeiNtH00xnpv4fuKMkQ3Vo5OIyAtXooopfH
 lBH9ygaBqeS2vP1PHSV4iDm+WIPV0mTnleVjXTguSoJyUHNW5SlJIlUFFl0fXvakn7/n5UHW39h
 7BhzKiTsIG7eb16U+5zUDNiWoD4ym8FbS14wbe9QzU/YSZBe4nMiBoByaAK/J9teqS0/+YClDv0
 eEkou12aaLpcPWLbbBK11s8dZVoMR45i7UryUkcG4xLfW9KUzF4Yk+BMmZ1GjmBwabrHfhv/yo3
 05ahvnrhcKHVLaaKo6o4cmuwJrjSjzdQiAmg/YwJD8iI9XMVjp1rdODm+r0wTZ/rGlQ06SOEy1y
 4AHKg4+MHIlWgQml3Lnyv0CjYg4bILsTkC2VqQgqRHrl8Jd2xFU1ljm2EtqMVwPuXNZAUNCRR+O
 Ts7pjvEDSvk6nvibdbg==
X-Proofpoint-GUID: Jad3ltDrnBXKyqagFa3J371h_RFsufAx
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae46615 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=CsxVdn2IL-oTZ3OAgFMA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: Jad3ltDrnBXKyqagFa3J371h_RFsufAx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX/eHQLWyt62lW
 5tDqPnbKxrxpqERlM9/XqLYhv4B64Hrm6ad6aF8DHNqk1ENlp/jgYbrawnK9bxqx/rtSxtHrJu8
 CNbEQGk/QQHtmpuwbA4VdtEUwi49jvk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_024038_254913_082C1EB0 
X-CRM114-Status: GOOD (  16.40  )
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


