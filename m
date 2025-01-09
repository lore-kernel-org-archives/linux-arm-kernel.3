Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787B4E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 07:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faXKx5JyBLEPD6tryFnH16a9m3UBc5HuVMYyWfnWTQ0=; b=xj7fMKSkxwmU0BA5qLXKj2l0vV
	cupfdUAphOefIGcJZDrhG8jXczmQQbbuJRa/RBdK5G3GepypW+eLM09b3XETfrltpcoV16zjCFqIA
	HqyXOxOwXmFuqRY6y4Q/STFM7iX6jZwFVYBSO1Q0Vyh9UdHVD5q8rMk/PSZcUsevaM9LFZEpnMDxY
	dQeM+k32Wn/65lg7vLTSFbzqtWaVg6MPsq+JyNlQXukudeIfG3AhpWtqW9HdSdgyf/zreIe8fml++
	bMmmfgEWcLX/0yKgbJBE/cUUMvvTheBA/zWu4Q3qonP5JS7YSUCaNTvImao+SqY2SDXKJLS11kr22
	MNeOEtZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVmdN-0000000Azfw-1Y6u;
	Thu, 09 Jan 2025 07:07:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVmbK-0000000AzPR-2icK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 07:05:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094EvRY009614;
	Thu, 9 Jan 2025 07:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	faXKx5JyBLEPD6tryFnH16a9m3UBc5HuVMYyWfnWTQ0=; b=O5Xa5hWTTPHEDWYg
	/rs4WIueZxRilD6XHR15CzpvIApum2UBoJwBU0pIhFVpii/Hn0WJaHEwGOk6j00w
	I2TOIySvT54dTO91J582x0MVxx6fnD1/+Nq8Bix50AMgwqvHvbG6d0Uvmc0r441u
	8vxyBElYvqqsYlBEI+cRBKKecLW4Cmxi6PrWVM2Rr/Qa/PUehiBZyZmKBC4o1UFS
	4PdsVWWXKJ+IY9T8DMbPFuO8ube2mm/NF2cWPxlUUC5Bfj8M91QDCYYXvocY0B9A
	puOAYPIRSyTC40aB/eLWSb71tbqqqKX0hTUQiyRboiu4f4hfOYz5TPzwkFWsZTwM
	2730Uw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44278t8b03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 07:04:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50974s5Q010347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 07:04:54 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 23:04:50 -0800
Message-ID: <169f8006-ff33-48ca-a680-37fe1cf0efe8@quicinc.com>
Date: Thu, 9 Jan 2025 15:04:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: mm: Populate vmemmap/linear at the page level
 for hotplugged sections
To: Anshuman Khandual <anshuman.khandual@arm.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>
CC: <will@kernel.org>, <ardb@kernel.org>, <ryan.roberts@arm.com>,
        <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>,
        <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <quic_tingweiz@quicinc.com>,
        <stable@vger.kernel.org>
References: <20250107074252.1062127-1-quic_zhenhuah@quicinc.com>
 <Z31--x4unDHRU5Zo@arm.com> <fbb134e0-cfeb-4c6e-98b4-d945f95383db@arm.com>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <fbb134e0-cfeb-4c6e-98b4-d945f95383db@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6sl83KDxCPtkIpOtbE4vMDGqTTuXFubv
X-Proofpoint-ORIG-GUID: 6sl83KDxCPtkIpOtbE4vMDGqTTuXFubv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=724 suspectscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501090056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_230506_742589_075F70AF 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
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



On 2025/1/8 18:11, Anshuman Khandual wrote:
> Just wondering why not start with PUD level itself ? Although SUBSECTION_SHIFT
> might never reach the PUD level but this will help keep the flags calculations
> bit simple and ready for all future changes.
> 

I suppose that it's because these are significantly larger than 2M, 
whereas Catalin assumed SUBSECTION_SIZE would not increase?
His comment:
"should cover any changes to SUBSECTION_SHIFT making it *smaller* than 
2MB. "

> 	flags = 0;
>   	if (SUBSECTION_SHIFT < PUD_SHIFT)
>   		flags |= NO_PUD_BLOCK_MAPPINGS;
>   	if (SUBSECTION_SHIFT < CONT_PMD_SHIFT)
>   		flags |= NO_PMD_CONT_MAPPINGS;


