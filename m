Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D16E606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Au0YuBt7;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UvGsiVpK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T8PKOHk2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhU2gllAfWGF/TwnX0sK3IcbsZoD1YNF/SKwStBqd+k=; b=Au0YuBt7zfDPvmf+iODtNENEXp
	WYpAjBLtSago8/eqCknNlW2xc5ElRYzqUdzdH+irerlXhtYT7Ir/c8G30T5jUx+2OyxVUNzkbbIfH
	teSC+45Ag8CRROEPI1dhotz1szu0gKYoBYpy2JaFb4AnQkjPF+DBbhesqiaWg2dQpPa3JXYHmlcIU
	XsfzGUdxlfrGB+lHIi9RW9CSkhmqsLvwtMyR2soqtp2qOHRhSymFxKbCyx/UCDa5Ar3BfGOAarn7T
	jRz7bofYEP/d1ZJoMIJDR1kPLnx0sLLxgdFdZDZEOU/hEmHvZQ1NJuA1PoXYSJGAiPEDCx3kDbtcf
	FkHtlGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXDi-0000000C5Pa-3Dla;
	Wed, 21 Oct 2026 14:23:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXDZ-0000000C5Kh-2tAW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:23:03 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF6lJ1389721
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhU2gllAfWGF/TwnX0sK3IcbsZoD1YNF/SKwStBqd+k=; b=UvGsiVpKDkcm10qz
	U4bRC9zRp05bOWOYEbTOs8DnVk0RSsBKSwZn05DT/AkZ8UADVuoUOJhKav12MgOq
	lfsZ98959ZLhgyOqm806rGvj/RGinHWiVqLqZ6sBaQdcAxkKoHwtrFHMz/Z+uuxO
	VuXYvH75KDK8/sK3tgsiiv+tHz+yeB9W63rw7iJWdBA8BJL8pdbVPdk90YR+VRzQ
	mY1/zTIu58nnWJK1Xr6ZhRp2pZPejlIOqqqBwmH9V/G9s1MsBrAoer89zlZunqqi
	jIoqmfcMZ9V37nALgs2zFSgg3Awp4WzE9rqJxP0HB3vhA1y99ShIKVjiJzDwnk5J
	lq8kTQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajmafs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:23:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35179e7f081so71139eec.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 07:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592578; x=1793197378; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhU2gllAfWGF/TwnX0sK3IcbsZoD1YNF/SKwStBqd+k=;
        b=T8PKOHk2z/LZ83WBsmvqfT39j9Vjct4ulJ0Ml3Jrv7/pamkIL6eyGsGhgSu8CHTcfp
         gZf9ycMwrN/Z6/cvrs4eJUNowNgdpRo04pv5GfesCmI2rjjW1+Ml5ShDG2iankipOHMN
         5NB9iUcuLFTP4JyiawwijcGdhczoOxscVAMDR50F0x6XWnMawvg4rmG4Y0duEBHxIKXD
         ml7ndrA35N6z/h8qMnCNdnOYlaECMvmsBR+u+guOqoVWIQmWT9Lh52gL5jymieZ757k8
         JPlK1KWD9lYh8G0HolajZwgFo9sxU9WR3g/S7WOXG5p6snyt+oN4ullYLw9tX+qAkm+b
         n6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592578; x=1793197378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhU2gllAfWGF/TwnX0sK3IcbsZoD1YNF/SKwStBqd+k=;
        b=Hws3GAgjXd0MMSoerHdsca6AVUZWy7v5FbGQnifcyKN6ISycaPRKJgrUki2pAAvtnI
         sbzcFs+5TKdg7SI2Beet/JnRdRaGEEnNL3YrYDHFnlqNKwa+nGF+CakRPBMsECSjHpAS
         4+vu7ipYX9a+4BS7UDoQCaebv0tMusPPtzIPFPRGQ10My0KGR9j3iifJ4TcmJtz3O96h
         cssu3aqqO3YecJCcbRY30hPlQ79nqKCeyw+VTFrRPLzNnpEmsEVp28Oef7VG7+HLDRb9
         aoqHfzDNqbb1WbuUeGGH5ZWVZV9obuwTH7NBJPllvx9/0axAWcqVFwdahS8YhFxR7zyu
         bD3g==
X-Forwarded-Encrypted: i=1; AKwUvBxMV+XNM5FxGh2r/OBPh+/+eeZETF5dg6K8HtnA+yrAZ1VTHf+patuc8I+uGp4Jd9HjAnudISBaIQEIQygcVIe7@lists.infradead.org
X-Gm-Message-State: AFq9FYLm+z6RNqix1K+qjkeYIe10MLWQJ5ErFwg5kbLUG3NaxOiBvJVr
	OBk20g95WrtNkA8K5M5L7ldYKuAy99wU9XiE1jkw3+YHKJbHV+oMTNUcFynHmInLstv7/86OGvh
	3EEuvJIkpJih/HVBrxfoRWAjZG3ZXaL4xzogLuqSDBh+afnkyDywC6htlW7pKTRw8typYJjOmJu
	+loQ==
