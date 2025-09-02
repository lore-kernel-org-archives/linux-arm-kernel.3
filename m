Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21301CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 03:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkLicw+foGt31+4JdXLWo90mqh6D3FRA50hbaqtqq28=; b=Y35m2VdcHaC/HaUibskrfQGh0Y
	Ca4V9Zv5Fry0s5W791mZ1XKIW9EGk07AvJn3AyEQG51U4Qu8mg8+1GWuhXgdu4e3dcKWM/v3++MS4
	F5Hqnr1YM7ViOtJUPuRBk4+zG23FkeIpjXvqdDlu9CoGJQILkjxF4yAKE0bX0XJnOIj1Z+rUJMUxq
	QCZQmMenJ0ZU3spXx6uxUebzsClnxqNwaINugZhxwE54am1uOMa7wveZCN9hYQz1ucAnVWfVES5AX
	2qd1MtC8lJCTZ5P4sQ//d9Pd3XROnt+owY8JE9bA9t4Wo41C99vmhu5Db5EHz+Qo55czyiFYaqaNE
	K//1hTgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utHmi-0000000F33b-2ENE;
	Tue, 02 Sep 2025 03:34:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utHjx-0000000F2W0-0mSa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 03:31:26 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822Rob7015191;
	Tue, 2 Sep 2025 03:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rkLicw+foGt31+4JdXLWo90mqh6D3FRA50hbaqtqq28=; b=DEWUmhUqKd9qZK1V
	+e3Ojlnv9C6gxtQkgYc5AnL9V/FMXfy8lHp5S+iy+yX5B4rPPDtKoRT+9DcdH2Tg
	Su1mbg3Y02pV38M/LTPpj1BABj/1e11w4CZFGZ66foPTx70T88Fv81K0OJI39/Uk
	V0KVjOjG9Wt7zjgqqvgCgvTzcBSWhRaltoVqZGW40ee+jdYMiiQPXwSg+YdqPZrW
	/1VT1P/hBA2InAJ8oKjLASxDCeQoDgCH0c+r5KY3Z8F1tjB/5ylW/3kU+xXZs2Mp
	ukMDNwIQgEvXZlhmxedS8Wtg2Qy2HoCKofXgOEI1swixNXTRQR6hKofEKE+HaMbF
	MPRQiA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyxca8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 03:31:10 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5823V9dp004701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Sep 2025 03:31:09 GMT
