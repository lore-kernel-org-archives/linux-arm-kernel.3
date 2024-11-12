Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73807D41D44
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 01:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NVIuvcN0ZMYMkb/pY/tVXiol5WGKrj//jazWF7CVjTo=; b=ZJdqC7gTVhSO5Q3idPNTssaHuk
	WlR/zcEYpgMMzhcCrj2s1pAPpZx47sIrkIAcdsSYVNFqQSZbVLl/6rkBFRWck9UAgCMUvGzyvKm/I
	KDk6fS5pynjv0Q8JyPYqmRqpkUl+jplVMHQOE1QShqjxiWcl0mCBqsOAOkJeMkX24sL0mRl4cYLe3
	vBDY8mP9TA7vHx5s4luF+eB5SuZLe93GM4+gXEzgtwDsO8qsDkLZW8tjDXNqhGPnwEEAivADTeSZK
	SI68AtksIiMLXNh6te9wq9txjOCVn2mDpOik0udjGb22IGV0clnFBuwlE0UO6nXKBJM2ZK9mCxaQt
	sscQecWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAfJ2-00000001onl-1Bpw;
	Tue, 12 Nov 2024 01:02:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAf6p-00000001mcw-3nVh
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 Nov 2024 00:50:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=NVIuvcN0ZMYMkb/pY/tVXiol5WGKrj//jazWF7CVjTo=; b=FrHvKhl8BnjI5KtnAGP9TzxvQq
	kOzwFRUzvNOsV4fdXBeiNNm2wcDcdaXQp2v4G4sPEVwtLqxZpgsixRrQPFjMVhvswQFY+XkbjrexY
	7szL3F64uVO5kP6QIvWZnmKvPo3irJHNzOdsDZSa4EAUfZSvwlgt7S/hohXtY3wf78t4pQN9R+36L
	33D2jc8SaRBf4EpojWfebAeLnCLY9MTi1QkPCWilKkqffQ/evoPcbGns01vlOAyMmQWu/zuSBidtJ
	/mxDqasw+cnj01O+6bssof9lCfIVHeA2vuXv4zXG6YouuwearA9DRzVSDEigqjnS2xc1YjuEGawr/
	Rbs1NAcA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAf6m-0000000CyJq-2qGW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 00:50:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABC9Eia019676;
	Tue, 12 Nov 2024 00:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NVIuvcN0ZMYMkb/pY/tVXi
	ol5WGKrj//jazWF7CVjTo=; b=LpE6pqMtcsWWuW8kXAnApgaToXKmGeOp3sH4NL
	vth4y/jw2OdaV3AwqZ8DAbxrcCb/xlPvvrVaNtcJVVDcp/r97rx/e2PHbzY5/IEb
	MPgpyfHAv6mQ1tEl49G37Ppjomsdi5KMn1rwbr7diQE9GjzWBm2BUTN2XcIQVFIX
	u632mz6h8WTS781KAtUIDk8CGQYrBZ4MLn0+1wKmus/8ogLEpUK1Gg7dfqGgSBa1
	EDi+fvJMWbjMCsErISvzIU8sx2lQFm2PmxMidAwaZnmwuavvn17osebz6hmXlSuQ
	kdavUhLngb+oczBlvV9IO3y7wcvoIJn337eb1KViz5JIR9hg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0465p9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:49:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC0nvxO026742
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:49:57 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 11 Nov 2024 16:49:56 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH v2 0/6] dts: qcom: Introduce SM8750 device trees
Date: Mon, 11 Nov 2024 16:49:30 -0800
Message-ID: <20241112004936.2810509-1-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gTllFbuONkCx3yNajB8rNRPDcyIhDNIs
X-Proofpoint-ORIG-GUID: gTllFbuONkCx3yNajB8rNRPDcyIhDNIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=980 impostorscore=0 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_005017_116059_06D792E3 
X-CRM114-Status: GOOD (  15.31  )
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

This series adds the initial device tree support for the SM8750 SoCs
needed to boot to shell. This specifically adds support for clocks,
pinctrl, rpmhpd, regulators, interconnects, and SoC and board
compatibles.

The Qualcomm Technologies, Inc. SM8750 SoC is the latest in the line of
consumer mobile device SoCs. See more at:
https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/images/company/news-media/media-center/press-kits/snapdragon-summit-2024/day-1/documents/Snapdragon8EliteProductBrief.pdf

Dependencies:
clks: https://lore.kernel.org/all/20241112002807.2804021-1-quic_molvera@quicinc.com/
interconnects: https://lore.kernel.org/all/20241112003017.2805670-1-quic_molvera@quicinc.com/
pinctrl: https://lore.kernel.org/all/20241112002843.2804490-1-quic_molvera@quicinc.com/
regulators: https://lore.kernel.org/all/20241112002645.2803506-1-quic_molvera@quicinc.com/
power domains: https://lore.kernel.org/all/20241112002444.2802092-1-quic_molvera@quicinc.com/
misc bindings:
- https://lore.kernel.org/all/20241112003544.2807368-1-quic_molvera@quicinc.com/
- https://lore.kernel.org/all/20241112003217.2806556-1-quic_molvera@quicinc.com/
- https://lore.kernel.org/all/20241021230500.2632527-1-quic_molvera@quicinc.com/
- https://lore.kernel.org/all/20241021230439.2632480-1-quic_molvera@quicinc.com/
applied bindings:
- https://lore.kernel.org/all/20241021230427.2632466-1-quic_molvera@quicinc.com/

Changes in V2:
- split dts and dtsi patches into separate patches
- changed eusb-repeater to phy
- removed empty chosen node
- lowercased phandles in dtsi
- added system-wide domain idle state
- added leading zeroes to applicable regs
- corrected gpio ranges
- removed some unnecessary comments
- updated timer size cells
- separated pmics & thermal zones into their own file
- added chassis type to board files
- added reserved tlmm nodes to board files
- corrected regulator-0 supplies in board files

Jishnu Prakash (1):
  arm64: dts: qcom: Add pmd8028 and pmih0108 PMICs

Melody Olvera (5):
  dt-bindings: arm: qcom: Document sm8750 SoC and boards
  arm64: dts: qcom: Add base SM8750 dtsi
  arm64: dts: qcom: sm8750: Add pmic dtsi
  arm64: dts: qcom: Add SM8750 MTP and QRD boards
  arm64: defconfig: Enable SM8750 SoC base configs

 .../devicetree/bindings/arm/qcom.yaml         |    7 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 arch/arm64/boot/dts/qcom/pmd8028.dtsi         |   56 +
 arch/arm64/boot/dts/qcom/pmih0108.dtsi        |   62 +
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts       |  794 +++++
 arch/arm64/boot/dts/qcom/sm8750-pmics.dtsi    |  188 ++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts       |  792 +++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi          | 2917 +++++++++++++++++
 arch/arm64/configs/defconfig                  |    4 +
 9 files changed, 4822 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmd8028.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmih0108.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-pmics.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-qrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750.dtsi


base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
-- 
2.46.1


