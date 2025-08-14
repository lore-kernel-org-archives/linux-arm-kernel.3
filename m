Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADF2CA0EE3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 06:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgdIPyoZYmfHL46/OfidSIeJuiRIcEKFFkB9alnkIrY=; b=W3A/FZ/UVsdCK7z7GjiSIpvmsu
	B7H8zxZ82428bFp6PASz+P493im8FY6+okPtcl/DCE/JlgURW8P/Tut5rAmF9/rGIVRsF3XU656L5
	ETTxMHuP/tClp5pdVjJYL5bth1TRmOkmcwsn7BYg64GzsjowdJ/tGc4J5CDbFev4Nirpw5PtmhkTB
	4ggRsVgo4oiesP8J0oMBNdBETGdwx0O26erkKk/gxIe9G5/2p6H9JaPXKM/9och9m1dqPKZ+cS8Hw
	b9YxKtPIquvE3P1MIht2ZXU8NEWxaARSwcFqzPKF9sDJg6ne/ACK3EbZFahgAbccLnabJESPYbsBp
	RnqI16OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umRty-0000000Fzjf-0dza;
	Thu, 14 Aug 2025 06:57:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umRr7-0000000FzGB-0yCk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 06:54:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMGmU2027429;
	Thu, 14 Aug 2025 06:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pgdIPyoZYmfHL46/OfidSIeJuiRIcEKFFkB9alnkIrY=; b=cnLVTRUU0sIkq4ev
	mtu9Grhy941hhX7xLTkqrKutOH61veIERyRGOIpSa55TNJvimLjqe9tMerNXTwKX
	MpEXucf2EBYeEI5D+0V7kbp770p2G8M6oF/Nrr1Zao7VnBNUdpK+8jBqCnAbZdKY
	O1qMJ2HF/e/G92N1juh3H/7LWPMzoHEaNyC6EHbHlgnhwzvfL8IQtsFToawE2D3U
	8BJczva03i7Zm3o/4d7JDIsuvlVdvEieka5KrCPrP9U2pTuWs6J93BiDMBzmL6d0
	XZJl3oIaQoID3hXag868q/35iFer/yGE9z0pkaySesKfT584SGGWqKVH/ovjs5Sz
	5i1iuA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjth5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 06:54:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57E6sOHS014135
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 06:54:24 GMT
Received: from [10.216.6.119] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 23:54:18 -0700
Message-ID: <c660ea69-d111-4a81-85c6-8ab16dfcfb28@quicinc.com>
Date: Thu, 14 Aug 2025 12:24:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] media: qcom: camss: enable csid 690 for qcs8300
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-5-quic_vikramsa@quicinc.com>
 <c467e3a9-2c67-4231-9d64-d64de08ec2ce@linaro.org>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <c467e3a9-2c67-4231-9d64-d64de08ec2ce@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX3XN7c3qwJ5vR
 4wHN+yiq/Vm5DFCG9+GZINHeTCTWjGRaRVfT/dok1l36ueVAt63uvrc2WXzMYJ7xEV03VS0irow
 L/soOPvjXHyzWmmrLKTt1CRa1BB6EFFLmQoi3FGqzJUtXttdmfvV7gsPA5PiftLCvD6lmjzgnCz
 rwuK4Mm3u8Q75Vl+bXzJEbwITVWIBruonJrTFvc1t6NVMG1cOe7YXQub34ER3EVhR6DAnkW6vYd
 cI1SZZEo7QdzV9QkPR7iv3axCSXh0XsUFYs65Svn7/ywUPrFiS+Eqt7rqUqxWSS+VcIM1D9SSgU
 /bV4lmEfKCOfqJG2O//oHZEdFCCE1WcRvVpBDv8SybO4fOqxyWdVcrnIw/BgOhZ6EEgV/3ThXze
 hlQHKoSA
X-Proofpoint-GUID: l8J6HStKPFpR2chhkk7R5prRDFaeWSCM
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689d8821 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=pidyNqlz_yV2GsitqqAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: l8J6HStKPFpR2chhkk7R5prRDFaeWSCM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_235433_383675_18C05886 
X-CRM114-Status: GOOD (  13.87  )
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


On 8/14/2025 3:03 AM, Bryan O'Donoghue wrote:
> On 13/08/2025 06:37, Vikram Sharma wrote:
>> The CSID in qcs8300 is version 690, it is same as csid used in
>> lemans(sa8775p). csid gen3 have support for csid 690.
>>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss-csid-gen3.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c 
>> b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> index fc6a9787febe..664245cf6eb0 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> @@ -45,7 +45,8 @@
>>   #define CSID_CSI2_RX_IRQ_CLEAR        0xA4
>>   #define CSID_CSI2_RX_IRQ_SET        0xA8
>>   -#define IS_CSID_690(csid) (csid->camss->res->version == CAMSS_8775P)
>> +#define IS_CSID_690(csid) ((csid->camss->res->version == CAMSS_8775P) \
>> +                 || (csid->camss->res->version == CAMSS_8300))
>>   #define CSID_BUF_DONE_IRQ_STATUS    0x8C
>>   #define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
>>                           1 : (IS_CSID_690(csid) ?\
>
> This really feels like it should be a property of the CSID not of the 
> SoC but... anyway it'll do for now.

Hi Bryan,

Thanks for your review. I will address this in a follow up series 
marking dependency on this one.


>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Regards,
Vikram


