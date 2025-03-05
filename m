Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81948C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 06:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vR5VynfP4MVglQhLx/xAmD1yEZynwRM3f/t52ykQK4Q=; b=IqXIGfEey5N6SxLfVC7+AlmmTC
	nWK/QV86X4J92pNwvMkHq6OEL6GdlD1OyEfIWk7umkEr61iqFVyQ/AEm0sCoeGJH8O51nglMI2tq8
	2xYj3Omqh1avFr65XL6vlNU5bzlqFXfs0F36+s80QpIlcMaDtYm2GOtfvNQOk5M9t21f+EiXMa/3J
	uLV1tJBRVvasWdiVlho4VkzKtVoi9I90XFeDTaqvBsLnTtTw5LwFDH9duHaqLAIx84cHsxdWXfw4e
	a3qhjLVn/Cz7m8SMXM+hR0MjjUTZ7dj3jETIUWScEXNy4t9b8V70K0OGQ6GbFW+j/3aL+5ecD1oB0
	0qmDW/GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpiLa-000000078DT-1HZz;
	Wed, 05 Mar 2025 06:35:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpiIx-000000077tz-22r4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 06:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vR5VynfP4MVglQhLx/xAmD1yEZynwRM3f/t52ykQK4Q=; b=UPxck6g7jkU/ohz8Vxacmfk7uF
	NKAurabNkfsw1O9tpDnKijyhokgvhLVeuOM0L7H5BQeZQxN+F5JIJHnxURQt84KdV1OSb2t0q78Uf
	nL9+jlwGPXSOwN6F7+xGoOg8Q5IunFm3l1OEe3U7OTv3IizEwX83MMpO/f2jJl8mxaMvXDqwYTngp
	FtjBPfLDz+zzsOj2MoxHR+fjs5SPa8bu4oeIJUColgxvGHrnMbWSdfix8+iemxR8E/+RFazuNZnJh
	x/o7e4boaqQWOWr5QKhhjc4PEl5qYeEGnLfJ0TOrHIUBEG8TI+NS6cgZEP8kYeauyRiz0EKWnoQJN
	DT54xE8Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpiIu-00000004vrf-0rdp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 06:32:30 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NA2ow013456;
	Wed, 5 Mar 2025 06:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vR5VynfP4MVglQhLx/xAmD1y
	EZynwRM3f/t52ykQK4Q=; b=HJdg0bKfDTybGFJpxIX6r+WogBtZej/grWeD35eH
	dviuxMM/9vRp2Q1VYo3EZoSLXWOhX2EknEcWzvOMhNfpa/unahbuVbYbEOgk6y5k
	S4THXrjrfgYcJIXOUeUbR/q4mWJ3A1sd4FqUtalRvinnxc5qHZ9Hs2QJpy8DFkLQ
	U5xwAiEc+T5dWNKwm6Enkg1b1x0Fxl9trwtiSSmdXG7D3RlVtUvNoB83PndBYN43
	7yrndd00vahDSd+niYOcPhpKzaPlymb3z6OSWYpNRXwey/29bhGHsIMHRL+jPGjU
	hYgV8IB7bKFp6dpLfla8SLo5xnJGt344bYzMKlc0Wt7FlQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6wmabu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 06:32:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5256W4sK023404
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 06:32:04 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Mar 2025 22:32:01 -0800
Date: Wed, 5 Mar 2025 14:31:57 +0800
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: Jacky Bai <ping.bai@nxp.com>, <lpieralisi@kernel.org>,
        <sudeep.holla@arm.com>, <rafael@kernel.org>,
        <daniel.lezcano@linaro.org>, <james.morse@arm.com>, <d-gole@ti.com>
CC: <linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <khilman@baylibre.com>, <quic_tingweiz@quicinc.com>,
        <quic_yuanjiey@quicinc.com>
Subject: Re: [PATCH v2] cpuidle: psci: Init cpuidle only for present CPUs
Message-ID: <Z8fv3X0Pivh8zbMg@cse-cd02-lnx.ap.qualcomm.com>
References: <20241120103749.1450017-1-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241120103749.1450017-1-ping.bai@nxp.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EZcyQOmC c=1 sm=1 tr=0 ts=67c7efe6 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8 a=COk6AnOGAAAA:8
 a=AUesVnU23U_Rn2rDAs0A:9 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6VvIHP9KaiVo-V4QU2O9xtOWpq3H0psq
X-Proofpoint-ORIG-GUID: 6VvIHP9KaiVo-V4QU2O9xtOWpq3H0psq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=939 suspectscore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_063228_486430_5559C610 
X-CRM114-Status: GOOD (  20.30  )
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

On Wed, Nov 20, 2024 at 06:37:49PM +0800, Jacky Bai wrote:
> With 'nosmp' or 'maxcpus=0' boot command line parameters,
> the 'cpu_present_mask' may not be the same as 'cpu_possible_mask'.
> 
> In current psci cpuidle driver init, for_each_possible_cpu()
> is used to init the cpuidle for each possible CPU. but in
> drivers/base/cpu.c ->cpu_dev_register_generic(),
> for_each_present_cpu() is used to register cpu device for
> present CPUs.
> 
> When boot system with 'nosmp' or 'maxcpus=0', the cpuidle driver
> init failed due to no valid CPU device sysfs node for non-boot CPUs.
> 
> [ 0.182993] Failed to register cpuidle device for cpu1
> 
> Use for_each_present_cpu() to register cpuidle only for present
> CPUs.
> 
> Fixes: b0c69e1214bc ("drivers: base: Use present CPUs in GENERIC_CPU_DEVICES")
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> ---
>  drivers/cpuidle/cpuidle-psci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
> index 2562dc001fc1..00117e9b33e8 100644
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -410,7 +410,7 @@ static int psci_cpuidle_probe(struct platform_device *pdev)
>  	struct cpuidle_driver *drv;
>  	struct cpuidle_device *dev;
>  
> -	for_each_possible_cpu(cpu) {
> +	for_each_present_cpu(cpu) {
>  		ret = psci_idle_init_cpu(&pdev->dev, cpu);
>  		if (ret)
>  			goto out_fail;
> -- 
> 2.34.1
> 

Tested-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>

I meet the same problem, and I test your patch, it is good to me.

Thanks,
Yuanjie

