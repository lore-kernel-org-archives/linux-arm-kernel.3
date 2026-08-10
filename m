Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E19C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 19:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZEJAB0D4cI7WOfzn0l7UQBdQe/CDr7alyfQHY4iuJw=; b=d3Mx5smfMRa0ej3JzHwGEUe2uI
	ZiGw48Vk0xu0MuH42wwfNPR8RLXCXxlfzRbgBj0O+WT/OrQYPSghiOmd2Wtgo+kZTrSAxXPTdRNUq
	qe5JiaDnnaQ34oYB2kgeo0YoAOprCubB58cehhX7GfpWVpPYUj0JqPzbMB2qNyhFEYIJ2+yRGsSBf
	xM7aUDyRzQt04qm65zvP3LSdUXHdwZZ5sTVBDYU+H0Fzt4hWBRjSLbrLosoc5CbGc1eLZ8c03WwSA
	Ej9wDB6ZD56uxYUtgDO4XFqRQPCvUFongHOAho8LdBauOpm02eNojo6wVZYbaKwn5lbGJB98c5zS3
	aCfxeSLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtW5k-0000000Cmhg-2k2R;
	Mon, 10 Aug 2026 19:55:24 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtW5d-0000000Cmgu-2NEB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 19:55:23 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 7F34EEC004C;
	Mon, 10 Aug 2026 15:55:11 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 10 Aug 2026 15:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786391710;
	 x=1786478110; bh=EZEJAB0D4cI7WOfzn0l7UQBdQe/CDr7alyfQHY4iuJw=; b=
	gfWC5wNL8SX6Y6VMq+3ZH6aB20Qd2FAgyYfwbl3dJI/AXTJfwnnWwbJI9KkJn0Eo
	4AYNMdFXW/Wl3mnZfStOrXwho1M7eS7genL6j62IKzw+Cdn0bvsmNVDmZ7rb9DKG
	uiJNl96f1b1oa/fEPXuo4VAtrjKr0H9lHTO06FRtgjzyaKGxJ2yq/jdJgQ4sR3/4
	OcNTfB6Ttop6MPatOvIfQvSlAHlySVNPul0UmBoSXgIMY7BsAkbV/UVtOLlTY2le
	SdK9QvnTMwlPrySFMocZm0kDvNGVjn6bLsQFRir0Sl3tMhFUIC8SGkOEOp3Er6sd
	yaMvN8cOxIWHYLd4Z5qqpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786391710; x=
	1786478110; bh=EZEJAB0D4cI7WOfzn0l7UQBdQe/CDr7alyfQHY4iuJw=; b=L
	QFsCts8M4CKy+C7KG0xTinfJor2YKnYj+cMk30WfmgDtGlKxqqV1yn83diYg8T00
	tL6M7JbBIl8nGvjJhXUOYJDBFCyYrOHDQHgyE7Dvj6/Zzvcc01SCWYvckySMQ5bL
	/pzDkeYpU+QQFNEqezhtwfPN11dIVr5ZSnCU4OyjA+a6mHx8dylpcFv64Wl0Nzpv
	T+1etQq8v6x/FseG4GN8PF9+a02YZioBjCLWbD1BGFcvT1R3oJHWQiJYBIV9EV3h
	gSg2mQTr8ReIfJ45ly7mFvW1FX5gdchKJ1lZ/9B0Oqw4SaxEuf5WrPE48wD4wXXY
	RV5PFldkGdbgrDs1LcDXA==
X-ME-Sender: <xms:mSx6aj8-hPz8ea4Nr47-QVOo0lw6xq5el2ur-Q0HKTEzsP9l0z3tRQ>
    <xme:mSx6aqju3TOOyixYRF73cvYsRZWMEUf6HcnSAPzE7FjKq6PvI-vLukUl9SB4Y0nzy
    FRiS1iAaMuwo4o3Fxs02LuOnIDMii8CVohn8OJCgadVY2j85QhMqdA>
X-ME-Proxy-Cause: dmFkZTEJKuF5fWhW1gyV/QC+his3q3Afl0NTj9jIU7o6QBUvqUeOlcMV77s2OuaxvU+ILC
    Lg/8I1hsL7LRjFhgD2/Gp0EO89h9JfBgYyTz5aWKTJ3J5YYgbM8tvEZhg+EGl5n8uYTTyI
    POE3l9mmBEhwerIhvtfwL4rrzF96IyQySaSrSGpEYa/ZlX3Tev0d6jym3s+V0TDrJ70BP9
    ylz+yV0kePt+oB+45hn9Ig8wM7AXtz6CDSrt/nxhkGF42u6ChckG4q4xtUDMIr5QQwO25Y
    EgYnW2FMrLzSK7yuiyymwzMwNirFFbVax+reL9ZfORb7pi2jK4hf9twycidwwLrK1zSQtS
    xNAC7f5rPtAMG+1e9f3ie4XSGBTQC9Oa2aaZWOLxEdbBhYac2s1uirK9LNaPxDwuyC479Q
    LdBa0c/Bvd6cS7ahiMARjwV1OLizHjured5CinPlk1YHURMCaZQQ3TVJy+4a3nYW6pPIuO
    cEkTzg7dAXZOCRhhCDEx8yCnmwGc83bmXudzbJncobSxeUmZzqtFWdgOHh5OiiypGtvcNP
    ssgo0XWs1UWhv3ssXP4MOvqtGUlK+XXn6OEJTbU2y4i7K8hvmbZJSHFbbg9PpjWTKlGukh
    KLZEjCcczXi+vn/5A7LVX9547nvGYzMYmc4Vcu3nSx7rx9qhfrKD8yGa0GIA
