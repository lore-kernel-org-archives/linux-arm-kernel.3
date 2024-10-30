Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7C7D6B6B7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 17:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=islD7/hTAaJepVUU53aoHZr7I1505Jhxy29H8utccEo=; b=Sn7M6XP0FTUiPhn7Fj0BQW6gga
	FvM9ZjK+EYPF7yK02+NdOpRHg33HgOLup0JqhGnHjgvP0DAjz4dic7VLU2RylnZIlO7Gt5bRu7FTP
	lyVclj4JIYBf6RQucR9Tlly0C3LrHGjIei6KacbodNzThHyFcnhkLbkMftiAWndEBMPBiEYO1b3ae
	SvuXji2ZfR57VGrEcfrtcq1NIHNSue1UAYYANDDbxU9tsF3oRjXkkTCPyrFF774Dwm9CiBMKPCcAm
	qBYTiyFA4GzRLXRTa3Ul5C8wMRy9Oprs8R8oxOl9ygb3mssgGr7gPVEWaphzBrX3jPaVL/mo2uoDK
	Gjc5M/zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6CvZ-00000001LVy-1RuX;
	Wed, 30 Oct 2024 17:56:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6CtL-00000001L6b-1un9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 17:54:00 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U9Tgut026938;
	Wed, 30 Oct 2024 17:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	islD7/hTAaJepVUU53aoHZr7I1505Jhxy29H8utccEo=; b=cVrMSWRkWUClr3/R
	U2XHFzzcw7rQzSkEMSVlPI9VM45lRL6jkoHUGsDaIV+aQa+m0qB4GB65Vc3hPBRx
	1y8GqPHLFWI1r5s2//jN07YJ2Z6Ij0sM6kpI6LFryfTUKVwnmCsC/YwmOuLFRmh0
	1YX0dAJE3tsnUOksIjXYi6dzloyV8JwvtO4a1Joz9ATS2QoEDVAONBRYUn29qxbz
	kQuyD4FBybjUIR2m1gLk+bkNn0JUdV+Pd+DXZIp31K6SevWz3+40WrUy9x9gtPwx
	8U4MpX4qhmzFn/oxGfuTn8FpCoQPpTtmbDut/fOm5uSiVtRyX2Iaf8lprmy2GHLT
	xUrXNA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqcqvxkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 17:53:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UHrN21008161
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 17:53:23 GMT
Received: from [10.216.35.255] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 10:53:14 -0700
Message-ID: <3f80ccd8-19b6-45cc-a34e-6fa420f78557@quicinc.com>
Date: Wed, 30 Oct 2024 23:23:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abhishek Sahu
	<absahu@codeaurora.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-3-4cfb96d779ae@quicinc.com>
 <da47ugibewtz6zyezkaxpvver47pp46r62mabls56pleb7nqdy@bwuwbenkb2zw>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <da47ugibewtz6zyezkaxpvver47pp46r62mabls56pleb7nqdy@bwuwbenkb2zw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Kc5bA-ntgXpxXk0Xee1GX_sLnDohq0V8
X-Proofpoint-GUID: Kc5bA-ntgXpxXk0Xee1GX_sLnDohq0V8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_105359_533748_BE01F442 
X-CRM114-Status: GOOD (  12.51  )
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



On 10/22/2024 11:31 AM, Krzysztof Kozlowski wrote:
>> Add DT bindings for the Camera clock on QCS615 platforms. Add the
>> relevant DT include definitions as well.
>>
>> Signed-off-by: Taniya Das<quic_tdas@quicinc.com>
>> ---
>>   .../bindings/clock/qcom,qcs615-camcc.yaml          |  60 +++++++++++
>>   include/dt-bindings/clock/qcom,qcs615-camcc.h      | 110 +++++++++++++++++++++
>>   2 files changed, 170 insertions(+)
>>
> That's some duplicate posting. I already reviewed some of the patches
> here, so please implement that feedback.

I will implement the fixes in the next patch.

-- 
Thanks & Regards,
Taniya Das.

