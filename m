Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8AACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjIuOUSlZRjacrSeZ1kN7ydCTv4SbgH5srpMbo7M54k=; b=nybuP+XRplM01C+KbF4V0Y2zIV
	syOhGWkc/ZO0QS7i45EsiWzpf025tn1V+wobfvC/3Wi98JvJ5aMClTcqGK+InEufR/YP1e1n8Duna
	ws0M65eR40FeK0s5DlmSKQlFaeIDZelRxjtrgoAr6lFucsNyXPDz/z1wHG7js8bDDGB9PtNgrpLru
	qod1A/iT1+N0f8OXfgaoN0d5kwaQgaXbsGNprV7O3unDoSaHSWnktS3C20LyMry6YPRx0cdvhlqCs
	hj9S6+B6myhdswwN8inCn8VLxng/Cwe7mjwypP6pbqnYo1KkVVDQQEP4GYSzTEdyOIXrGfHTVOJ0u
	XuU4R+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFDz-0000000CXzs-0k9C;
	Wed, 10 Sep 2025 07:26:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFDw-0000000CXyo-1PRg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:26:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58A5oxTY020569;
	Wed, 10 Sep 2025 07:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tjIuOUSlZRjacrSeZ1kN7ydCTv4SbgH5srpMbo7M54k=; b=llRhJsfk1GnzUjY+
	62e/jULBjRfhJEwTgCzLLGXd61Z/9RPzWktkJrfv9qkr//sYrRSiKK3dMAmtcugq
	vIJIX0V3G4WN9dEyCkeZZsBmFtQVdh3/K9M3B434PS9rX0Y8hKLwDFUuCXhjromi
	EzQ4U/8PrgSgqFef/aIEV/vyXZ5WXFNaXBo/V0MWZusGnlXOhszFWUmGlN4J3Moe
	l7klPxZpi7Zie3g1lbPnC25rFBGR/Lo7BUwgBgttleT1ykKQMA6lZ30UrroxNVby
	z7k1SIT4d3WnaSb0u9PQO/Mr9/s2plHzB3VES+TaPyW/3NzBXtXrUVmAsROwXrln
	Cgc6MA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8aaw4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 07:26:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58A7QSGI005026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 07:26:28 GMT
Received: from [10.204.66.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 10 Sep
 2025 00:26:23 -0700
Message-ID: <d16d40ab-8a35-4886-b11f-2eee15849e1c@quicinc.com>
Date: Wed, 10 Sep 2025 12:56:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Add qcom,qcs8300-camss
 compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-2-quic_vikramsa@quicinc.com>
 <f1e3c3a9-9929-477a-b1ad-e485c059cbc2@linaro.org>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <f1e3c3a9-9929-477a-b1ad-e485c059cbc2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c12824 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=xK8GJCHwwqq8D6wDn2oA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Y0FiRtsMI90TjEYc3DDyEdtzkK-DWdYN
X-Proofpoint-ORIG-GUID: Y0FiRtsMI90TjEYc3DDyEdtzkK-DWdYN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX6Rdil2iWUBUY
 ThbgUYl5wKxGa0oY6yWIB0BEggLrYO7IarkrvY4tTBwveUtInH8tfgXQ7fherU41EDuDEQRu0Hg
 NAtTRcZXBtlRKi65NB8ipSdtpOtMm5GUGM2kjFVXb94DxfAjKPq7MUqTccuociwIOlc0qmMWdgV
 qPqG3B5RZ8Djh2CvCjbnUns6sfVgAsOtDqn1f9B6MzrUNCC7LqRh7IdAmfyKAXKTpNMOKIj9s8w
 rqaYY8vgP24PtOAbL14M4zEnc6YDD4oqeOL2jLD9GMGprgxJ8fdlwOhNyjQzQGd17W2Vetr6SbA
 NbkETCVapifD0jKiQdUjK7AN80yFC1Kah/nTxB+DYFFjaofrfmwq8haDDvD0Ie7IS9MFJruzljn
 C2g0lBss
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_002636_374421_2E2BCEEB 
X-CRM114-Status: GOOD (  14.64  )
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


On 9/10/2025 12:35 PM, Krzysztof Kozlowski wrote:
> On 13/08/2025 07:37, Vikram Sharma wrote:
>> Add the compatible string "qcom,qcs8300-camss" to support the
>> Camera Subsystem (CAMSS) on the Qualcomm QCS8300 platform.
>>
>> The QCS8300 platform provides:
>> - 2 x VFE (version 690), each with 3 RDI
>> - 5 x VFE Lite (version 690), each with 6 RDI
>> - 2 x CSID (version 690)
>> - 5 x CSID Lite (version 690)
>> - 3 x CSIPHY (version 690)
>> - 3 x TPG
>>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   .../bindings/media/qcom,qcs8300-camss.yaml    | 336 ++++++++++++++++++
>>   1 file changed, 336 insertions(+)
> So it turns out this code is wrong and you already sent fixes for it.

Hi Krzysztof,
Thanks for your comments. These bindings are tested with TPG (Test Pattern Generator), As camera sensor testing was not possible at that point.
This is because Monaco-evk kit was not ready which can be used to enable sensor.

These Bindings are complete in its own, If someone want to use TPG.

My latest update in these bindings are for camera sensor enablement which needs supplies too.

Please let me know if this justification works to accept these bindings it its current form and add supplies as a separate patch.

Best regards,
Vikram

>
> Bryan, please don't apply it.
>
> Best regards,
> Krzysztof

