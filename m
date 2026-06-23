Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C993CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 09:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdWOsNB74PTKDnwvkQGpZxzYzxlHNDoCbSDW+1a9eiQ=; b=FegD3pqC5X8kmgl2ta8o8KBrVj
	0UDNAlV7bHuKIDoKfhWPZ0JGkIb1oezbE/tHjvsbQDgSrqdW61QjpnUsYTtN/0iG8rIKXPjH/3jrE
	9NfypeIwlRcwZVlYQ97k4hXuqPeeQOSLDRS13qlBFNQGstq5chEuwg1jlSt58VhDPz7oLaok4Jg0I
	E2DsgQ28pO/LPpVBhpb1d9Vek1N+L8+6NClLN+c2kgyC5VCKcm9W49/cRUFjFrwVeom6ZMeBTVQQ8
	iWNY2nSr6bYtEBaIRufn5iiC8U3RT3GpF9GTJfswTy6A9e3uUQckxR0UyrS2YzrKgUkkZZ0yAuQcd
	dw1vp28g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxoe-000000062eD-3LWL;
	Tue, 23 Jun 2026 09:53:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxoX-000000062cG-1kgV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 09:53:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cma13564124;
	Tue, 23 Jun 2026 09:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MdWOsNB74PTKDnwvkQGpZxzYzxlHNDoCbSDW+1a9eiQ=; b=Q4TtjG+E2HKtlNJV
	f/2I95xoEUlVza0dFOG9qIOalqCzSkf7OyOz1/oULAybmTA2XQy81TvU6W+SzjNX
	HaNeKfIKkYdoRPSuVk05k+GwW55KPwC9DXpesIcpUn0YN3+za98TAv2oTmA8iEjv
	QzHOvXPrj93dHggufPM2uSuktTHTXPtUN+U8KQdtG6Qr4DWoGV785ezckntJNfJ6
	xTwJ6I2hoCiJwP4RbWGusnhr9fcqELPAsPHD2bBj01EW7RTZuYh9Dp2PCWoQh9UK
	olq36amUoMlwhwVe1gsJ+3HuhO6vNa2NL8X9/zYHvi/FOyNV4xt0KhuBtIXlV/hC
	VOzQ2Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n445hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 09:52:57 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 65N9qud3009399
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 09:52:56 GMT
Received: from [10.233.71.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 23 Jun
 2026 02:52:54 -0700
Message-ID: <b20f7186-20b8-4f81-a572-c282225c5d4d@quicinc.com>
Date: Tue, 23 Jun 2026 17:52:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/5] Add Qualcomm extended CTI support
To: Leo Yan <leo.yan@arm.com>, Yingchao Deng <yingchao.deng@oss.qualcomm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>, <jie.gan@oss.qualcomm.com>,
        Yingchao Deng <quic_yingdeng@quicinc.com>
References: <20260615-extended_cti-v10-0-1c1694b6d8ed@oss.qualcomm.com>
 <20260623090432.GG31870@e132581.arm.com>
Content-Language: en-US
From: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
In-Reply-To: <20260623090432.GG31870@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3OSBTYWx0ZWRfX0RHEK4hDyulp
 aCPTx+Oq2fV+k0NJaplNYfMdZPglrwdpHLAG5PYYHIuuM9k2df4jsPB81RxJLNARrUBZwf09ZGC
 O9/rPtOiHSqOOhIu4roc7nOLN5hRzQY=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a577a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=xHOLy-DW91tEOpoVtToA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: p8u8y9y4TC_ivJCv6FsqejFWA6TbcIef
X-Proofpoint-GUID: p8u8y9y4TC_ivJCv6FsqejFWA6TbcIef
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3OSBTYWx0ZWRfX2JhhlzNmu68/
 OGFrYvSDGGp89NsPNL7jm4lRrJsJCVDJjpVQyAUb/zinBRJlWkY/WEud5bxFcjoSSsC7W3OlNDE
 si7qN28GYRbSesisBuT7BXVMX92QmxBvkZXHnPZOgPa/tObQ36LgelSwKn0RPa8QpnDG4CxAy5u
 gBEzd5nCIsaU3H/1NRcMnGUHiFjEZJxyiupXcBAEEuuLmMwaOQRkWGO1aXg2lrsXvQG66003JKO
 5ORmhbkYUhcoe75ip8yZExyG366GHP7LAjvTzWyzeU9LlNpWZiOLqNtgR4TVouELT23KXjMbFi+
 28OZWmAcH8W3fk16QK41mhhBWU0e7MHRmK0O2dbzXpK4jd07bWZt+nkYd9dJ/rl6qzgqGmxZFM8
 7xkFX/Ock4X4Hkmo/8NXUtglE5vcTqQXct4p84z7VuCECxwPfwScifYyCNUnmq4VuMGTKOhSG1G
 lsmxJeSccoYrCALByBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_025305_604953_49724641 
X-CRM114-Status: GOOD (  13.62  )
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


On 6/23/2026 5:04 PM, Leo Yan wrote:
> This series looks good to me and I tested:
>
>    - Confirmed no any change for standard CTI;
>    - Perf command;
>    - Build bisection.
>
> Tested-by: Leo Yan<leo.yan@arm.com>
>
> Mike may also want to take a look in case there is any overlap with his
> claim tags init patch [1]. I don't have a strong preference on which
> series goes in first, as the claim tag handling in this series looks
> clean enough to me.
>
> @Yingchao, just a small suggestion: rc1–rc4 is usually the best window
> for getting patches merged. If you receive comments and are able to
> address them quickly, it may be worth respin patches during that
> period to try catching the next merge window. This is no guarantees,
> just thought it might be useful to share as a general tip 🙂
Thanks Leo for testing and the helpful suggestion.

Thanks,
Yingchao



