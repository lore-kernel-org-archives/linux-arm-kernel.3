Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AB8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 20:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lFuIrLxk;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E45LxALM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xhfm/FnI3dgYatG4alzCY4CMRbBwFdv1fIdjJsOp9rQ=; b=lFuIrLxk6163dLq+Yqzle7M1DV
	2uk+nksgkT/KdhNvxw7jUg7AX0E61TolC5GF2njTbH8ziNxiziF+y8EgxGMdTg+eBcrQ4O3zK8++E
	HSNNgkfx9WsVgIANU1VvD9irAu+dcqYlz9ecn2ZTjI5pHNJX6FAEukQ28tjwLJGrJ8p+CkXxb/lOl
	ZGZpn958yb4RUm9QB0PotYvJK0Z935k3gDIASrAGQaJijrUCAEfgFS78f1SsKXJG+0mTrsnkXTpzU
	cz2MePyg8nhOgJSppHjpPWmVxkZ/JRWIVOknNYUbnfrKdDrO9ZBd/HwkuVLrMYKKPSxuOB/n9vSHk
	eoAhoIyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL4rV-00000001Q4j-0tF6;
	Sun, 25 Oct 2026 20:30:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL4rS-00000001Q3z-3C2Q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 20:30:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49d05d51553so16082125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 13:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792960232; x=1793565032; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xhfm/FnI3dgYatG4alzCY4CMRbBwFdv1fIdjJsOp9rQ=;
        b=E45LxALMHcOSsaw2F4e6XqH5kYRg2cnVNpPaQBt40NVjogPIQE2aC9DHnyQFDQjFKM
         XMv3K/ZCrKV3vVBWmUmme2nzy8c1I21fQBpgIHyKt72aGcNJ58BHc6DB3/JE6prxhK2r
         yTPa1KGA6RQZGWkxoJoROBEJUfsSkbUs/UURDvkbixAGANMHwZfCYPs4SuY0CfyTc7k7
         k/lMkSJ5aEslmUdLobOB4JOaXHOUKf0JSwl+4Fori4txyJjY5nVlDR7Tz/SxrE4Wrsom
         oIZwRiMxvLB3wQ0PaRL1A0DCM2VL66dSWAyiLkZacRstsqXteLIKOt/D7LvBYRTjknjw
         K/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792960232; x=1793565032;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhfm/FnI3dgYatG4alzCY4CMRbBwFdv1fIdjJsOp9rQ=;
        b=z8KqsJJz5NaaQh1tHwZQNPd8C8G1esnHu6eOG8UXVBEMwZycQ/0Pd3tLlbbL2Suzpe
         5O9PvZPvkmhKa1g+n87Sa9SXejBXzHdZGE5K8g7/FvjcmyYUQR/oUcL28DigNa0o0qfG
         BvZRGSu1Ft7hwtL3PKCjHM6RoWq3dnWWsswVs4fdfwwYyVqfqApKb6LTHR7+QP3v0h5z
         CvN+iXDhi+BChNAITdXsjcsOpOBijV6KhdWbMpYSbju07gK6zpexfE7eXsL+l/U1b2xs
         XXmcGTMutdXkHL6jbp3K7sGfa/o3CIcLMjIJyd6AzzkdyWpEvCjUqulFIYaUFO1LLZV0
         TiYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoDJMU4F2yRL7jZxM/5AxfWBnvYe+aUErBt9huaXee7BxTB8ukJV0QMTLzc59MCddbR+Gnl/i3xc8Xu3tov4bF@lists.infradead.org
X-Gm-Message-State: AFq9FYJyVokCgFQxkmrn7oU20k+++pBs0gIQn0oWlsn2gZL9DXTGYj8z
	dcWauYjnIUxMae7nLxBPQ8mxJy+WfYwQGNktvBB/uuz2VdwuIQDmIXuk
