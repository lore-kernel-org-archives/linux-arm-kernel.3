Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD4FC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 08:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUO1jksSmzlhAfx/j3xxVgsgOha96dJxP5yOTtMR46M=; b=SQgOIOFXBNIGYNupgjXnCAZtgn
	Q3xveLGOQjE51NC1+Mod6jqL9N8A/1ZlSBvWsujbo4dgYvpLWmFFRCx5gM6qZEs/s4SlxzByQY7Iy
	HYU4hX8tPQNCeYIWjp5xPsV3ymhapnsseLV30uSI/h7Omps9wdfThZB3xQrN6HWOndGFHyBPpZqpn
	rcO2gFw25Q/qh6lALp1u3MEcqQ9606YopwoXY+wJQZLqy9SBYZTqIbajGPPwaANvbWGSsmz0B47SY
	9TEaNar63d6gdZ1OCyf5IxgFhkONQx4WqP37xUO0hUVxdlfKDyglSjZkidJIvqToMPTlsUU/7CYOd
	vEIS9HSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0ix-0000000HTNW-3Ptd;
	Mon, 03 Mar 2025 08:00:27 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0hP-0000000HTHe-1fAk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 07:58:52 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-471f1dd5b80so320721cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 23:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740988727; x=1741593527; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eUO1jksSmzlhAfx/j3xxVgsgOha96dJxP5yOTtMR46M=;
        b=VH+eu3tk6aBSjvMVlZhc6MbVtw3ybzFzDpqY/1U1vtGdfEFC30RHEo1EYJivi36B7w
         EBgu+W5iCAHtieFlmd0/ayRxu5Yaj1UReANqvpX6IBVRzY3sxS8pl5lSDvcwapOn8k7m
         OO+emSPyAG+WBNLK/0Od95yKWLIVfmR5H2LC3hiMBFMuOzyukPhnkmr8YAbyScJBtnkt
         k/5hrg2tKFjAuYy+uL/uz2JYlw8e/rj4KXXuV7eekXiW20hzV7LrVNvNSzzE41WRN6N0
         w+4L9cy9ynn8BWW4ieOjfp6VUbDCxyfHH4xVLbe8yRqmQIvPQxh92OUyvRHjcKnod3uW
         HvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740988727; x=1741593527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUO1jksSmzlhAfx/j3xxVgsgOha96dJxP5yOTtMR46M=;
        b=gcXjcuQUt2w20iKm54MjNKFpCtyZT0LEslvNkwBe81M31Mc7luT69woGTK8g3c4UhD
         0+M9KjuJfSsnP0I0Ak0gx0siddf9GEvE+iNOcI9Tz17HTbt/Mb72Te5maqAl4KHMvi/4
         wwYF/aImnBQEvjypuvKrBprYzzAgKR1uu914b34ClvsQdTkt1hdvZ1+2Fybylvfc+K9O
         cSflCqtuBPo1mzBwwlhO57WQKV69CNWqbAaMATVm6Dof7vSZSaU62TdsjcIhS1DtGjGB
         k2EktTr7Dqmu+DxYkfj9ry6qYgHuIyqcMTupiQrpgUoHNT/rk8ohHet5fd7Gg2LtVeR/
         04eg==
X-Forwarded-Encrypted: i=1; AJvYcCVwgTpkygKyW2n/kiOBCm26s3gJNP0Lho+PNaZjhC09Gd6CBNsXw7fg+GaNWJVflIZzEZW3fAhKRReCjowAYR1L@lists.infradead.org
X-Gm-Message-State: AOJu0YyMfm07Cz31WTXrg+R6/BduUCAKSxypmwMZPG8Jlz1ADFqzGqI+
	d0f45sqJRZg51aZNTFYDnXWFHWxNq7uUhIdmUmEJ+TBJma9BAuBBXVBBBxD6cUsh8Ip5ekYEDD/
	SGMeaWJPtFeDpvGcNdSV7sMcojJaTIXcUoj1V
X-Gm-Gg: ASbGncsjUVYyFkFK/TFIzsHd9hvwK7YnxpakQsuhtfn8G7HTxshbWURc4KisduVVVVG
	Nugy+hulwTTG0Be/XAMlzEgCv2HTxmm44ZSoEPNZZ1gzJHyNBe7T0KN/ItxCh9dfN59M+/CbIpn
	KhJGQT/Vnb6jV11HVLiuNWpzJm
