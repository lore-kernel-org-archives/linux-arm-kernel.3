Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43CAC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 05:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQto2qBA8jXrwtuiJVSKz9PIjUMLHZE160LRDZU8eRA=; b=oFJF4vUnMivQ9id+CBTXMsOfbQ
	pyQd3pFLfp/gsQnW1CGyzCKEPnuo2flxtO1hnq7cgWwVPrMXR2QZ+QnDGKiISgHlCYwcvoJD7a1CW
	5ym9lslRLNVfXFl4Mu3kuc/6SlbVj/BMQddMSIuxcH2bo9lpwiosG8x9jAYsfDrpBrbsRTM8cpqNF
	+bHHUcZ3yjqT2XbjQT/cYo2PDOR/axVwWkmg3mjvmv/7CALrcqcNpSs2CdZCwkWW0K45Whe1xBeQb
	2VCa0CDGZolo7g4VCwSpZbSBQFqN8W3AM3VuLheMLxyS1hgx56gj9gMsr4vyXE5yWc/QdY1CzHX2R
	v9sq/tdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkCk-0000000Al9H-1PL2;
	Thu, 10 Jul 2025 05:52:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZk9V-0000000Akod-0qTt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 05:49:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569N0iDs016792;
	Thu, 10 Jul 2025 05:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jQto2qBA8jXrwtuiJVSKz9PIjUMLHZE160LRDZU8eRA=; b=koFhYZ274qCxSu5P
	o1ZZCV3g1fPYGXD08JHt5+DSpbk9W1lotdlbFjk387rAtzJHHlepBALpZnq5Kw4/
	S61T7QcdJi/JPoW00NmcX/zy/P//CzCklk6qswR4GOtgwLGx63+BJRvcszPTv8QW
	MaIUUVmqQX/e2fPTyD7eM4WHF1p3RbN3QwiHug1oT6pbYJLhE0jbFFzOdo4qQc+m
	+7sJf+OtTyZtONU5hNvdiqRiNhDzaCisrlwvsWJiLicB30zDUDtKyRQ/Nr3JsYoL
	ZDBdV0H2hhkoqWwcFEdxXcy8FYd+KIuGfwAVbGY/hFWHrBJTvw9rNzF81YAxpQ1E
	LqtqCg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbnunj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 05:48:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56A5mpQt023075
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 05:48:51 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 9 Jul
 2025 22:48:47 -0700
Message-ID: <a9edc2c8-9486-4b22-ae22-c55d7b4e03e3@quicinc.com>
Date: Thu, 10 Jul 2025 13:48:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Leo Yan
	<leo.yan@arm.com>
References: <20250611-trace-noc-v10-0-a83b5c63da34@quicinc.com>
 <20250611-trace-noc-v10-2-a83b5c63da34@quicinc.com>
 <4e3c8754-1831-45b1-8012-1de9a8759a0e@arm.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <4e3c8754-1831-45b1-8012-1de9a8759a0e@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA0NyBTYWx0ZWRfX/uHNGFdKKUdH
 SkDBnQQOVeu0f6QYOk9UGQUf3FdRXKmTgHA456WAJ3k1GuDlEwNFkxv+qpIp5I1LX2M0EMlJpi7
 X0WwHBZea5kOei6cJ43orMcGjIVBZ6lCFBZJodhFE6NAA18xrMcDFSn+sb38zw/KqESpzhzs3Wt
 YtSRJSmsGXwVEdf9sltiiJ0ymTv/jlJEnYej5yF2KdDUkO+mDi1lyqDXmggFrRw/4MOfLY4dCy6
 WmgTV96ky2pFN6Jvr5O9NX5ddUYadJBhstAQDm31Pyi0t8mPPyTmQ8qUcn1Pzb9g6uFeOGS+gtJ
 /ykvQ6R4VL6zcDgh+LIKYVOOIxODwpJrT1MJ77Tnt9s+qMlHYy//lmz5U7fEnk/vbk7lkUzc45E
 n8P05IqY0trPZg4GeuYJxMq8own20aZGfdqXxsagZ5jXiE7R5e+1j5nkADnVHI3aDMzeS3mK
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=686f5444 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=7CQSdrXTAAAA:8
 a=COk6AnOGAAAA:8 a=QP5JmWE8YpjSW6ngeHcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3kroq27bglVu7bXHBKt7K8uye6nCj7Dy
