Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E0FC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 03:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6I9aT70ThpCc4Zm1RlBMipp1lBbPvY+r5gRPRkVScQ=; b=GZ29qMdo/SLXrnGOvY739hdwyY
	UxTDqN3+ToeCDMjJSfm6XNF/CMd32gatJXyM2gwcAX74hOfxD7YS8M4FA+zoEvRcvG94JDjRTQLPe
	IMdBkKm8Q1efqMonQwCNCs/TlqPS31XK+pLMiK3QS6SPFq1bMeFyxbp1d07omPmuo7JY7kPnGNzuv
	bMG2Q2DXTQREu4VhK8zh4Kz/cc28bnPMo//ok1kbk6FGYoW32XlygoPdZTsGHbGD4on41fxyEvGTg
	pSpQVqkgKUhYVOPPLSJkwEewalwfxio3uIvSI1vsWFvXY2YLXU5FnvzjqEUenIU7MEXM5yHYCQPWP
	cSt+LYOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMIHK-00000009a7F-0OWk;
	Tue, 03 Jun 2025 03:25:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMIF8-00000009Zz2-3REa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 03:23:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJp0J030985;
	Tue, 3 Jun 2025 03:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B6I9aT70ThpCc4Zm1RlBMipp1lBbPvY+r5gRPRkVScQ=; b=B3hhedS/CcDX82iD
	e2s36lpftIWnhrU1i8zqdexrzpdkRGoUiLrJ4Gz1OTNJodqoEF41SM6RQETSia1u
	hJ5oMJi1lz/uODyY5Vw2eK27wanW0nr0ASonfWKBQ8UUpxXyjugz34Uq4zRkrvQS
	UPJtbjVxa/L4U+7W7MvO2XMRI+pfbjRUseVeyPeLI73GMWl6KeOGXW3PfV83+8XB
	IQ28tD0qCEEmBjcmnZwU+imWKu/nLNoYjAZhg7S437y2eSymSzTj+w9EbkyfvBz4
	tZzSBsJQeCD/4kwtJ2B8FoORDamx2M9sihdq5aKa4UHiFO8oI55NY+VfDYpshPaL
	OgERTw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ts56v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 03:23:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5533N4EI001090
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Jun 2025 03:23:04 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Jun 2025
 20:23:00 -0700
Message-ID: <eb7dbabf-d878-468b-9945-36d8b14a4e65@quicinc.com>
Date: Tue, 3 Jun 2025 11:22:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
CC: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com>
 <20250522-trace-noc-v6-2-f5a9bcae90ee@quicinc.com>
 <3a19197d-b534-458c-b4d7-51fd9d2c954d@arm.com>
 <40599afc-4342-467c-87d8-3f53cbcfd242@quicinc.com>
 <20250523085655.GD2566836@e132581.arm.com>
 <4d54e620-abb9-4a36-bab0-3970c7e30a5f@arm.com>
 <62d1e4cb-cc13-4333-a160-66a280dca5f6@quicinc.com>
 <17abf8b5-8a2e-4573-a870-e2f98ad866a6@arm.com>
 <20250530125944.GB666854@e132581.arm.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20250530125944.GB666854@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zxbsBjZotBgpF1CDtEDMk5fOTP9tTSlt
X-Authority-Analysis: v=2.4 cv=Qspe3Uyd c=1 sm=1 tr=0 ts=683e6a99 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=roaXpTnMcXxoyfGzR8sA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAyOCBTYWx0ZWRfXxwg1tayofc/q
 3S7cFoWgTyC39NeeXOlsLXf9mWyGBQyI6YyVe14X9Fr/+5/hqT9COz4ZinJ9VIiHVnyqfqtitQk
 Z+udSGq2OIr19MRHXRm6IJL9V2f4nFDW6dnHZSwsVExW8yOpcV+ynL0YaF77/HhcIYfj17hkdtS
 7azvHwhWvBOnN9qUNRClLbEvZStx5ef7jTl0eEABNvE4clIAdovDNNB2VtW4qtQFkX/HacYxA8V
 wrKc8x5+5LIIpyAkVsbwMAch29yJjcOJx0fSWuAAcmmmefniPTX6FLzcPAMPKZj+/EInWnqtqTo
 4OHvhcMZOxE5cZG/qaubsGPc7wEAmTgl/wAsMAvpBe8xNcz+XZftoUjtrA0ow+kDMnwxXwXQVY0
 2/ASQhbEaoPzxEBq5s+zrZwG5r9vYKDJxOuqmcIzgj8LUpslHheD/uLXLO4s5rkvS/PGkzK/
X-Proofpoint-ORIG-GUID: zxbsBjZotBgpF1CDtEDMk5fOTP9tTSlt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_08,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_202315_078149_0A56715C 
X-CRM114-Status: GOOD (  22.95  )
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



On 5/30/2025 8:59 PM, Leo Yan wrote:
> On Fri, May 30, 2025 at 12:32:23PM +0100, Suzuki Kuruppassery Poulose wrote:
> 
> [...]
> 
>>>> 2) How does the source driver know the TraceID for exposing via sysfs ?
>>>> Does it expose its own traceid ?
>>> No, sources connecting to TNOC don't have their own traceid, it expose the ATID which allocated in TNOC.
>>> TNOC will maintain the ID in coresight_path:: trace_id, when enable source, the source can get it from path.
>>>
>>> Here is the patch to expose id in source:
>>> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250530-showtraceid-v1-1-2761352cf7b4@quicinc.com/
>>
>> Please don't do that. We don't have to fake a traceid for all sources.
>> It is only of use to the decoder, with manual input from the user. So,
>> someone using the TNOC based system must be aware of how to collect the
>> traceid and as such expose it from the TNOC and not all the other
>> sources connected to it.
>>
>> Simply expose it on the TNOC device node
> 
> [...]
> 
>>>> Good question, since we have the "path" maintaining the TraceID, we
>>>> should use that here for the TNOC. But the other question is, can there be multiple sources connected to a single TNOC ? (I am guessing, yes!. And thus it may not work with what you are proposing.
>>>>
>>> yes, there can be multiple sources connected to one TNOC, and these sources share one Trace ID which allocate in TNOC.
>>> To decode the scenario relay on TraceID + Inport number, TraceID identifies the TNOC, the decoder maintains a table that maps each TNOC inport to its corresponding source.
> 
> If the Trace ID is only used to identify a TNOC, I am just wandering
> if can use self-contained method.
> 
> For example, you can generate a ID number based on the register base
> address, something like:
> 
>    /* TNOC physical address */
>    drvdata->paddr = res->start;
> 
>    if (IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
>        drvdata->atid = (drvdata->paddr >> 32) ^ (drvdata->paddr & 0xffffffffUL);
>    else
>        drvdata->atid = drvdata->paddr;
> 
> Then, you can get a unique ID for each TNOC in the system, and the
> ID is determined by the pyshical address and can be calculated
> directly by decoder.
> 
> Leo

Using both dynamic and self-contained IDs within the same system can result in ID conflicts, which may cause decoding failures.

