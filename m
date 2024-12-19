Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A280E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 03:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTKstjkSA8BTortv7dXvF8pKroH7V24PZ/uN8TShCjw=; b=LmakLvccJaLL9bexQ4g9ru9qW4
	fCD4eJaPpB7QbM8l8xQiFaGPwHLoXvb6VFFr9T0FpbHMw3SKhsIEbgaB6OZC+6GmXTm6jvb/8XMg5
	LFY97/OS4xqLOVJ9IhTl/lUZZ/7Jxwz01NBxY41oiNoi9iW1rlze1dZWL5C8XzPxWQ39ce1tweUP9
	UN7Az6JoDS2D5b8JCo8rIK3R2xnh7rygf66jj0jBCJRTRfKSADUH9WWXay8TLVfA7IVIcDaHnbs9f
	Uz2/Q0MFuSNBuXozJaoEyTxrrJaHtGcj02z+JSPT/9UGsWTlGIrqH+EYYihslrfBT6+l75XIBgk2P
	eYqhiG0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO7B3-00000000hza-2WC5;
	Thu, 19 Dec 2024 03:26:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO79w-00000000hoK-2dyF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 03:25:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIICbA7030090;
	Thu, 19 Dec 2024 03:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mTKstjkSA8BTortv7dXvF8pKroH7V24PZ/uN8TShCjw=; b=fPQ1Ce3Z4rKyvLvE
	2TAe3P5qjROyfPRgztTIuXG22vtukWLxTd6EPMY2kKBZwtOch3aD2vTtomWs6cL7
	34gyd3KW6l21/JKTAfvNQnKiJXRmLb0NW5epftlnkcNKmO54MtjiucAvzYNqQdHl
	lr8TVJJ2b0czahe6MD1SRJGCE9C03XZccBZDI8SElxl8uJw6sLHUJk7edKQ5zjgA
	9Nsf9jQFFvQB/3OuNvNrUS9YcKSuByZlIrPQbxUlM4cRJQwlX8rQZVbYOuDqjQni
	xpgKxVQUWia6yqTCwwTtcRaeJf1egieYintbClVomid3mls0dqAApqB2BqHdaOpm
	oEcJFw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m3fk925j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 03:24:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ3OsO5005948
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 03:24:54 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 19:24:23 -0800
Message-ID: <a6de450f-792d-429e-925e-850d11163907@quicinc.com>
Date: Thu, 19 Dec 2024 11:24:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] Coresight: Add Coresight TMC Control Unit driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
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
        Konrad Dybcio <konradybcio@kernel.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20241210031545.3468561-1-quic_jiegan@quicinc.com>
 <20241210031545.3468561-5-quic_jiegan@quicinc.com>
 <d09097da-a07a-4dfa-9c0d-567b329b64ac@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <d09097da-a07a-4dfa-9c0d-567b329b64ac@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EN8MsNzd0MooXx_vM2kwTn_ShE_yQR1S
X-Proofpoint-ORIG-GUID: EN8MsNzd0MooXx_vM2kwTn_ShE_yQR1S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_192508_695572_91072A87 
X-CRM114-Status: GOOD (  25.51  )
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



