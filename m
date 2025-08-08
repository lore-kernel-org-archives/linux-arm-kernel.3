Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F261BC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 07:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tg5QwGjB360r4p6Qr8WTAhPi9SfBNexyRnwIOPWGlzg=; b=WLRDzxqDNYOpC625B3Q+wkL5vF
	s9nS8PyM0rV0De+zD9wJcpUzkRkN1oJbPHtmT29HfWq/E6IL96IDKBExfbWRR08X4L1EgkC0pZ75u
	J4JrzbZ7oV6uYNe/nFkzxcy/xzgFS8nNqXM7oK58Dzz+xl/azhIuzMI0hvnv26JkWPS07AQgfwkL/
	ZFJd0b1Geh+QnrmTrZfSO1Iq0HsZL+njXrmTk+lDvigIctKKncodAw76DrYBDgyzqN0AdXyrt0lmT
	4gGEqBARHG0KlQSEos7Z3XrC6+RbhwLikbbNzZPWUqQLqjSUKXmmszul7LQNq5PQUB9SbjkzvupUv
	aYQ5/Tjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHmK-00000002F0L-1gq1;
	Fri, 08 Aug 2025 07:44:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHSL-00000002BWO-1f6Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 07:24:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A21B22EA;
	Fri,  8 Aug 2025 00:23:52 -0700 (PDT)
Received: from [10.57.5.99] (unknown [10.57.5.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30E133F673;
	Fri,  8 Aug 2025 00:23:54 -0700 (PDT)
Message-ID: <7f2b31e1-34ea-4207-bbdb-e83f7a147107@arm.com>
Date: Fri, 8 Aug 2025 08:23:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/36] arm_mpam: Add basic mpam driver
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
 Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250801170930.000051fe@huawei.com>
Content-Language: en-US
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250801170930.000051fe@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_002401_490696_F579B4C5 
X-CRM114-Status: GOOD (  20.20  )
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

Hi Jonathan,

On 01/08/2025 17:09, Jonathan Cameron wrote:
> On Fri, 11 Jul 2025 18:36:12 +0000
> James Morse <james.morse@arm.com> wrote:
>> This is just enough MPAM driver for the ACPI and DT pre-requisites.
>> It doesn't contain any of the resctrl code, meaning you can't actually drive it
>> from user-space yet.

[..]

> Whilst I get that this is minimal, I was a bit surprised that it doesn't
> contain enough to have the driver actually bind to the platform devices
> I think that needs the CPU hotplug handler to register a requester.
> So about another 4 arch patches from your tree.  Maybe you can shuffle
> things around to help with that.

Ah, I hadn't spotted that. The register-requestor code should only serve to
reduce the available PARTID - just in case the CPUs support less than the
cache hierarchy.
It's likely its the 'system_supports_mpam()' that prevents the driver being
registered. I'll move that into the arm64 patches - its needed so any id
register overrides in the CPU knock out the driver too.


> That makes this a pain to test in isolation.
> 
> Given desire to poke the corners, I'm rebasing the old QEMU emulation and
> will poke it some more.  Now we are getting close to upstream kernel support
> maybe I'll even clean that up for potential upstream QEMU.
> 
> For bonus points I 'could' hook it up to the cache simulator and actually
> generate real 'counts' but that's probably more for fun than because it's
> useful. Fake numbers are a lot cheaper to get.

I've not found a good source of fake numbers to use. Ideally it would just
increment whenever the task was scheduled - but I've found that hard to hack
that up in linux.
I fall back to reading the counters instead of the MPAM registers ... but its
hard to test for overflow or double counting with that.


Thanks,

James

