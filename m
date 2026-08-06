Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EA0C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 12:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFeS4PeRsayRYBFloMaxUiRltGFYekwWFXMQQcHkYoA=; b=mkUKfG9K1P4urwZ7qr62Mp1Fui
	UeCa/YSAuQVJLLis/BiK7hmRgg5DEpnD7wU0oLsLTS2S+oe86Qc3zOAdKPzKSJ8dy1IAz0uW6GWpA
	ah/ZlscIF01BeylUh5/8qeCSkLlXHCYQ/bS5i0hH7HT/DpzhyiYAa5tKxzFA8BjFHE/yo+OOJjgnW
	epx6VeKSNHf5gMd5HIGOUyPQpAWXJezXNIM2+583XLa1VCC0LUzqN9c0W2QwodZJyaNObufsTzN0b
	el8b7+oBp7GrwNUIjvH3/fCHrZb6b6BIC0XEXbp/TZPe9tAGUxftg+b6NHxUpqnF+n3i6b8VoW6S7
	a6s2Be8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxTO-00000005oaN-1LbL;
	Thu, 06 Aug 2026 12:45:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxTK-00000005oZr-3dXy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 12:45:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7C67153B;
	Thu,  6 Aug 2026 05:45:11 -0700 (PDT)
Received: from [10.57.42.103] (unknown [10.57.42.103])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1F573F632;
	Thu,  6 Aug 2026 05:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786020315; bh=Q4WngC6vmWdYNNtsq+E7FJuWMdZnTE5UpPG0PLI+Euk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tAbvYIYGBAe7EmP8CXWSdUthrp4THKN3QD6nqU2kYZjFHINLtdyIQ9X+2UK55cmeW
	 r+4ClisBpE5d0hpYEYvb3G6ZTUXNuRZ2AGOBipcxRBRMgyJyArJWgBpq5DDJZvmRCM
	 TMrRSucNJ5ART60Xwfpx8Oyi7in4Y2/3yeNze0/E=
Message-ID: <a2af089b-916e-46ec-9a59-8c4506279199@arm.com>
Date: Thu, 6 Aug 2026 13:45:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] perf/arm-cmn: Support CMN S3 r2
To: Will Deacon <will@kernel.org>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, ilkka@os.amperecomputing.com,
 leo.yan@arm.com
References: <cover.1785252273.git.robin.murphy@arm.com>
 <anR5CDq3efkXzgG6@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <anR5CDq3efkXzgG6@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_054519_045340_9A118287 
X-CRM114-Status: GOOD (  10.54  )
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

On 2026-08-06 1:07 pm, Will Deacon wrote:
> On Tue, Jul 28, 2026 at 04:59:20PM +0100, Robin Murphy wrote:
>> v1: https://lore.kernel.org/all/cover.1782830759.git.robin.murphy@arm.com/
>>
>> Hi all,
>>
>> Since nothing else has come up, this is a very minor respin to fix
>> the bisection nit that Leo spotted, and hopefully it's good to land?
> 
> Please can you check the comments from Sashiko?
> 
> https://sashiko.dev/#/patchset/cover.1785252273.git.robin.murphy@arm.com

I did, they're nonsense:

https://sashiko.dev/#/message/fe126e13-440b-4c0b-8e38-4dbcfd3f7846%40arm.com

Yes, the encoding machinery added in patch #4 in preparation for patch 
#5 isn't used until patch #5, shocker! That's why I even explicitly 
changed to title to "Plumb in...", in the hope that in the absence of 
logic, a language model might at least be able to follow language...

Cheers,
Robin.