X-Gm-Gg: AYBFou07szLX5e5PftRZDaTk/fOkpGt+cXI7R9XVoPtSSrlIdu3JOtNMcN1QmrUrFwO
	O7Fq/eObE2vW/ofk5Ss2S3+jq2oCbnNWblH+JQzwAD60hzJQOs6QR0oc63FWikG4c8Z85e+AzhQ
	FBhqBWENBTOD3+21xfwiYi4Qj/vqv0Pjg+SDJYKOYmVT8K0K/ezXTc729A1xTw3KNxP7ssBQuht
	wPFalwTvhyhysV45PtxEBrg1cluAaEDy9x2CiYPVpErtb0SThOP7HRRa3lf/UFpfgN9T3igOQn4
	EmmrzC7+BhP6OxWVJIpU+hpNEwb3rRPAqG4Ez76gJ33zO+dI0x8Z9gZwFay1mt9fJ21hptH7Ddx
	/VJQWolMnN6J46ySAI7U0M926tMusjCmh5WCx4W6VYy0ME/JtZ63oYEv4gYQoy5xcLgdkIj4T0f
	Q6o3ZvU9kzd+FFVUJQkpxdyljlxSOceL1yqyJ6/peA76/nAxArjgTGmF3XcrTf+iOlPt5uwhV+Y
	WlnXglMTgXNrwK3c2vWVbzFj3g1siJbjnwrjebg8TqZ4ERZrq+tuPEbaLtnq7LFwfZ/xc/Lhgnt
	BNmpd0wJxWgQPA5v02FN7MewRGNGPAxASHDa89epAYIH7Xh+oFsfr7MgGNxeH1jyfig0K8YqMr0
	SBF3AAYXkcCGdOvlTzr8MWMIpN/iRrBHkDcSXQMQ98ICAmplyK4qng7WUsI48ftsYI7cGmAVIe3
	38
X-Received: by 2002:a05:600c:4583:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a35acc2773mr98426965e9.32.1792960232061;
        Sun, 25 Oct 2026 13:30:32 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a9cc-4401-09c3-9199-30c4-c6a3.310.pool.telefonica.de. [2a02:3100:a9cc:4401:9c3:9199:30c4:c6a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm12003158f8f.17.2026.10.25.13.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:30:31 -0700 (PDT)
Date: Sun, 25 Oct 2026 21:30:29 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Eric Auger <eric.auger@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] KVM: arm64: Preserve level IRQ re-pending
Message-ID: <at5k-_Ign30fPuHE@gmail.com>
References: <20261022064628.4206-1-kmehltretter@gmail.com>
 <atxWfRsNNK8vdeSr@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atxWfRsNNK8vdeSr@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_133034_841216_E90670C9 
X-CRM114-Status: GOOD (  17.71  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 11:55:57PM +0100, Oliver Upton wrote:
> > The exact alternative is to stop and synchronize the target vCPU
> > before applying such a write, as the active-state accessors do. Is the
> > conservative replay acceptable here, or should ISPENDR pay that
> > synchronization cost?
> 
> Yes, just kick the target vCPU out and sync the LRs back into the VGIC
> state. That's consistent with the approach we're taking everywhere else
> where this sort of issue arises.
> 
> If we're lucky the vCPU is just poking at its own redistributor and the
> synchronization is free.

That makes sense. In my current v2, vgic_mmio_write_spending() uses
vgic_access_active_prepare() and vgic_access_active_finish() under
config_lock, and drops the extra struct vgic_irq flag.

> 
> > The issue was reproduced with Zephyr, NuttX and RT-Thread guests. On a
> > Raspberry Pi 400 host with a GIC-400, each GICv2 guest handled the SPI
> > once before the fix and twice afterwards.
> 
> Have you configured these guests in such a way to reproduce the issue?
> What exactly are they doing that is susceptible to this issue?
> 

Yes, the runs used a small test harness in each guest. Each test
configures unused SPI 150 as level-sensitive, pends it from thread
context, and pends it once more from the ISR before deactivation:

- Zephyr (qemu_cortex_a53): k_irq_set_pending() -> GICD_ISPENDR.
- NuttX (qemu-armv8a): up_set_irq_type(IRQ_HIGH_LEVEL) and
  up_trigger_irq() -> GICD_ISPENDR.
- RT-Thread (qemu-virt64-aarch64, pic.gicv2_eoimode=1):
  rt_pic_irq_set_state_raw() -> GICD_ISPENDR.

A driver that hits the same pattern is RT-Thread's
components/drivers/mailbox/mailbox-pic.c, which amp.dtsi configures with
level-high SPIs and rings via GICD_ISPENDR. 

pic_mbox_isr() reads MAILBOX_ISTATE once at entry and clears only those
bits at exit.

Sending on another channel while pic_mbox_isr() is active sets the new
MAILBOX_ISTATE bit and writes GICD_ISPENDR. Without this RFC fix,
deactivation drops the second pending state on both GICv2 and GICv3 and
leaves the new channel bit stuck.

Thanks,
Karl

