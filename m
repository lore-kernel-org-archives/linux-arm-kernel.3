Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4CBD39409
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 09:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdEbr56r+VHuQauUpjjRhRHLeI675xbXEe9pFgGKcMM=; b=LUI7sl/y0oxFGcmjcFt0qHhggG
	yaXbxNT2+R5fEigmhm3+YLkAtSs89ZNhNDgkM8jStet10pE6ZqI9hUnzDhhsaYh9w6dtk/4PScCpT
	wA48gCjSryZsaw+Kes8Sm6Gku16mpyg3DRDxh++6C/J6O39WB//sPlgCnkhtmppZ59M8BMCNqIoBa
	5zXDgR3ZYD4Tq1UM0+/Sn5XFDCqonSdgj3Xt2KUgSFKfcpWLOXsZExXW0nmqB2jbbPtc47JYSDEpF
	hg1hWlPXrN3mXxeChwXkV50kPvZq5u5ch4/QMUG0b8C3otZG4UoUfKswSQmLdrG1SQ/puAQidBIYz
	O/0xciEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EhD-0000000HIoB-2ktb;
	Thu, 02 Apr 2026 09:50:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EhC-0000000HImW-0iw7
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 09:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BdEbr56r+VHuQauUpjjRhRHLeI675xbXEe9pFgGKcMM=; b=AVFh4C9MY7wnkuHdube2PEl/ME
	J0PmU5thTHpNCGdjCeYlzujwjqr6gMW/MbJlBCH+r/FPFqHH5OXla9jZ4wN+Yledmz8WmPB6QoyRt
	VuIGVCDAXDxGuNmofos/RYaH+pxQUGpsfF6Z0rA2J5lY2HI+rUNIFMYow8jQVJ7oVjsFVNoVb7ug8
	bbGDYZYue8yL0dufyesgqJh6wQG3TghUmZ32PHHYl0p0rOx2AdfTquJCOU26JX5156NxixhgKxgzA
	VAlf/XOHh/SgBaLcyzEGgt90El++zamGGllkBgJU4QN1KAgv4Jyu3mNpAugZbJRhNMOQVZUXvC3dt
	s2uZocfQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Eh7-00000002AEE-348y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 09:50:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328dADt1249516;
	Thu, 2 Apr 2026 09:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BdEbr56r+VH
	uQauUpjjRhRHLeI675xbXEe9pFgGKcMM=; b=H3qzhEf53fmB0HqZlGgwyZSdUrg
	2PiTUXporSax9/GPq/4OfZ2GqdltxPlRVgz1rEhyiAUi46L9G8Jl4AxlxrHvjfoy
	oijzSaBNlUyNZOMMCqajwPoe/SdSAn76BobBfKK0qua1GWBvUhdLrf6WTpJEyLj0
	bsThBlWZ1rJPic1Q2Z+BoT5yQJuNT6xooRNwC0ccpIfbRGVcF0/aK03oLzI6X1FI
	mNlD+OS2RHmSW1d+JtxCrLvvZy7caGSs0yvwQph/JHrSfIpzJRAiLiMObBegzLDg
	Rdy6XQhGvf2sFaz8NWNexXnHvqAJ6DWqvawSlzQS3d8o4cofWpoilVw7EzQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9n4t09gx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 09:50:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6329oGm6004383;
	Thu, 2 Apr 2026 09:50:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4d6qk2m86p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 09:50:16 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6329oGCa004360;
	Thu, 2 Apr 2026 09:50:16 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mkuntuma-hyd.qualcomm.com [10.213.97.145])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6329oGpo004356
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 09:50:16 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4582077)
	id AE7975EC; Thu,  2 Apr 2026 15:20:15 +0530 (+0530)
