Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1646ED39408
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 09:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/xYMmjVgEXgdxV48wdb3wGntOFFuiUnKCT2/b5NadA=; b=cax0fo0UmfMmXx6YcEAQJadqRQ
	dgeLpV18z419oZ5QN7yxLOn4aXhYJ2At7UcVyOsecdvM9jLKlW3aP/WCo/EPekPVdNdGs2z9LyCwn
	8eJMRHeE5TWlgheCEozAwlsGnXpSe4UpucsYlMjqPhyYKagdws98SgSYwYXBAMwm7UKeIyYwoqyEU
	7AK3goFR46uwYs99q96v18uzhVsnQcjUIdEyKQIbA0p/KsVUL9ebxLw33U/CUOPrHE3Pej2TpT47/
	/k1ilF8y3l0sR/2CK61pRbxkyEy1A7ypQJJ8W71yW4jyGq85a4wzmPGsslbzzvcbuqMDjaq/LwiMD
	bSwUyWpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EhD-0000000HIok-48pa;
	Thu, 02 Apr 2026 09:50:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EhC-0000000HImY-0sJV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 09:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=j/xYMmjVgEXgdxV48wdb3wGntOFFuiUnKCT2/b5NadA=; b=CY9wEbr7QTuEQjM7WmqT8S3hmr
	HrBUg2J11mcXTEAbnyB3AaMv8ICeMYnwom+aMtw/m4xvN570w8LdvaqQHiAWeQQDbWbC0E0Gmif0+
	A8t1j8Vwp019ud5E8De/tzxNqTNYhqd77cOecRLKyIE5CXsoEpRXCKwttGh2dGIidhVdAx3Xm1fag
	gUz/qJE1FdiFMHr5K7CDPmG3QpJ4z318lW5k7u5q88GUY0js/z9uVMQ9ov5U7E+omPZeDi9moXzmm
	0NYwyHYTFfqwo1rtS7xt+kBIFiInAzrIQIacRO+aMNW/pb6lZIy8ZdcQ5K1uc7FLffCfqF9Ws1foC
	8KymuJyw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Eh7-00000002AEB-3VnG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 09:50:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6327HGXH3044207;
	Thu, 2 Apr 2026 09:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j/xYMmjVgEX
	gdxV48wdb3wGntOFFuiUnKCT2/b5NadA=; b=FfWf84ZJUaRx87TkgVJsW5G/YLD
	N0QdrBImTt05FEXTE6o9VASqAD4exqXh1uM+MNfZnxWDGmXrrjr1SYfP+gjQ7vRE
	hOpacvDZ9wCY8XxXaUpVcr1xF6Bwm0EX2WADCwQWJC+28k1rLUWLRd2SpwmJ3E5s
	3S2tpbO3ZXJCDesH0qx1JNeLCFb//7Ing19X5pxKPERDzlwDI6UWzF7wt1FdMnwP
	KvWodcIj1tOILslAaCZak5nVka1Styxb9o4U5HrjwWmmfzGe5HNG+dxDw4K00z/1
	sr40ytrniBQ9Q9wCcpioFRYew3fwlNbpANCWoKwCIp/kPbPMozN3uytqXvQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483v8fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 09:50:19 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6329oGU9004382;
	Thu, 2 Apr 2026 09:50:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4d6qk2m86k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 09:50:16 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6329oGHC004362;
	Thu, 2 Apr 2026 09:50:16 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mkuntuma-hyd.qualcomm.com [10.213.97.145])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6329oGYd004354
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 09:50:16 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4582077)
	id B402F5ED; Thu,  2 Apr 2026 15:20:15 +0530 (+0530)
From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com,
        Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Subject: [PATCH v5 3/3] arm64: dts: qcom: lemans-evk-ifp-mezzanine: Enable mdss1 display Port
Date: Thu,  2 Apr 2026 15:20:03 +0530
Message-Id: <20260402095003.3758176-4-quic_mkuntuma@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402095003.3758176-1-quic_mkuntuma@quicinc.com>
References: <20260402095003.3758176-1-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce3bdc cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=0voD-ITsHmux3e9IgYMA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4OCBTYWx0ZWRfX1hsR09aS5PFY
 h6bJ7zyEy1VJKQ4pHwNZhEM512SKuAZ1zILLsdKWeZKUZmUph3Kd9yCAecJQs6Sd8sEb4vLD9iA
 emJcDbPIFavK8/4WVR7cEGmzmwkNIRNcctw7QtXA6CVK7aoLxtAng4JAvW7RVTK6C5mi1GJN1BR
 ON/ZJVIr650BiXvSiaJWASSKjMyuyVwCJXIEuRX2n+BmzJQ2XpnKQCOZ1LDqbe6cr711fVntmnI
 T6RuJYU2z3iRaWDAioFNyfOe1s/TpszvKuCxcIRz3MD7bR6VF+vhghlcBPl23kKqoML967eOJDk
 j/7XPjphj9XGDKFeFwatt0s31Zq7mleDIR7vn5eCpbeT/lb21kp+vNLykmL5b57FJcqbT6zqY8Q
 sKWy6jQC9+49Dzt3RmXHD8ZvFShEzpWIpKdJT9hhlpIZC4E8J+odVv+JG5CWrIHBQ/3wCvXl2ID
 18zku2RR+9hgR30EuDA==
X-Proofpoint-ORIG-GUID: f6XuQancGbzBxrIPkTdPrUqEW_W-HNuu
X-Proofpoint-GUID: f6XuQancGbzBxrIPkTdPrUqEW_W-HNuu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_105034_823120_5EB7E611 
X-CRM114-Status: GOOD (  11.30  )
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

From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

Enable DP controllers, DPTX0 and DPTX1 alongside
their corresponding PHYs of mdss1 which corresponds to eDP2
and eDP3.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
---
 .../dts/qcom/lemans-evk-ifp-mezzanine.dtso    | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
index 268fc6b05d4b..44bd9b1a1765 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
@@ -11,6 +11,30 @@
 &{/} {
 	model = "Qualcomm Technologies, Inc. Lemans-evk IFP Mezzanine";
 
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
 	vreg_0p9: regulator-0v9 {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_0P9";
@@ -141,6 +165,44 @@ mac_addr1: mac-addr@0 {
 	};
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
+&mdss1_dp1 {
+	pinctrl-0 = <&dp3_hot_plug_det>;
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
+&mdss1_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp3_connector_in>;
+};
+
+&mdss1_dp0_phy {
+	status = "okay";
+};
+
+&mdss1_dp1_phy {
+	status = "okay";
+};
+
 &pcie0 {
 	iommu-map = <0x0 &pcie_smmu 0x0 0x1>,
 		    <0x100 &pcie_smmu 0x1 0x1>,
@@ -235,6 +297,18 @@ &serdes1 {
 };
 
 &tlmm {
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
 	ethernet1_default: ethernet1-default-state {
 		ethernet1-mdc-pins {
 			pins = "gpio20";
-- 
2.34.1


