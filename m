Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E105ECAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 11:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sr+3TOUJGZkTvPdj5ni/KiW7FZ5zvFQ62TYrQkn+sAw=; b=Z/5WX9pmyTCazLsV96DlKWCTuq
	zeQzwTgys4mOqIf0pqZAnTqtpSN1enwoBjBxufJK3EUMjiIJY1urxJoIkS3poXqnKm4xVcVX08okJ
	HVRi6/lo5X9EV9LnGw58tKhP/6NAtf9vVsgCrKIS/tJdiO0tDZ5TRStZZNo11RZ1+jGaDiYV+1Egq
	buHiuUs4j9vEL8XDtSN7VmHILelVLd69O+NZQk/M/CyNC6+qx0RjVoa1di2c5T1hDbKtDHiHHb0/H
	N0Z0dxIzVfovkJS9RUc/iBY+EWFqQBfbZv+l0cVY+U6LRVjBWWmefT/ofvLPpmPX1ns1vqMt012zF
	fyGmhB4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1NeX-0000000GuId-2frw;
	Wed, 24 Sep 2025 11:27:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1NeU-0000000GuFg-03HH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 11:27:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B805106F;
	Wed, 24 Sep 2025 04:27:04 -0700 (PDT)
Received: from [10.57.1.72] (unknown [10.57.1.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA4F23F5A1;
	Wed, 24 Sep 2025 04:27:11 -0700 (PDT)
Message-ID: <4dfdf419-102f-4fab-8d58-4863dfe64167@arm.com>
Date: Wed, 24 Sep 2025 12:27:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [UPDATED] [GIT PULL] coresight: Updates for Linux v6.18
Content-Language: en-GB
To: Greg KH <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 james.clark@linaro.org, leo.yan@linux.dev, mike.leach@linaro.org
References: <2025092306-foster-outsource-fb07@gregkh>
 <20250924082242.2306143-1-suzuki.poulose@arm.com>
 <2025092446-spinout-paramount-a27b@gregkh>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <2025092446-spinout-paramount-a27b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_042714_093608_3997AD40 
X-CRM114-Status: GOOD (  15.46  )
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

On 24/09/2025 12:06, Greg KH wrote:
> On Wed, Sep 24, 2025 at 09:22:42AM +0100, Suzuki K Poulose wrote:
>> Hi Greg
>>
>> Please find the updated pull request to fix the invalid commit reference in
>> the fixes tag, in the original pull request [0]
>>
>> Apologies for the inconvenience.
>>
>> [0] https://lkml.kernel.org/r/20250922125907.2268152-1-suzuki.poulose@arm.com
>>
>> Kindly pull,
>>
>> Suzuki
>>
>> ---
>>
>> The following changes since commit 1b237f190eb3d36f52dffe07a40b5eb210280e00:
>>
>>    Linux 6.17-rc3 (2025-08-24 12:04:12 -0400)
>>
>> are available in the Git repository at:
>>
>>    git//git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v6.18-v2
> 
> That is not a valid "url" to pull from, how did you create this?

Dang! I did use the git request-pull, but have to manually replace the
"ssh" URL with git:// :-( and I messed up.

> 
> I've added the missing ':', but you might want to check your scripts to
> verify you aren't doing something odd.

Will take care of it, thanks.

Suzuki


