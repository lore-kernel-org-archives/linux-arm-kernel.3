Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED62D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 12:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcopow1qSFwvd9fNyuwAU04J2biGOz8GFQZ+auPheQ0=; b=EGBhPqi++e8aACaHesmp54OkC2
	5WG2MKnk8159e+8h9sfpLTcJpcOCN3wo0m3nslsOHBQrdMmN/RQw6lXZNNqkcSDW2ymlDMHv3R76a
	3kx5X8TfVRqQ+nVaXOmun35YAwrvkduP0SgpYeLL8FA+EvFfK0ShD/kE/a+VNJ1LZfzHJZqPHrLXn
	Av5TQrw5E5Qyvx3XjD8Fvq8yTnhPSyUhp/Eq0YhsdG9KB3B0NLEfLbvJkeoI0yn73Su/3XTk9yNLq
	AsjQkY3G9P6m+sMXJ4nTtqJyre1UjVkMDBVAwVnjZ6spqIENm52A3X84p0zcbGPtseNQXzHgzr8Z7
	Gz7sDYjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSxC8-0000000EHf9-2jpr;
	Tue, 09 Dec 2025 12:51:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSxC5-0000000EHd4-3R0u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 12:51:55 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B99N77X3474206;
	Tue, 9 Dec 2025 12:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vcopow1qSFwvd9fNyuwAU04J2biGOz8GFQZ+auPheQ0=; b=l2iqCT2CTcn3Zh8X
	BDZ9mYVHruwPFB7UPFktDAJNElQFs5R+vw63qC4y14mdLOBTL5DKei4wA4KhrRZW
	0fcusZj1N7gKdHIzemiThzgsjXLKlax+vR1MemnQQrqlWy/3eB9Itvojk6DFZgCe
	ySe5RGa5y4ty9+nuGMIXh4dWa7X78nZW1pVn4R+Kup0OlnL2PKJFvYeaAiyruJbj
	UywPs1kjEZZbNQFi3Ki01Ir1QF0lObhUibEmAkyVq3F9O4DECJLoGI+6VdW/X6dV
	si0/H1L2zc7RZ0zzqiN/3Kuwclj7h71XDdqwz9uhWZtkZQo981/AYA6NZo0csk/J
	hGB3zw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axa0bsvgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 12:51:47 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5B9CpkNZ014161
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Dec 2025 12:51:46 GMT
Received: from [10.233.71.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 04:51:42 -0800
Message-ID: <1fbe140c-b960-4f13-83e2-b0a0733a67bc@quicinc.com>
Date: Tue, 9 Dec 2025 20:51:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Leo Yan <leo.yan@arm.com>, Yingchao Deng <quic_yingdeng@quicinc.com>
CC: <mike.leach@linaro.org>, <alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <james.clark@linaro.org>,
        <jinlong.mao@oss.qualcomm.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_jinlmao@quicinc.com>, <suzuki.poulose@arm.com>,
        <tingwei.zhang@oss.qualcomm.com>
References: <CAJ9a7Vg9Efi-5eecfiUF82_Qq8Jg9imN5q1-VKYZoPVUxNpjhA@mail.gmail.com>
 <20251209081649.105623-1-yingchao.deng@oss.qualcomm.com>
 <20251209121916.GT724103@e132581.arm.com>
Content-Language: en-US
From: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
In-Reply-To: <20251209121916.GT724103@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA5MyBTYWx0ZWRfX2X19jiaI8qzD
 gzqAC7hTx3GgLYSTltpLcD/NdPWx+1LJAYPu2oDw5iJO3HSzCPAZZH/ZcaNgYg+7ZgEN3HliPdA
 43kUp4AO4+DrgBnWupsCq0RMxmNO2NIWHhq7rznF0EXOie7RMup+V5q2SfX//DjOiyJpuBtVQ1T
 LQzkMcu0DaVOI6fxtThkkbhW9yQE3Gs/CcVna4H8lz60DJOtfIMwo18akRcNbBGpxV3fUMng4ze
 7JdQoPTQ+oTuP0e9+Maut6hsPvM1d+47EwWnL2wYODvUUBp54WW3Eps0zyPceDsjc6IOv4StBn2
 L0LxySKmgjPJkutTXA2Jcb1LmUVewKaeiE8ANKtpolQOTPDXCQ3i+SR1OT6Z+R0GAMIn0apsxYG
 h1zTeuI0hyTPkNtqSJ39icJBUdYZVA==
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69381b63 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=uuXvdfZ7YpPWpv2YKKMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: a_YW54CdoEYm6JHiOuscNg71q_wUEHUl
X-Proofpoint-ORIG-GUID: a_YW54CdoEYm6JHiOuscNg71q_wUEHUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_045153_975437_B968D5A2 
X-CRM114-Status: GOOD (  19.53  )
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

Hi Leo,

On 12/9/2025 8:19 PM, Leo Yan wrote:
> Hi Yingchao,
>
> On Tue, Dec 09, 2025 at 04:16:28PM +0800, Yingchao Deng wrote:
>> Hi Leo & Mike
>>
>> Based on Leo’s suggestions, I created a new patch, but there are three points that do not fully align with his recommendations:
>>
>>      1. The helper function for returning the register address now returns only the offset, because returning the full address would conflict with cti_write_single_reg.
> No need to change each callsite for cti_write_single_reg().  You could
> update cti_write_single_reg() instead:
>
>    void cti_write_single_reg(struct cti_drvdata *drvdata,
>                              int offset, u32 value)
>    {
>            CS_UNLOCK(drvdata->base);
>            writel_relaxed(value, cti_reg_addr(drvdata, offset));
>            CS_LOCK(drvdata->base);
>    }

However, since we also need to handle cti_reg_addr_with_nr, it will be 
necessary to add an additional parameter "nr" to cti_write_single_reg?

Thanks
Yingchao
>>      2. For registers such as triginstatus1...3, I defined additional macros CTITRIGINSTATUS1...3. This is because CTITRIGINSTATUS + 0x4 equals CTITRIGOUTSTATUS, and to avoid conflicts with existing macros, I chose numbers starting from 0x1000 for the new definitions.
> To avoid the register naming pollution, please don't define the common
> names but only used for Qcom registers.
>
> AFAIK, you even don't need to define these registers.  These registers
> are only used for sysfs knobs, we can define an extra "nr" field (e.g.,
> bits[31..28] for indexing these registers, something like:
>
>    #define CIT_REG_NR_SHIFT          28
>    #define CIT_REG_NR_MASK           GENMASK(31, 28)
>    #define CTI_REG_GET_NR(reg)       FIELD_GET(CIT_REG_NR_MASK, (reg))
>    #define CTI_REG_SET_NR(reg, nr)   ((reg) | FIELD_PREP(CIT_REG_NR_MASK, (nr))
>
>    static struct attribute *coresight_cti_regs_attrs[] = {
>    ...
>      coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
>      coresight_cti_reg(triginstatus1, CTI_REG_SET_NR(CTITRIGINSTATUS, 1)),
>      coresight_cti_reg(triginstatus2, CTI_REG_SET_NR(CTITRIGINSTATUS, 2)),
>      coresight_cti_reg(triginstatus3, CTI_REG_SET_NR(CTITRIGINSTATUS, 3)),
>    ...
>
> Then, you just need to decode "nr" fields in cti_qcom_reg_off().
>
>>      3. Regarding the visibility of attributes for triginstatus1...3, since coresight_cti_reg produces an anonymous variable that cannot be directly referenced, I used coresight_cti_regs_attrs[i] to obtain the attribute corresponding to triginstatus1.
> Okay, I get the meaning for "an anonymous variable" - there have no
> field naming when define attr with the macro coresight_cti_reg().
>
> but you could comparing the attr string?
>
>    if (!strcmp(attr->name, "triginstatus1") ||
>        !strcmp(attr->name, "triginstatus2") ||
>        !strcmp(attr->name, "triginstatus3"))
>        ...
>
> Thanks,
> Leo

