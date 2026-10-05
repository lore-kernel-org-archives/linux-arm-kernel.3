Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C791CCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 12:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gSC8BWgYbWrAg0Kx9BnmmGYI/8F5QnU2tOw3NoHWuA=; b=QfWR5vlU8UTlyZNiAPi8qCPG5l
	wteXff9Yww7Ouffb6mQqi8LaWLx1LLgCOeAIGKVyBSERg2Z/nCJgFauCi+Io52BJ6W0ZNXPt0ZHz6
	eM6SVhifyJNcM0mqfIlhb9TmmnkSAhEE+0OVwOWbk80R03CPwXMujq2SS9GqNB7+BG/j+4ij8i7rA
	182CzzO6rESHlJ4Z4YVm2pxa1CkW0osMftwb3QTf0rgsRAxfOgWH9oc1c9FLKwf4UeH540j7i3VdQ
	8+s1EXOpan8oOEJKoVHKQrTYiUqDVUZBQ+Y/jC+h4ODUKcl59Ep6nzi4+irw5RB6M8GjScogf+UQx
	Adft5TCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhox-0000000GOzm-0ulP;
	Mon, 05 Oct 2026 12:29:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhou-0000000GOzL-1Bwk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 12:29:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A8FE152B;
	Mon,  5 Oct 2026 05:29:21 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54FBF3F86F;
	Mon,  5 Oct 2026 05:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791203364; bh=kvuyZYEDNj0i1sF9V+F8wbBxaj7cf+K5/6Sca5BzRlw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PA/TilmzGf/fTGgNQJNQeV9G4+0zdmbfhEfA1URx62ZNN5JO9GjxBe2vOCPMwaUdh
	 65SSW3CAUb3N0zWPGdGbCyIoVv4BbfVazoF8dfskgQ+eDvfuEWz+wCJpmUCyCUcOTY
	 2n/9+vDBIBqyeUKVYreZxeX9H8Ptew+9Y8NoR2OQ=
Message-ID: <a44431a4-7a4e-4dea-b313-e769ecd55fad@arm.com>
Date: Mon, 5 Oct 2026 13:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/arm_cspmu: Add Arm system PMU
To: Will Deacon <will@kernel.org>
Cc: mark.rutland@arm.com, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <84a65061841c8870375ee6b0621dd3f61651763d.1788970980.git.robin.murphy@arm.com>
 <asKMMAvyAbT5mGJd@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <asKMMAvyAbT5mGJd@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_052928_403496_0968A30C 
X-CRM114-Status: GOOD (  14.01  )
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

On 04/10/2026 6:26 pm, Will Deacon wrote:
> On Wed, Sep 09, 2026 at 05:23:00PM +0100, Robin Murphy wrote:
>> Arm's latest Compute Subsystems and SoCs are using a common PMU block
>> in various places which can mostly just be driven as a generic 64-bit
>> CoreSight PMU, but does have an IMP-DEF register for additional
>> filtering. The details of event and filter encodings depend on the
>> particular PMU instance, so are left to the higher level Arm Telemetry
>> Solution tooling.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/perf/arm_cspmu/Kconfig      |  7 +++
>>   drivers/perf/arm_cspmu/Makefile     |  1 +
>>   drivers/perf/arm_cspmu/arm_cspmu.c  |  7 +++
>>   drivers/perf/arm_cspmu/arm_cspmu.h  |  1 +
>>   drivers/perf/arm_cspmu/arm_syspmu.c | 67 +++++++++++++++++++++++++++++
>>   5 files changed, 83 insertions(+)
>>   create mode 100644 drivers/perf/arm_cspmu/arm_syspmu.c
> 
> Sashiko failed to apply this and so did I :/
> 
> What is it based on?

Ah, sorry, I sent this straight off my local branch where it's on top of 
the BMU patches - clearly I forgot to consider that that would mean some 
context conflicts in the Kconfig and Makefile. I can resend if that's 
easiest.

Cheers,
Robin.

