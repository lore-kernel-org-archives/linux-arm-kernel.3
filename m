Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C68CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U7k2Nch5voDi406TTgsnG/LRJ3rVQu56S7zp13yDgEw=; b=QV1HhzZjJs2tKZVAutw84VQzCT
	TVlTb/VwpkdYOWJoCsn8oYZ6x36CPzl5eFbmAxMnqqo1lYdCBTWWVxztL5+XYMDHaVkJLVVtaqJuJ
	vdUHcblzaw3p6KmaIOWyvAlw/XMotNSRUr2OTc9+REDPNRcLKug90BqN1d42fKdmg+6yDPD6+YJ4v
	h2H4TWY3xh2jPlgrWZ/qteLCnjoU9m2MxDHgMPoOw7CnOp9H7+JXRgamPzgeXmiEH0By7oL1EE7Mo
	y5n1e6NJcdDVph6fx3kLAo8oslgSpir/hvXzFSyM4a034pWAIkQLg/bu5fZmuxM3A+V9q1RHTGPx8
	KQoNei8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1x3-00000008pbC-30vP;
	Tue, 09 Sep 2025 17:16:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwkl-00000006pDg-2j52
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=U7k2Nch5voDi406TTgsnG/LRJ3rVQu56S7zp13yDgEw=; b=QmrM542Zh69ExA0elg9Pi1Qg9r
	YkSWTYdjN2P+tNzeLNt7hzaZXOYFyiMlmRJwHgFvERydcviy+MWR2boES5SXdsN/tYwmefCBP/EhD
	JsaKQSxrx/S1e/DIkMalo3JtVmSQRAEmrimiUYzuzACluJAjZhKwQbSADopball306utUwE2qj4AH
	DfjwvW6o0qo3rZIJH8tth+p8azPqxMWrHGPg/0vSgiEMtRVPbPdtrWqoRhNw8AjcpkEQ1j5uckmwv
	l1TgK3grF10AviI17iLR4uWHS5yBXcESvtMgBrEq6TYvvLvl69z4+PhzhFy7NYC4rMLftwgLmJJ2m
	zvF23/bg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwki-00000005KHK-02Cc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:43:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LQjj009026;
	Tue, 9 Sep 2025 11:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U7k2Nch5voDi406TTgsnG/
	LRJ3rVQu56S7zp13yDgEw=; b=fO61Qqz8JA0HFqEHUPpcAzhzZANtR58nthK81s
	oLC36PJnqaCbMJfEodn6V2flDUjSzLZUn6EozXZZodswl3iXkPXo3YClRY1C2NdV
	1XWKGxk6gLhYGC+uUOQoi7D/vsBcT+WnyqKRPuEM3ZLpic/4Mv3KQRt7Ytl9DXV9
	FAy3UMwsKrOywdOxtCtzZlZHO8hr83449pwGpWwS4RATQje3sYI1vYVTnQ0SVGkg
	rYnaBXNiI2PtkMQ8ZSTsg9aIU3tojiFP8nk7fkYWevShZgdSW7QBY2gr68LpWZww
	noB561aDXZkI6o4/4nETFOsO8fW2gF6SG1TnoA0wHctwActw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdvv7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 11:43:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 589Bh0X7024236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Sep 2025 11:43:00 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 9 Sep 2025 04:42:55 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/4] Add CCI and imx577 sensor support for monaco evk 
Date: Tue, 9 Sep 2025 17:12:37 +0530
Message-ID: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8VdtUUVYVoJR3QbnrSUEzr9U2S1Xy9SV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX5zT+HYDiAJ7R
 HqayA7PYg4xgljAUEQa6gIoxEUUEq/+LH0OpvqhLxymCmUHhh9kjBwtdxflXKWHTpDccTm9wzrE
 P05sfEwoJL6vtyovIHkmQqt2mmZZUZnnfKfoZ4srbi7qUdfYbTMjbAzZYFk0i2nqA4FrU/AtneG
 eV/Va44XaKYj0PUMU/ZYZRyfwjOl1UR63gCc0qnMIoxrd0+BIvEaPJ/qyNbeGLJkuX074ncQoS7
 nkJ6Ttm6HzrxvmTe66OdvYdulItBFsHwJZHUStd9xG8oa7Tzf7qwuNyYEHxPB/8frVagZa4xvgg
 AcPrIPGWKOQgZfbMbHRyDw1t8Xr+xZR0jE9hQbCQJqoQhGs7qp42vORVenDpzQ+brwxi3o3x6us
 3GJ5tkJl
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68c012c4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=v6uyjqmK6R-IeO1cyMMA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8VdtUUVYVoJR3QbnrSUEzr9U2S1Xy9SV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_124312_375760_A345449B 
X-CRM114-Status: GOOD (  11.78  )
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

Monaco EVK is a single board computer, based on the Qualcomm QCS8300 SoC.
This series adds CCI definition and enablement of imx577 sensor
via CCI1 on monaco evk.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -d /dev/media0 -V '"imx577 3-001a":0[fmt:SRGGB10/4056x3040
  field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":1[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":1[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":1[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F
  /dev/video1 --capture=5

Used following tools for the sanity check of these changes.

- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml dt_binding_check
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml
---
This patch series depends on patch series:
https://lore.kernel.org/linux-arm-msm/20250814101615.1102795-1-quic_vikramsa@quicinc.com/
https://lore.kernel.org/all/20250813053724.232494-1-quic_vikramsa@quicinc.com/
---
Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---

Nihal Kumar Gupta (4):
  dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
  arm64: dts: qcom: qcs8300: Add CCI definitions
  arm64: dts: qcom: monaco-evk-camera: Add DT overlay
  dt-bindings: media: camss: Add qcs8300 supplies binding

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml |   2 +
 .../bindings/media/qcom,qcs8300-camss.yaml    |  13 +
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../boot/dts/qcom/monaco-evk-camera.dtso      |  98 ++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 309 ++++++++++++++++++
 5 files changed, 426 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso

-- 
2.25.1


