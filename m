Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9988C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 11:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AW9MIXjUK1pfs9+e0MaPxARChQNnNhfDrXrnFMNtdQg=; b=hdS3MA4BlnvHHYD7m8+RI3dqnK
	wPm7jeRMovLPOY5QcgnaQP+S8ckHrTqpJd/CGvaLghSqcqVhhp38me5gmomRqgV476g8C0d4+FQZJ
	2qvuSaaBK8ITlP3lJQvbjRvV02HHSuuRGiHsglnody4R7+/y7xfYL8W02Qkhv1uBfu5lX1NH4PD0a
	3nvG+5pg+uaw360WcsDAKWNXxE+/OX687PiEkUBpS+3g5l3480KMkHNAcxdZQwTUSdQJ/PyHTIgVb
	XhP2cAcnDuA5jJmoGy2KdFipSLqmu6ghZvihK1wUqJjRES1PvpHMmfAndNEYFcEUiJNZoynRAKt/L
	SGzRk6Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOAa-00000008RyE-3SrH;
	Wed, 25 Jun 2025 11:20:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNPd-00000008Jkd-3A3B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:31:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P2LLrO022996;
	Wed, 25 Jun 2025 10:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AW9MIXjUK1pfs9+e0MaPxARChQNnNhfDrXrnFMNtdQg=; b=QHpWD/ugJpK7gW86
	Inj9vEw275HORrKdaW192cUMTDXW9CpBu+26OBxlF0HdSKJ+Ft3EyBkPAX80UGtD
	s4im0MpbxFcc7nPMIYK/cap3faGmjraBBL0YlFV5e3fNUWZJ/8LRojrSaQ3EFF1w
	yRyKrcaHA4NZAtxgwr8OCCERa2PFQB3epJCQD2/YwhjT26HN13e+du/k6z6HwsPP
	KpgmTn+h05cFbl8DkBvu83vKztdVsxk/uFgpa4ZlqKdVC6wkZaHCnKpI3k+xh8NW
	K/Gn5XV3Ft9auKU412cjPZkuhT8lElEjrvUbkf3ds2KfbU2cBnz5K6Xp9UTmqgRm
	hJh0EA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88f99yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:31:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PAVLsc010034
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:31:21 GMT
Received: from [10.217.217.109] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Jun
 2025 03:31:15 -0700
Message-ID: <9a9d84e3-49de-4fbd-9c0d-180e3e498125@quicinc.com>
Date: Wed, 25 Jun 2025 16:01:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
 <20250612-qcs615-mm-v9-clock-controllers-v9-1-b34dc78d6e1b@quicinc.com>
 <f0483597-45b9-49f8-b316-a9cde7b98d81@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <f0483597-45b9-49f8-b316-a9cde7b98d81@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3OCBTYWx0ZWRfX26wuM6lcihze
 eu9Nyj+z3yzjUAEcr3gZY4XOJuGhhUH1hFrUsyUTv6BVlVVCpWaymS3CEy3JaVmYeQh5Kb3RcRk
 APdBC4mSAoVwKDpVDotsp/zGDb1yGG9CIVD/6U5Qnnxq/bMYOBBPkab0+QTcz1lmpGiDAOxLytG
 +urBh9QpJTUp0VNY0xKOs9Zk0r9JyyCw/AigmT4subFD4GVekJpNGcS02Z9CuPgN3q1xVP2QkGi
 g5vRh4soVZJ6sdbcBa+QJIF6BKL/Op9CkkiuUMqC33eBkOUpTPTBG0729ebX8KNf7jTB0DhVc/p
 wLypAKBj0xSZz5jhp69KCw2sMOerWFNXN7U3cEQCbpnl285IWybI+6R6jsfYzJAoxEAqR1STq5f
 edWrTrNz/GKAILxFiAjPFMH6zw7zKDamLpENsrrOXRTZCsMZP4Vm2fg+QAZ4nnm+7CVHIFDZ
X-Proofpoint-ORIG-GUID: 7hgSntyQVKtiLc9TRyJr9rWEMAe240_0
X-Proofpoint-GUID: 7hgSntyQVKtiLc9TRyJr9rWEMAe240_0
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685bcffa cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=4u-pnGOhn0YgKSHAsOkA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_033129_913845_9D5DC5F1 
X-CRM114-Status: GOOD (  25.21  )
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



On 6/15/2025 12:20 AM, Konrad Dybcio wrote:
> On 6/12/25 11:55 AM, Taniya Das wrote:
>> The alpha PLLs which slew to a new frequency at runtime would require
>> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
>> which can support the slewing of the PLL to a new frequency.
>>
>> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>  drivers/clk/qcom/clk-alpha-pll.c | 170 +++++++++++++++++++++++++++++++++++++++
>>  drivers/clk/qcom/clk-alpha-pll.h |   1 +
>>  2 files changed, 171 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>> index cec0afea8e446010f0d4140d4ef63121706dde47..5e4a755b849970281e7742ef83219b7eeaa406c3 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -2960,3 +2960,173 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
>>  	.set_rate = clk_zonda_pll_set_rate,
>>  };
>>  EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
>> +
>> +static int clk_alpha_pll_slew_update(struct clk_alpha_pll *pll)
>> +{
>> +	int ret;
>> +	u32 val;
>> +
>> +	regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_UPDATE, PLL_UPDATE);
> 
> There's an ever sweeter sugar-syntax for this case - regmap_set_bits()
> 

I will update and use the regmap_set_bits as required in the code.

>> +	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
>> +
>> +	ret = wait_for_pll_update(pll);
>> +	if (ret)
>> +		return ret;
>> +	/*
>> +	 * Hardware programming mandates a wait of at least 570ns before polling the LOCK
>> +	 * detect bit. Have a delay of 1us just to be safe.
>> +	 */
>> +	mb();
> 
> Since you read the value of PLL_MODE back, the barrier is unnecessary
> 

I will remove in the next patch.

> [...]
> 
>> +
>> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
>> +
>> +	/* Ensure that the write above goes before slewing the PLL */
>> +	mb();
> 
> Here however, the write may not arrive at the clock controller before you
> proceed to slew_update()
> 

Yes, it is required here and will keep it.

>> +
>> +	if (clk_hw_is_enabled(hw))
>> +		return clk_alpha_pll_slew_update(pll);
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Slewing plls should be bought up at frequency which is in the middle of the
>> + * desired VCO range. So after bringing up the pll at calibration freq, set it
>> + * back to desired frequency(that was set by previous clk_set_rate).
>> + */
>> +static int clk_alpha_pll_calibrate(struct clk_hw *hw)
>> +{
>> +	unsigned long calibration_freq, freq_hz;
>> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>> +	struct clk_hw *parent;
>> +	const struct pll_vco *vco;
>> +	u32 l;
>> +	int rc;
>> +	u64 a;
> 
> A reverse-Christmas-tree sorting would be nice 
> 

Yes, I will update as required.