X-Proofpoint-GUID: 3kroq27bglVu7bXHBKt7K8uye6nCj7Dy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_224901_250108_5A6470AE 
X-CRM114-Status: GOOD (  23.28  )
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



On 7/9/2025 9:19 PM, Suzuki K Poulose wrote:
> On 11/06/2025 11:42, Yuanfang Zhang wrote:
>> Add a driver to support Coresight device Trace Network On Chip (TNOC),
>> which is an integration hierarchy integrating functionalities of TPDA
>> and funnels. It aggregates the trace and transports to coresight trace
>> bus.
>>
>> Compared to current configuration, it has the following advantages:
>> 1. Reduce wires between subsystems.
>> 2. Continue cleaning the infrastructure.
>> 3. Reduce Data overhead by transporting raw data from source to target.
>>
>>    +------------------------+                +-------------------------+
>>    | Video Subsystem        |                |Video Subsystem          |
>>    |       +-------------+  |                |       +------------+    |
>>    |       | Video TPDM  |  |                |       | Video TPDM |    |
>>    |       +-------------+  |                |       +------------+    |
>>    |            |           |                |              |          |
>>    |            v           |                |              v          |
>>    |   +---------------+    |                |        +-----------+    |
>>    |   | Video funnel  |    |                |        |Video TNOC |    |
>>    |   +---------------+    |                |        +-----------+    |
>>    +------------|-----------+                +------------|------------+
>>                 |                                         |
>>                 v-----+                                   |
>> +--------------------|---------+                         |
>> |  Multimedia        v         |                         |
>> |  Subsystem   +--------+      |                         |
>> |              |  TPDA  |      |                         v
>> |              +----|---+      |              +---------------------+
>> |                   |          |              |   Aggregator  TNOC  |
>> |                   |          |              +----------|----------+
>> |                   +--        |                         |
>> |                     |        |                         |
>> |                     |        |                         |
>> |              +------v-----+  |                         |
>> |              |  Funnel    |  |                         |
>> |              +------------+  |                         |
>> +----------------|-------------+                         |
>>                   |                                       |
>>                   v                                       v
>>        +--------------------+                    +------------------+
>>        |   Coresight Sink   |                    |  Coresight Sink  |
>>        +--------------------+                    +------------------+
>>
>>         Current Configuration                            TNOC
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> ---
>>   drivers/hwtracing/coresight/Kconfig          |  12 ++
>>   drivers/hwtracing/coresight/Makefile         |   1 +
>>   drivers/hwtracing/coresight/coresight-tnoc.c | 242 +++++++++++++++++++++++++++
>>   3 files changed, 255 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
>> index f064e3d172b3d630515bb3a11450e883a6b5b4bf..6a4239ebb582e95f0ebe8e9c8738a726f27f60a1 100644
>> --- a/drivers/hwtracing/coresight/Kconfig
>> +++ b/drivers/hwtracing/coresight/Kconfig
>> @@ -268,4 +268,16 @@ config CORESIGHT_KUNIT_TESTS
>>           Enable Coresight unit tests. Only useful for development and not
>>           intended for production.
>>   +config CORESIGHT_TNOC
>> +    tristate "Coresight Trace Network On Chip driver"
>> +    help
>> +      This driver provides support for Trace Network On Chip (TNOC) component.
>> +      TNOC is an interconnect used to collect traces from various subsystems
>> +      and transport to a coresight trace sink. It sits in the different
>> +      tiles of SOC and aggregates the trace local to the tile and transports
>> +      it another tile or to coresight trace sink eventually.
>> +
>> +      To compile this driver as a module, choose M here: the module will be
>> +      called coresight-tnoc.
>> +
>>   endif
>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
>> index 4e7cc3c5bf994d4066adc3b6c203edd19e88a823..ab16d06783a572ea1308dfb3a30c96df9e5ffdb7 100644
>> --- a/drivers/hwtracing/coresight/Makefile
>> +++ b/drivers/hwtracing/coresight/Makefile
>> @@ -36,6 +36,7 @@ obj-$(CONFIG_CORESIGHT_SINK_TPIU) += coresight-tpiu.o
>>   obj-$(CONFIG_CORESIGHT_SINK_ETBV10) += coresight-etb10.o
>>   obj-$(CONFIG_CORESIGHT_LINKS_AND_SINKS) += coresight-funnel.o \
>>                          coresight-replicator.o
>> +obj-$(CONFIG_CORESIGHT_TNOC) += coresight-tnoc.o
>>   obj-$(CONFIG_CORESIGHT_SOURCE_ETM3X) += coresight-etm3x.o
>>   coresight-etm3x-y := coresight-etm3x-core.o coresight-etm-cp14.o \
>>                coresight-etm3x-sysfs.o
>> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..ac0b165f8742aaa8b6f6ed81d75eb75a81a85e39
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
>> @@ -0,0 +1,242 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> + #include <linux/amba/bus.h>
>> + #include <linux/coresight.h>
>> + #include <linux/device.h>
>> + #include <linux/io.h>
>> + #include <linux/kernel.h>
>> + #include <linux/module.h>
>> + #include <linux/of.h>
>> + #include <linux/platform_device.h>
>> +
>> +#include "coresight-priv.h"
>> +#include "coresight-trace-id.h"
>> +
>> +#define TRACE_NOC_CTRL      0x008
>> +#define TRACE_NOC_XLD       0x010
>> +#define TRACE_NOC_FREQVAL   0x018
>> +#define TRACE_NOC_SYNCR     0x020
>> +
>> +/* Enable generation of output ATB traffic.*/
>> +#define TRACE_NOC_CTRL_PORTEN   BIT(0)
>> +/* Sets the type of issued ATB FLAG packets.*/
>> +#define TRACE_NOC_CTRL_FLAGTYPE BIT(7)
>> +/* Sets the type of issued ATB FREQ packet*/
>> +#define TRACE_NOC_CTRL_FREQTYPE BIT(8)
>> +
>> +#define TRACE_NOC_SYNC_INTERVAL    0xFFFF
>> +
>> +/*
>> + * struct trace_noc_drvdata - specifics associated to a trace noc component
>> + * @base:      memory mapped base address for this component.
>> + * @dev:       device node for trace_noc_drvdata.
>> + * @csdev:     component vitals needed by the framework.
>> + * @spinlock:  serialize enable/disable operation.
>> + * @atid:      id for the trace packet.
>> + */
>> +struct trace_noc_drvdata {
>> +    void __iomem        *base;
>> +    struct device        *dev;
>> +    struct coresight_device    *csdev;
>> +    spinlock_t        spinlock;
>> +    u32            atid;
>> +};
>> +
>> +DEFINE_CORESIGHT_DEVLIST(trace_noc_devs, "traceNoc");
>> +
>> +static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
>> +{
>> +    u32 val;
>> +
>> +    /* Set ATID */
>> +    writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
>> +
>> +    /* Set the data word count between 'SYNC' packets */
>> +    writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
>> +
>> +    /* Set the Control register:
>> +     * - Set the FLAG packets to 'FLAG' packets
>> +     * - Set the FREQ packets to 'FREQ_TS' packets
>> +     * - Enable generation of output ATB traffic
>> +     */
>> +
>> +    val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
>> +
>> +    val &= ~TRACE_NOC_CTRL_FLAGTYPE;
>> +    val |= TRACE_NOC_CTRL_FREQTYPE;
>> +    val |= TRACE_NOC_CTRL_PORTEN;
>> +
>> +    writel(val, drvdata->base + TRACE_NOC_CTRL);
>> +}
>> +
>> +static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
>> +                struct coresight_connection *outport)
>> +{
>> +    struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +    scoped_guard(spinlock, &drvdata->spinlock) {
>> +        if (csdev->refcnt == 0)
>> +            trace_noc_enable_hw(drvdata);
>> +
>> +        csdev->refcnt++;
>> +    }
>> +
>> +    dev_dbg(drvdata->dev, "Trace NOC is enabled\n");
>> +    return 0;
>> +}
>> +
>> +static void trace_noc_disable(struct coresight_device *csdev, struct coresight_connection *inport,
>> +                  struct coresight_connection *outport)
>> +{
>> +    struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +    scoped_guard(spinlock, &drvdata->spinlock) {
>> +        if (--csdev->refcnt == 0)
>> +            writel(0x0, drvdata->base + TRACE_NOC_CTRL);
>> +    }
>> +    dev_dbg(drvdata->dev, "Trace NOC is disabled\n");
>> +}
>> +
>> +static int trace_noc_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
>> +            __maybe_unused struct coresight_device *sink)
>> +{
>> +    struct trace_noc_drvdata *drvdata;
>> +
>> +    drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +    return drvdata->atid;
>> +}
>> +
>> +static const struct coresight_ops_link trace_noc_link_ops = {
>> +    .enable        = trace_noc_enable,
>> +    .disable    = trace_noc_disable,
>> +};
>> +
>> +static const struct coresight_ops trace_noc_cs_ops = {
>> +    .trace_id    = trace_noc_id,
>> +    .link_ops    = &trace_noc_link_ops,
>> +};
>> +
>> +static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
>> +{
>> +    int atid;
>> +
>> +    atid = coresight_trace_id_get_system_id();
>> +    if (atid < 0)
>> +        return atid;
>> +
>> +    drvdata->atid = atid;
>> +
>> +    return 0;
>> +}
>> +
>> +static ssize_t traceid_show(struct device *dev,
>> +                struct device_attribute *attr, char *buf)
>> +{
>> +    unsigned long val;
>> +    struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    val = drvdata->atid;
>> +    return sprintf(buf, "%#lx\n", val);
>> +}
>> +static DEVICE_ATTR_RO(traceid);
>> +
>> +static struct attribute *coresight_tnoc_attrs[] = {
>> +    &dev_attr_traceid.attr,
>> +    NULL,
>> +};
>> +
>> +static const struct attribute_group coresight_tnoc_group = {
>> +    .attrs = coresight_tnoc_attrs,
>> +};
>> +
>> +static const struct attribute_group *coresight_tnoc_groups[] = {
>> +    &coresight_tnoc_group,
>> +    NULL,
>> +};
>> +
>> +static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
>> +{
>> +    struct device *dev = &adev->dev;
>> +    struct coresight_platform_data *pdata;
>> +    struct trace_noc_drvdata *drvdata;
>> +    struct coresight_desc desc = { 0 };
>> +    int ret;
>> +
>> +    desc.name = coresight_alloc_device_name(&trace_noc_devs, dev);
>> +    if (!desc.name)
>> +        return -ENOMEM;
>> +
>> +    pdata = coresight_get_platform_data(dev);
>> +    if (IS_ERR(pdata))
>> +        return PTR_ERR(pdata);
>> +    adev->dev.platform_data = pdata;
>> +
>> +    drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> +    if (!drvdata)
>> +        return -ENOMEM;
>> +
>> +    drvdata->dev = &adev->dev;
>> +    dev_set_drvdata(dev, drvdata);
>> +
>> +    drvdata->base = devm_ioremap_resource(dev, &adev->res);
>> +    if (!drvdata->base)
>> +        return -ENOMEM;
>> +
>> +    spin_lock_init(&drvdata->spinlock);
>> +
>> +    ret = trace_noc_init_default_data(drvdata);
>> +    if (ret)
>> +        return ret;
>> +
>> +    desc.ops = &trace_noc_cs_ops;
>> +    desc.type = CORESIGHT_DEV_TYPE_LINK;
>> +    desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
>> +    desc.pdata = adev->dev.platform_data;
>> +    desc.dev = &adev->dev;
>> +    desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
>> +    desc.groups = coresight_tnoc_groups;
>> +    drvdata->csdev = coresight_register(&desc);
>> +    if (IS_ERR(drvdata->csdev)) {
>> +        coresight_trace_id_put_system_id(drvdata->atid);
>> +        return PTR_ERR(drvdata->csdev);
>> +    }
>> +    pm_runtime_put(&adev->dev);
>> +
>> +    return 0;
>> +}
>> +
>> +static void trace_noc_remove(struct amba_device *adev)
>> +{
>> +    struct trace_noc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
>> +
>> +    coresight_trace_id_put_system_id(drvdata->atid);
>> +    coresight_unregister(drvdata->csdev);
> 
> For the sake of safety you should reverse the order of the above
> operations. To prevent a released system id visible on the csdev.
> 
> Rest looks fine
> 
> Suzuki
> 
updated in patch V11.
>> +}
>> +
>> +static struct amba_id trace_noc_ids[] = {
>> +    {
>> +        .id     = 0x000f0c00,
>> +        .mask   = 0x00ffff00,
>> +    },
>> +    {},
>> +};
>> +MODULE_DEVICE_TABLE(amba, trace_noc_ids);
>> +
>> +static struct amba_driver trace_noc_driver = {
>> +    .drv = {
>> +        .name   = "coresight-trace-noc",
>> +        .suppress_bind_attrs = true,
>> +    },
>> +    .probe          = trace_noc_probe,
>> +    .remove        = trace_noc_remove,
>> +    .id_table    = trace_noc_ids,
>> +};
>> +
>> +module_amba_driver(trace_noc_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Trace NOC driver");
>>
> 


