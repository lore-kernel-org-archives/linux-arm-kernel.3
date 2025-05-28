Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690C9C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 16:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jb+UR+Q0E4zR5zAdL8Kqt97Gy40v+Q4z4YAMQrSOW6A=; b=gvXUZMM0VL/0fz
	uip7Ix94U8f+Biz5Ua0r+cxAe+yySUYDmpDL+aURm+1E8nlFOUz7DReajH0L1QmKNwfHLMvrQ3Xbd
	wAb4YlNpghkR6twNi7Af8Rfc0+X9wZ2GWILVSy4hVZi4zkks/FKRe6d6LW1gVLM+emnKIyAPC+yc6
	Z+wpLf5pY8yxZX3YVtAqOTYNWo+ubpTrOcSlTAqlBSYxvaa9euAqEsG7gHd4bHaYTjx7PzJn66FX/
	mRhvQnruhAffxQkbzmE/eOJeTz6vY1r5xYXqy8hYka36TKAiyTuOSbWvje9mXqV033JmylAKkkNjG
	r6jJef7wmkShyzMO7/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJeK-0000000DgPg-1r0n;
	Wed, 28 May 2025 16:29:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJMm-0000000Dcmb-0pKL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 16:11:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BAA91A2D;
	Wed, 28 May 2025 09:10:39 -0700 (PDT)
Received: from [10.1.34.177] (e137867.arm.com [10.1.34.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E1D53F673;
	Wed, 28 May 2025 09:10:53 -0700 (PDT)
Message-ID: <fce9e492-7945-47a7-9891-e629d523e630@arm.com>
Date: Wed, 28 May 2025 17:10:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] arm64: debug: split hardware breakpoint
 exeception entry
To: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-7-ada.coupriediaz@arm.com>
 <20250520153638.GF18901@willie-the-truck>
 <aDcpESO2rYX_7V3Y@J2N7QTR9R3.cambridge.arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <aDcpESO2rYX_7V3Y@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_091056_292976_200E44EC 
X-CRM114-Status: GOOD (  17.75  )
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
Cc: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 28/05/2025 16:17, Mark Rutland wrote:

> On Tue, May 20, 2025 at 04:36:39PM +0100, Will Deacon wrote:
>> On Mon, May 12, 2025 at 06:43:21PM +0100, Ada Couprie Diaz wrote:
>>> +static void noinstr el0_breakpt(struct pt_regs *regs, unsigned long esr)
>>> +{
>>> +	if (!is_ttbr0_addr(regs->pc))
>>> +		arm64_apply_bp_hardening();
>> I think this is a change in behaviour, as arm64_apply_bp_hardening() is
>> now called before enter_from_user_mode() and debug_exception_enter().
>> Is that safe and intentional?
> Yes on both counts:
>
> * It's safe. The arm64_apply_bp_hardening() helper, and the callbacks
>    that it may call are all noinstr, and are written to be safe to call
>    in this environment.
>
> * It's intentional. The goal was to do this as soon as reasonably
>    possible, at least before unmasking exceptions, without incurring the
>    cost for exceptions where this didn't matter.
>
>    We've already executed a bunch of code to get here, and moving this
>    after enter_from_user_mode() should be fine.
>
> This is inteneded to look the same as el0_ia() and el0_pc(), which both
> call arm64_apply_bp_hardening() before enter_from_user_mode().
>
> Mark.
A you mention in the other patch Will, I can definitely highlight
those points in the commit message for v3, especially that it is safe
and already done by `el0_ia()` and `el0_pc()`.

Thanks both,
Ada


