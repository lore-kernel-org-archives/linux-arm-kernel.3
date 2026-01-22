Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EBAC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LeFsxXU0vTUz3SkVxXpLyIcoHY7U5CxMyBBnaUCUBTc=; b=h6MBLJ7wnFN11g
	QqLzcGygDzkM1ed4PDljL8dM1i68r2rR0YBh6TxGyRdbFwulN2naaI1b1FL/c0KCS9Qr9rCBlgqw+
	RnHumMsIxVtkMCp4BM3hDXG8ZgOaTKvMrrtSwCXTjGVRbhSgo94D6oMEbAHoP/Zx0S39eXZWVDRVG
	+T1Ykujvr0keTOTwqiyyg1k2bSwbkrXKYuHDU+kEsMYsLfRuxfn4hDor35gWUCo9gJ6rcLYfMQFLu
	BBNcu2JRFCqUcy+gFbSlOt6gyLn7EaRXCVA0MNcnmSD3v34E6JWN88VO+nDoYLQR6/2nEoL3qYPPr
	leb6i+roeseCVFJ/qW5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7p-00000006seb-0TNM;
	Thu, 22 Jan 2026 10:41:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7l-00000006sYg-0xDf
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 10:41:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=LeFsxXU0vTUz3SkVxXpLyIcoHY7U5CxMyBBnaUCUBTc=; b=XTYkzlTlmpVHFrpNdez2DE6RrI
	4JGfGAj8z4N37fHrUeT2/1spuYEbSx5zVS5Oh2C4NTg3w1SBrRyBRdR1rs0Gq5n1H1hHOh0MN10rz
	xP757gX/nWeXuG9WWRTa6A0Vag/KjxacSsV8QcPZyZWrurxUChnYBMJxScoHDdqF2mL/+XBUa7+ya
	5wbDZDnK/TLzDl84Yw/9Eiu25cUU2BsnMT17QSR8wWFym2TfdjFVoWzHS2Wf5ZTuLF/0vH6W2UcOe
	Bmo1pwe9tRFPnn4BDwuEzKCR6fje5W1K+d4Hz5RNNBnTfhhLg3lD2usD/Ldu4ET88Y26UAihNXAwI
	qT/cBxoQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7f-00000000Be9-3xTZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:41:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M84Mjr107530
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LeFsxXU0vTUz3SkVxXpLyI
	coHY7U5CxMyBBnaUCUBTc=; b=eIC1eHgPYwDnnyccfnpKoNoemffF9htQcvn/qN
	+7GSaGkCk9YtwIX4TSv0Fng35FCeRg0QzecjMwQD+2PX6WuupzLTeECVy84E7f//
	nEq5JAo8VPDoW5IK49XO+BTM+HWV3jTAt4H7JUMmrrDaZ88b/oeL7JrgvgHCfbzj
	6JD1m52r0gSCjXpogCEwHqIJ3uwtGfBb9jgpas6TeUROnWR5BXV6dq4szMX56MAY
	BPd0rOACTBs4Fq2kaLJxD2VFYYZNwezhj2idwkAIe3v2SjsyvfA6aG/kMKcMcYbw
	7Ymh3A3nn5SS1BKugLtUhvrVpVLlC8FCphfErXe1xEiei8ug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pgt462-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 10:41:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6ad709d8fso171198885a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078462; x=1769683262; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LeFsxXU0vTUz3SkVxXpLyIcoHY7U5CxMyBBnaUCUBTc=;
        b=O1na+lKFoKhiqraE/EQv40Ya0JwYSGiD1xFHReo5PxnrJAi0PMHuYpkbLacU8vSHmO
         MT48j2Wmz54uYp17n5pd7xKEh2cS8UR9i8rO3wJy+8UUObwpG/YF0uJHNzrQ5aBYr3SB
         grDDV1b3YmRBvlYU89CZIo+rj1vACNRKCAJOv+5qPgj6M0T/A6eqBYLIB24j42MDpBjV
         eqVakreGSz65kwPTenbE9oRNZItqwCTsXIJWx7ik5ot+KaQrLocrWqEHKrlPnF+g7qKD
         GrshCR4aMA9PFnm37mNhGyNyKMERvSCZkP7iIsxpARFJkUIKoyL+TkxN1N1fmHQsPioc
         7UZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078462; x=1769683262;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeFsxXU0vTUz3SkVxXpLyIcoHY7U5CxMyBBnaUCUBTc=;
        b=ES0J1qfeYs+hkDmtpOFHBhYRhfu+OiS2krhM93g9d+i8Kg8ghKwkRxJrLZiCxGcFe9
         wiXJfWx/hgP9yQ2ivcP+h3fuZU0eRC3k88ZpjnZD1aX92R3Bbkm8ggcDE0Hw9dypogL8
         kBudlWkvzrEx23cHTs1E/Bcj/RaHxUA9kH6k2+2SsXBr9oMeBpHCe6Sf9ZcERcnlF6kN
         SSMrZzdJTHJE2B8EuMEOL8CgdlAQW+aKKzcA+mV93NnW3oU6N7+bDFDdExmuqM3uWs9s
         CQsHoxwoQoEtsUd27tls4w/3ArsZOgT56TR6KZ8V0pz9hNhhVnYVvFwPd6EyBbGV5DPF
         KHgA==
