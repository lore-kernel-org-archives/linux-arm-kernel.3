Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051DBC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 18:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvKiGeQQXdoaNRy8cKQkU1P8BTdh5zPp9R1GKNeEFeA=; b=pKjhoowipy+TQ/jHO6ipA2xMGD
	37dBJ3oMQn3B0yBApBw3FmU3UiYW/qFLXDiW8fUDcpJJdtIEX4Koq+lJvETpG8qZLI3AO2gh/u7P5
	S94DE8MevsY9zD73kub2IMogKg6f5XS2Dm8iU31h12FY7aOdnO+HihC1kolTjYt4DfD/8kV9pQ7oA
	ikjrFWbKHc1rbCevU9nHyx7bkovwEp+PkyWhQbUs+HXn7k5ZUMOSMAKuMJLUU1FWDJA36oiSai/It
	LaSg6QSc5Iek92qR06zTcWrRtpzquuDqnbeInuOZMY+MIdH+k5C2P2E7iwmooP9990SVmQuHPw/NO
	X0HNyjgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRxLB-0000000B2xs-3Iko;
	Wed, 18 Jun 2025 18:16:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuU0-0000000AYjQ-2S1I
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 15:13:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BvKiGeQQXdoaNRy8cKQkU1P8BTdh5zPp9R1GKNeEFeA=; b=gZqzpdhZcAuQrgIt7AutANI8nF
	EPYE1kio3MLOYeMukK4Dc8waLtrU3mDMPWxE/4X2DSEGdgjYBv0pLOjuiLdHvazO2jU2hXPQqla4a
	jlha5hG+IHXu7Fd6tJLS1EDltl3mfXZO4UP+j/sLNi3RZsvoDJRID5pEa9QUzGZw4Q+oabWpqPROq
	soRw/fJmuvejYdGW/C+g1W79hz+EuQ13Ak6fHIMaF+KKSK0F6Lr5L3e1N9neNtbKdpisTxypJ+AWV
	Rtu60YPzSWiu44G7/m1gHCsJAehbbTUcJ+QCqW/sDxPkBAeu0lX84vgnBGA1xZ1N6w3DwzhuLiSIJ
	Sq3IkQjA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuTx-000000048eA-2nKo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 15:13:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I9231C015638;
	Wed, 18 Jun 2025 15:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BvKiGeQQXdoaNRy8cKQkU1P8BTdh5zPp9R1GKNeEFeA=; b=TYjo1P9E8jrf+vtK
	B4mqkoC4jb/sodFzM6AqHQTtwsNRTuu9renvffElLBm9SfU4atamvmnSw5uByu59
	UC/x0S/ZLi/QUiTrP2veC77Sher2JDnL/q7YCqhS7A5JEplsuUcq0jJGrlubh3LD
	J9ImWWK8Ato2Iydzv6MfOlave32KwxbSIVgUlkvLBrEwn62TvxsBjsi5e5L8+D9x
	AjSqJ0tIdFE4lK1OfM2MA/t4jJvQZiSKuUgq9p1Gv2Pi7eTzWH/OOYSzQCSiyCAu
	D99lXvCCq7RhjWKwmMdpGHcFDZSt7kO5t+SocCmSpyJbzgQpZGwFPy1dpaFwCKI2
	xOchng==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47b9akv2nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 15:13:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55IFDWEE028125
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 15:13:32 GMT
Received: from [10.253.36.28] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Jun
 2025 08:13:26 -0700
Message-ID: <c2cefd3f-3579-4c41-ac0d-08869b51eaaa@quicinc.com>
Date: Wed, 18 Jun 2025 23:13:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: interconnect: Add Qualcomm IPQ5424
 NSSNOC IDs
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Will
 Deacon" <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>
References: <20250617-qcom_ipq5424_nsscc-v1-0-4dc2d6b3cdfc@quicinc.com>
 <20250617-qcom_ipq5424_nsscc-v1-1-4dc2d6b3cdfc@quicinc.com>
 <8fc66f04-27f1-416e-b7c5-d3045e94f13a@kernel.org>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <8fc66f04-27f1-416e-b7c5-d3045e94f13a@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: erdZe8h3cOfKGCAKK3MbpbXil2YGXIBE
X-Authority-Analysis: v=2.4 cv=UPTdHDfy c=1 sm=1 tr=0 ts=6852d79d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8
 a=wEgfWPuv0KXlM2Taas8A:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEyOCBTYWx0ZWRfX2T73sEv55TzK
 bd2uZbTfg0L2+P63qECMxQqLAgBX2DldXYERVfx46bZMKKPLfF2m2RhfjgFcVOZEuE4XNfFWlsd
 nJ1lMYGAsx28VCZ4X6AHBVTB3KHgCZhwKX3iync4b5clhbKFfgpGpUW+siJEWZEDUtTTj8Ov3wu
 T8DMEg9q5dqS0AbTDaTfWYtxJsxo6WcbNoGnA6iAPSo7yE+XVn3rrKJ1Qwn3M6+RgHi/cyx1n/s
 W/NEleWEOfIT5bnL8U7JkKn3swRxzRj1griirdwWD6ZtpVLcOuq1KpyQaRePkmfvmcsG737i6Pu
 oSO5jXusIIxamwQteRvkWI1Z7Xc+LQqxZ9KP5RGns6l3pISoYctKUucmLVaH3WTmLTjY0g14juM
 EEkz9RU0o8WdTO1HhTcHbwhcZyeIQtMIEXBENvD8epVD34qMTdBdbGJBhsAV4SkvuE5544jG
X-Proofpoint-GUID: erdZe8h3cOfKGCAKK3MbpbXil2YGXIBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_161346_024092_85C7BFF3 
X-CRM114-Status: GOOD (  11.88  )
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



On 6/17/2025 10:47 PM, Krzysztof Kozlowski wrote:
> On 17/06/2025 14:06, Luo Jie wrote:
>> Add the NSSNOC master/slave ids for Qualcomm IPQ5424 network
>> subsystem (NSS) hardware blocks. These will be used by the
>> gcc-ipq5424 driver that provides the interconnect services
>> by using the icc-clk framework.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 
> Best regards,
> Krzysztof

Thanks. I will update the commit message to follow the guideline.

