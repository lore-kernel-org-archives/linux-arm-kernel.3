Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75339C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 22:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWQ4v/f/GoWwWu5ht3MvTN7pfxJCUFbhAq8aAoYX+GQ=; b=jV+yRCEyh776CXW9GumeCXBQFn
	dw5p1D0VcDoaCo3tIcDiV6JEApdz/aViUBM9DaF4jqXZhCJM8B4Sspa+IsBM2ZVDOayzV/6L1z5+g
	jOwBxV0q9I3+BvroBDT3ZTY17TyojQfA1kdT/EvP2plG9b6PRxR/9Y8CRRz3H5lyjbXgB7Foeu8yS
	JmWxroFc7lxVQBfC35S4IINrBULzHAPSNVirAIcApkVufLdKt6vWMZN2Do54aRhpLoGnPre/VRsY4
	QtErd5TWSMh0uFMrRGblUKAy5g/Lvwd4eJ0wvw6cDFKis+teNLT7F6KFEFJlLihUs+on05YZMhsyB
	l3eGAp8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSUq-00000006kue-3boS;
	Mon, 13 Jan 2025 22:01:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSMO-00000006jUV-2Ewx;
	Mon, 13 Jan 2025 21:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aWQ4v/f/GoWwWu5ht3MvTN7pfxJCUFbhAq8aAoYX+GQ=; b=nj/Nk+IhXq2x7yIP/0sTZ8RBKV
	WuQ5F73W0hA1c/UYGAssmVIRlozNlL9e6Sqb6Cd1Exk7CGMYKg7CqkvAs9pASGpZcs+SvR8jcfPFu
	S2Q+O4ULwaj0h5RZXJolR5Gu2Nxbk5IgzgQ+42OV97xFhEd4dTPw3haVUClHs01eADRg4bKwLsfwT
	A+SRtLqw4YDqnMedS2BPWUIe9X2ULjzV6AHl15M2pSTooSlU4aq7Jux2xTAQdqefGJDa7cfpOTrGL
	TWkfeU4n7hUFhT10P31hyR0Enh5Dhqx2slrN0RcDOGFd7AT7OkMSbAJURwz6mYIo3sAThXnd7oexS
	dBr6iNqQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSMI-0000000AMKP-1OMF;
	Mon, 13 Jan 2025 21:52:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DErkuB021789;
	Mon, 13 Jan 2025 21:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWQ4v/f/GoWwWu5ht3MvTN7pfxJCUFbhAq8aAoYX+GQ=; b=IAHEd56xwjyaijYG
	EfiR8z0R4b0pbRExpLbxuQ/u+aG1VPL13CHJbTVvaWrSnFEAlVgQMlVM0BkHyWB0
	9f58e8V8+CZSy6qUVMfPeKZzuFX2g/jjUj+A81XHC6i+Ul9a+45rlUee6aNSNdvc
	kwnsKTHskHtgFcr2+2trK3HYBciVutfCR7x0Zy+dFe4A+pIOnRnzoPbBxe2b+BEg
	mnvEnppjKNsX5Eqwi0jmJwPw2uRwzjqHc7P9+C5vRKJ7U0tV+jJ4/cMbOzoYnDkk
	9OFZEH95LiXj9/YrNexQDPvgMGzrzqdiEfnVAAjJRFVesKVpICyVdIPcNDJo8cMm
	oor+8w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44550agy5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:52:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLqJjN010741
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:52:19 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:52:18 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 13 Jan 2025 13:52:10 -0800
Subject: [PATCH 4/7] phy: qcom: qmp-combo: Add new PHY sequences for SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sm8750_usb_master-v1-4-09afe1dc2524@quicinc.com>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
In-Reply-To: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Will
 Deacon" <will@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        "Melody
 Olvera" <quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736805135; l=11639;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=7IhGAigQLaTiTD7xT00eLsEsaVMQz+Tmzg6WTlMOIEg=;
 b=vDn2r0jdRslrjDxnPd8x/1HeVxS7XyLYH/a1uREwVk3GHnZGE7C51wiPo4u56qPU/yNrVz4me
 F2rrMpWCBXQACaEJbY7pYFRq73qbcNMcE4PBdKoFlQLIcK63u1/zd8N
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: r4Upw6yqbO98jjlyWkuXp70ebAhmJ8Ze
X-Proofpoint-GUID: r4Upw6yqbO98jjlyWkuXp70ebAhmJ8Ze
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_215231_038812_733D148C 
X-CRM114-Status: GOOD (  11.05  )
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

From: Wesley Cheng <quic_wcheng@quicinc.com>

Add new register offsets and PHY values for SM8750. Some of the previous
definitions can be leveraged from older PHY versions as offsets within
registers have not changed. This also updates the PHY sequence that is
recommended after running hardware characterization.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 198 ++++++++++++++++++++++++++++++
 1 file changed, 198 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index b09fa00e9fe7db8d97b7179ee15d3f07fe578b0c..823a60029ea6acbd1f0f8c7d27aaa58de39ed758 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1471,6 +1471,139 @@ static const struct qmp_phy_init_tbl x1e80100_usb43dp_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_EQ_CONFIG5, 0x10),
 };
 
