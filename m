Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408E1D62613
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=; b=t6dtIkimswTHGmAwMUQdWILTFs
	CvT6SQD0TpkV/dZ6DcJqBdq/N6p77veY4blq0/mIsZxwifynmGHTk53wHmXaQpFYRGZfVwAFdM3Qe
	rgj4tJVynrYw62V/k9mK8XkuJYTRTj8FJ8e8rASEMfQchVw3rOswrsYPLVwu4kuecAMkjmun7BD84
	cxXhs6rrPMZvCvhnOJ7o3sehMDBpSL/boQtZwTnyZfNYFtOrUoQJQCd8mgb0bVjrimR8qjN7OAV90
	Vlt4ySGUok1IUEtBQuKNNX7eHrgTPEgYTQmGyOlodBk1mE+FpKMouMOQnFfe9AXMW9vs8C5r5sFig
	jd3lIytQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis8K-00000006tEB-21QA;
	Thu, 22 Jan 2026 10:41:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis8J-00000006tCS-0ipP
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 10:41:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=; b=qomeRQcG5yqfucPjcpZZH5Mt0o
	dLvxUn8mSPtJXGGZbSh8NzZRRKqB7iPREurJ43XAAgueAuqxqiqMq1yRE0gLkSe2ECDmvGgwO6+Ju
	/+/NWawMZhSWTtRk0kL/XMbXYv4GbTyip5ytvFUk6fPkpYfUi4TUOBu+soIsaRPBOO6ZA6iD4A4PQ
	R7mZGIWdcsRCTBCdfVBLPRrhqgac/JJeWQTG+ZH2VBTFd3UkmYZXqFqW9kTd5FHx/KHxxemkwdaov
	951oKl+x8LqKXpfO9N233Y11Sbum+uiXCWHDK3l+13tXMmNfy12ZVe8/h5IeorNbkRkgcmYI0Qh4k
	KDhma4Zg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis8D-00000000Bnb-2CQr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:41:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MAcwTD2899591
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=; b=jX01lWX3yFK3QBsd
	L11wmoR0sLo16up3YONxLEHLJk2fQa8+O3fwOBkgB+dmzXIWC4E1F/EnEjOf6Pyk
	OwOSeGz3EvSWgknLzrr+rG9KJo4HIvZloVqTT6wDcqTQHGbUDTsgHJopNddxjtzU
	faOtMzyWbz5okd4Ra+b/IFTL2RXtUPduPNsANfSOHjVAoZf3bKDHODF1haHbpmuG
	6Rm3fMF3SGo9IIUJUCb7QDejdTHI3KBUfZzwNIehxvs4hLLHji9AcKfCM9WyFus/
	Ac7IWRkCfS4o45LxpNfVFPA3oEDdHuK2XrLeiwzsasYQMhtxZOEt/pNGNGg89CmY
	Bi61pw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bujau00c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:41:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5297cfe68so170903385a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078496; x=1769683296; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=;
        b=Ar1CQPK1Jmu9rHwWeI/sehAhuGTcEJxfOUmmIaZB6tCazIO22om7L1UTvTM+Nul+Yg
         9SV8hhhySmJiLM2RJ+Msss6SKT6LbEAWJwoYeofSFMsCEMqJ6BGOMxoUE81eZ0NHQaLM
         vG/ohQk3kmeESBMA3DJoYfRPAK5E3PEalmGRObWgo4evl0p8CdRKWNAbnT/viOg0lyHy
         kwsEXjsfjOZX8f2s4A1h0gRT1NzMqLqt2G33YLDYOjHWtBq/dFIJ+DsrHR1U8cUSE/qN
         xOPu9wdUavPVFhLZjXcrGEhifJXYuHYctON26PDSRv1N/S3h6x5Zxrs0WVM9d5o2x279
         EQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078496; x=1769683296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=;
        b=VDrTcZf51b5i8wtGwE8ueyw2c1Upt3aRk5b9sld/yqcuSk1gotrKKqZVPpnf7k7Xba
         goecpAKf775CyHWDFlg2LGi3eBydluj/inZS3d5gbVg948pmbxk0QdN7/dKdjc5lD8VM
         PLjeW2lYpIViCsRxciprOHTJKyJ9pTPItFflEkpYUj5cO0+JHCx1tQczrzU06rmXswvU
         7TXGEIuXUMT5M3mfFJQTCBmrU7DeriB/v/aHXL/J/dw3+qUlRafE9hJ7EZp0WND0bmKS
         DsxbBw2L7YM5l38Seu32GkJKOd3oX8sq8Pw0b5Lc34/lVw+syz5ORUAQAzV+RzXn8+0E
         3InA==