X-ME-Proxy: <xmx:myx6aqgxi8oP6vuDcb0xzgOiVXrkS1eYykHvbNeCENSCbj0qkxLmdA>
    <xmx:myx6asg-YkgB7E7qIo_SH5atWBaA4DfD5ziXHzE9551Q59AQ-iNSZQ>
    <xmx:myx6aiIospucrG4jnbr1Myv0ILS5jgbx-orLSgvE2WItHBf5nAm4oQ>
    <xmx:myx6ajH8PdoPbFlR7reGDM2G2UhWU0hwM-BuYcSQI7u8dSSwwtFjZg>
    <xmx:nix6anpxnZgUBEVPdFQSrIlfufqxuzjGlRMpQv09dtHUP-sl_G6Gxgfe>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 84DA132A0066; Mon, 10 Aug 2026 15:55:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ATK9jC40M2-k
Date: Mon, 10 Aug 2026 21:54:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Summers" <kirkwood@davidjohnsummers.uk>, arm <arm@kernel.org>
Cc: "Andrew Lunn" <andrew@lunn.ch>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <abec4a63-11cd-4814-ae12-f1c89d07e9ad@app.fastmail.com>
In-Reply-To: <5cb9b531-29c3-4928-aba6-5f14560e046f@davidjohnsummers.uk>
References: <5cb9b531-29c3-4928-aba6-5f14560e046f@davidjohnsummers.uk>
Subject: Re: Marvell Kirkwood and the linux 7.1.5 kernel
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_125520_206916_B7BD8470 
X-CRM114-Status: GOOD (  20.53  )
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

On Mon, Aug 10, 2026, at 17:59, David Summers wrote:
> Hi All,
>
> I've an ancient nas I'm updating, that has Marvell Kirkwood core. I 
> recently updated to the 7.1.5 kernel, and now my kernel is hitting many 
> bugs, specifically:
>
>> [ 3.195064] BUG: using smp_processor_id() in preemptible [00000000] code: kworker/u4:1/49
>> [ 3.203374] caller is __flush_anon_page+0x28/0xd8
>> [ 3.208146] CPU: 0 UID: 0 PID: 49 Comm: kworker/u4:1 Not tainted 7.1.5-1-ARCH #3 PREEMPT 
>> [ 3.216370] Hardware name: Marvell Kirkwood (Flattened Device Tree)
>> [ 3.222666] Call trace: 
>> [ 3.222677] unwind_backtrace from show_stack+0x10/0x14
>> [ 3.230489] show_stack from dump_stack_lvl+0x38/0x48
>> [ 3.235573] dump_stack_lvl from check_preemption_disabled+0x104/0x118
>> [ 3.242139] check_preemption_disabled from __flush_anon_page+0x28/0xd8
>> [ 3.248791] __flush_anon_page from __get_user_pages+0x420/0x608
>> [ 3.254844] __get_user_pages from get_user_pages_remote+0xd0/0x404
>> [ 3.261148] get_user_pages_remote from get_arg_page+0x6c/0xec
>> [ 3.267025] get_arg_page from copy_string_kernel+0x98/0x194
>> [ 3.272720] copy_string_kernel from kernel_execve+0xa0/0x19c
>> [ 3.278501] kernel_execve from call_usermodehelper_exec_async+0x120/0x238
>> [ 3.285425] call_usermodehelper_exec_async from ret_from_fork+0x14/0x28
>> [ 3.292164] Exception stack(0xe0b2dfb0 to 0xe0b2dff8)
>> [ 3.297243] dfa0: 00000000 00000000 00000000 00000000
>> [ 3.305458] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>> [ 3.313672] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
>> 
> And this bug gets hit multiple times for each command run.
>
> I've tracked smp_processor_id() to linux/arch/arm/include/asm/smp.h 
> which contains:
>
> #define raw_smp_processor_id() (current_thread_info()->cpu)

Since you confirmed that CONFIG_SMP is disabled, we can tell
that this is not the location that caused the BUG() above,
instead the warning does come from lib/smp_processor_id.c when
CONFIG_DEBUG_PREEMPT is enabled, and this happens regardless of
CONFIG_SMP.

I think this most likely comes from this function:

static inline void vivt_flush_cache_pages(struct vm_area_struct *vma,
                unsigned long user_addr, unsigned long pfn, unsigned int nr)
{
        struct mm_struct *mm = vma->vm_mm;

        if (!mm || cpumask_test_cpu(smp_processor_id(), mm_cpumask(mm))) {
                unsigned long addr = user_addr & PAGE_MASK;
                __cpuc_flush_user_range(addr, addr + nr * PAGE_SIZE,
                                vma->vm_flags);
        }
}

which only gets called on uniprocessor Armv4/Armv5 systems with an
aliasing VIPT cache, and those are relatively rare.
smp_processor_id() checks that it is called in an atomic section
because the CPU might change under it on SMP kernels otherwise,
but __get_user_pages() is definitely not an atomic context.

I checked the same code path in linux-5.15 and I don't see any
changes that would explain why you did not see the same
issue earlier.

Can you try to turn off CONFIG_DEBUG_PREEMPT? The specific
warning here looks like a false positive since you can't get
there on an SMP system, but it may be that there are other
similar issues if you see a lot of different warnings.

       Arnd

