Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A673C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 20:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cqlSeCpwocQEmK8jPueF1yCbKiDV3dojuJhXPMIV//w=; b=oRScrQxX/Fhm0C95OKysk6zUeq
	+uvAV3HG1daozqSiUKzZmN7BGGXcosgSByZpcendEJTc/TTg+EaUG92Bp1r2RzJgwTEwDJvwXvnIF
	xn9rPEDh5f+fA7wWXSFVXjx3O84+ewP4/8/H+V38M0qJDRfLJQoSknZwmfrcNh4LkynSLe21BkYN6
	qzr6lVcM+IgyHb1hMdvvnXGvz15TUhaTwaVK2AM9In3FOL9arPJ2a1uHKK/dZ1+Zep46ZaC5QS7dd
	S+7F069XDN6ADk8zboAuXoP9whkH51+DYxlzDtoYWkXyisYPzxnyWtGqGJ35x59QKn+kvneNwXS1A
	Me9Ad6Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjjSl-0000000DCAg-21NQ;
	Tue, 14 Jul 2026 20:10:43 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjjSi-0000000DCA9-1OXp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 20:10:42 +0000
X-Forwarded-Encrypted: i=1; AHgh+RpU5V+Q8vE7AB+/etON9t1kwXORa/s385S7Fbntdp6jttWDDJrArq2xSzmRXtOooktCxC5hb5sjBRjVvXJEnclN@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784059837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cqlSeCpwocQEmK8jPueF1yCbKiDV3dojuJhXPMIV//w=;
	b=pomT0SPPzLKTdMIZItolEgi1i1OA8ryK15pwmZQvvyhS9h3+seCA79gt7HpDDtRGSQArAU
	Nt62/fwm4+WQy7qmobQ30ju4ESrIpDyrKWurvngl6h1ha7TbxGRidY5NmSsHvzYEfkjXEK
	RSuILr2tlgO42ZEBhzUuThukq/Rf81o=
X-Gm-Message-State: AOJu0YxUH043JEdhAOLQQrhpNHBgYFUYF8AYIJmPzKgg3pwJYuNxkJri
	/RxLAcxns/TvVjJM/jA4R5WkJEhqd097vTwCuM1Yu0YyRc5FfASLJnak4Vt5B0NXICC39WfQgtI
	rZfbxHsEpANNzhEf90R+7CR01EKmxVL/2YgfZkJDc
X-Received: by 2002:a05:622a:289:b0:519:b82d:fe62 with SMTP id
 d75a77b69052e-51d7bcc96ffmr17653231cf.7.1784059812809; Tue, 14 Jul 2026
 13:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com> <20260706175415.2604046-10-vdonnefort@google.com>
In-Reply-To: <20260706175415.2604046-10-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 14 Jul 2026 21:10:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzm-Nv_FaTGT1-f0tx1v4kYVaa9LcfNgvEiQJOo_nyF3Q@mail.gmail.com>
X-Gm-Features: AUfX_mzBFXy0D-wOkq0LD_Ri-IqJu87749Yb0iJ6-50K_-aUHBIcRFe2rotbFjY
Message-ID: <CA+EHjTzm-Nv_FaTGT1-f0tx1v4kYVaa9LcfNgvEiQJOo_nyF3Q@mail.gmail.com>
Subject: Re: [PATCH v2 09/18] KVM: arm64: Add reclaim interface for the pKVM
 heap alloc
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_131040_538047_AC248F0A 
X-CRM114-Status: UNSURE (   7.74  )
X-CRM114-Notice: Please train this message.
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

On Mon, 6 Jul 2026 at 18:54, Vincent Donnefort <vdonnefort@google.com> wrote:

...

> +
> +unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id)
> +{
> +       return kvm_call_hyp_nvhe(__pkvm_hyp_reclaimable, id);
> +}

Missing new line.

With that fixed:

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

>  static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
>  {
>         if (pkvm_hyp_vm_is_created(kvm)) {
> --
> 2.55.0.rc2.803.g1fd1e6609c-goog
>

