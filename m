Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA93C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 06:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfEMvjkhdcJKnNVbGfwBeQDZU9T5YnWpt4uzfWzHLWU=; b=GwkCTUjo0gv/lGFWjR1Yv2js/c
	1C3Q6wDOTWhSvxek0swYCTRW/kT/8hOxJzqWn85lJfyffMyzaJe3sjE2dbObsOFev92Qlstqc7Umm
	JKr2iNWXO++VMyB9ZX6caDAt087/BqsNDppHVP/kJpxwa7DZmjXBr0p0ZVFqxmP5fbIQ5BboMJWuW
	qBn2qg91MiMzgniUAtPclWjdTwiCLne4lJ/4jv/KXADx7pQJpyGrFUzwg/Z9qBd8bLngTokaKzz16
	OatkpJejRtmWXDPdh/BZE4Wd2hUhye3t6k4JDA9Q6FdXGm46XiKnnRnJYwQMXdMNDZvC3szDIvF57
	WVfB52YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1e15-0000000DpTN-01hr;
	Wed, 02 Sep 2026 06:00:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1e12-0000000DpSx-3arT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 06:00:10 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6825YTZK725966
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 06:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfEMvjkhdcJKnNVbGfwBeQDZU9T5YnWpt4uzfWzHLWU=; b=XhEs8iK+re31Euro
	SUs0TpWerwjDpmvXk7ZiOvEMayAIzQJOPWSxMt8i/0cKuleKojZaxHMrNTul1jPO
	b0CBxSanoTDi3Ff0CWiMdk7RI1/pMrUrh30aGAGf50kdGY0hcxrum1DRdTjFNJLm
	VQqhu/PGmevn0JB7rO5trUivKJtTt3CEla01952rJ0cuTheTXhQa7tqf9ZT0a6WG
	zPnqq+kNIp4EGv+JLNXAa0eh4ngY1Wap+MbdImhoQblVNAVMEVWEx+MYuCdy4C0J
	LTp4EhCQgYMZ9KIcZI3INiP8nxruA5MdeFjOH8lj58f+sIdZIa4ACEerWkfXPVjh
	SoGcJg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge38w2bjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 06:00:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso1043204a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 23:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788328806; x=1788933606; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfEMvjkhdcJKnNVbGfwBeQDZU9T5YnWpt4uzfWzHLWU=;
        b=ZRpjjuiOI2AoP+zETaItIWPdeIHQm/whwHoJGHtnKGivgwCBht/YDeRfOEi08Gr0fa
         gEFJSlwDw1yNKMjbUi07RJwEkL0dWx/096wl1q9QzKgNLH/QmFFPlb/t/EBgerkiizO6
         IybYbxwnktRawZXCLPVYYdXK73IBYp2hB9szeNv7DZeXixKpi2VOp7WvqYnUTT7CrgrO
         uyZUH2qWQ5KALSlbdNbl3gPv7RVM0BSMRc+YEVUr6+vDLv0Dr9cFJ9mzoT9JDxomxli+
         UxnFSlagaHI6zCMSA8IynqB8BayQKLTIlIlCgLWqnobQ5rNQMx4y3KJAjFEdyesMtC7O
         dxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788328806; x=1788933606;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfEMvjkhdcJKnNVbGfwBeQDZU9T5YnWpt4uzfWzHLWU=;
        b=FJztt28Poh8SW9Huqk2rDTi+YpA9TJtu8EUNZplodFKsLfWNgIdOfiFbKJBryVHW6R
         aY+PTW/Z7bmvq8Z6nau2+Yllb3Ho+usM6psThFvc/0gYYtlcD/SQUMKsObGQ2LmCXk86
         rwFt4p44rpMd3zldNdporefLT6lTmcU1ECFGKL5CZsB9Hs0uO//58kGuor6fpxbqMw+1
         wgteJwQydg7sf8VO5P2IiFNNgxik4/I56L0nM2hrpeYRN4XOFIB8ymnAQDPQDEyd/IJ4
         Q++z6y0DAPW5I/JzvdeY+bykil6ObWwerZIY+H+swbt3kpr0SZiPMz1GvH4Ebn+3nMC8
         P+wg==
X-Forwarded-Encrypted: i=1; AKwUvBz3qPsq4U7gqLyC8VCYXqRRKW1Huc1iQCQlCowCV+CMszJ6qp2aBRY5r2dyjbAi9VZPGZ42leaCD33O9qAjhaGJ@lists.infradead.org
X-Gm-Message-State: AFuF++mVKJTNsmBEYNYFB19u+BVK5buh4DCxgshIA3d6+fCH8wyDJa+U
	Cxz8H4rUuovdgCAzD5LQfTXoGKlKmrrkG9nOvG5x/eia2hDHzf0d7eu6jKSGd6jyLwjfmw0YSIs
	vnEK5MOCizk+reomES+pabeXV0K4TnleGhLQ/y//DkapnpXEDcuUsIJfNTr9dnbOj3naOury++4
	BRGA==
