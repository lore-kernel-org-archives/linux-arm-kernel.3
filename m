Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA9AC28B31
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 15:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfWLYP57gVsIyTQR+W3aALSmFfgRt/y1vRXHXiE9DW4=; b=t48ewjBqO39rak2GBwcMsFDFfA
	CVxfmFXc5S20UTlhOAgtP2SAJ7VkOKmes/1SRpBSMQ8A/2MocX85MV55ZDBHr3phcg9gqteO2p5+5
	ECjZOw2lluXoiBOMehW2FuOgo008j0K9YgxJiSKx1uuksf7MJWfL5Pp67meKweaGoxMpJCKz0+ZRV
	L5Uj6GKwqKHvx71C6QQ1EcIG4ejvBDGUu4OZe+0YVLCYagfx48uJCRzxVu/OqMxCwie0dI38uZxzr
	cv/JrcQruwEZYed8kTuCW7nHlC+Bn5LrRa0XXMVrWAkgdV6mR+jaKXpuSfZL74WgsUJVtNZ9Q9l2V
	GnrVaPkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqHg-00000008SSf-1LXm;
	Wed, 05 Mar 2025 15:03:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpon9-00000008Brb-0Wf4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 13:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XfWLYP57gVsIyTQR+W3aALSmFfgRt/y1vRXHXiE9DW4=; b=pDKL5OoIQ4xEGYuxMutY66bgd/
	PDVwyEGVtdKJwAcgHbPr7d8kXGVBGYOZfnC+w3SWpg9eRC96exa08a4Au+XQWAb4wLQm9nuNffjkf
	NJPc4MkvQG/PSKQR7R/NLoWA0H+D1PtG64RY61XEOJNx0QRrKiCDWGnWnR/lur1i90PLCd/Mf25N6
	MCywpTCo8DEgHDFQsBI68auDnEOqktJd5HyrTtv20kZDQqD/Bv/+V8kSUIkzluPRJwj4cVVcBQSqc
	v7iQe1ptLCkxVG8nCPRyW5+QiUyj4BOcVo/vqSuAP8DQZTJUew6hNvlBKDGoVeY4ZZKCw9V0FV5Jc
	/A6rk8Qw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpon5-00000000YBJ-3yVx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 13:28:06 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525B19UP028088;
	Wed, 5 Mar 2025 13:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XfWLYP57gVsIyTQR+W3aALSmFfgRt/y1vRXHXiE9DW4=; b=J9uoP7ECC637HiZl
	QtnRPAUvy4H7tYkShruj8LM9vQoCd4Y5XT+0VIRWJH/LkqCcjbrryFEeKAaf3l3P
	YYcW2iv+5gbBwRaPNbjJ//ejBXxhq+Tu/srjibCuZhchzewrw0ohwKaVhGdbJqXz
	oMBfMcWi8kSs+YRXfBLmHEH17RQ5mLUfyHYC2H2RanCRY7+GukKJLck+iGGSCb3C
	RAF4Duf2SgF/x8KVMQ8IbngmncL9xINwscSXcVy+oxNrVSv2/nWVlFKGzKJhk4GM
	o1Q8P72XCo9aLzWj1EhwgSarJ0SzP0TUWK8jDJdhasFAU4mqQHF6x1PGIqKuz6+s
	2crPqg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6vdc7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 13:27:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525DRQG7002596
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 13:27:26 GMT
Received: from [10.133.33.61] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Mar 2025
 05:27:20 -0800
Message-ID: <7fe6c345-85cf-4114-b419-f50d1a6cbef1@quicinc.com>
Date: Wed, 5 Mar 2025 21:27:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 02/10] Coresight: Add trace_id function to retrieving
 the trace ID
To: Mike Leach <mike.leach@linaro.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark
	<james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-3-quic_jiegan@quicinc.com>
 <CAJ9a7VgGp4YqzN-yx0x+NiZG8now6SCmnimaou2Z=exYcoiegw@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <CAJ9a7VgGp4YqzN-yx0x+NiZG8now6SCmnimaou2Z=exYcoiegw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZX3-QF7poviCcbiF4XHdi-8RCpyBDC1H
