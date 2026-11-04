Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D789606D80B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 19:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GjbXtoOh;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KhCF2oMx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=57vfrI08RU+BjdVlt6HNqo3GZbH4J3dGXlSjxWrO5dY=; b=GjbXtoOhNiFfso
	z3mBNPOIR9q7jMZcXVX33PLAhMl/XYYZe+rqj0qfFF2VWXqw0v0NS+S2iSPakkc3FFWikOY7QJ/8H
	hzri9F69ZqaAlbMimu3KvjJ2kudpDj+g5gQuwJVeMVOtgGFdxAFbjLNdn7Q5uWuyvgtm8+8kTXBch
	pcepiedgCtC3ubXM/DO/5aS/kMMAuHVhNbK9IZJ01rf+JQhaU9C/VZlFY0tuNsia6BhkHAsJ1Oa5k
	sxvKu+K0D4ONZBqlGE72kXXz8/r199YSSOu3D2d5qSLWf3d15GvHDikMOF8KcBSPV+TmYS+MW8KnM
	lc3Q+5/xJhfo3Ug80LFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOh7k-00000006p6N-2oa3;
	Wed, 04 Nov 2026 19:58:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOh7k-00000006p6F-1lpZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 19:58:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 321A0418AB;
	Wed,  4 Nov 2026 19:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B98F1F000C1;
	Wed,  4 Nov 2026 19:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793822300;
	bh=57vfrI08RU+BjdVlt6HNqo3GZbH4J3dGXlSjxWrO5dY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KhCF2oMxoz87W+u3A5bPcohuwPziaHxHMdwPT9EHqJ1WeQ7Nwxoh++Ajbwa4VXkEf
	 rftxIrr3F6NQKo+MYYg9bZOqAibrI8VBkMa1zVx7apyjbD/7FuNCXleWStsd5LAHiD
	 5Ywpwm3UmY0EFN7vQkoIBuRcs/4XsyOuhJHfMtU9URbH+uwKPjzJQgTzjcLwxad9Z/
	 px0i4V7Rg89xGist/Lg0p7U1XDvkFOGnCDelizxvwsQOoYOc1r3C6zDthUr6clx+o1
	 4yrL1gdCU18Tg+KbxHhpIoEhrTYkbcsYS+RSxnWvDG46Uv2cJ7kkkBtJTQ0wjYEN7/
	 nUe0GMemw82lQ==
Message-ID: <de273977-8e8d-410e-8424-e99a0b4080b7@kernel.org>
Date: Wed, 4 Nov 2026 21:58:13 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: iproc-msi: Bound events handled per IRQ
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261016182124.GA1884550@bhelgaas>
 <309f6f13-b010-4818-936d-4b7b4b389239@kernel.org>
 <179338093960.40615.2809022600772649565.b4-reply@b4>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <179338093960.40615.2809022600772649565.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/30/26 19:22, Manivannan Sadhasivam wrote:
> On 2026-10-16 23:10 +0300, Eugen Hristev wrote:
>> On 10/16/26 21:21, Bjorn Helgaas wrote:
>>> On Fri, Oct 16, 2026 at 03:18:53PM +0300, Eugen Hristev wrote:
>>>> Limit each iProc MSI parent IRQ to 16 event-queue entries.
>>>>
>>>> A continuously fed queue could otherwise keep the chained handler running
>>>> and starve other work. The budget still drains pending events and lets the
>>>> next parent interrupt continue processing, improving fairness and bounding
>>>> interrupt-handler latency.
>>>>
>>>> Without this starvation avoidance, one CPU can stall indefinitely
>>>> in the loop and not serve other interrupts, timers, etc.
>>>>
>>>> While testing it with an Ethernet NIC,  when too many MSI interrupts
>>>> come in, CPU might get starved:
>>>>
>>>> Connecting to host 192.168.30.1, port 5201
>>>> [  5] local 192.168.30.2 port 52586 connected to 192.168.30.1 port 5201
>>>> [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
>>>> [  5]   0.00-1.00   sec   240 MBytes  2.01 Gbits/sec    2    334 KBytes
>>>> [  5]   1.00-2.00   sec  63.2 MBytes   531 Mbits/sec    1   1.41 KBytes
>>>> [  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
>>>> [  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
>>>> [  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
>>>> [  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
>>>> [  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
>>>> [  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
>>>> [  5]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
>>>> [  177.568497] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
>>>> [  177.568913] rcu:     0-...!: (1 GPs behind) idle=28ac/1/0x4000000000000002 softirq=28922/28930 fqs=1
>>>> [  177.569457] rcu:     (detected by 1, t=5256 jiffies, g=21629, q=819 ncpus=4)
>>>> [  177.569870] Sending NMI from CPU 1 to CPUs 0:
>>>>
>>>> With this bounded approach, IRQ handler will complete and continue
>>>> to serve MSI events on the next handler invocation.
>>>
>>> Is there something unique about iproc that makes this an issue, or do
>>> we need to worry about this in every MSI interrupt handler?
>>>
>> This is not specific to iPROC, so in theory it can happen to any other
>> MSI interrupt handler. If the handler has no way to break the loop, and
>> the condition that generates the MSI IRQ happens continuously, the same
>> situation will happen.
> 
>> Some other drivers e.g. take the IRQ state into a local variable, do the
>> task, clear it up, and don't care to read it again, like the iPROC is
>> doing, unless another MSI fires.
>>
> 
> You should rework the iproc handler to read head and tail outside of the loop
> and handle the recorded events inside the loop. This will avoid using any
> arbitrary max event limit and allow other handlers to also run.

Hi Mani,

Thanks for the feedback, I changed it as you said, sent a v2.

Eugen>
> - Mani
> 


