Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6221BC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 22:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cOIIZ8FZFU7mksi3tzXnVOLfsOb/+Dn0c8S1ublaoZo=; b=0PLoVVZz+H0sxv
	eO04c/nZu6e+jITOyDolLs7X0C6WfYWRVtaeCWFeGQos0dyE2K7sTIMiHLYY6uoFgU6P1wvyuuTXO
	y98T9Gd+m1hqQQ2KoG1kRDuU6JHIK7EXpxMLiQLvct9Ug9q+DHOi613ib5UZ/2FXJQOMKLfX686os
	Ka+2UEgXyv08UxFuO0xyyegVKWmBip9bACW6pSIRnGatIKpL1IbjZ9X9FXnrRyqQJddWO2iuugjOa
	NOO3CdF7g2shwuPnN3S2MuVcuQw1mBJ+pNHlFKEacb2TIP3imkrwuJn/tJomNh9EzQF79Nq9SJqtC
	kYO8o56MkZuPcNEdY+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpaNC-00000006Mno-2oxw;
	Tue, 04 Mar 2025 22:04:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpaGx-00000006Lil-2SqB;
	Tue, 04 Mar 2025 21:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=CC:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=cOIIZ8FZFU7mksi3tzXnVOLfsOb/+Dn0c8S1ublaoZo=; b=QOrmdXI7ifZa2qsAeQthWReceW
	11lNN+lbXJEoNveLPlnOYmZb7rJVPibEHZ38ThmlVHWSuViu5CHPRywHZ2KRUlgg82akYNTSw3rPF
	URYyeys+GhkH4obTZqgjqt1Ht0rwVbgv3sdJouc4RtpknE7UQ6wWVMmZ1vTbgDvHu/65UNhEmoIxT
	9zRQkpPpjsjD5Nd5nWCZq95ZIU6Mu1WQh2LRouSxD4YUFYX9KiBKD2yH3G9JYJDyOo7ku5g/BcLgh
	ARMuzRDTDe38OxU16U9wULRZCMgh5RU2oCzFLFtLwHkTnZboufPOo9KZuRYDfey79vJMhs76NqMij
	gfF3YYiQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpaGt-00000004AmC-0Khi;
	Tue, 04 Mar 2025 21:57:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524AZBvw010211;
	Tue, 4 Mar 2025 21:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cOIIZ8FZFU7mksi3tzXnVO
	LfsOb/+Dn0c8S1ublaoZo=; b=QuM4YPpwNKad2gKeH3kn1SbIzyGb/BNNpA/SDH
	LaCfbCvLjqCvrrZ9vEHnIzpJxXkeMN5bJlR9n8FEUBu2o5giU/4eFMpZAtAoamIy
	O3oz4T0HCpoEBix2Q4GZWFPVPDPnZpjtG+h2tgleVu3J9RmabbrO8bssP+XpdDuo
	MxCbgrZdUYHOZJG8xv0wSdxYGR9sphtyza4O+zLAvYkt0RchVwyBw5jbt6V1Srxk
	ymc3ijmmaAgulVncuAn8HifsX0pn6wIO76Mv6u4bfsqPDlwEhol/zj+wgZ0YBrb+
	aMYjEAldMVXzkCv97fGuhVTQjinAPWLVBtbE4GzW1pV1SHcw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6wk8y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 21:57:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 524LvaZl014462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 21:57:36 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Mar 2025 13:57:35 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH v2 0/9] phy: qcom: Introduce USB support for SM8750
Date: Tue, 4 Mar 2025 13:56:33 -0800
Message-ID: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABF3x2cC/22NQQ6CMBBFr2JmbU07gqgr72EIqe1UZgFoB4iGc
 HcLLty4fD/5700gFJkEzpsJIo0s3LUJcLsBV9v2Top9YkCNmUHcK2mORa6rQW5VY6WnqAIWlnw
 RDj7TkH6PSIFfq/NafjnSc0jq/jfWLH0X32t3NMu6JHJtzL/EaJRW+mQDGe8wx+ySfI5bt3NdA
 +U8zx9jxdHoyQAAAA==
X-Change-ID: 20241223-sm8750_usb_master-f27aed7f6d40
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741125455; l=2726;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=9rRYFsEsVrMx37ehmR6fho88IeXrskKIXHekpFyUXWI=;
 b=fMWjktR0b5uW/W+F3cLpeOXO8pcUgj/FLwrrdfa0eQzDYpTW3IgRwaXv7Ia42XrK8muNO3r4p
 6srtgStylaBAQ0E9wTPuDWGfvlE0xN6w1Ege5Qh8+xV623Ju2HelmiQ
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EZcyQOmC c=1 sm=1 tr=0 ts=67c77751 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=wn7q5I4-uf_KSUSPJ7EA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: P1C0mChZInZXEHFmkKKOr-y0o5WpRfNA
X-Proofpoint-ORIG-GUID: P1C0mChZInZXEHFmkKKOr-y0o5WpRfNA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_09,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=946 suspectscore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_215751_504555_2588E029 
X-CRM114-Status: GOOD (  13.73  )
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

Add support for the PHYs and controllers used for USB on SM8750 SoCs.

---
Changes in v2:
- Added new QMP PHY register definitions for v8 based QMP phys.
- Made changes to clean up some code in the M31 eUSB2 PHY driver based
on feedback received.
- Added bulk regulator operations in M31 eUSB2 PHY, to ensure that
both the vdd and vdda12 regulators are properly voted for.
- Removed external references to other dt bindings in M31 example for
the DT bindings change.
- Split DT patches between SoC and plaform changes, as well as the
PHY subsystem Kconfig changes when introducing the M31 eUSB2 PHY.
- Added orientation switch and port definitions in the DT changes.EDITME: describe what is new in this series revision.
- Link to v1: https://lore.kernel.org/r/20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com

---
Melody Olvera (1):
      arm64: defconfig: Add M31 eUSB2 PHY config

Wesley Cheng (8):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add SM8750 to QMP PHY
      dt-bindings: phy: Add the M31 based eUSB2 PHY bindings
      dt-bindings: usb: qcom,dwc3: Add SM8750 compatible
      phy: qcom: qmp-combo: Add new PHY sequences for SM8750
      phy: qcom: Update description for QCOM based eUSB2 repeater
      phy: qcom: Add M31 based eUSB2 PHY driver
      arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs
      arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP and QRD platforms

 .../bindings/phy/qcom,m31-eusb2-phy.yaml           |  79 ++++++
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   2 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   3 +
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  24 ++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |  24 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 163 ++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/phy/qualcomm/Kconfig                       |  16 +-
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c          | 296 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 221 +++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 +++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 +++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 +++++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
 16 files changed, 1034 insertions(+), 3 deletions(-)
---
base-commit: 20d5c66e1810e6e8805ec0d01373afb2dba9f51a
change-id: 20241223-sm8750_usb_master-f27aed7f6d40

Best regards,
-- 
Melody Olvera <quic_molvera@quicinc.com>