+static const struct qmp_phy_init_tbl sm8750_usb3_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE1, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORECLK_DIV_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE1, 0x75),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE1, 0x25),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0x5c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x5c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0x75),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE0, 0x25),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x62),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_BUF_ENABLE, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_CFG, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_1, 0xb6),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_2, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_3, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_ADDITIONAL_MISC, 0x0c),
+};
+
+static const struct qmp_phy_init_tbl sm8750_usb3_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_TX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_RX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_OFFSET_TX, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_OFFSET_RX, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_1, 0xf5),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_3, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_4, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_5, 0x5f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_TX_PI_QEC_CTRL, 0x21, 1),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_TX_PI_QEC_CTRL, 0x05, 2),
+};
+
+static const struct qmp_phy_init_tbl sm8750_usb3_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_FO_GAIN, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SO_GAIN, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_PI_CONTROLS, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SB2_THRESH1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SB2_GAIN1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SB2_GAIN2, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_AUX_DATA_TCOARSE_TFINE, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_VGA_CAL_CNTRL1, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_VGA_CAL_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_GM_CAL, 0x13),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_IDAC_TSETTLE_LOW, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x27),
+
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_SIDGET_ENABLES, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_LOW, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH2, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH3, 0xdf),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH4, 0xed),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_LOW, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH2, 0x91),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH3, 0xb7),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH4, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_DCC_CTRL1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_VTH_CODE, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_SIGDET_CAL_CTRL1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_SIGDET_CAL_TRIM, 0x08),
+};
+
+static const struct qmp_phy_init_tbl sm8750_usb3_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_LOCK_DETECT_CONFIG1, 0xc4),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_LOCK_DETECT_CONFIG2, 0x89),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_LOCK_DETECT_CONFIG3, 0x20),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_LOCK_DETECT_CONFIG6, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_REFGEN_REQ_CONFIG1, 0x21),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_RX_SIGDET_LVL, 0x55),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_CDR_RESET_TIME, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_ALIGN_DETECT_CONFIG1, 0x88),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_ALIGN_DETECT_CONFIG2, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_PCS_TX_RX_CONFIG, 0x0c),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_EQ_CONFIG1, 0x4b),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_EQ_CONFIG5, 0x10),
+};
+
+static const struct qmp_phy_init_tbl sm8750_usb3_pcs_usb_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
+};
+
 static const struct qmp_phy_init_tbl x1e80100_usb43dp_pcs_usb_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
@@ -1781,6 +1914,22 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
 	.dp_dp_phy	= 0x2200,
 };
 
+static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {
+	.com		= 0x0000,
+	.txa		= 0x1400,
+	.rxa		= 0x1600,
+	.txb		= 0x1800,
+	.rxb		= 0x1a00,
+	.usb3_serdes	= 0x1000,
+	.usb3_pcs_misc	= 0x1c00,
+	.usb3_pcs	= 0x1e00,
+	.usb3_pcs_usb	= 0x2100,
+	.dp_serdes	= 0x3000,
+	.dp_txa		= 0x3400,
+	.dp_txb		= 0x3800,
+	.dp_dp_phy	= 0x3c00,
+};
+
 static const struct qmp_phy_cfg sar2130p_usb3dpphy_cfg = {
 	.offsets		= &qmp_combo_offsets_v3,
 
@@ -2280,6 +2429,51 @@ static const struct qmp_phy_cfg sm8650_usb3dpphy_cfg = {
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 };
 
+static const struct qmp_phy_cfg sm8750_usb3dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v8,
+
+	.serdes_tbl		= sm8750_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8750_usb3_serdes_tbl),
+	.tx_tbl			= sm8750_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sm8750_usb3_tx_tbl),
+	.rx_tbl			= sm8750_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sm8750_usb3_rx_tbl),
+	.pcs_tbl		= sm8750_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8750_usb3_pcs_tbl),
+	.pcs_usb_tbl		= sm8750_usb3_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8750_usb3_pcs_usb_tbl),
+
+	.dp_serdes_tbl		= qmp_v6_dp_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl),
+	.dp_tx_tbl		= qmp_v6_dp_tx_tbl,
+	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_dp_tx_tbl),
+
+	.serdes_tbl_rbr		= qmp_v6_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v6_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v6_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v6_dp_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr3),
+
+	.swing_hbr_rbr		= &qmp_dp_v6_voltage_swing_hbr_rbr,
+	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
+	.swing_hbr3_hbr2	= &qmp_dp_v5_voltage_swing_hbr3_hbr2,
+	.pre_emphasis_hbr3_hbr2 = &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
+
+	.dp_aux_init		= qmp_v4_dp_aux_init,
+	.configure_dp_tx	= qmp_v4_configure_dp_tx,
+	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
+
+	.regs			= qmp_v6_usb3phy_regs_layout,
+	.reset_list		= msm8996_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+};
+
 static int qmp_combo_dp_serdes_init(struct qmp_combo *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -3915,6 +4109,10 @@ static const struct of_device_id qmp_combo_of_match_table[] = {
 		.compatible = "qcom,sm8650-qmp-usb3-dp-phy",
 		.data = &sm8650_usb3dpphy_cfg,
 	},
+	{
+		.compatible = "qcom,sm8750-qmp-usb3-dp-phy",
+		.data = &sm8750_usb3dpphy_cfg,
+	},
 	{
 		.compatible = "qcom,x1e80100-qmp-usb3-dp-phy",
 		.data = &x1e80100_usb3dpphy_cfg,

-- 
2.46.1