X-Forwarded-Encrypted: i=1; AJvYcCVsg+336HxkDv/0LI81YazEC3aPN6GRcnsa7cHWOHDAK71TBcx4Bp1GV1qM3uUSYf9sOVIaH0+IYRYJm5IqPNQ1@lists.infradead.org
X-Gm-Message-State: AOJu0YzfldFg3vBVoAFrUmNJ89AW2bLrBuDBuPizD5sYVR6btfVz1rcg
	8OKzd153CHewrBjcaIEnJk8IXSKc07tXTXkCIj4a7Dhb+Cw+ogzCTQ8ME94yMo1lgh0rPYd7RE3
	ewv3KzBo/DRa8yAjm7hwlPFuAtyrCgXjrYX1FMdguw8E8T5WNAohSybuK8NLPJhyD8eHvgOqMMf
	MFVQ==
X-Gm-Gg: AZuq6aJsPAJwRWjWbx42SP9df9POfN7U/QHo2fjvcyysS7kLiBc7oCS+wizHHKON5r4
	YMwQExu6LLM40q0vIFVONFwIN/z9eA/25DbIqbIyhu0rDUemn/ElAL/RN5fA7GTzUowRmmaCBRC
	K6qk9trqxSAanUMp+uco5cyfba2SgPUyy8RQig+AXAX+ePyT6cqSIc3gicmV4u0ELXsEqVpRkfB
	XNHPFg//75SLOCL3BvOlxLZyzRWC/xe5yJ8Hnf7wQroZFvpeaBGsfjQrnvu6lzT9U7lq/THPBgz
	xpuGDF6jXaf5FdLkKclbBGRkXYJv7RLlihDqoE0hP5+11Nut0pRsN4lXHXEaWlZWtcueY7stCWj
	OOK/Kzf5VsB/pZziNvupYnasA6PjiySamaXjmjpnIcEj9EqYS0wu22fCsDvo8ICbgAuceeyCAFR
	99
X-Received: by 2002:a05:620a:2954:b0:883:647b:6dec with SMTP id af79cd13be357-8c6da87eed6mr313576085a.3.1769078462461;
        Thu, 22 Jan 2026 02:41:02 -0800 (PST)
X-Received: by 2002:a05:620a:2954:b0:883:647b:6dec with SMTP id af79cd13be357-8c6da87eed6mr313572685a.3.1769078462005;
        Thu, 22 Jan 2026 02:41:02 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7260229sm1387868685a.42.2026.01.22.02.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:41:01 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v4 0/5] Add CCI and imx577 sensor support for Talos evk
Date: Thu, 22 Jan 2026 18:40:45 +0800
Message-Id: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK7+cWkC/23PzWrDMAwH8FcJPs/B8teSnPoeYxQ7UVuzuGmtx
 HSUvvucdIcOdhH8hf2TdGeEKSCxrrqzhDlQmM4l6LeK9Sd3PiIPQ8lMCmlASskpWjBij/mLN+h
 xaLE9KN+z8uGS8BBuG/bxWfIp0Dyl783Ocu2ujBUg7CuTJRfcewDZ+0YN73o3EdXXxY39FGNdC
 lu1rF4EMH8EVYQGjLTDAMZo9Y/weC6Y8LqUI+fnliwikduO7H5hDUIIrWpQIMBqDry8pWnMuFx
 oTuji7hhdGDe1mN4R8nVMmLsq2xpannpb5j1+APYBlOBcAQAA
