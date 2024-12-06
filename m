Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C678E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 10:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/ryQ2lrpgoHQc48zNvSjIhEhICpUtxTSCqioMkrH6I=; b=Vc6aMxWZT2YlgyJpM1KMJo2ZMS
	55Ua8zlNm4IDleOTmJJE9mb4Wmg7mo9bUOVSyNF/gvEs4gDAKVOck+7DxMWfjBziprealDr24Rc+C
	yVX3H/+kyRefgR63Y2mnPso+8ACPyFVu5HDkc/SngoTHa5Jw/c0qmvUiaVwKaHWS1tLhSsJ5A63yI
	PVZR5irJqIOjyf1rPkTcWKJzwOEORIuTBaWzK8iuXQUhnUtfJwozCzsaDKjsYjsDi64ZO9kvD7qi3
	1/CK5fygXSjt2N1E1J2TyB0XZoxOBiPcgo4ACpdan1lmMkMAUrhYc0w6Tzvx+1FttCqPtF4EZ1OZ2
	J0ohxFGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVEH-00000001C8o-3Bxu;
	Fri, 06 Dec 2024 10:06:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVDH-00000001C2r-0Zip
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 10:05:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4349c7b6b0dso32535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 02:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733479528; x=1734084328; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R/ryQ2lrpgoHQc48zNvSjIhEhICpUtxTSCqioMkrH6I=;
        b=tgivArN+CN53qcOM9162pBHQwNkdcaiQm9lyAgXALbMPlit7DvUDslWm6o/ihAH4Uh
         dpe+QpvfVHt7MMOc8GoPuzSOVHtggEqOlwUr6tg3g+box5vqqm7BkwWSon91Lm81xByE
         Re9DERH+BRxTIjmNBTHPEFxHqRLnyoOQVKDH4qfibfw5WgUXFfM2e8zbR9QQ1W3sJ+ji
         1dTZtUxvTQU5Y5CgTsqTEM44ZhgPut5U3hthW2UmB2bZdwk2HU2Y30x5WL9HrhCMCgM0
         2RahcjXvxVZdxppuYPyrQS7hGlP4s3BovPULbL1sme+sei7K6iKeA00hPmlnauWg4oIu
         qTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733479528; x=1734084328;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/ryQ2lrpgoHQc48zNvSjIhEhICpUtxTSCqioMkrH6I=;
        b=saYt34eomq8misdXTwYls4WbEDH+blo59nHg6k2eTQphoWeSw30UufJedi6VbjpsoU
         HmlMocnoNxmMeFNw1CQuMcPlfSZpuKtulZUaAt8j8nWruEgrHjlocwjq8GSpJYg9o4X1
         6Fa1Bew0r1H2OAQKzfdWR5gRjtO1+EzkBUFgpgC4iJdUdLld6lwSmBoBLOyuxejm9dvE
         VWGHJBN94ZSPcaNyA7krERJaqvmkXvYq/VIzih5qqRR0AZBuIhi8gfliK17DXL4NOMNz
         s06zp3YoYJN341kmoAWR0keyLI2ynRhuALva0SeWgYSDLgIZGWAAm2gz/y2pKopUBDKS
         2Gmw==
X-Forwarded-Encrypted: i=1; AJvYcCU2i6+sKuqmiCI4i05PvGxhRUVe/vYKx9mxvmBmDNHiLWbSH9XqLaJtUEZQS6Dde3HU5Dt0py1NBfSUHyAImyNQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzMChp7oXbhFQhgoA4C3XTj6QhAiwv9qhRWHBQc4CHNR4XFVnq0
	QtsQ31XBkT9IqV576uAX7Z9hkVyaZgwAV2maCmTw8ksFm4nej6NgJaw6aM7wb47t4vKkUjX04bT
	KJ8HAAITLttHR3fKOH7BQ7qqX/u3mVwRIbIw2
X-Gm-Gg: ASbGnctvJE1UBoFXJ8gphBfW5g7X0MJCv9jT2ITWcOXVN2Z+7Un0RskBnm0XQu74jS5
	S7vO+F6UNlevB3CpGDl6zzeusxjPT9w==
X-Google-Smtp-Source: AGHT+IG+4dJpEo5yLtZoUhglN3xuWlQYiuH64fyMBXTPh3lbLD+/Gl4eqok3Nj9uu15d8KD5B/bL+1d4FMP7EJcyEYA=
X-Received: by 2002:a05:600c:1f83:b0:434:c967:e4b5 with SMTP id
 5b1f17b1804b1-434def170d7mr668415e9.1.1733479528294; Fri, 06 Dec 2024
 02:05:28 -0800 (PST)
MIME-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com> <20241202154742.3611749-6-tabba@google.com>
 <Z1JNGmcZka1hl2ha@linux.dev>
In-Reply-To: <Z1JNGmcZka1hl2ha@linux.dev>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 6 Dec 2024 10:04:51 +0000
Message-ID: <CA+EHjTyTODB42oSy0iBkqBGiyH-FUfG_mqgVWzaZ33qnkeESZQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/14] KVM: arm64: Initialize feature id registers for
 protected VMs
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, james.clark@linaro.org, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	broonie@kernel.org, qperret@google.com, kristina.martsenko@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_020531_174466_1BCBCA72 
X-CRM114-Status: GOOD (  15.72  )
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

Hi Oliver,

On Fri, 6 Dec 2024 at 01:02, Oliver Upton <oliver.upton@linux.dev> wrote:
>
> Hi Fuad,
>
> On Mon, Dec 02, 2024 at 03:47:32PM +0000, Fuad Tabba wrote:
> > +/*
> > + * Initializes feature registers for protected vms.
> > + */
> > +void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu)
> > +{
> > +     struct kvm *kvm = vcpu->kvm;
> > +     struct kvm_arch *ka = &kvm->arch;
> > +     u32 r;
> > +
>
> Can you add an assertion that this is called while holding the
> vm_table_lock? Otherwise it isn't clear why its safe to initialize
> per-VM state.

Will do, and I'll update the documentation around vm_table_lock to
clarify that. Should I respin after this, or would you like me to wait
a bit?

Thanks,
/fuad

> > +     if (test_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags))
> > +             return;
> > +
> > +     /*
> > +      * Initialize only AArch64 id registers since AArch32 isn't supported
> > +      * for protected VMs.
> > +      */
> > +     for (r = sys_reg(3, 0, 0, 4, 0); r <= sys_reg(3, 0, 0, 7, 7); r += sys_reg(0, 0, 0, 0, 1))
> > +             ka->id_regs[IDREG_IDX(r)] = pvm_calc_id_reg(vcpu, r);
> > +
> > +     set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags);
> > +}
> > +
> >  /*
> >   * Checks that the sysreg table is unique and in-order.
> >   *
> > --
> > 2.47.0.338.g60cca15819-goog
> >
>
> --
> Thanks,
> Oliver