From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com
Subject: [PATCH v5 2/3] arm64: dts: qcom: lemans-ride: Enable mdss1 display Port
Date: Thu,  2 Apr 2026 15:20:02 +0530
Message-Id: <20260402095003.3758176-3-quic_mkuntuma@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402095003.3758176-1-quic_mkuntuma@quicinc.com>
References: <20260402095003.3758176-1-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: 5LQZ4oTKzDfbUDmMnpDGeSUVqL4iXpyj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NyBTYWx0ZWRfX/NeZ2V/lY4a2
 oskx+ufC5sYx/29rfpJlctGVQlvl3la9hxgXaV4EDGaYASKrGVCCeZviCZLv1S0JflpwXsw77Af
 lJXnK1OTi4atJXpmV8sjd4hdQaYoWBJm4Rl+nO409omsqAYziDU2zUP85m4H/kuvOgfb7Kvi2IC
 k0tPp/Urc7xTQwnpMw4tGgHeREugs29RWVMjoZAbIAjyM188a9nWW5thUK8bov02SkoGD4TVxGd
 qfd6GoEl+4FWVPkoKIIZC7Slgofse3PpWTZsHdcaN90AbpeDK1x8pef98+G6Etmmn4BldqQGOzV
 v2uNvcLFRznaaOCn/RqNh+5UTeX6nJIxVnrqs9utYDP20iH/butsWqxOiWrLhTkhnL0dLT5W7ny
 PkMm2VY4n5sPSCrAEZWKqu8eWMeGg1Ee0bHbkznk3L0yyhhvtWsvmcIRSh8E4NJzKjdRQPFZYjv
 9YMG+nndNYciVKdyzXA==
X-Proofpoint-GUID: 5LQZ4oTKzDfbUDmMnpDGeSUVqL4iXpyj
X-Authority-Analysis: v=2.4 cv=Ap/jHe9P c=1 sm=1 tr=0 ts=69ce3bdc cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=COk6AnOGAAAA:8 a=lcgM4KOETyTTvZj5T8AA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_105034_496419_C1EFA94F 
X-CRM114-Status: GOOD (  11.43  )
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

This change enables DP controllers, DPTX0 and DPTX1 alongside
their corresponding PHYs of mdss1 which corresponds to edp2
and edp3.

Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
---
 .../boot/dts/qcom/lemans-ride-common.dtsi     | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 31bd00546d55..9b48e6134ff9 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -154,6 +154,30 @@ dp1_connector_in: endpoint {
 		};
 	};
 
+	dp2-connector {
+		compatible = "dp-connector";
+		label = "eDP2";
+		type = "full-size";
+
+		port {
+			dp2_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp0_out>;
+			};
+		};
+	};
+
+	dp3-connector {
+		compatible = "dp-connector";
+		label = "eDP3";
+		type = "full-size";
+
+		port {
+			dp3_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp1_out>;
+			};
+		};
+	};
+
 	dp-dsi0-connector {
 		compatible = "dp-connector";
 		label = "DSI0";
@@ -613,6 +637,50 @@ &mdss0_dsi1_phy {
 	status = "okay";
 };
 
+&mdss1 {
+	status = "okay";
+};
+
+&mdss1_dp0 {
+	pinctrl-0 = <&dp2_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss1_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp2_connector_in>;
+};
+
+&mdss1_dp0_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&mdss1_dp1 {
+	pinctrl-0 = <&dp3_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss1_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp3_connector_in>;
+};
+
+&mdss1_dp1_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
 &pmm8654au_0_gpios {
 	gpio-line-names = "DS_EN",
 			  "POFF_COMPLETE",
@@ -790,6 +858,18 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
 		bias-disable;
 	};
 
+	dp2_hot_plug_det: dp2-hot-plug-det-state {
+		pins = "gpio104";
+		function = "edp2_hot";
+		bias-disable;
+	};
+
+	dp3_hot_plug_det: dp3-hot-plug-det-state {
+		pins = "gpio103";
+		function = "edp3_hot";
+		bias-disable;
+	};
+
 	io_expander_intr_active: io-expander-intr-active-state {
 		pins = "gpio98";
 		function = "gpio";
-- 
2.34.1


