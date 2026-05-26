Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DB3CD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 07:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZV+VCMUCy52tuI2qmm/aDP+m+/9nKTduvdWfC/7mhI=; b=GThkZAT2ZGvrS4J4X+gFFlhxnz
	gcQk2hG3lRjY7zdZA5PCFDrViB0MoO6dvPQjE0R2jhpwD8nG1jFF6wv/3bmEUWGLLvgPYZyjbmfYf
	D018yzmXMXRzpAGZBJ/b6mPq4T+Vnd1EwXrimPGc+JOrdQX2XItqrg/GHlxrn8WiezLU6YXUh6e7/
	Hp6y+iH39XhKQQ5yaepcmQeJOvzXzKDNb/JDDmxk34UmSxwXRMctEtJTpaHDMFNUVwHmEM8HzIJYm
	4PdWU+8SB//gyA7fgQKVGsgj3F8lJnZgcxrFRhx0jQ0CtSfjJg/H/9aRYWlsh6d7PHzamTPwZgCvs
	EQDJ+ZZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmYR-00000001J8u-21ey;
	Tue, 26 May 2026 07:50:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmYO-00000001J7m-1KBa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 07:50:21 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4891b4934ffso05e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 00:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779781818; x=1780386618; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lZV+VCMUCy52tuI2qmm/aDP+m+/9nKTduvdWfC/7mhI=;
        b=vy7NVRPjkCD1GXxWG5RHou686jKVhd0cQjvKsv2rGVKqfyrQs1ZzQZN+YOEtYGdEbR
         sx3DA5qR1rDmlkFxYTgyKyPXHtUjOs6dwcxQ9N5VW6SYsylMZgNu4MHrGpnDFL4RT+Rs
         5S0MfBegZFLOUR9CF4rAqaFlFb205tbjiIXYozsFTFdNhL4EQaPzyEKMBzUHIfWgIDeJ
         8DsChWP4suN6wmSLqZwpd23+Ia8/E8xXDWuMmLzWuvcKs5Vs2i/9/X+5inlmjCI7dTYu
         islSltXV8QIopjh+rdwsQmnbfr5O4sje2rzrIGZUiLxRLVDLyyLeWKJmkAEvjxVFM0wK
         tsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781818; x=1780386618;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lZV+VCMUCy52tuI2qmm/aDP+m+/9nKTduvdWfC/7mhI=;
        b=NINCfq4JchqUjYiYCwqIiR0R0wjzKo2WQWXmuFCOUKj6NtBQdinMDO7hdFBlqYsnvC
         flBbC37GQHv+kp3qRIRu7PmdqxXVi2FXZXTgGWYR46RxF9dL+46ifGx9NAwELV3hFEvl
         2xb6bbeG7hBdxSVSWRYfuUYzs9zUTkj7V+6vZrzWKnQCEC5OPRUKFuiWisFEgQrdj/Fj
         h4PkddcRvrw4BPL/yIxsBorX054iCsZq2ewytLsnf4J7yUKLmdOPIuD8MRY69+EnAfAJ
         TfIAmDUN9w2NBVoV3sJbzxB6DTSP9LBhYAcbX7TBTTT3iBSnD73aTh3s5wg4ECVFkUO8
         CvAQ==
X-Gm-Message-State: AOJu0YzXHbPGsCx3h/YbYq9Tpfqg0NCl8+qaeswSajtLLHuA/oTqqMkg
	p65FMpmlB6BycrrDoQSOtlEK7kHwg4oLzjt2Fg9/AdPAjXB3K+T9IYrx4fJ1MwwXHg==
X-Gm-Gg: Acq92OFQEJ1TjO00TZKxAkpbqN+y2NEmN1CIu2nB+JfHYSdvO1vZZ910sGY/YPbYQiR
	EALM6ufZ3QQ6ueBKelSL+YqTdOtfIVg1uSpIfe08qOqS3ggbLP6zP1qVIPA/5feareUv7t8x7L7
	ePbiTcyfPE6Sqz+UQ9R5aSScjcOVeaX7jF8Imi4gadmlP2vBPyNtf4UTvq8T5TpAYRswMRoqJs8
	M8oNfqBodxiL+IJB4aH6gvDAdiJ5lD4b1gv5XSlBpLNMew616Hmwc3b61C96R8MGY75aadjBdvs
	dIcgec4gHODOm6dD4Pvm/DR1rTCyTxIjOkQJYDdUfzPBYYcliIOtmGTvA2ZbUTGqYNKvraMdrwl
	N1ltn+DmEp96rMBiu2uU5rYT56UDzYqLhVC/0qfynufNm5gztVEwRgY8z62TzDhra8fExE9KWoe
	2WSB7foHHsZEJTI7cNwr9WYZ0LceoZGX4mAYAQdS2wUssR0buGxYCRu7nis+kXB4zcq/m6gL3NI
	d0=
