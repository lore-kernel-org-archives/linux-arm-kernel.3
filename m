Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5473C44533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ku5KCnE7b1jJ6zu4nYk93cfScYqAwr6yPRdJFJ3GoUQ=; b=egXmb5Qg+KRhbB
	YxTvHyE1LGp47ha/f7jeyx+yZs4QzKSm7h/8N+mnWjfs/qji7AEDAz2X1a7tcx5OFzGK6gVGm0Jxb
	r3KAFZzEeHDNTKYXs2fMpM44sAGJtFO/JELoS0WQxRxT+cboOzWoM+S0Z2bq3IyAIG8hYs4zHRx3G
	B1SVBH4b3zKIqCtXIDo74C+75vP79oqTRsflOzy2qql93bOnqV/I3aMduKERCorThPXDBmIHF3qnt
	cA4TbZhRbM0JudyYq49bPBNR1cUKh2s4zpmIoMKsxkzqY8wDigeyGeOkGEeKvxRxoVwtGHGcsM0Ow
	UAKGW7MRhZ2mUHBVgG9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSC2-0000000BEAB-06Oq;
	Wed, 22 Jul 2026 08:20:42 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSBx-0000000BE9O-2xuO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:20:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Ku5KCnE7b1jJ6zu4nYk93cfScYqAwr6yPRdJFJ3GoUQ=;
	b=PlLmEHAxYAFgBX+n7fnihc/U7TSE6ZpoAXmwKeL/gG9bkL/Eh2WuyGIJa2ut/ET/Yutl9sSkb
	bnua6Mqz7EyEAXjFBDgVR1zb8RwN51UvezIyDqql9/vyiSEzPZXHkdEbVbCGnnsk9KqDIxXhpYG
	wsPqP5xC6p8gNVgqZgD0WXA=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4h4n550jQ8z1K96s;
	Wed, 22 Jul 2026 16:11:05 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 8123540578;
	Wed, 22 Jul 2026 16:20:26 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Jul 2026 16:20:25 +0800
Message-ID: <2b14daf3-576f-4b37-b233-e0e1e2c76f2d@huawei.com>
Date: Wed, 22 Jul 2026 16:20:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 18/36] arm64: gicv3: remove GIC_PRIO_PSR_I_SET
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-19-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-19-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_012038_396872_1FCFBB9B 
X-CRM114-Status: GOOD (  21.80  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> `GIC_PRIO_PSR_I_SET` was used to keep track of sections of the kernel
> where interrupts always need to reach the CPU and could not be masked

Did I miss something? I have not seen this usage of GIC_PRIO_PSR_I_SET.
In the kernel code I have observed, the use of GIC_PRIO_PSR_I_SET is
always because the interrupt has already been masked by the DAIF.I bit.

> via interrupt priorities, or DAIF bypassed the status of the PMR.
> 
> This flag unmasked IRQs when OR'd to GIC_PRIO_IRQOFF and ensured that

Did I miss something? I didn't see the code related to the OR'd to
GIC_PRIO_IRQOFF.

otherwise, LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>


> that IRQs were seen as disabled by the `local_irqs_...` functions,
> as they would only check the PMR if pseudo-NMIs were enabled.
> 
> This is not needed anymore as our IRQ masking APIs now know how to handle
> interrupt priorities properly and in parallel with DAIF : remove it.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/ptrace.h         | 2 --
>  include/linux/irqchip/arm-gic-v3-prio.h | 8 --------
>  2 files changed, 10 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
> index 192eb97cd50b..c630165882e8 100644
> --- a/arch/arm64/include/asm/ptrace.h
> +++ b/arch/arm64/include/asm/ptrace.h
> @@ -24,8 +24,6 @@
>  #define GIC_PRIO_IRQON		GICV3_PRIO_UNMASKED
>  #define GIC_PRIO_IRQOFF		GICV3_PRIO_IRQ
>  
> -#define GIC_PRIO_PSR_I_SET	GICV3_PRIO_PSR_I_SET
> -
>  /* Additional SPSR bits not exposed in the UABI */
>  #define PSR_MODE_THREAD_BIT	(1 << 0)
>  #define PSR_IL_BIT		(1 << 20)
> diff --git a/include/linux/irqchip/arm-gic-v3-prio.h b/include/linux/irqchip/arm-gic-v3-prio.h
> index 44157c9abb78..464bf1d29453 100644
> --- a/include/linux/irqchip/arm-gic-v3-prio.h
> +++ b/include/linux/irqchip/arm-gic-v3-prio.h
> @@ -20,17 +20,11 @@
>   * GICV3_PRIO_NMI is the PMR view of the priority of pseudo-NMIs. This can be
>   * written to the PMR to mask pseudo-NMIs.
>   *
> - * On arm64 some code sections either automatically switch back to PSR.I or
> - * explicitly require to not use priority masking. If bit GICV3_PRIO_PSR_I_SET
> - * is included in the priority mask, it indicates that PSR.I should be set and
> - * interrupt disabling temporarily does not rely on IRQ priorities.
>   */
>  #define GICV3_PRIO_UNMASKED	0xe0
>  #define GICV3_PRIO_IRQ		0xc0
>  #define GICV3_PRIO_NMI		0x80
>  
> -#define GICV3_PRIO_PSR_I_SET	(1 << 4)
> -
>  #ifndef __ASSEMBLER__
>  
>  #define __gicv3_prio_to_ns(p)	(0xff & ((p) << 1))
> @@ -45,8 +39,6 @@ static_assert(__gicv3_prio_valid_ns(GICV3_PRIO_IRQ));
>  static_assert(GICV3_PRIO_NMI < GICV3_PRIO_IRQ);
>  static_assert(GICV3_PRIO_IRQ < GICV3_PRIO_UNMASKED);
>  
> -static_assert(GICV3_PRIO_IRQ < (GICV3_PRIO_IRQ | GICV3_PRIO_PSR_I_SET));
> -
>  #endif /* __ASSEMBLER */
>  
>  #endif /* __LINUX_IRQCHIP_ARM_GIC_V3_PRIO_H */


