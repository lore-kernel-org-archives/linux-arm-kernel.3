Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ED2C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 09:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vhtf+O6571L5NvCf+/lUYx3qGvG7r+/V8Hl09YPXGb8=; b=w4XoD1vkeBs70w6cxwJBUIAFj4
	AQDhFOek91lGg9LyZlqGprNPrOzrBNgirNn8iINmiPk/F0rIsL9eOzY9/QGdUusdFrYvFIC0xuMVL
	YF5oqIsqy9aRhxqFg9loWDHq6dTXBKxhiSEjPuXu+OjD9paxvSXZUqFD8AGsQebAC/vz8G4bbTuCD
	nIUPYDJ5037K0bP5rQ2nvjQZxljNWoBaTBnVf1wfmnr0j7flnHz3M5uJQOIIEIejNxE29W127IlJx
	EEyaJSGYS7NIgd/ysDYRTVeFmdCoMIm2NTxnCxAwulZer3V1hv4PJBmqwvTETmMWHdI8WwZ+tTJxC
	Mlp5FBuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7FM-000000021j0-05YK;
	Mon, 17 Mar 2025 09:59:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7DM-000000021JO-1jnp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 09:56:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34AF413D5;
	Mon, 17 Mar 2025 02:57:04 -0700 (PDT)
Received: from [172.18.154.215] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AB1E3F673;
	Mon, 17 Mar 2025 02:56:48 -0700 (PDT)
Message-ID: <2bd3aa0a-d700-46bf-81d1-a5fb0364d1e0@arm.com>
Date: Mon, 17 Mar 2025 10:56:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/4] arch_topology: Support SMT control for OF based
 system
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, sudeep.holla@arm.com, tglx@linutronix.de,
 peterz@infradead.org, mpe@ellerman.id.au,
 linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, pierre.gondois@arm.com
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 xuwei5@huawei.com, guohanjun@huawei.com, sshegde@linux.ibm.com
References: <20250311075143.61078-1-yangyicong@huawei.com>
 <20250311075143.61078-3-yangyicong@huawei.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <20250311075143.61078-3-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_025656_562596_26247875 
X-CRM114-Status: GOOD (  11.36  )
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

On 11/03/2025 08:51, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> On building the topology from the devicetree, we've already gotten the
> SMT thread number of each core. Update the largest SMT thread number
> and enable the SMT control by the end of topology parsing.
> 
> The framework's SMT control provides two interface to the users [1]
> through /sys/devices/system/cpu/smt/control:
> 1) enable SMT by writing "on" and disable by "off"
> 2) enable SMT by writing max_thread_number or disable by writing 1
> 
> Both method support to completely disable/enable the SMT cores so both
> work correctly for symmetric SMT platform and asymmetric platform with
> non-SMT and one type SMT cores like:
> core A: 1 thread
> core B: X (X!=1) threads
> 
> Note that for a theoretically possible multiple SMT-X (X>1) core
> platform the SMT control is also supported as expected but only
> by writing the "on/off" method.

Here we still have a little misunderstanding. IMHO, even on such a
system 2) would work too.

My qemu example with SMT-1, SMT-2 and SMT-4 in one system from your v11:

# cat /proc/schedstat | grep -v "^v\|^t" | awk '{print $1" "$2" "$3}'
cpu0 0 0
domain0 MC ff
cpu1 0 0
domain0 MC ff
cpu2 0 0
domain0 SMT 0c
domain1 MC ff
cpu3 0 0
domain0 SMT 0c
domain1 MC ff
cpu4 0 0
domain0 SMT f0
domain1 MC ff
cpu5 0 0
domain0 SMT f0
domain1 MC ff
cpu6 0 0
domain0 SMT f0
domain1 MC ff
cpu7 0 0
domain0 SMT f0
domain1 MC ff

# cat /proc/cpuinfo | grep ^processor
processor	: 0
processor	: 1
processor	: 2
processor	: 3
processor	: 4
processor	: 5
processor	: 6
processor	: 7

# echo 1 > /sys/devices/system/cpu/smt/control

# cat /proc/cpuinfo | grep ^processor
processor	: 0
processor	: 1
processor	: 2
processor	: 4

# echo 4 > /sys/devices/system/cpu/smt/control

# cat /proc/cpuinfo | grep ^processor
processor	: 0
processor	: 1
processor	: 2
processor	: 3
processor	: 4
processor	: 5
processor	: 6
processor	: 7

Whats doesn't work is to echoing a '2' but that's not
'max_thread_number' of the system.

[...]