X-Received: by 2002:a05:600c:a313:b0:489:1bbb:3356 with SMTP id 5b1f17b1804b1-4904f68f399mr2720555e9.2.1779781817275;
        Tue, 26 May 2026 00:50:17 -0700 (PDT)
Received: from google.com (136.41.155.104.bc.googleusercontent.com. [104.155.41.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454db285sm282079495e9.5.2026.05.26.00.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 00:50:16 -0700 (PDT)
Date: Tue, 26 May 2026 07:50:13 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	tglx@kernel.org
Subject: Re: [PATCH] irqchip/gic-v4: Harden against bogus command line
Message-ID: <ahVQtakwshwI9ss-@google.com>
References: <20260521130503.4103369-1-smostafa@google.com>
 <86zf1qv4do.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86zf1qv4do.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_005020_367455_BD74D4DC 
X-CRM114-Status: GOOD (  33.12  )
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

On Sat, May 23, 2026 at 10:53:23AM +0100, Marc Zyngier wrote:
> On Thu, 21 May 2026 14:05:03 +0100,
> Mostafa Saleh <smostafa@google.com> wrote:
> > 
> > When accidentally setting “kvm-arm.vgic_v4_enable=1” on the wrong
> > setup that has no MSI controller device tree node (it exists but
> > not used) and GICv4, it caused a panic as “gic_domain” is NULL and
> > the kernel attempted to access its ops.
> 
> When you say "that has no MSI controller device tree node", does it
> mean that the ITS has not been probed at all?

Yes.

> 
> >
> > Originally, I hit this on an older kernel, but was able to reproduce
> > it on upstream with Qemu by hacking this unreasonable setup.
> > 
> > [   33.145536] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000028
> > [   33.145658] Mem abort info:
> > [   33.145751]   ESR = 0x0000000096000006
> > ...
> > [   33.154057] CPU: 1 UID: 0 PID: 295 Comm: lkvm-static Not tainted 7.1.0-rc4-ge3f15ad3970e #5 PREEMPT
> > [   33.156922] Hardware name: linux,dummy-virt (DT)
> > [   33.158780] pstate: 81402005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> > [   33.160340] pc : __irq_domain_instantiate+0x1d4/0x578
> > [   33.162602] lr : __irq_domain_instantiate+0x1cc/0x578
> > 
> > Add a hardening check to avoid the NULL access, and fail the VM
> > creation in that case.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  drivers/irqchip/irq-gic-v4.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/irqchip/irq-gic-v4.c b/drivers/irqchip/irq-gic-v4.c
> > index 8455b4a5fbb0..7e39f7eae85f 100644
> > --- a/drivers/irqchip/irq-gic-v4.c
> > +++ b/drivers/irqchip/irq-gic-v4.c
> > @@ -159,6 +159,9 @@ int its_alloc_vcpu_irqs(struct its_vm *vm)
> >  {
> >  	int vpe_base_irq, i;
> >  
> > +	if (!gic_domain)
> > +		return -EINVAL;
> > +
> >  	vm->fwnode = irq_domain_alloc_named_id_fwnode("GICv4-vpe",
> >  						      task_pid_nr(current));
> >  	if (!vm->fwnode)
> 
> I think this check is a good few levels too late. If you want to fix
> this, I'd rather make sure that kvm_vgic_global_state.has_gicv4 is
> reliable and covers this case. Which means making sure that
> gic_kvm_info::has_v4 is itself reliable.
> 
> If my above understanding is correct, I'd expect the following
> (untested) hack to help.

Thanks! That also fixes the crash, the VM will launch with a vGIC with
no ITS in that case.

Thanks,
Mostafa

> 
> Thanks,
> 
> 	M.
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 291d7668cc8da..e6b9fee1b6786 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -5838,6 +5838,7 @@ int __init its_init(struct fwnode_handle *handle, struct rdists *rdists,
>  
>  	if (list_empty(&its_nodes)) {
>  		pr_warn("ITS: No ITS available, not enabling LPIs\n");
> +		rdists->has_vlpis = false;
>  		return -ENXIO;
>  	}
>  
> 
> -- 
> Without deviation from the norm, progress is not possible.