X-Forwarded-Encrypted: i=1; AJvYcCXaPPhCaWXAn0bXYXJe/02nkrDWnXF1iP9V0S5XOmxTnKEeTS2H6S+YBUxOb20bfnnuXA2BYrC22fgu5Sg9V5iU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2zScsBV7RWJN9mpaQVgPmhKCVY8ZJ+sFnb3Dk8iqLoxO4qHaR
	QfLcQC5RHieMHUaf0smxD6EwEz1rMUeXe35M25bbNj8iTZWhjlEn/0WxlQdfL7zyNnzuHljJq9b
	emkMBDhvjn0MbVvtXK0x1ypoyQk9Lwl2mX6rqzTy6annUyqf316BVfTc8UVOz5pxZ87qToC8GAL
	7Beg==
X-Gm-Gg: AZuq6aI9Q+AsU2cfX7b8opb1oY6IgplwUfU4UIVmvgGNSNG5XsSlsnlBI5MURsmoVXh
	t8bVkTHD6ZEJJb8vkDG3+8fzNNrx7XRdObQhRM5DR+U3h1Tu0LEXJB+j3KkjDLwWIcLlflHaAoR
	UCiY0RjgP78qV8wOwb4QGXT7la032RORZedDb92Pr3e45egri8L/FSCVsuKBGe9fMV9cpHbVRpo
	ac4FzEdfXQHFDgrVKKcTIHf2N1H9I/dGBHEUeP8qYB9AvcD6HGlBgDLro3KTKHCrzP9n8nQdu2y
	xyPbw1kO3vaaEcZ4Cykl1a04CI7x3IfbhClecYk58FOKoCY/PxCoO+4zP0jhLZ8ydprZ+UQVrbK
	YihIP/jKU3PrwsycBpPaDBd4OylOlktWWj9EEsMoQn+vPDx8HTuyEOJ3Q0FcKYSwatNL+ePWmOU
	xh
X-Received: by 2002:a05:620a:288b:b0:8b5:1b5:cafc with SMTP id af79cd13be357-8c6a6709b67mr3080298085a.36.1769078495763;
        Thu, 22 Jan 2026 02:41:35 -0800 (PST)
X-Received: by 2002:a05:620a:288b:b0:8b5:1b5:cafc with SMTP id af79cd13be357-8c6a6709b67mr3080294885a.36.1769078495346;
        Thu, 22 Jan 2026 02:41:35 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7260229sm1387868685a.42.2026.01.22.02.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:41:34 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:40:49 +0800
Subject: [PATCH v4 4/5] arm64: dts: qcom: talos: Add camera MCLK pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v4-4-a908d49892e7@oss.qualcomm.com>
References: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078453; l=1538;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=urisQog5JZfbdirBxu5tGAO+ASUUaW9dPoY/c9Nj33A=;
 b=I7z9k27YrP0G4lQE7jSsHQaqMCmfAdS0JW5oaDyYtJTvk5+UcdXrfI7CMFvOcIoB4Bt41Vodq
 tUrvYBEyWVUDgr/FFrVxfAuANQayW2RNkejOcM6nSJ3Mw1e+f1Ux8fA
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: Sn2aa8uX-UXVUnYiwrjJJydP1ZhqSz9C
X-Authority-Analysis: v=2.4 cv=P443RyAu c=1 sm=1 tr=0 ts=6971fee3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Sn2aa8uX-UXVUnYiwrjJJydP1ZhqSz9C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NSBTYWx0ZWRfXxn0hxRfmnZen
 yI+aSk4Oac5HFBflKGr78/qt629Bhh4Y720tnYCYV4kOEHGOerAJrqGL03+r/DWBPE3NGLcvDYI
 ly7WMbXh6D5kyeK8IF4IEvEKwpLo81Ljc8LVD7KbcSgMTnHzH6iDPfyK4Hjd9b8Gx0UFsM5x7P3
 MD37eKSWTQdKis+uuxalNgqBhydeV2p+Vkfvwhvs+qaSC2CL3OqkZDj1yjRx/RqOz6UqxwzyB8g
 zq7ucncYTsARisMWHYZ4vP/6BBJjZ8baMNv7AmJuOdh3255//EtE5jcpQXJ/GYw+zo+t1ako49P
 Im4qsr3e0xkINp7aDEROXJXRTTbeaNIB0Zuff2p7ILN0oCf+HAIzF7AGI9TS6eNbKgfT6UY7DtB
 0KpMsLvUwyIx23keBGpj1a83JTUn6ieZENIxbXxd0DjCm1wqkAvmsY2yaVUONc30iFZDGTR39zp
 7hT8ss9qS/sLJ0hgrrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_104142_186430_257D834A 
X-CRM114-Status: GOOD (  11.51  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Define pinctrl definitions to enable camera master clocks on Talos.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 6d28096e50546855bd762e479b66ed6214ec5d65..33897994d0ca8a193acfbc94a932551a09c712ce 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1553,6 +1553,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio29";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio30";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio31";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci_i2c0_default: cci-i2c0-default-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";

-- 
2.34.1