On 12/15/2024 6:21 AM, Konrad Dybcio wrote:
> On 10.12.2024 4:15 AM, Jie Gan wrote:
>> The Coresight TMC Control Unit hosts miscellaneous configuration registers
>> which control various features related to TMC ETR sink.
>>
>> Based on the trace ID, which is programmed in the related CTCU ATID
>> register of a specific ETR, trace data with that trace ID gets into
>> the ETR buffer, while other trace data gets dropped.
>>
>> Enabling source device sets one bit of the ATID register based on
>> source device's trace ID.
>> Disabling source device resets the bit according to the source
>> device's trace ID.
>>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>> ---
> 
> [...]
> 
>> +static int __ctcu_set_etr_traceid(struct coresight_device *csdev,
>> +				  u8 traceid,
>> +				  int port_num,
>> +				  bool enable)
>> +{
>> +	uint32_t atid_offset;
>> +	struct ctcu_drvdata *drvdata;
>> +	unsigned long flags;
>> +	uint32_t reg_offset;
>> +	int bit;
>> +	uint32_t val;
>> +
>> +	if (!IS_VALID_CS_TRACE_ID(traceid) || port_num < 0)
>> +		return -EINVAL;
>> +
>> +	drvdata = dev_get_drvdata(csdev->dev.parent);
>> +	if (IS_ERR_OR_NULL(drvdata))
>> +		return -EINVAL;
>> +
>> +	atid_offset = drvdata->atid_offset[port_num];
>> +	if (atid_offset == 0)
>> +		return -EINVAL;
>> +
>> +	spin_lock_irqsave(&drvdata->spin_lock, flags);
> 
> guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
> 
> and drop the unlocks
> 
Sure, will fix in next version.

>> +	CS_UNLOCK(drvdata->base);
>> +
>> +	reg_offset = CTCU_ATID_REG_OFFSET(traceid, atid_offset);
>> +	bit = CTCU_ATID_REG_BIT(traceid);
>> +	if (reg_offset - atid_offset >= CTCU_ATID_REG_SIZE ||
>> +	    bit >= CORESIGHT_TRACE_IDS_MAX) {
>> +		CS_LOCK(drvdata);
>> +		spin_unlock_irqrestore(&drvdata->spin_lock, flags);
>> +		return -EINVAL;
>> +	}
>> +
>> +	val = ctcu_readl(drvdata, reg_offset);
>> +	if (enable)
>> +		val = val | BIT(bit);
>> +	else
>> +		val = val & ~BIT(bit);
>> +	ctcu_writel(drvdata, val, reg_offset);
>> +
>> +	CS_LOCK(drvdata->base);
>> +	spin_unlock_irqrestore(&drvdata->spin_lock, flags);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
>> +{
>> +	int port, i;
>> +
>> +	for (i = 0; i < sink->pdata->nr_outconns; ++i) {
>> +		if (sink->pdata->out_conns[i]->dest_dev) {
>> +			port = sink->pdata->out_conns[i]->dest_port;
>> +			return port;
> 
> Return sink->....
Sure, will fix in next version.

> 
>> +		}
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +/*
>> + * ctcu_set_etr_traceid: Retrieve the ATID offset and trace ID.
>> + *
>> + * Returns 0 indicates success. None-zero result means failure.
>> + */
>> +static int ctcu_set_etr_traceid(struct coresight_device *csdev,
>> +				struct cs_sink_data *sink_data,
>> +				bool enable)
>> +{
>> +	int port_num;
>> +
>> +	if (!IS_VALID_CS_TRACE_ID(sink_data->traceid) ||
>> +	    (csdev == NULL) ||
> 
> I'm not sure this can be null by the time it reaches this function
Will check.

> 
>> +	    (sink_data->sink == NULL)) {
>> +		dev_dbg(&csdev->dev, "Invalid parameters\n");
> 
> dev_err?
It's better with dev_err, will fix.

> 
>> +		return -EINVAL;
>> +	}
>> +
>> +	port_num = ctcu_get_active_port(sink_data->sink, csdev);
>> +	if (port_num < 0)
>> +		return -EINVAL;
>> +
>> +	dev_dbg(&csdev->dev, "traceid is %d\n", sink_data->traceid);
>> +
>> +	return __ctcu_set_etr_traceid(csdev, sink_data->traceid, port_num, enable);
>> +}
>> +
>> +static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
>> +		       void *data)
>> +{
>> +	int ret = 0;
> 
> Unnecessary initialization (you instantly overwrite it), also below
> 
>> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
>> +
>> +	ret = ctcu_set_etr_traceid(csdev, sink_data, true);
>> +	if (ret)
>> +		dev_dbg(&csdev->dev, "enable data filter failed\n");
> 
> Since the this function returns an int, maybe return ctcu_set_etr_traceid()
> and let the upper layer throw an error (also for some other functions in this
> file)
> 
Sure, will check.

>> +
>> +	return 0;
>> +}
>> +
>> +static int ctcu_disable(struct coresight_device *csdev, void *data)
>> +{> +	int ret = 0;
>> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
>> +
>> +	ret = ctcu_set_etr_traceid(csdev, sink_data, false);
>> +	if (ret)
>> +		dev_dbg(&csdev->dev, "disable data filter failed\n");
>> +
>> +	return 0;
>> +}
> 
> [...]
> 
>>   enum coresight_dev_subtype_helper {
>>   	CORESIGHT_DEV_SUBTYPE_HELPER_CATU,
>> -	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI
>> +	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI,
>> +	CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
> 
> Please add a comma here too, so that future additions will be
> less noisy
Sure, will add a comma after CORESIGHT_DEV_SUBTYPE_HELPER_CTCU.


Thanks,
Jie



