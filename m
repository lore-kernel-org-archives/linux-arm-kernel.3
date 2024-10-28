Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BB4D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 03:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zN10JdhAIAKuyeOLdvbGAXdgY1Y+VOJbyGob/tjS3A=; b=v3o+tlqXbrjOQ+zwDA3MBWmJmt
	NqvjRt9sEGwCqPSBQ9YkWvBsdMC3i+I2wyJlY52aDiEG1cfGDyt15qH2golqTu2eyGvAPsJV1RFwP
	nwlrOKdCpWVEGu6cKF5TUWtwtlEss0UsS0cu/iNgAoGhx/q5QMdnthy3dCPdXirkCgk2TBilcyUEp
	OjYF6x4HJNuhnbwLDS1XsH4i6Gn6H5jGoXtyvXRsN+nx+cN0NPBdtWZH7igZdNSFcOrLpn7CAsoaj
	9eqQNxSnLISgrkC6oZ04mQnKYP/wSR1zOmXtcpniSvEHPbkK/8tx2AvzBXTy4BKO46/YSGJsddCh4
	hKcia1UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5GGj-00000009QOa-0024;
	Mon, 28 Oct 2024 03:18:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5FtL-00000009Nl9-1oCZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 02:54:06 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RNpLGo031126;
	Mon, 28 Oct 2024 02:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5zN10JdhAIAKuyeOLdvbGAXdgY1Y+VOJbyGob/tjS3A=; b=Qserw/KST6S3KzwA
	iVrBOggXDNlmNEvOn0NGaSo+LUIFysn0ADcSOCJCyVM8VWKb+CA7Mk7rtwO1mNRJ
	7XIm5Zt3yXhEuupgGu85by34E/Gu1WvCyK67hVqC1Hfbs6khVSFrYUAJJNs2LAyS
	Jrz0PGA/r1oQ9IExwJxboMCYPu362dQnJitlsSLhBS41loAwItx5JHL8m04bJO1f
	rYtvnfUrlkJzpmh9gmHY/Vo9//wRxhY8W6V6FzTAgAutFbuSfDsSg+vP1gOl1YHl
	ZCrYsVN0h3R//h0cDzEHK+5zJEkfnClzAtetmzWVz/9F9y6lyL54sQ2PR5Cr9C1o
	QwtDJg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gskjucvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 02:54:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S2rxgZ023044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 02:53:59 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 19:53:55 -0700
Message-ID: <e263d461-9e2b-4ffe-8221-cd9ecdd142c9@quicinc.com>
Date: Mon, 28 Oct 2024 10:53:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add coresight nodes for QCS615
From: Jie Gan <quic_jiegan@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>
References: <20241017030005.893203-1-quic_jiegan@quicinc.com>
 <69be09ec-e9a5-4fb6-890e-74a65f3ce404@oss.qualcomm.com>
 <3f90b3d6-9637-47b7-ad8a-ff43cb28ad32@quicinc.com>
Content-Language: en-US
In-Reply-To: <3f90b3d6-9637-47b7-ad8a-ff43cb28ad32@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: G65cGfCj_fY372rmIK411cIbN-yhb_Yz
X-Proofpoint-ORIG-GUID: G65cGfCj_fY372rmIK411cIbN-yhb_Yz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_195405_382162_1EBE454D 
X-CRM114-Status: GOOD (  14.77  )
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



On 10/28/2024 8:54 AM, Jie Gan wrote:
> 
> 
> On 10/26/2024 2:47 AM, Konrad Dybcio wrote:
>> On 17.10.2024 5:00 AM, Jie Gan wrote:
>>> Add following coresight components on QCS615, EUD, TMC/ETF, TPDM, 
>>> dynamic
>>> Funnel, TPDA, Replicator and ETM.
>>>
>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>> ---
>>> Already checked by command:dtbs_check W=1.
>>>
>>> Dependencies:
>>> 1. Depends on qcs615 base dtsi change:
>>> https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615- 
>>> v3-5-e37617e91c62@quicinc.com/
>>> 2. Depends on qcs615 AOSS_QMP change:
>>> https://lore.kernel.org/linux-arm-msm/20241017025313.2028120-4- 
>>> quic_chunkaid@quicinc.com/
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 1632 ++++++++++++++++++++++++++
>>>   1 file changed, 1632 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/ 
>>> dts/qcom/qcs615.dtsi
>>> index 856b40e20cf3..87cca5de018e 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> @@ -202,6 +202,18 @@ l3_0: l3-cache {
>>>           };
>>>       };
>>> +    dummy_eud: dummy_sink {
>>
>> Node names (after the ':' and before the '{' signs) can't contain
>> underscores, use '-' instead.
> Sure, will fix it.
> 
>>
>> [...]
>>
>>> +        stm@6002000 {
>>> +            compatible = "arm,coresight-stm", "arm,primecell";
>>> +            reg = <0x0 0x6002000 0x0 0x1000>,
>>
>> Please pad the non-zero address part to 8 hex digits with leading
>> zeroes, across the board
> Will fix it.
> 
>>
>> This looks like a lot of nodes, all enabled by default. Will this run
>> on a production-fused device?
> Yes, usually Coresight nodes are enabled by default. Those nodes can run 
> on the commercial devices.
Sorry, my last clarification is not clearly. The Coresight nodes are 
enabled by default for commercial devices(fused), but only part of 
functions can run with commercial devices because it needs check fuse 
data before running.

If we want enable all debug functions related to coresight nodes on 
commercial devices, we need APDP override(APPS debug policy override) 
procedure first. The APDP override procedure will override some fuse 
data to allow debug sessions.

Thanks,
Jie


