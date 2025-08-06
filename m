Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D04C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 07:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/GtAIYDD5rcGDyR+usmHd7mDChZFA080DV7cCwDjF0=; b=am2Aeb6t/zkG6/MFEPEjxgAGEr
	IHiISKK9AumgsfY7H/GqJ4ZSFGwJyfjJ5KSJRuPc1zmoJjnflNFxsAdVTWKt+jcVQStecd3aiY9XT
	WHQX+YaVeBoiHI/zNbO7rOXC4pXXjexXvElaLnGR+CPxhPOMDJh/WuCgQEwFnBVDyi40PMw2tUxLd
	CN389+Ej0SMMH8GfOdzK9u5lvxranVCYbjRqgyBctuKnhX5+B2CibG+4lf/6I6Y6xcv18vXNvrid2
	9z4AlHLImiTEVYxeKaJPPJfRLQ2t1u041382e08zpr9L3NX1OPGZ5+ZAlBYJSRK3s5NxlNmKGc4vD
	PYJs4MEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYV7-0000000EVIq-2MF7;
	Wed, 06 Aug 2025 07:23:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYKl-0000000EUGl-0bNS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 07:13:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5766Eoie022908;
	Wed, 6 Aug 2025 07:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/GtAIYDD5rcGDyR+usmHd7mDChZFA080DV7cCwDjF0=; b=DNUz+dekanb0A2WD
	DSjaD92lL7OSoHRl/1jeI/MRO9QPvZN1NF3YySjOwpne5MeTynWCYzw2BizAKtCQ
	qouR7OP0dzsLsHLiuzSSxqAsDHewou4j8Ho2CGtmkptKRbNCALA1WyVT7ONFZXU5
	UmTgX6Tj77mW4vuIEmmvkBLFVp6Q5tJx/dcHHNBhoCsG6IsxDo9pvEYlX8d6/iar
	nQJoL+QD1OXk76nFOD6ww3bWo7ZMYTUQ5BsJjjhPg3DVZUCbDvb9SP1+4ctkGIgr
	CYdzthafoVCNNGMTWjWfcy9zJhKD2w6tdXxzlejG4G2PuwYxSLqgP0bwwbHuVQut
	tvfp/g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpya9q5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 07:13:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5767D3c0013945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Aug 2025 07:13:03 GMT
Received: from [10.133.33.160] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 6 Aug
 2025 00:12:59 -0700
Message-ID: <14aa800f-9585-41ee-bd51-81457045d893@quicinc.com>
Date: Wed, 6 Aug 2025 15:12:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] coresight: Add label sysfs node support
To: Mike Leach <mike.leach@linaro.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark
	<james.clark@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad
 Dybcio <konradybcio@kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20250717125343.3820505-1-quic_jinlmao@quicinc.com>
 <20250717125343.3820505-3-quic_jinlmao@quicinc.com>
 <CAJ9a7ViD6MqOrtBp6LYnEg-rs6x0c9HuGfy4pWHG1iW67OdT=g@mail.gmail.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <CAJ9a7ViD6MqOrtBp6LYnEg-rs6x0c9HuGfy4pWHG1iW67OdT=g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: l7HlQcKL_uC_Z9_8b372g9n8lqMYiYy8
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=68930080 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=7CQSdrXTAAAA:8 a=Q327Jk2ll2QABhRSXNsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX2rUnxsR65sR4
 YmCPEtVamJ2qV+8s5L1z76v4KdfADmUX2LCg8TBwOIGfFqvcz2WNhCTZdRtWQJ6Vd8910ficbZX
 /qnzb8pWzyMPqtTNuqtBSUQpATHTSD6uJP4cfc/nDX1KafCf/2xMmPi2StYi/1skBt80RvATt2n
 xtK2zpbvDjWU5tKGgOF5GvIJxDlgZgi1DPB6TxJ+BtXbFhvTgRPGWGAMijZ92c9d2jLhVAY4G1H
 OUM3kzag9lKyJCby0in+Mu12/UNCQW05Sz2RlLC99hJRm0fBskFm/xlyekcXWFaczKLle91tmIG
 /XqYhvGNsYgyGIJwR6MHqZRFKZB+l+yFjM0S/OUf4AP4xAgRkBC6wnF3PDCU+/FUdGaZ6fNy5h3
 fM+2FTx6
