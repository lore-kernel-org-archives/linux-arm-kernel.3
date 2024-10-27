Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24F1D1356C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 15:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0SVi4wuY31MEA962sDb73MizyKBANV4LsDxIEBcBrY=; b=v3k1QopjZ0Z3ew2dzd1FNvJkST
	E7A3DSE6BkUCaqEWrLhwMnz8JAXB3umyyaQpjL8C4IflwNVnSVC7JhqUevUzITt+Thr/uLwRyFWH8
	ccR9VqTd4zhOpz8JUphPxWzH2I3Wm3G383pTFk90JOwn3fcq5jGbLu14hher+P+3nH78zId/5PD8n
	olFyaHUTR4er/2/eSrTF3dkX8ieoBWaZ+C/HGo65sc9qE+vHRXSFpNxwsvBQA334cCB2E1Zyf1+v5
	wwk0o5p1ARIWBTMl+t/BM/NnBdNp88IO+rfS6af9gJCkETkDbixnNC4QIXCQWpLmuaX4Mw/Dyf6ed
	Jt9ugTAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t55M8-00000008Unf-3vvR;
	Sun, 27 Oct 2024 15:39:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t55KW-00000008Uep-3eqD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 15:37:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49REIi6J020846;
	Sun, 27 Oct 2024 15:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w0SVi4wuY31MEA962sDb73MizyKBANV4LsDxIEBcBrY=; b=l0aKoSdVTsmllT9Q
	Q8E2g2TiRdeN1n2yADEr4Ss1oadNTl/PlF+ITidFlXxXSoB+wk3dNqbky7TU2SJw
	zThsIWSxnYYD36G0gFahxDXl8yfru8kP7ZxG25sSauyGLj7OeAwdd0KPb/7EseU1
	w+Tjoiiu3bsHr4HpiYo5SVd645di8ne41XEdmHBSUSvzF5KciQ5aLCOyNRZE0Bd5
	StHJoXy17QL7YzLfkSdHW/+CvO5Cm2yY5Bt4UXR5vOZGWoaKMAgsTndDiqoqeK1H
	ISGtIE4gNJqa9pquZ0H6cpmS/brSCaMmmlCZyKsCji2FGkVDMI3HWVBtqwEv+b2t
	DxOodg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grguajqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Oct 2024 15:37:02 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49RFb1eC030189
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Oct 2024 15:37:01 GMT
Received: from [10.216.8.251] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 08:36:56 -0700
Message-ID: <6b3d3815-ca7a-470e-993d-862f96249edb@quicinc.com>
Date: Sun, 27 Oct 2024 21:06:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/arm-smmu: Defer probe of clients after smmu
 device bound
To: Robin Murphy <robin.murphy@arm.com>, <will@kernel.org>
CC: <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robdclark@chromium.org>, <quic_c_gdjako@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <quic_charante@quicinc.com>, <stable@vger.kernel.org>,
        Prakash Gupta
	<quic_guptap@quicinc.com>
References: <20241004090428.2035-1-quic_pbrahma@quicinc.com>
 <d4a52579-0e2a-4df3-a1fa-e8e154ff1e90@quicinc.com>
 <3925d2f0-3b1f-4200-acc4-8f991616ec0f@arm.com>
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <3925d2f0-3b1f-4200-acc4-8f991616ec0f@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jm-iVN1pNVfu1vBKJI6TSGdOIwF8CGpr
X-Proofpoint-GUID: jm-iVN1pNVfu1vBKJI6TSGdOIwF8CGpr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410270136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_083725_080572_F76D3E24 
X-CRM114-Status: GOOD (  18.84  )
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


On 10/17/2024 7:24 PM, Robin Murphy wrote:
> On 15/10/2024 2:31 pm, Pratyush Brahma wrote:
>>
>> On 10/4/2024 2:34 PM, Pratyush Brahma wrote:
>>> Null pointer dereference occurs due to a race between smmu
>>> driver probe and client driver probe, when of_dma_configure()
>>> for client is called after the iommu_device_register() for smmu driver
>>> probe has executed but before the driver_bound() for smmu driver
>>> has been called.
>>>
>>> Following is how the race occurs:
>>>
>>> T1:Smmu device probe        T2: Client device probe
>>>
>>> really_probe()
>>> arm_smmu_device_probe()
>>> iommu_device_register()
>>>                     really_probe()
>>>                     platform_dma_configure()
>>>                     of_dma_configure()
>>>                     of_dma_configure_id()
>>>                     of_iommu_configure()
>>>                     iommu_probe_device()
>>>                     iommu_init_device()
>>>                     arm_smmu_probe_device()
>>>                     arm_smmu_get_by_fwnode()
>>>                         driver_find_device_by_fwnode()
>>>                         driver_find_device()
>>>                         next_device()
>>>                         klist_next()
>>>                             /* null ptr
>>>                                assigned to smmu */
>>>                     /* null ptr dereference
>>>                        while smmu->streamid_mask */
>>> driver_bound()
>>>     klist_add_tail()
>>>
>>> When this null smmu pointer is dereferenced later in
>>> arm_smmu_probe_device, the device crashes.
>>>
>>> Fix this by deferring the probe of the client device
>>> until the smmu device has bound to the arm smmu driver.
>>>
>>> Fixes: 021bb8420d44 ("iommu/arm-smmu: Wire up generic configuration 
>>> support")
>>> Cc: stable@vger.kernel.org
>>> Co-developed-by: Prakash Gupta <quic_guptap@quicinc.com>
>>> Signed-off-by: Prakash Gupta <quic_guptap@quicinc.com>
>>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
>>> ---
>>> Changes in v2:
>>>   Fix kernel test robot warning
>>>   Add stable kernel list in cc
>>>   Link to v1: 
>>> https://lore.kernel.org/all/20241001055633.21062-1-quic_pbrahma@quicinc.com/
>>>
>>>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c 
>>> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> index 723273440c21..7c778b7eb8c8 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> @@ -1437,6 +1437,9 @@ static struct iommu_device 
>>> *arm_smmu_probe_device(struct device *dev)
>>>               goto out_free;
>>>       } else {
>>>           smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
>>> +        if (!smmu)
>>> +            return ERR_PTR(dev_err_probe(dev, -EPROBE_DEFER,
>>> +                        "smmu dev has not bound yet\n"));
>>>       }
>>>       ret = -EINVAL;
>>
>>
>> Hi
>> Can someone please review this patch? Let me know if any further 
>> information is required.
>
> This really shouldn't be leaking into drivers... :(
>
> Honestly, I'm now so fed up of piling on hacks around the fundamental 
> mis-design here, I think it's finally time to blow everything else off 
> and spend a few days figuring out the most expedient way to fix it 
> properly once and for all. Watch this space...
>
> Thanks,
> Robin.

Hi Robin

Do you have any approaches in mind that you are currently considering or 
exploring?

Thanks
Pratyush

