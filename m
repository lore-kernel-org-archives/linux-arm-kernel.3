Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F950CCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcNOXqyNxVuYWyzbp1QnwdLMw35li5hGmPS33Nttnsw=; b=t7DUTKsbILZToEcowIcjzzRCZe
	dkP7nF7dQDS91zC5XhtHtgDY910V+OVPHkq8A+LSzipeeUMn8nBbzaecKCD+fVbGE3GAgRFqbRhNn
	PPIpaXmEb2DHv3KiNfy/c6K5rp1/tJXCiP9HWawzcLA8lfaMvl9FpF2dIQrxJYW3ZWGWzzuEcR0GN
	R+GoYaQRBAYahhOgxFaMhxyLX4VkMskaciOSuvxv31EwdNw69CrExzxmLyDQ54GC5Y7sdyp5cf9Vx
	33vKyhTEynEypJ1j7uWnYRjM7sg1yIKeKBJejtyq+gUGwcYffJK7BKrayiBQhyo4gJBfQl56vAmjw
	16aiFZyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkGD-000000076k8-07gX;
	Mon, 19 Oct 2026 10:06:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkGB-000000076i0-0cIK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 10:06:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 81EC940F20;
	Mon, 19 Oct 2026 10:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A671F000C4;
	Mon, 19 Oct 2026 10:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792404386;
	bh=PcNOXqyNxVuYWyzbp1QnwdLMw35li5hGmPS33Nttnsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W8hOKmbqIRQafhh1GRUUbkc8AnOdIEHvEXad95z150YDdAx7vJrxtQR0G6MDqHPPL
	 nz0Dv/E7S3lutezkPlC0i5Rc4jJAVxIAjLHYf8hTQCDbzWviQHVUd4/J6jf5OAp9fN
	 qVj12uRa5bQRUwICfBZjapIH4QOJvc2YMUCoo4tC9X7kKyQmuoAQqCJcyOXO5WfHaS
	 p3B+xT9bA4CExjZ1tgXqieQGovgQXtSjT/bvCR3tiGV91lA3GMdRkperq6ho5MDMaz
	 fpqP1CSmQvuZDXkrvCV9EFxLYZhlUz991fUtIGL3nw28W4bwkx5HZXdNtCZZgG4mnH
	 1/kZ4j52r+tOg==
Date: Mon, 19 Oct 2026 11:06:22 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: tanmay.shah@amd.com
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Harini T <harini.t@amd.com>,
	Saeed Nowshadi <saeed.nowshadi@amd.com>
Subject: Re: [Q] zynqmp-ipi-mailbox and SGI interrupts
Message-ID: <20261019-innocent-opalescent-urchin-7feffa@sudeepholla>
References: <20261015083937.8SDbdK8P@linutronix.de>
 <1ee3f542-e0b2-41d4-bf6a-b103dabf50cd@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ee3f542-e0b2-41d4-bf6a-b103dabf50cd@amd.com>
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

On Fri, Oct 16, 2026 at 11:10:29AM -0500, Shah, Tanmay wrote:
> Hello,
> 
> Thank you for your email, please find my response below:
> 
> On 10/15/2026 3:39 AM, Sebastian Andrzej Siewior wrote:
> > Hi,
> > 
> > The ZynqMP IPI Mailbox driver supports two bindings of which
> > xlnx,versal-ipi-mailbox is not present in any kernel dts file and
> 
> This new bindings are for Versal and later SoCs which has buffer-less
> IPI. It supports only notification to the other core without any data
> transfer. The device-tree nodes may not be available in the upstream
> kernel yet, but it is used by other consumers. Here is an example:
> 
> https://github.com/Xilinx/u-boot-xlnx/blob/master/arch/arm/dts/versal-net-vn-x-b2197-01-revA.dts#L100
> 
> 
> > xlnx,zynqmp-ipi-mailbox is used in two .dtsi files.
> > For the per-CPU interrupts the irq-type should be 2 (which would
> > correspond with GIC_ESPI in the dts, no?) which I can't find.
> > Before the IPI_IRQ_TYPE_SGI it used to check for the value less than 16
> > I also can't find this in the two available dts file.
> > I did browse over the "AMD Versal Virt" but it also looks not present.
> > 
> > My question is whether this is used or just a development step that
> > never got somewhere. 
> 
> No, it is the actual use case supported by the driver. Just the
> device-tree node is not in the upstream kernel, because it is usually
> project/vendor/consumer specific.
> 
> > My guess is that the device tree here is preconfigured from the boot
> > firmware.
> 
> Yes.
> 
> > So is this SGI-IPI a thing or not?
> > 
> 
> Yes it is. Ideally, TF-A and Linux can share the IPI. If the IPI
> interrupt is used by the TF-A and the expectation is that Linux mailbox
> work on the same IPI (because all other IPIs are busy) then the work
> around is, TF-A will generate SGI for the linux mbox driver, and the
> mbox driver will use that SGI via device-tree.
> 
> It is a vendor specific use case. So the dt-node for this use case, may
> not be available in the usptream kernel, but can be enabled if correct
> SGI is configured via the device-tree.
> 

Any solution to support SGIs in GIC properly needs to be generic and don't
add any vendor specific solution. I proposed a solution for FF-A a while
ago, please check if that works for your platform as well[1]

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org/