X-Change-ID: 20251222-sm6150_evk-8ebed9e9f3bc
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
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078453; l=2958;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=J9VHQJQwue+LfT3z9SbqGo6EQB54j2aREQ5dCXhFV5I=;
 b=eOeg/peQAM3pR8Iz3aQql6aI9gbuvkoWl2HlGTz9wHB+2MJbTxOUur1dxebKnEFVznbSaQgYf
 DsSvKxOc7FiAS+aYFIkakwwgthxepnDDxquYQqApf3fe+ATJq1KQ1vp
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NiBTYWx0ZWRfX9LjBwiIv1A/B
 HZ8lj7PYGImxpAkUVRu40ozn49gCrKRZ5knvN+jK/Oi4L86hFDCvIhzWBz4J2AZmwHVTvDhN0bY
 gLm0XXgquh17XrSvia16i30xEm0YSHaU9GvhWq99GB0d2SqDdPBBlab4UULRCyqM3Oh/LbtbXDh
 FsHsU1bfysZnSEm+eBKxX43CynA6Ei2vy2hJ20Pvv31jrDQXS+b9W8lL03fOGFF8DoiGtLwoYct
 9Qfwf2o4HTUxC8G81OwcGoreKBdCPKVjaKUF5Hzwpq05ImMY2V1VYS+50a1yvir0ImYg/T6lYtO
 iC6F3XcDys2aXToFVyTlXy0KJZB9M/JIqPNH/si3e2pCAlXDfe5vhwlvkmYPvaQtGSJw+2QX69w
 MLc3glicUjvMyDfRFZ83vsrkElE4GHlJggjnlC0nlFiAZ0487YHV1VZvB6H94u6NJ9gupz4VRBs
 R0xwTvZvQEE/c8UTAjg==
X-Authority-Analysis: v=2.4 cv=OZGVzxTY c=1 sm=1 tr=0 ts=6971febf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=EncVXgJB8TypbGqEiwsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: mNC0YjaXxGuO1ihq3b8DivEBHBLnjXZB
X-Proofpoint-GUID: mNC0YjaXxGuO1ihq3b8DivEBHBLnjXZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_104108_201185_4A3E7F18 
X-CRM114-Status: GOOD (  13.90  )
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

Talos EVK is  based on the Qualcomm SM6150 SoC.
It lacks a camera sensor in its default configuration.
This series adds CCI support and enables the IMX577 sensor via CSIPHY1
through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

This patch series depends on patch series:
https://lore.kernel.org/lkml/20260114100043.1310164-1-tessolveupstream@gmail.com/

Changes in v4:
- Add CCI properties to the existing portfolio. -- Loic, Krzysztof
- Modify the incorrect dtb install configuration. -- Vladimir
- Link to v3: https://lore.kernel.org/r/20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com

Changes in v3:
- Add generic names for the CCI clock. -- Loic, Krzysztof
- Split cci node, removed double space. -- Dmitry
- Rename camera dtso name, add detailed description. -- Dmitry,
  Vladimir, Bryan
- Add dtbo-y for dtso. -- Rob
- Interrupts cell change adaptation.
- Delete cci sleep pinctrl state.
- Link to v2: https://lore.kernel.org/r/20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com

Changes in v2:
- Modify the CCI dts style and commit msg. - Konrad
- Split mclk change as a separate patch. - Vladimir
- Remove clock-lanes. - Vladimir
- Add mclk3(GPIO31). - Vladimir
- Link to v1:
  https://lore.kernel.org/all/20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com/

---
Wenmeng Liu (5):
      arm64: dts: qcom: talos: Add camss node
      dt-bindings: i2c: qcom-cci: Document sm6150 compatible
      arm64: dts: qcom: talos: Add CCI definitions
      arm64: dts: qcom: talos: Add camera MCLK pinctrl
      arm64: dts: qcom: talos-evk-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     |  63 +++++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 279 +++++++++++++++++++++
 4 files changed, 347 insertions(+)
---
base-commit: c8a4a774a9b0d2c86593492625874e27e9cbc9a9
change-id: 20251222-sm6150_evk-8ebed9e9f3bc
prerequisite-message-id:20260114100043.1310164-1-tessolveupstream@gmail.com
prerequisite-patch-id: 065fda916d7faca61113e1230fcc0ce3916442fe
prerequisite-patch-id: eddd1b1714715707d386608e4f9b24396f51cd44
prerequisite-patch-id: ae777d7e17e32afc36fd1f741bb57ff0d3556841

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