X-Gm-Gg: AYBFou1lHIUlKU7I6FuhCUSgQXr+wx2LjIevNl8Z6kYiksDW82IrvoW8Aq2hKtGMxBz
	W6I4Zhu0bwmrKWPYgmU5NUkP3UIbqgFeTMVT6fNIzdtBFcAfo/raOXif+YREmCuIQn316Y0lGHw
	+u5h75hdPoCXQAD5nW8XdRHOP7XuwKfndKu+dM6Py0gz2c65loO1Ul5EWCZd1IvSSFSOtNdLpLl
	6P9DQG4BMYJPG0anh+4LdVPch0kBzWyDAit+wUXC72xPgnoLTQ4S0sEqsUaPM1dGGG3EI3VbhZI
	pN/m2yfLriPBziA9IC///pCCA1ToxMv4Hope3iWPdqNSeCKb7zjehegRTTGD/zTBYfpYt+AsjaM
	elnmU/IdxvLruLmFjrE0F
X-Received: by 2002:a17:90b:4c41:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39aedfb9a24mr2873947a91.10.1788328805554;
        Tue, 01 Sep 2026 23:00:05 -0700 (PDT)
X-Received: by 2002:a17:90b:4c41:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39aedfb9a24mr2873886a91.10.1788328804870;
        Tue, 01 Sep 2026 23:00:04 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0f2a315sm3878760a91.8.2026.09.01.23.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:00:04 -0700 (PDT)
Message-ID: <1b5ac53d-61f5-4623-aac0-3640851a3133@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 14:00:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix trace ID search skipping pass-through NoC
 devices
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Richard Cheng <icheng@nvidia.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260817-fix-trace-id-assign-issue-v1-1-b2164e33f9fa@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260817-fix-trace-id-assign-issue-v1-1-b2164e33f9fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: l-s2ZsXTZj6wGNxkDf83QenfUmEhx1bt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX7uHWq7zRwTN9
 FCV/85jDyIXDNBHwrl3FyBFRff23iRzjsrj5jVm3YdWAYPoSsWdl210Jgla+iILABsTGlbfcYXZ
 VYu/X0IqYg8Egg1fHfDMIDii40MEt9s=
X-Authority-Analysis: v=2.4 cv=LOpWhpW9 c=1 sm=1 tr=0 ts=6a97bb66 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1rTBPEPs6ENoEJvntSoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: l-s2ZsXTZj6wGNxkDf83QenfUmEhx1bt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX8vt+mnl+WdGs
 ul3mpcaaqy5AJ1gSLIBa23iHoxXPs3eQ36mlZEPpRHusnL3uvfW38Dl+0Dx/uP53HOXHdmGFBk9
 oJnUnKkYsmV5PGUoGgl1j0dUGnpwJluBMUfIb8waAQRFDeIlGMgOdxngmXyTFHeoRu3ChnrXj4v
 NOz3bVD8Cdf6nqv5gNWMO4xaHpYndoskJtJhL3JrknKTUZSNGBl2N17U3gWiKUM+dym8dCXdU/T
 ZsWWm21Rus7an536DqvvE9qKqbL6ce9qT6YZk0gdgHN3ShjdP7N8NpaHGcVMjHxVrxRxYfyJOGW
 eAKZ9/V0wQYrFQFpAqIbbCzSWegqHUrmKogY5zydRVsXXz9Ya53GRbWqInivKUSE+CiRtvSgL39
 +Tmb5B2o1OcV06D8t13mu3zxvmlt0Lx41Ajyz2uD+Hdya722axGvFx234e3gkn/u9pvx+poO8s4
 xTc0FkfbyL2uSuCohSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_230009_042103_1E4C4208 
X-CRM114-Status: GOOD (  26.37  )
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



On 8/17/2026 4:50 PM, Jie Gan wrote:
> coresight_path_assign_trace_id() only treats a trace_id of 0 as "this
> device has no ID assignment, keep searching downstream". Pass-through
> NoC links such as itnoc (qcom,coresight-itnoc) intentionally return
> -EOPNOTSUPP from their .trace_id callback since they have no ATID
> register to program, but that negative value falls through to the
> IS_VALID_CS_TRACE_ID() check and is rejected, aborting the whole path
> with -EINVAL before the real trace ID owner further downstream is
> ever reached.
> 

Gentle reminder

> This breaks enabling any source whose path traverses an itnoc, e.g.
> writing 1 to tpdm/enable_source for a TPDM fails with:
> 
>    sh: write error: Invalid argument
> 
> Skip devices that return -EOPNOTSUPP the same way as devices that
> return 0, so the search continues to the next device on the path.
> 
> Fixes: f4526ffee6ff ("coresight: fix missing error code when trace ID is invalid")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 6d65c43d574f..949ee9f00097 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -953,8 +953,12 @@ int coresight_path_assign_trace_id(struct coresight_path *path,
>   		/* Assign a trace ID to the path for the first device that wants to do it */
>   		trace_id = coresight_get_trace_id(nd->csdev, mode, sink);
>   
> -		/* 0 means the device has no ID assignment, so keep searching */
> -		if (trace_id == 0)
> +		/*
> +		 * 0 means the device has no ID assignment, and -EOPNOTSUPP
> +		 * means the device explicitly declines to assign one (e.g. a
> +		 * pass-through NoC) - in both cases keep searching downstream.
> +		 */
> +		if (trace_id == 0 || trace_id == -EOPNOTSUPP)
>   			continue;
>   
>   		if (!IS_VALID_CS_TRACE_ID(trace_id))
> 
> ---
> base-commit: 4477a78374a57c3809b172ad30cceabda48c47c6
> change-id: 20260817-fix-trace-id-assign-issue-d269e90d1c62
> 
> Best regards,