X-Google-Smtp-Source: AGHT+IE3FrgYtSi6fG4kXuYXuz/jK19In39DBZldcGqipI/hiKj7Ook8PSAQkhdmiEcyY+thrVu8z5Hwh6+LBERKFs4=
X-Received: by 2002:a05:622a:6a8a:b0:474:e50d:e15e with SMTP id
 d75a77b69052e-474e50de602mr1680411cf.16.1740988726923; Sun, 02 Mar 2025
 23:58:46 -0800 (PST)
MIME-Version: 1.0
References: <20250226215520.1759218-1-tabba@google.com> <20250226215520.1759218-4-tabba@google.com>
 <Z8ISLxQRcsx2uuHw@google.com>
In-Reply-To: <Z8ISLxQRcsx2uuHw@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 3 Mar 2025 07:57:00 +0000
X-Gm-Features: AQ5f1Joaynh2cBRm8OtTCH-hJn2SnkXoThMxCC0fRrNpPRV0DAzWGfywmNtI5RU
Message-ID: <CA+EHjTympdi0wei2Qx=hF2cYvHpzE0sWto2ypcJB3ddmonTROg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] KVM: arm64: Factor out pKVM hyp vcpu creation to
 separate function
To: Quentin Perret <qperret@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, mark.rutland@arm.com, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, vdonnefort@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_235851_458878_8A0FBAC3 
X-CRM114-Status: GOOD (  16.19  )
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

Hi Quentin,

On Fri, 28 Feb 2025 at 19:44, Quentin Perret <qperret@google.com> wrote:
>
> On Wednesday 26 Feb 2025 at 21:55:19 (+0000), Fuad Tabba wrote:
> >  static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
> >  {
> > -     size_t pgd_sz, hyp_vm_sz, hyp_vcpu_sz;
> > +     size_t pgd_sz, hyp_vm_sz;
> >       struct kvm_vcpu *host_vcpu;
> > -     pkvm_handle_t handle;
> >       void *pgd, *hyp_vm;
> >       unsigned long idx;
> >       int ret;
> > @@ -161,33 +178,12 @@ static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
> >       if (ret < 0)
> >               goto free_vm;
> >
> > -     handle = ret;
> > +     WRITE_ONCE(host_kvm->arch.pkvm.handle, ret);
>
> What's the reason to make this a WRITE_ONCE? Does it mean we should
> update the readers to be READ_ONCE()?

I don't remember the original reason, to be honest. In this case, it
was to make it consistent with downstream code in Android. That said,
I plan on revising all of these soon and fixing this (and related
code) in light of Will's comment regarding potential specter gadgets:

https://lore.kernel.org/all/20250218092705.GA17030@willie-the-truck/

Cheers,
/fuad

> > -     host_kvm->arch.pkvm.handle = handle;
> > -
> > -     /* Donate memory for the vcpus at hyp and initialize it. */
> > -     hyp_vcpu_sz = PAGE_ALIGN(PKVM_HYP_VCPU_SIZE);
> >       kvm_for_each_vcpu(idx, host_vcpu, host_kvm) {
> > -             void *hyp_vcpu;
> > -
> > -             /* Indexing of the vcpus to be sequential starting at 0. */
> > -             if (WARN_ON(host_vcpu->vcpu_idx != idx)) {
> > -                     ret = -EINVAL;
> > -                     goto destroy_vm;
> > -             }
> > -
> > -             hyp_vcpu = alloc_pages_exact(hyp_vcpu_sz, GFP_KERNEL_ACCOUNT);
> > -             if (!hyp_vcpu) {
> > -                     ret = -ENOMEM;
> > -                     goto destroy_vm;
> > -             }
> > -
> > -             ret = kvm_call_hyp_nvhe(__pkvm_init_vcpu, handle, host_vcpu,
> > -                                     hyp_vcpu);
> > -             if (ret) {
> > -                     free_pages_exact(hyp_vcpu, hyp_vcpu_sz);
> > +             ret = __pkvm_create_hyp_vcpu(host_vcpu);
> > +             if (ret)
> >                       goto destroy_vm;
> > -             }
> >       }
> >
> >       return 0;
> > --
> > 2.48.1.711.g2feabab25a-goog
> >