Received: from [10.233.71.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 1 Sep
 2025 20:30:28 -0700
Message-ID: <8eb373a0-0d73-4555-9e64-a62245727d56@quicinc.com>
Date: Tue, 2 Sep 2025 11:30:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Fix NULL pointer access issue
To: James Clark <james.clark@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <jinlong.mao@oss.qualcomm.com>,
        <tingwei.zhang@oss.qualcomm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        "Joey Gouly" <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
References: <20250901-etm_crash-v1-1-ce65e44c137c@oss.qualcomm.com>
 <450f11c2-6c11-4ffa-ae20-db4ea419a3ca@linaro.org>
 <863496e4yg.wl-maz@kernel.org>
 <80178c90-b9f3-4e1f-baa5-f54aa89ec927@linaro.org>
 <86y0qycnb8.wl-maz@kernel.org>
 <239f2e3d-1fb5-4d53-869f-aba2d7a6530d@linaro.org>
Content-Language: en-US
From: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
In-Reply-To: <239f2e3d-1fb5-4d53-869f-aba2d7a6530d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IToa63p__ilb4I3CXqNWRXgBkeCIQC5x
X-Proofpoint-ORIG-GUID: IToa63p__ilb4I3CXqNWRXgBkeCIQC5x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX3/0hXenUcHyD
 2us1qEa4kCcr+9k8zKGBY3WxFYiQZX7kFNOomj9J6VfDpF2iiPB6dmrj3lwfQt02+pd5QN75qe0
 /ZsALbFE9PSanlI1PHWcihcv9XLoFilsG4aRB5Cjb9g/6qWWWznp9cKZN7EUoeXsy/QwAtd96UC
 J5DEwXmCKMr0sqpxMKSAC6OC1g2uUi1mOJ781xoaKpmmEbC75AGYp3igd40yQNYfEWhl60+avLP
 OfDtMhPheCkyPXfbwdV3hThhrwrt/rg5asSfQr35vdgCVtvYvKJvizQF7RBmgzzy7GWKwuMsoRF
 iIuEgs51alqSqNHOEGDVkyfvq/jaOE5jazr6N2PYfEhygEpIZb00vd3in9jCSTXWm3h+R0WHkLt
 XIUlXP6K
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b664fe cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=9zBjmbKyw9-5aDrWJ3wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_203125_344549_B2E67346 
X-CRM114-Status: GOOD (  22.48  )
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

Thanks James & Marc
Will upload v2 and move the warning to the end for better readability.

Thanks,
Yingchao
On 9/1/2025 10:16 PM, James Clark wrote:
>
>
> On 01/09/2025 2:30 pm, Marc Zyngier wrote:
>> On Mon, 01 Sep 2025 13:31:23 +0100,
>> James Clark <james.clark@linaro.org> wrote:
>>>
>>>
>>>
>>> On 01/09/2025 1:24 pm, Marc Zyngier wrote:
>>>> On Mon, 01 Sep 2025 11:36:11 +0100,
>>>> James Clark <james.clark@linaro.org> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 01/09/2025 11:01 am, Yingchao Deng wrote:
>>>>>> When linux is booted in EL1, macro "host_data_ptr()" is a wrapper 
>>>>>> that
>>>>>> resolves to "&per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)",
>>>>>> is_hyp_mode_available() return false during kvm_arm_init, the 
>>>>>> per-CPU base
>>>>>> pointer __kvm_nvhe_kvm_arm_hyp_percpu_base[cpu] remains 
>>>>>> uninitialized.
>>>>>> Consequently, any access via per_cpu_ptr_nvhe_sym(kvm_host_data, 
>>>>>> cpu)
>>>>>> will result in a NULL pointer.
>>>>>>
>>>>>> Add is_kvm_arm_initialised() condition check to ensure that 
>>>>>> kvm_arm_init
>>>>>> completes all necessary initialization steps, including 
>>>>>> init_hyp_mode.
>>>>>>
>>>>>> Fixes: 054b88391bbe2 ("KVM: arm64: Support trace filtering for 
>>>>>> guests")
>>>>>> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
>>>>>> ---
>>>>>> Add a check to prevent accessing uninitialized per-CPU data.
>>>>>> ---
>>>>>>     arch/arm64/kvm/debug.c | 7 ++++---
>>>>>>     1 file changed, 4 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
>>>>>> index 
>>>>>> 381382c19fe4741980c79b08bbdab6a1bcd825ad..add58056297293b4eb337028773b1b018ecc9d35 
>>>>>> 100644
>>>>>> --- a/arch/arm64/kvm/debug.c
>>>>>> +++ b/arch/arm64/kvm/debug.c
>>>>>> @@ -233,7 +233,7 @@ void kvm_debug_handle_oslar(struct kvm_vcpu 
>>>>>> *vcpu, u64 val)
>>>>>>     void kvm_enable_trbe(void)
>>>>>>     {
>>>>>>         if (has_vhe() || is_protected_kvm_enabled() ||
>>>>>> -        WARN_ON_ONCE(preemptible()))
>>>>>> +        WARN_ON_ONCE(preemptible()) || !is_kvm_arm_initialised())
>>>>>
>>>>> Hi Yingchao,
>>>>>
>>>>> There shouldn't be a warning for this, at least for the case where
>>>>> it's not initialized and never will be. If you're never going to 
>>>>> run a
>>>>> guest these functions can all skip, the same way for !has_vhe() etc.
>>>>
>>>> It's not a warning. It's a bona-fide crash:
>>>>
>>>> void kvm_enable_trbe(void)
>>>> {
>>>>     if (has_vhe() || is_protected_kvm_enabled() ||
>>>>         WARN_ON_ONCE(preemptible()))
>>>>         return;
>>>>
>>>>     host_data_set_flag(TRBE_ENABLED); <--- Explodes here
>>>> }
>>>>
>>>> So the write of the flag has to be skipped if KVM is available, even
>>>> if KVM is compiled in.
>>>>
>>>>     M.
>>>>
>>>
>>> Yeah. And just in case there is any confusion, I didn't mean that we
>>> should not have the check entirely, just that it shouldn't be in the
>>> WARN_ON_ONCE(). We should put it in the part that makes the functions
>>> silently skip:
>>>
>>>    if (has_vhe() || is_protected_kvm_enabled() ||
>>>        !is_kvm_arm_initialised() ||
>>>        WARN_ON_ONCE(preemptible()))
>>>            return;
>>
>> Which is exactly what the OP wrote, except for swapping the last two
>> terms.
>>
>>     M.
>>
>
> Hah! So it is. Being on the same line as the warning really threw me 
> despite looking at it 10 times.
>
> Not sure if it's just me but I think having the warning at the end or 
> on its own line is more readable.
>
> Either way:
>
> Reviewed-by: James Clark <james.clark@linaro.org>
>
>
>
>