X-Proofpoint-GUID: l7HlQcKL_uC_Z9_8b372g9n8lqMYiYy8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_001311_193851_2AFE8E33 
X-CRM114-Status: GOOD (  21.88  )
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



On 8/5/2025 7:43 PM, Mike Leach wrote:
> Hi
> 
> On Thu, 17 Jul 2025 at 13:54, Mao Jinlong <quic_jinlmao@quicinc.com> wrote:
>>
>> For some coresight components like CTI and TPDM, there could be
>> numerous of them. From the node name, we can only get the type and
>> register address of the component. We can't identify the HW or the
>> system the component belongs to. Add label sysfs node support for
>> showing the intuitive name of the device.
>>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> ---
>>   .../testing/sysfs-bus-coresight-devices-cti   |  6 ++
>>   .../sysfs-bus-coresight-devices-dummy-source  |  6 ++
>>   .../testing/sysfs-bus-coresight-devices-etb10 |  6 ++
>>   .../testing/sysfs-bus-coresight-devices-etm3x |  6 ++
>>   .../testing/sysfs-bus-coresight-devices-etm4x |  6 ++
>>   .../sysfs-bus-coresight-devices-funnel        |  6 ++
>>   .../testing/sysfs-bus-coresight-devices-stm   |  6 ++
>>   .../testing/sysfs-bus-coresight-devices-tmc   |  6 ++
>>   .../testing/sysfs-bus-coresight-devices-tpdm  |  6 ++
>>   .../testing/sysfs-bus-coresight-devices-trbe  |  6 ++
>>   drivers/hwtracing/coresight/coresight-sysfs.c | 71 ++++++++++++++++++-
>>   11 files changed, 129 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
>> index a97b70f588da..55367bbc696f 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
>> @@ -239,3 +239,9 @@ Date:               March 2020
>>   KernelVersion: 5.7
>>   Contact:       Mike Leach or Mathieu Poirier
>>   Description:   (Write) Clear all channel / trigger programming.
>> +
>> +What:           /sys/bus/coresight/devices/<cti-name>/label
>> +Date:           Jul 2025
>> +KernelVersion   6.17
>> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>> +Description:    (Read) Show hardware context information of device.
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source b/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
>> index 0830661ef656..9a11bd5b15cc 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
>> @@ -13,3 +13,9 @@ KernelVersion:        6.14
>>   Contact:       Mao Jinlong <quic_jinlmao@quicinc.com>
>>   Description:   (R) Show the trace ID that will appear in the trace stream
>>                  coming from this trace entity.
>> +
>> +What:           /sys/bus/coresight/devices/dummy_source<N>/label
>> +Date:           Jul 2025
>> +KernelVersion   6.17
>> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>> +Description:    (Read) Show hardware context information of device.
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etb10 b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etb10
>> index 9a383f6a74eb..ff1f89795188 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etb10
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etb10
>> @@ -19,6 +19,12 @@ Description: (RW) Disables write access to the Trace RAM by stopping the
>>                  into the Trace RAM following the trigger event is equal to the
>>                  value stored in this register+1 (from ARM ETB-TRM).
>>
>> +What:           /sys/bus/coresight/devices/<memory_map>.etb/label
>> +Date:           Jul 2025
>> +KernelVersion   6.17
>> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>> +Description:    (Read) Show hardware context information of device.
>> +
>>   What:          /sys/bus/coresight/devices/<memory_map>.etb/mgmt/rdp
>>   Date:          March 2016
>>   KernelVersion: 4.7
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
>> index 271b57c571aa..743f26619c69 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
>> @@ -251,6 +251,12 @@ KernelVersion:     4.4
>>   Contact:       Mathieu Poirier <mathieu.poirier@linaro.org>
>>   Description:   (RO) Holds the cpu number this tracer is affined to.
>>
>> +What:           /sys/bus/coresight/devices/<memory_map>.[etm|ptm]/label
>> +Date:           Jul 2025
>> +KernelVersion   6.17
>> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>> +Description:    (Read) Show hardware context information of device.
>> +
>>   What:          /sys/bus/coresight/devices/<memory_map>.[etm|ptm]/mgmt/etmccr
>>   Date:          September 2015
>>   KernelVersion: 4.4
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
>> index a0425d70d009..e6a584a4b040 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
>> @@ -329,6 +329,12 @@ Contact:   Mathieu Poirier <mathieu.poirier@linaro.org>
>>   Description:   (RW) Access the selected single show PE comparator control
>>                  register.
>>
>> +What:           /sys/bus/coresight/devices/etm<N>/label
>> +Date:           Jul 2025
>> +KernelVersion   6.17
>> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>> +Description:    (Read) Show hardware context information of device.
>> +
>>   What:          /sys/bus/coresight/devices/etm<N>/mgmt/trcoslsr
>>   Date:          April 2015
>>   KernelVersion: 4.01
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
>> index d75acda5e1b3..5578fa5f6f02 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
>> @@ -10,3 +10,9 @@ Date:         November 2014
>>   KernelVersion: 3.19
>>   Contact:       Mathieu Poirier <mathieu.poirier@linaro.org>
>>   Description:   (RW) Defines input port priority order.
>> +
>> +What:           /sys/bus/coresight/devices/<memory_map>.funnel/label
>> +Date:           Jul 2025
>> +KernelVersion   6.17
>> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>> +Description:    (Read) Show hardware context information of device.
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-stm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
>> index 53e1f4815d64..c3a81978e30b 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
>> @@ -51,3 +51,9 @@ KernelVersion:        4.7
>>   Contact:       Mathieu Poirier <mathieu.poirier@linaro.org>
>>   Description:   (RW) Holds the trace ID that will appear in the trace stream
>>                  coming from this trace entity.
>> +
>> +What:           /sys/bus/coresight/devices/<memory_map>.stm/label
>> +Date:           Jul 2025
>> +KernelVersion   6.17
>> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>> +Description:    (Read) Show hardware context information of device.
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tmc b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tmc
>> index 339cec3b2f1a..9554f4f453a3 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tmc
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tmc
>> @@ -107,3 +107,9 @@ Contact:    Anshuman Khandual <anshuman.khandual@arm.com>
>>   Description:   (RW) Current Coresight TMC-ETR buffer mode selected. But user could
>>                  only provide a mode which is supported for a given ETR device. This
>>                  file is available only for TMC ETR devices.
>> +
>> +What:           /sys/bus/coresight/devices/<memory_map>.tmc/label
>> +Date:           Jul 2025
>> +KernelVersion   6.17
>> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>> +Description:    (Read) Show hardware context information of device.
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
>> index a341b08ae70b..e6d935e83042 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
>> @@ -272,3 +272,9 @@ KernelVersion       6.15
>>   Contact:       Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
>>   Description:
>>                  (RW) Set/Get the enablement of the individual lane.
>> +
>> +What:           /sys/bus/coresight/devices/<tpdm-name>/label
>> +Date:           Jul 2025
>> +KernelVersion   6.17
>> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>> +Description:    (Read) Show hardware context information of device.
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-trbe b/Documentation/ABI/testing/sysfs-bus-coresight-devices-trbe
>> index ad3bbc6fa751..2a5868ba3d6b 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-trbe
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-trbe
>> @@ -12,3 +12,9 @@ Contact:      Anshuman Khandual <anshuman.khandual@arm.com>
>>   Description:   (Read) Shows if TRBE updates in the memory are with access
>>                  and dirty flag updates as well. This value is fetched from
>>                  the TRBIDR register.
>> +
>> +What:           /sys/bus/coresight/devices/trbe<cpu>/label
>> +Date:           Jul 2025
>> +KernelVersion   6.17
>> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>> +Description:    (Read) Show hardware context information of device.
>> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
>> index feadaf065b53..f7a0c9056854 100644
>> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
>> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
>> @@ -7,6 +7,7 @@
>>   #include <linux/device.h>
>>   #include <linux/idr.h>
>>   #include <linux/kernel.h>
>> +#include <linux/property.h>
>>
>>   #include "coresight-priv.h"
>>   #include "coresight-trace-id.h"
>> @@ -371,17 +372,81 @@ static ssize_t enable_source_store(struct device *dev,
>>   }
>>   static DEVICE_ATTR_RW(enable_source);
>>
>> +static ssize_t label_show(struct device *dev,
>> +               struct device_attribute *attr, char *buf)
>> +{
>> +
>> +       const char *str;
>> +       int ret;
>> +
>> +       ret = fwnode_property_read_string(dev_fwnode(dev), "label", &str);
>> +       if (ret == 0)
>> +               return scnprintf(buf, PAGE_SIZE, "%s\n", str);
> 
> sysfs_emit() here.

I will update it.

> 
>> +       else
>> +               return ret;
>> +}
>> +static DEVICE_ATTR_RO(label);
>> +
>> +static umode_t label_is_visible(struct kobject *kobj,
>> +                                  struct attribute *attr, int n)
>> +{
>> +       struct device *dev = kobj_to_dev(kobj);
>> +
>> +       if (attr == &dev_attr_label.attr) {
>> +               if (fwnode_property_present(dev_fwnode(dev), "label"))
>> +                       return attr->mode;
>> +               else
>> +                       return 0;
>> +       }
>> +
>> +       return attr->mode;
>> +}
>> +
>>   static struct attribute *coresight_sink_attrs[] = {
>>          &dev_attr_enable_sink.attr,
>> +       &dev_attr_label.attr,
>>          NULL,
>>   };
>> -ATTRIBUTE_GROUPS(coresight_sink);
>> +
>> +static struct attribute_group coresight_sink_group = {
>> +       .attrs = coresight_sink_attrs,
>> +       .is_visible = label_is_visible,
>> +};
>> +__ATTRIBUTE_GROUPS(coresight_sink);
>>
>>   static struct attribute *coresight_source_attrs[] = {
>>          &dev_attr_enable_source.attr,
>> +       &dev_attr_label.attr,
>>          NULL,
>>   };
>> -ATTRIBUTE_GROUPS(coresight_source);
>> +
>> +static struct attribute_group coresight_source_group = {
>> +       .attrs = coresight_source_attrs,
>> +       .is_visible = label_is_visible,
>> +};
>> +__ATTRIBUTE_GROUPS(coresight_source);
>> +
>> +static struct attribute *coresight_link_attrs[] = {
>> +       &dev_attr_label.attr,
>> +       NULL,
>> +};
>> +
>> +static struct attribute_group coresight_link_group = {
>> +       .attrs = coresight_link_attrs,
>> +       .is_visible = label_is_visible,
>> +};
>> +__ATTRIBUTE_GROUPS(coresight_link);
>> +
>> +static struct attribute *coresight_helper_attrs[] = {
>> +       &dev_attr_label.attr,
>> +       NULL,
>> +};
>> +
>> +static struct attribute_group coresight_helper_group = {
>> +       .attrs = coresight_helper_attrs,
>> +       .is_visible = label_is_visible,
>> +};
>> +__ATTRIBUTE_GROUPS(coresight_helper);
>>
>>   const struct device_type coresight_dev_type[] = {
>>          [CORESIGHT_DEV_TYPE_SINK] = {
>> @@ -390,6 +455,7 @@ const struct device_type coresight_dev_type[] = {
>>          },
>>          [CORESIGHT_DEV_TYPE_LINK] = {
>>                  .name = "link",
>> +               .groups = coresight_link_groups,
>>          },
>>          [CORESIGHT_DEV_TYPE_LINKSINK] = {
>>                  .name = "linksink",
>> @@ -401,6 +467,7 @@ const struct device_type coresight_dev_type[] = {
>>          },
>>          [CORESIGHT_DEV_TYPE_HELPER] = {
>>                  .name = "helper",
>> +               .groups = coresight_helper_groups,
>>          }
>>   };
>>   /* Ensure the enum matches the names and groups */
>> --
>> 2.25.1
>>
> 
> with the above change
> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>