X-Authority-Analysis: v=2.4 cv=bPnsIO+Z c=1 sm=1 tr=0 ts=67c85153 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=LpQP-O61AAAA:8
 a=_YhmHaDjSWNydp913SEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: ZX3-QF7poviCcbiF4XHdi-8RCpyBDC1H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_05,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_132804_345081_55134BE0 
X-CRM114-Status: GOOD (  22.40  )
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



On 3/5/2025 7:07 PM, Mike Leach wrote:
> Hi,
> 
> On Mon, 3 Mar 2025 at 03:30, Jie Gan <quic_jiegan@quicinc.com> wrote:
>>
>> Add 'trace_id' function pointer in coresight_ops. It's responsible for retrieving
>> the device's trace ID.
>>
>> Co-developed-by: James Clark <james.clark@linaro.org>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c  | 30 +++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-dummy.c | 13 +++++++-
>>   .../coresight/coresight-etm3x-core.c          |  1 +
>>   .../coresight/coresight-etm4x-core.c          |  1 +
>>   drivers/hwtracing/coresight/coresight-stm.c   | 11 +++++++
>>   drivers/hwtracing/coresight/coresight-tpda.c  | 11 +++++++
>>   include/linux/coresight.h                     |  5 ++++
>>   7 files changed, 71 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
>> index ab55e10d4b79..32aa07f4f8c1 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -24,6 +24,7 @@
>>   #include "coresight-etm-perf.h"
>>   #include "coresight-priv.h"
>>   #include "coresight-syscfg.h"
>> +#include "coresight-trace-id.h"
>>
>>   /*
>>    * Mutex used to lock all sysfs enable and disable actions and loading and
>> @@ -1557,6 +1558,35 @@ void coresight_remove_driver(struct amba_driver *amba_drv,
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_remove_driver);
>>
>> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
>> +                              struct coresight_device *sink)
>> +{
>> +       int trace_id;
>> +       int cpu = source_ops(csdev)->cpu_id(csdev);
>> +
> 
> This is a global funciton so need to check that this csdev is a
> source,. and does provide a cpu  function before calling it.
> 

Hi Mike,

I put this function here because it's required by etm3x and etm4x. It's 
intended to be called only by ETM devices, which are definitely source 
devices and have a cpu function.

Jie

>> +       switch (mode) {
>> +       case CS_MODE_SYSFS:
>> +               trace_id = coresight_trace_id_get_cpu_id(cpu);
>> +               break;
>> +       case CS_MODE_PERF:
>> +               if (WARN_ON(!sink))
>> +                       return -EINVAL;
>> +
>> +               trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
>> +               break;
>> +       default:
>> +               trace_id = -EINVAL;
>> +               break;
>> +       }
>> +
>> +       if (!IS_VALID_CS_TRACE_ID(trace_id))
>> +               dev_err(&csdev->dev,
>> +                       "Failed to allocate trace ID on CPU%d\n", cpu);
>> +
>> +       return trace_id;
>> +}
>> +EXPORT_SYMBOL_GPL(coresight_etm_get_trace_id);
>> +
>>   MODULE_LICENSE("GPL v2");
>>   MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
>>   MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
>> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
>> index 9be53be8964b..b5692ba358c1 100644
>> --- a/drivers/hwtracing/coresight/coresight-dummy.c
>> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
>> @@ -41,6 +41,16 @@ static void dummy_source_disable(struct coresight_device *csdev,
>>          dev_dbg(csdev->dev.parent, "Dummy source disabled\n");
>>   }
>>
>> +static int dummy_source_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
>> +                                __maybe_unused struct coresight_device *sink)
>> +{
>> +       struct dummy_drvdata *drvdata;
>> +
>> +       drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +       return drvdata->traceid;
>> +}
>> +
>>   static int dummy_sink_enable(struct coresight_device *csdev, enum cs_mode mode,
>>                                  void *data)
>>   {
>> @@ -62,7 +72,8 @@ static const struct coresight_ops_source dummy_source_ops = {
>>   };
>>
>>   static const struct coresight_ops dummy_source_cs_ops = {
>> -       .source_ops = &dummy_source_ops,
>> +       .trace_id       = dummy_source_trace_id,
>> +       .source_ops     = &dummy_source_ops,
>>   };
>>
>>   static const struct coresight_ops_sink dummy_sink_ops = {
>> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> index c103f4c70f5d..c1dda4bc4a2f 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> @@ -704,6 +704,7 @@ static const struct coresight_ops_source etm_source_ops = {
>>   };
>>
>>   static const struct coresight_ops etm_cs_ops = {
>> +       .trace_id       = coresight_etm_get_trace_id,
>>          .source_ops     = &etm_source_ops,
>>   };
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index 2c1a60577728..cfd116b87460 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -1067,6 +1067,7 @@ static const struct coresight_ops_source etm4_source_ops = {
>>   };
>>
>>   static const struct coresight_ops etm4_cs_ops = {
>> +       .trace_id       = coresight_etm_get_trace_id,
>>          .source_ops     = &etm4_source_ops,
>>   };
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
>> index b581a30a1cd9..aca25b5e3be2 100644
>> --- a/drivers/hwtracing/coresight/coresight-stm.c
>> +++ b/drivers/hwtracing/coresight/coresight-stm.c
>> @@ -281,12 +281,23 @@ static void stm_disable(struct coresight_device *csdev,
>>          }
>>   }
>>
>> +static int stm_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
>> +                       __maybe_unused struct coresight_device *sink)
>> +{
>> +       struct stm_drvdata *drvdata;
>> +
>> +       drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +       return drvdata->traceid;
>> +}
>> +
>>   static const struct coresight_ops_source stm_source_ops = {
>>          .enable         = stm_enable,
>>          .disable        = stm_disable,
>>   };
>>
>>   static const struct coresight_ops stm_cs_ops = {
>> +       .trace_id       = stm_trace_id,
>>          .source_ops     = &stm_source_ops,
>>   };
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
>> index 573da8427428..94c2201fc8d3 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -241,12 +241,23 @@ static void tpda_disable(struct coresight_device *csdev,
>>          dev_dbg(drvdata->dev, "TPDA inport %d disabled\n", in->dest_port);
>>   }
>>
>> +static int tpda_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
>> +                        __maybe_unused struct coresight_device *sink)
>> +{
>> +       struct tpda_drvdata *drvdata;
>> +
>> +       drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +       return drvdata->atid;
>> +}
>> +
>>   static const struct coresight_ops_link tpda_link_ops = {
>>          .enable         = tpda_enable,
>>          .disable        = tpda_disable,
>>   };
>>
>>   static const struct coresight_ops tpda_cs_ops = {
>> +       .trace_id       = tpda_trace_id,
>>          .link_ops       = &tpda_link_ops,
>>   };
>>
>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>> index c7cd5886c908..ce9a5e71b261 100644
>> --- a/include/linux/coresight.h
>> +++ b/include/linux/coresight.h
>> @@ -335,6 +335,7 @@ enum cs_mode {
>>          CS_MODE_PERF,
>>   };
>>
>> +#define coresight_ops(csdev)   csdev->ops
>>   #define source_ops(csdev)      csdev->ops->source_ops
>>   #define sink_ops(csdev)                csdev->ops->sink_ops
>>   #define link_ops(csdev)                csdev->ops->link_ops
>> @@ -421,6 +422,8 @@ struct coresight_ops_panic {
>>   };
>>
>>   struct coresight_ops {
>> +       int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
>> +                       struct coresight_device *sink);
>>          const struct coresight_ops_sink *sink_ops;
>>          const struct coresight_ops_link *link_ops;
>>          const struct coresight_ops_source *source_ops;
>> @@ -709,4 +712,6 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
>>
>>   void coresight_remove_driver(struct amba_driver *amba_drv,
>>                               struct platform_driver *pdev_drv);
>> +int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
>> +                              struct coresight_device *sink);
>>   #endif         /* _LINUX_COREISGHT_H */
>> --
>> 2.34.1
>>
> 
> 


