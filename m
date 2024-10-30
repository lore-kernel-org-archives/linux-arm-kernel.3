Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6FDD5CCA6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 12:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gF+3gfp5dbT+G1Ph7dID7VDXTSrRr3ClgxYxPHb04fY=; b=c9qZWrLaR5OMs2pA+qvEOcv2mn
	Xk6IKXdZ+Z1AyvgPCVBIRrfBQhpfD1/WSqbJxO1lPcA3ZX4bDJ+0V8ZYMh6XtUCtegB6u/o1KHG8A
	0dvE1gOG02gPrilz9yrDvxIiwU8xqkZve6sI13eHLAGJgk5HTQHHLH7V2mxZVsb8Ii6uXlVcCI+tm
	pYZ4CwPefegYPTgTIDKJkgdtSQohvdax9qVmKDdLENR8ir8TvBqu/5WEGbLoDEeDnc8KgJ6fFoyly
	ypalX/RTec1e4A5RT+ErlDsvZv56YIuIeQ7bKndc2/hTkpBIyQbNsL/c8t5zpJjkjZuJuh3X5Y4z/
	ImuyVVbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t68FR-00000000OOH-05OV;
	Wed, 30 Oct 2024 12:56:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t68Be-00000000NSt-1Xep
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 12:52:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UAiOVV008871;
	Wed, 30 Oct 2024 12:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gF+3gfp5dbT+G1Ph7dID7VDXTSrRr3ClgxYxPHb04fY=; b=HYbVbyAch/WMPDr2
	iQGaTkS1tpHhiKQRsP6zgv9yruuy78iK9OODcoUqykcmNnclCmDkBLOfDLciWhsE
	+pGL7qsX60lR/CW84A6voo3Q6ZVShNFO+aZC25aVNy3eT3h7al5K2/lLLVC1Zg2v
	lgtylT0dhFq6XshnBKcJLG5o7AkfhCLlT2W2xym5hlr79P51kKtzw7yVbpjKmfCP
	NFMfOKkRo0uCDA7ByZUboqZ21HJQ+QpLIa3vzVpSi7bma4sVGj0jVY1B0faBMYun
	JPipyGkLjER+61ZUQF0oJ5hqAt91fV5sm8jNrMHqcwMGeXvBGTsViAnBb3qVr9JR
	D8xHuQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42jxa8bud0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 12:52:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UCqO1s023019
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 12:52:24 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 05:52:18 -0700
Message-ID: <a1c14b44-c11a-9855-45a1-9a30fe40c01f@quicinc.com>
Date: Wed, 30 Oct 2024 18:22:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 3/4] pmdomain: core: Fix debugfs node creation failure
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
CC: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>,
        <ulf.hansson@linaro.org>, <jassisinghbrar@gmail.com>,
        <dmitry.baryshkov@linaro.org>, <linux-kernel@vger.kernel.org>,
        <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <konradybcio@kernel.org>,
        <linux-pm@vger.kernel.org>, <tstrudel@google.com>, <rafael@kernel.org>,
        Johan
 Hovold <johan+linaro@kernel.org>
References: <20241023102148.1698910-1-quic_sibis@quicinc.com>
 <20241023102148.1698910-4-quic_sibis@quicinc.com>
 <ZxuixxBzQZUdIW1c@hovoldconsulting.com>
 <72a0b7b5-4209-f969-0726-e411b5a74e01@quicinc.com>
 <ZxunIcSZDoO3ph64@hovoldconsulting.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <ZxunIcSZDoO3ph64@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gmUKxpxBdrgdJWBnvcj7Leuq-A80ZKjX
X-Proofpoint-ORIG-GUID: gmUKxpxBdrgdJWBnvcj7Leuq-A80ZKjX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 mlxlogscore=959 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_055234_445391_EC47F968 
X-CRM114-Status: GOOD (  12.94  )
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



On 10/25/24 19:41, Johan Hovold wrote:
> On Fri, Oct 25, 2024 at 07:36:16PM +0530, Sibi Sankar wrote:
>> On 10/25/24 19:23, Johan Hovold wrote:
> 
>>> Also seems to do the trick:
>>>
>>> Tested-by: Johan Hovold <johan+linaro@kernel.org>
>>>
>>> But perhaps you could consider starting enumerating the duplicate
>>> domains from 2 (or 1) instead of 0?:
>>>
>>> NCC_1                           on                              0
>>> NCC_0                           on                              0
>>> NCC                             on                              0
>>
>> We are just trying to make sure node names are unique and
>> can't ensure the pd-name correctness since ida starts its
>> number generation from 0 and I didn't want to shape the
>> fix just to cater to our specific case. The firmware fix
>> will be in charge of ensuring pd-name correctness.
> 
> Ah, it's a global number space? I didn't really look at the
> implementation...

Thanks for testing out the patch. Yes it was a global number
space but we are changing the implementation again in the next
re-spin. Please try that out instead.

-Sibi

> 
> Johan

