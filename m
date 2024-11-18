Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDC4D49231
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 15:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnU5XTK5tf6lmEyuvaB0LJLpKJLlqNbSBa2n1XEH/NY=; b=VtBK2tDCD6gJ3WJJaEJfNtftKK
	wuGDagkGH0QEqMr7OPvWKz/g2Coz5rj5ttbNWhqsvAZJ6yewppWPlk/CyZRan99kx0A/LMhToFB8y
	U117s2ojXskgj0ZgvyqA3ag4WAgA7hfzRD2R882lcJhnUfdv69deB6dGozlnAqEVhjfwX+ITmosra
	lU4l+3UROU1oKiNkuU9AXpn38eI72RYnr/JX0Y/wyZ4J4+ZXMC7EDnNRsRgmsUjy9v4r4/p80EiAR
	YnQtbo2hGx4IZD0P6E2yInM79s8c4yqJIJw8+scTGsFnAkIPKw3qOZ25R4JzjxcHqWAu3aNOiEYyI
	y/qtHIdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3cR-00000009uxl-1iXR;
	Mon, 18 Nov 2024 15:24:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3bV-00000009umI-0xuJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 15:23:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83A95165C;
	Mon, 18 Nov 2024 07:24:22 -0800 (PST)
Received: from [10.57.89.219] (unknown [10.57.89.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4ED6E3F5A1;
	Mon, 18 Nov 2024 07:23:49 -0800 (PST)
Message-ID: <9e04fa8f-7c08-49a9-9647-f8d1f183ffcf@arm.com>
Date: Mon, 18 Nov 2024 15:23:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] perf: arm-ni: Remove spurious NULL in attribute_group
 definition
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org
References: <20241118-sysfs-const-attribute_group-fixes-v1-0-48e0b0ad8cba@weissschuh.net>
 <20241118-sysfs-const-attribute_group-fixes-v1-1-48e0b0ad8cba@weissschuh.net>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241118-sysfs-const-attribute_group-fixes-v1-1-48e0b0ad8cba@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_072353_306409_7CD850E9 
X-CRM114-Status: GOOD (  16.25  )
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

On 2024-11-18 3:02 pm, Thomas Weißschuh wrote:
> This NULL value is most-likely a copy-paste error from an array
> definition. So far the NULL didn't have any effect.
> As there will be a union in struct attribute_group at this location,
> it will trigger a compiler warning.

Acked-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>   drivers/perf/arm-ni.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
> index 90fcfe693439ef3e18e23c6351433ac3c5ea78b5..fd7a5e60e96302fada29cd44e7bf9c582e93e4ce 100644
> --- a/drivers/perf/arm-ni.c
> +++ b/drivers/perf/arm-ni.c
> @@ -247,7 +247,6 @@ static struct attribute *arm_ni_other_attrs[] = {
>   
>   static const struct attribute_group arm_ni_other_attr_group = {
>   	.attrs = arm_ni_other_attrs,
> -	NULL
>   };
>   
>   static const struct attribute_group *arm_ni_attr_groups[] = {
> 


