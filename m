Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075F2E65D3F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDQynBMt/JyIxD/BhQ2nf8R/ubBRLvN96DuCte3cP6A=; b=46B32EH5Ysc09V7UML1jBxSgG3
	VX7G3kT3RHnqBbNvD4ZFAn8m/e2omH2/jIaQOwH/JF77yB/vHnRuzJb+7jfdIRPXEdo5McV4EtznL
	Jsw06zszuzBzqS+5PE12kCa1zFJtNerIg3OSZqugtNrciKLeVrB8L6WYKC76tw/cbujj9MurDQmp1
	0Fe+W+gjrFnOs/sjlj4aZrasJa1rMUtpek3vYWKF19xviCHyWvPJp76mnCRtCGAicxjP+tUxoZj4M
	AvMrrDBr5CBE85qewcHaCJPuqxqGT5hOpKppKT9SDGJIVIVVH+XgEdWdIzpA+ukZqj6cB3QCFKk63
	dgdfCg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQbp-00000002D18-3QWo;
	Fri, 22 Nov 2024 10:09:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQRQ-00000002Ahh-1dAV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:59:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM2N3k7025091;
	Fri, 22 Nov 2024 09:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vDQynBMt/JyIxD/BhQ2nf8R/ubBRLvN96DuCte3cP6A=; b=j/phiIMKN629ROgM
	MyJ8fywaotVJjzcAu/P+GIIB2WQnYP+s5YRoUHumgdT5YvRzgQbWuc+AAxq862As
	5McAtWEdqzV0wWHe6Y7RFRERaokMySsGBqD7UfSoIp7sUboi8Ixu91bxK8Jp3Ln5
	jkP/WrSnI+ea4bU3TdCD26VnFfLI4Nq6XsTka2YKqpb7TveF3f4bAje88nqKkOBa
	HGYI7zurIUQSyeC446tBfN4+d2toiWL5G7Me76pJac3zy5UdEQwph9ayXb2XRBzI
	bV+bnRm60kPIVR6My7ZMKx17f2r7iNXIyax68zfe8mmo56T3lh8AZ2wTpinb//BE
	mrewkQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43251njxx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 09:58:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM9wuMU031543
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 09:58:57 GMT
Received: from robotics-lnxbld017.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 01:58:49 -0800
From: Fange Zhang <quic_fangez@quicinc.com>
Date: Fri, 22 Nov 2024 17:56:45 +0800
Subject: [PATCH v3 2/9] dt-bindings: display/msm: dsi-controller-main:
 Document SM6150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241122-add-display-support-for-qcs615-platform-v3-2-35252e3a51fe@quicinc.com>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, "Li
 Liu" <quic_lliu6@quicinc.com>,
        Fange Zhang <quic_fangez@quicinc.com>,
        "Xiangxu Yin" <quic_xiangxuy@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732269514; l=1018;
 i=quic_fangez@quicinc.com; s=20241014; h=from:subject:message-id;
 bh=Y1O01Z9215kOJjLapEzpypUpn6Pm7d+A8qx0fRoXGbI=;
 b=vYU5dZHzeId+NmlaM7UqJqJ8pvloRWwJNCmGm8bH2coHTDc/gZwH53v44GzzluPUEdm5Xdz04
 IGYxjMvuilxDVmweNLUXMZq4m42Psywk8fCPcZ3nfq5/Enb6zeaVCKY
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=tJv8Cz0npA34ynt53o5GaQfBC0ySFhyb2FGj+V2Use4=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _R-eWq888WRvP_maNUkL2sZo0sQpOi4r
X-Proofpoint-GUID: _R-eWq888WRvP_maNUkL2sZo0sQpOi4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411220084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_015908_562511_7ECC0888 
X-CRM114-Status: GOOD (  10.11  )
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

From: Li Liu <quic_lliu6@quicinc.com>

Document general compatibility of the DSI controller on SM6150.

Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index b0fd96b76ed1376e429a6168df7e7aaa7aeff2d3..a7fbb5af4b0583e88ebcad07dd004046c38f95ee 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -30,6 +30,7 @@ properties:
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6125-dsi-ctrl
+              - qcom,sm6150-dsi-ctrl
               - qcom,sm6350-dsi-ctrl
               - qcom,sm6375-dsi-ctrl
               - qcom,sm7150-dsi-ctrl

-- 
2.34.1


