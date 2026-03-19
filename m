Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27D21090237
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwqXWOs5RJuysMtH/Thzze8YPTs15V9upVFcogWkWE0=; b=Txig0LwGaDYjjnbMX6YkE78e03
	AUem/O4geuKwGrwoYEUr4jKeLK3BKjPJvngUcD+6uriQtmXfXyn7XMo8WrCYjiAYjvc9XMUDi9x1F
	ZilLZQbuyq45Jpb6jSmCjTt6y18e9zmrlDJMu03SxD1KTd51xtuO0Oe78yiN6LiWVLdZyq+E2HlOt
	o3MfvVoxeVYfWPjmdMWSgqAAgzHtHUH7aIxWtYfWyPg73hFE20y3/2pTmuCao672XB/XblkPpvdeN
	uezSZp/29pRfSIztXJwBj1s0VlkS7WymSGyE7aDGPNKnaoafG8uzWEvPCabpBSVUQB/VqRwVJYKcm
	OJpTXZ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3F4Z-0000000AsYl-12Q8;
	Thu, 19 Mar 2026 15:14:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3F4Y-0000000AsYf-0m8P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:14:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 75AA1600AD;
	Thu, 19 Mar 2026 15:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83877C19424;
	Thu, 19 Mar 2026 15:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773933245;
	bh=6uAt7ubzV2O3BI/pAFzPDP4tAXyo8E4m0NbhLWXLX7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L/HpPYRyB1SSEB7/oIXSgbd20NyZpWHxgE6iK9aXcxf7ZlW8BUYcrc9wij9EqMvb5
	 xRVeI3EbFJ9OoCT3uWu1Vt45sa19+Jp0jYuI3wSr58j2hX3inuVS+nUxgJe/VJ/448
	 n162+qsfyZykdrUgrKFEBUmiIkV+LtXjGxs+x3Mj6TwmnJy7oRdfsFKx9VPRQ5ss6I
	 sqb4buK5yBLSLBv20U8zzN57XlEC9xZ+SiuwxgmikGuS/UTwBGa9Gk2OnHmZj3/EkY
	 rZgaCHWSf867C9KVxGZLrVbfcEDL6EEERx9l3FfIFA6zBPOZoOpyh71oW+8NU84k81
	 wmK0mRFe/YreA==
Date: Thu, 19 Mar 2026 15:14:01 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: suspend: Remove forcing error from suspend
 finisher
Message-ID: <20260319-tiny-coucal-of-tranquility-ce0bd4@sudeepholla>
References: <20260316-suspend_ret-v1-1-1a30b110bb7d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260316-suspend_ret-v1-1-1a30b110bb7d@oss.qualcomm.com>
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

On Mon, Mar 16, 2026 at 02:18:18PM +0530, Maulik Shah wrote:
> Successful cpu_suspend() may not always want to return to cpu_resume() to
> save the work and latency involved.
> 
> consider a scenario,
> 
> when single physical CPU (pCPU) is used on different virtual machines (VMs)
> as virtual CPUs (vCPUs). VM-x's vCPU can request a powerdown state after
> saving the context by invoking __cpu_suspend_enter() whereas VM-y's vCPU is
> requesting a shallower than powerdown state. The hypervisor aggregates to a
> non powerdown state for pCPU. A wakeup event for VM-x's vCPU may want to
> resume the execution at the same place instead of jumping to cpu_resume()
> as the HW never reached till powerdown state which would have lost the
> context.
> 

Though I don't fully understand the intention/use-case for presenting the
VMs with powerdown states ....

> While the vCPU of VM-x had latency impact of saving the context in suspend
> entry path but having the return to same place saves the latency to restore
> the context in resume path.
> 

I understand the exit-latency aspect, though the register set involved is not
very large unless the driver notifier list is sizable on some platforms. This
is typically the case in Platform Coordinated mode.

> consider another scenario,
> 
> Newer CPUs include a feature called “powerdown abandon”. The feature is
> based on the observation that events like GIC wakeups have a high
> likelihood of happening while the CPU is in the middle of its powerdown
> sequence (at wfi). Older CPUs will powerdown and immediately power back
> up when this happens. The newer CPUs will “give up” mid way through if
> no context has been lost yet. This is possible as the powerdown operation
> is lengthy and a large part of it does not lose context [1].
> 

When you say "large part" above, do you mean that none of the CPU context, as
visible to software, is lost? Otherwise, we would need to discuss that "large
part" in more detail. From the kernel point of view, this is a simple boolean:
context is either lost or retained. Anything in between is not valid, as we do
not support partial context loss.

> As the wakeup arrived after SW powerdown is done but before HW is fully
> powered down. From SW view this is still a successful entry to suspend
> and since the HW did not loose the context there is no reason to return at
> entry address cpu_resume() to restore the context.
> 

Yes, that may be worth considering from an optimization perspective. However,
if the hardware aborts the transition, then returning success regardless of the
software state should still be counted as a failure. That would keep the
cpuidle entry statistics more accurate than returning success. And it is
a failure as the OS expected to enter that powerdown state but there was
as H/W abort.

> Remove forcing the failure at kernel if the execution does not resume at
> cpu_resume() as kernel has no reason to treat such returns as failures
> when the firmware has already filled in return as success.
> 

This is not possible with the current PSCI spec:
"Powerdown states do not return on success because restart is through the
entry point address at wakeup."

-- 
Regards,
Sudeep

