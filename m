Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0614CCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 13:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wzxu0EWI2kaKwB7R1TPSDkmRDLOU/vc/6W9NX0gtYU=; b=RitUTZGdn6S3/pfp2EyYkdud4Y
	83iCMIy9yxOtAsZF6M4PB9oRi2pCImDvdMmquinFG1IAU7q6oQoX9EHwLyTBckD+U2iLK0DWsnse9
	k+DSaIhEJnbLD8cQsN0TBEhMPba7BxF4/RX0e7IsaAoUqjhvtTpqATZAE0hhIseXeQSHroPhEioVV
	t+gUTPmPMuZD9v5Nh1pYewyBEtl2Udg3bnOuEzCeFyDiJP+HG2n5NQQCjK2QnLu/fvojobe1iJ4nT
	YfHkQOOTpbc/psJATdo+3ylXX0v9WLgnEM6omUgy1udOxboQCF2iitzWp9uQpkTtNXF075hheFXyb
	0J4UW+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiXa-0000000GVKM-2cc3;
	Mon, 05 Oct 2026 13:15:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiXX-0000000GVJY-4A8N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 13:15:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C187152B;
	Mon,  5 Oct 2026 06:15:31 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43B0C3F86F;
	Mon,  5 Oct 2026 06:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791206134; bh=m3tmSH0+leL7BS79iE/YdCgWfzPU9HDRqYcmSoRJD60=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KIoe/8CVD+wIe5QvHf9R7AMxlQqGiVNz0V7h5QPw/ZHk2OZsH79wmWEzt9Y1FfqzX
	 ZwsAJ3IoJNBq2cwafU4UjpJMqKW6zdpFuJFYIwSYCjQwsWSP+CbwK11PYGo8zrCCQa
	 FZMAltM8TzJtX3bWD+Hw3zF3f5wPv7kbo7+WdpbY=
Message-ID: <426110f0-0ef4-4f15-b68f-103a863df3aa@arm.com>
Date: Mon, 5 Oct 2026 14:15:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] perf: Add Arm Bus Monitor Unit driver
To: Will Deacon <will@kernel.org>
Cc: mark.rutland@arm.com, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <c936505c43275f434bce924b7657e42bfb25579c.1789652832.git.robin.murphy@arm.com>
 <asLO8rGQPYo3KhKB@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <asLO8rGQPYo3KhKB@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_061536_085879_02236E9C 
X-CRM114-Status: GOOD (  13.20  )
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

On 04/10/2026 11:10 pm, Will Deacon wrote:
> On Thu, Sep 17, 2026 at 02:47:12PM +0100, Robin Murphy wrote:
>> Arm's Bus Monitor Unit is a low-level performance analysis tool for
>> matching and counting transactions at interconnect interfaces. Each
>> BMU consists of a number of "interface monitoring units", with some
>> global controls to synchronise them and so permit accurate calculation
>> of cross-interface metrics. Each IMU contains, among other things, its
>> own PMU largely based on the CoreSight PMU architecture, but with some
>> functional incompatibilities due to the nature of how much per-event
>> filtering needs to be crammed in to categorise AXI/CHI transactions at
>> the protocol level. As such it gets an honorary home in arm_cspmu/ in
>> order to share the common register definitions, but for simplicity does
>> not try to bend the functional abstraction to fit.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>
>> ---
>> v3:
>>   - Couple of inconsequential tweaks to shut Sashiko up about things
>>     that would never actually happen anyway
>>   - Drop unneeded DT patches that I can't be bothered to fix right now
> 
> Please can you take a look at the Sashiko comments on this one?

I did start writing a reply at the time, but it was getting so sarcastic 
that even I thought better of sending it...

In (polite) summary:

1 - Gibberish
2 - Yes if firmware blatantly mis-describes the hardware then Linux may 
not work properly. Whoop de do.
3 - Yeah so?
4 - Pants-on-head gibberish, but the second part about COMPILE_TEST is 
fair (an oversight from ripping out the DT support) - fix is already in 
-next via the ACPI tree[1]
5 - Yeah so?
6,7 - Yes, welcome to perf...

Cheers,
Robin.

[1] 
https://lore.kernel.org/all/CAJZ5v0g4k6FhyQMypkRyVJMkSBUsmeuetJuxRA826PcA7Mo5Hg@mail.gmail.com/


