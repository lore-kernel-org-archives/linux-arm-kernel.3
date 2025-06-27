Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382AFC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFQsmDVr9Yex6/NIexKoaBq2lGE7hWQt1kKwMRyJes0=; b=jn4AsGiRIAQ2oflFzTxC6yE3e1
	uVlN/goKQcyrZlUQv2q8yCmr8sBMDLzy4k6IU9ujh4JtSqasxxvRAnDeXI6/fly2ZUVwgut5m7IEV
	pOYZ1YqZjLUFg7Yjc1BQWj+oSeOZU0HOAsgtjJrrjpTPM9BPz1LNgGokkGXWyoEaGmO8sCePwOHkQ
	NUNSSwnQLc+qd64F1Ov1lHcOWWQxK5hb5fsy+BbgS+S7ANoO9zvKBlDC1T4cICCADeUyVtMh7Iuyv
	6tOi+QK6eJGnd9oUr6OxlOe2cL2oSCDtaWBRP9SjhBU5xg88tW5M6EZfWq+U6zryFBEZFvJbVLq5I
	U50LjM0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVDCp-0000000FRfj-1P5Z;
	Fri, 27 Jun 2025 17:49:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVC6E-0000000FIuP-2PK2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 16:38:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 093AA1A00;
	Fri, 27 Jun 2025 09:38:33 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08C023F58B;
	Fri, 27 Jun 2025 09:38:48 -0700 (PDT)
Message-ID: <efa92bef-8bfb-431f-ac9e-048041ff13f6@arm.com>
Date: Fri, 27 Jun 2025 17:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] cacheinfo: Set cache 'id' based on DT data
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com,
 Ben Horgan <ben.horgan@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
 <CAL_JsqKD7yOxSnfnah2gE0EodtQ4KyJ2_qXmMu2oK9i6numzwA@mail.gmail.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <CAL_JsqKD7yOxSnfnah2gE0EodtQ4KyJ2_qXmMu2oK9i6numzwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_093850_651991_B46E6A86 
X-CRM114-Status: GOOD (  21.24  )
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

Hi Rob,

On 23/06/2025 16:05, Rob Herring wrote:
> On Fri, Jun 13, 2025 at 8:04 AM James Morse <james.morse@arm.com> wrote:
>>
>> This series adds support for cache-ids to device-tree systems.
>> These values are exposed to user-space via
>> /sys/devices/system/cpu/cpuX/cache/indexY/id
>> and are used to identify caches and their associated CPUs by kernel interfaces
>> such as resctrl.
>>
>> Resctrl anticipates cache-ids are unique for a given cache level, but may
>> be sparse. See Documentation/filesystems/resctrl.rst's "Cache IDs" section.
>>
>> Another user is PCIe's cache-steering hints, where an id provided by the
>> hardware would be needed. Today this expects a platform specific ACPI hook
>> the program that value into the PCIe root port registers. If DT platforms
>> are ever supported, it will likely need a kernel driver to convert the
>> user-space cache-id to whatever hardware value is needed.
>>
>> Rob H previously preferred to generate a cache-id from the information DT
>> already has. (Rob: does the PCIe cache-steering use-case change this?)

> I don't think so because who knows what values the PCI root port
> needs.

Some hardware specific value, that would have to come from the DT...


> It's never going to be the cache id directly since that is per level.

Can re-used across levels, but because they can also be sparse its equally valid for them
to be unique. This is what is happening on arm64 ACPI platforms.


> So we'd need some sort of mapping. That's going to be something
> like this:
> 
> Userspace level+id -> DT cache node -> PCI RP value
> 
> So the first translation is the same as you have here. The 2nd
> translation might be something we put in DT or could be in PCI host
> bridge driver.

ACPI currently requires some kernel interaction too as the value gets written to some
platform specific register. Even if it did get standardised, I guess something like VFIO
would manage access to that register to fix up the values.


Thanks,

James

