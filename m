Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61229C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 06:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ti6mrnRniD673CTX+hG/sAAcg1JSfYL2S8V/LJ7Gu3s=; b=FtUI5vQmBYQ5VdYlY+6QEtgZVb
	FzfIJvTm0K/aWQzRWfc2gsnIzMihXwoJS9qX9NO/kn+nc8WfEyWyqJ2tTVGItExnzQVaHMxDVFDvW
	W+VG2hBfGUaYjMr63J78eATPs8XVQOIUbHxyORVqKa1SplOpnxt3ldqVaCgfpWnZC193rd7E2eqq1
	TAKxDfdmxNaCpzSiunZ0teW6kqzP/Hu6zIc77diN9Eh70dNx48SsF1B8gQeGDZo/7GnExjVB8KJWb
	KpkjXLyhNogvV0wgIUpcowdSB7MdT0L7U7ti73QwlA35ndeDLAjhcf+RbzqU1OEGlWigoyzCUg8zH
	oDQuoy+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUil-00000004Bbx-3Wf0;
	Tue, 01 Jul 2025 06:43:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUL6-000000047yC-1HaS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 06:19:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5614FN9Y024794;
	Tue, 1 Jul 2025 06:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ti6mrnRniD673CTX+hG/sAAcg1JSfYL2S8V/LJ7Gu3s=; b=T8AxJ4+tGPPpFge+
	keNFammgzYs35F0QyZZiqLkDaFo08PaDUUe8nhZhlqqekTWWnVTe36wGWTfcE+Mn
	/qiXIa7t3t5euP0BfvuJrjm6KSwLeJJMOslgH+oW7BoXcCUpSlCSglGd4eCQrjQN
	VbFQASm9lJ5gct3XIHQMDTEBwM7XcnH6XB0rxlaFPnh0ipK7B6igd5PvHRB/T0wa
	9bAknWq01GDa1PP79nPSGOETjZBbuFfSCv3lpkeiYEVH+kZVhUL5Pr7+HZxOtERO
	g8NkFykq0TRvUKZsSJpE/MD4dfqH6XdWWpEpPuybKDoyhbmcgi1X442QIGDLPh2d
	v+s2hQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9f901-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 06:19:25 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5616JO5x020508
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 06:19:24 GMT
Received: from [10.217.217.109] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Jun
 2025 23:19:19 -0700
Message-ID: <744da3c1-04c6-4347-bafc-233471d07853@quicinc.com>
Date: Tue, 1 Jul 2025 11:49:13 +0530
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
 <9a9d84e3-49de-4fbd-9c0d-180e3e498125@quicinc.com>
 <c37349c0-8ec0-4654-bc82-15190509ddeb@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <c37349c0-8ec0-4654-bc82-15190509ddeb@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68637ded cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=bVv2Rnes1pukqZk3WigA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Upw_c5UZz3oM712a0vmt5Vdbt_qqNuEU
X-Proofpoint-GUID: Upw_c5UZz3oM712a0vmt5Vdbt_qqNuEU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAzMyBTYWx0ZWRfX75XITVUDZ34y
 cgJmLR8w3Ag6yIcddTImDpihy/XbAgvTDLRVkfeviD+ERvx4Goaw73ULMoiragNxlBeqViLox1E
 ibNPqnO1BlCTbiX6XrxFr4jxL+0sanYAklR8pP/DEFLZ/OYiiLftzd23eYXI5CXBKvhzvIY1ecW
 OPQQBeeQrBFu3iXLLRBPTkxCMKAcoyd1rTrVeqKDHSxW1x7cYGcU/8ktJx+iMwiOV3OzWTOsuNM
 42m326X2I3+lHAaRzmNzdViVCXG80xxb74j3ROnJ+r5qKANWNqNWfqfzYwg//Qbqa2cwI1eLRxr
 lItDnTk+XZRPQY2O5rr4yr1ZCzs4iZW8kikHdZ0xStBFDH46r2vVGn6mUlaU5miWj9BaUwvR+SY
 xn7EgIl3ujSfe3nC5IKSEPxBIdWKt580HxcIBDGKonNlsBhtho1+c1gvwQ48JQrcqxXFtbvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_231932_523685_25716983 
X-CRM114-Status: GOOD (  15.65  )
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



On 6/27/2025 8:39 PM, Konrad Dybcio wrote:
> On 6/25/25 12:31 PM, Taniya Das wrote:
>>
>>
>> On 6/15/2025 12:20 AM, Konrad Dybcio wrote:
>>> On 6/12/25 11:55 AM, Taniya Das wrote:
>>>> The alpha PLLs which slew to a new frequency at runtime would require
>>>> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
>>>> which can support the slewing of the PLL to a new frequency.
>>>>
>>>> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
> 
> [...]
> 
>>>> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
>>>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
>>>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
>>>> +
>>>> +	/* Ensure that the write above goes before slewing the PLL */
>>>> +	mb();
>>>
>>> Here however, the write may not arrive at the clock controller before you
>>> proceed to slew_update()
>>>
>>
>> Yes, it is required here and will keep it.
> 
> You should change it to a readback instead
> 

Okay, I can introduce a readback, but as per the PLL code we have been
using mb() at most places. But I am okay to update it.

> Konrad