X-Gm-Gg: AYBFou0hevMCBcATI4Qral/ZyL2/CclmsXip2vvohF92Xu2R4P5FONa5gM21owffAdS
	NFbtLcNDFqcAOBVYRphtzFZB4xi6KH1+raxkiU56jPxFSWDBTT3JVdgAuZfbbs/bXCAneMPOxmA
	OqN8gkjhVE++ii8MBzjcNqfedbZ4KhKf/1pAE8iB+WBU1QFuKnmhLMXjo+K8oYtKqb+UfIIX5bi
	TpPurlSOqE0dyfFqyFvU0mALNd49hfbtoVKdQJEbRL00SQWP58/9EAzkTK5DdVd2fNjdJxbFJnX
	jeuW68QZsxwNIkKC3NbmOM0X1CK0AbeyrroA6GtJZx2WE0xkP8yZb55BCVj/Yrius0FuPpwaj32
	SxZnGpCvFOICmbtuIwuMxvzvd1sDCPDjyD971TfHv024GUnpBsyFW3xnITXvT+24pNV4uf/XC8V
	yIGM8nDol59SdZtcUiBCzJ0Ea6K3pQrA/c4Kt7tloYYDb+fgz7Ln8=
X-Received: by 2002:a05:693c:42d6:b0:368:5521:612f with SMTP id 5a478bee46e88-3685522022emr645173eec.0.1792592578373;
        Wed, 21 Oct 2026 07:22:58 -0700 (PDT)
X-Received: by 2002:a05:693c:42d6:b0:368:5521:612f with SMTP id 5a478bee46e88-3685522022emr645109eec.0.1792592577677;
        Wed, 21 Oct 2026 07:22:57 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:57 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Wed, 21 Oct 2026 19:51:50 +0530
Subject: [PATCH 7/7] arm64: dts: qcom: shikra-iqs-evk: Add Waveshare 8-inch
 DSI panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-shikra_display_overlays-v1-7-adaea735999f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=3852;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=UtMVjHRombnci1ObQ7ST3ZaP9JWmZT8/3KRuats5gMA=;
 b=C6gZaY6cbD4x+C+mcjef+RVS4qVqqHkTqnGC6IOb/LFg2ed19PeZybw3NdlOh9qE9frNR0fDn
 20+NX8Q02+JDOX6QlaGXswMEKYWt4atEbMfIh1kXi/ljtid0ZtcWwTQ
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX3Kxkp/15BPV7
 Clv10k1Wkkmb9B0SAjZnGJYshIj2PCk5iZXU6QYnD+O/CMgfexuXMTpgYBFQtUyaGZwPYbi6p0G
 kwKfrxdFBhNjkIwf0IJxxDlOPMHKXzVeF2YgY8JsJcDe87wcT51Bxkd3Bvt7tB6OpNET1iAAOre
 kQfl6In3y6bi+IwzEYt+c6oOXLLQyPjdYNZCerYana9f28XciSwILmhWZLM9m01MHe4YjJMCZVA
 Q0KeLwFTmmmvvP2eeWir3cGaurFTpqYi6TywFsDYaXHStaYXAjmIsfSrf5pG6srGGEWMliHuYfv
 VE1SA1XulKBZMqCJBbkTCq3J5QqAQrxPoVSU1BzqS08+gllx5oBozsO8yYYP9Avx1pQ9cYspK4e
 l64cdjOU4cd5+MGoRgsp5Ky5AApxI21nQ8IyuV3sb07kqvJDNqsaHLPWex/wdDFG3QrBAa2hVep
 9mN+uoMc066OY0MZaFQ==
X-Proofpoint-GUID: OpkqwJ7_h6M82sjVDZUPyPYlCjYOIXBI
X-Proofpoint-ORIG-GUID: OpkqwJ7_h6M82sjVDZUPyPYlCjYOIXBI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX8C3uVtRyjqH8
 ayf796YJfMdcswpEXC09zQ3pTNKf3Y1KIdXoj15C2JtLBhpAEy1GNcTWTwwq6101JLpyAWVr1MP
 mRgATCI+pIKi6MVfU5XZtVwE8nq4nGU=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad8cac4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qEeDTSk_RORxmtoI1doA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_072301_857793_87F301C5 
X-CRM114-Status: GOOD (  16.92  )
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

Add a DT overlay to enable Waveshare 8-inch DSI panel connected to DSI
22pin on the carrier card.
DSI0 from SOC is routed through MUX which can be selected by DIP switch
S1016.5 ON, for enabling this 22-pin JDISP1 DSI0 connector.

Add the JD9365DA-H3 panel, GPIO expander at I2C4 address 0x45 for
panel power, reset and backlight, and the Goodix GT9271 touch
controller.

Disable the default HDMI bridge and connector in favour of the
Waveshare DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso   | 77 ++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6d64e7ce197e..2d25e3cc81f4 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -383,12 +383,14 @@ shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-iqs-evk-dlc-panel-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-dlc-panel.dtbo
 shikra-iqs-evk-lvds-auo,g133han01-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-lvds-auo,g133han01.dtbo
 shikra-iqs-evk-raspberrypi-dsi-7inch-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-raspberrypi-dsi-7inch.dtbo
+shikra-iqs-evk-waveshare-dsi-8inch-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-waveshare-dsi-8inch.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-dlc-panel.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-lvds-auo,g133han01.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-raspberrypi-dsi-7inch.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-waveshare-dsi-8inch.dtb
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso
new file mode 100644
index 000000000000..d0aa115681ff
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso
@@ -0,0 +1,77 @@
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
+	model = "Qualcomm Technologies, Inc. Shikra IQS EVK Waveshare 8inch DSI Panel";
+
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
+&i2c4 {
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
2.34.1


