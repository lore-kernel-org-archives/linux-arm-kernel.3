Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C1BC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXSiS7hQ0cVWleo6eSaBan8aztzKf2VAYt0ApgopT3Q=; b=lMWfudq54+8RBQKZ6hXAz4doeV
	Yg3sG3jZBaHHLKej4W8q8/9iTcbZBBXonulh1ZElQfey9Sqcx4qDYjP7S+JMCp6l2/IrwSyTkxjRR
	y9ta1/I/tMGRnfK4CZtYNxENbwkKBVYOGHvmBSP61PoyuCj6wT07iLygkqDgb+0DQCfy/1/dnhXcA
	lqXz1IDInfwHobH164AzieXmRVFN6foJeUTZ9ZgPUhu/ePPZxdB6K8pG9jSnOQYpcxby/8q5itUhF
	PSaomlliUihSauhmVgomdudwWRgnwgCt0tB+eHS2k1chJcCSQJEDWlC8FbNg71ihVGwUJDdL64uMm
	+8yFAr5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QKv-00000005uGj-438E;
	Tue, 15 Sep 2026 10:24:25 +0000
Received: from out-10.mta0.migadu.com ([2001:41d0:1004:224b::a] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QKr-00000005uFf-1GV9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:24:23 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=eEpTu0phK8BsqOnC0fc6MeL/3Km/1p8O2zPIqVueRhk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789467859; v=1; x=1790072659;
 b=LQKHylLWB89skJseoo7xgznKwhq0qN+0PWkIkHKhSOUlts9MsMTVgUr8QXQKAw9HDiRmLREC
 g3cCCiFjnc5DHVFJTC1G8CObDx8YcWS/UAlFxFgnrLGf37cL/6bCRnFbGOR9sFFtGLKpUg6FvIA
 GmK78z7OPJ/2qY/4mb9k2STI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a13db3921302c32c;
	Tue, 15 Sep 2026 10:24:19 +0000
X-Mizu-Trace-ID: a13db3921302c32c
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so4145e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 03:24:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzgRcMtStIzuE5loqco+mGqkTd2Lnaji3phi/F8LN5nrD+PBgr5u7CkvoBbx4xhPFszXZ02R0MiFxYMmR0nC9Ty@lists.infradead.org
X-Gm-Message-State: AFuF++k101dgO506m7ZJStipNe5TJ74bZlhkX25aeVQPVfOclgctC4//
	BHwOfnPhw7oIDaIwoq5sjm5uV2qhWxz77EORBvCFUsIqsYPTvHqsDpDOEEpRNVQ+IIVMSo4QYDj
	YS92fX6IETcQoM3VylrUAO9i1r1Yg5Wx2yMciKeIJ
X-Received: by 2002:a05:6512:3c91:b0:5b8:9e63:dfb4 with SMTP id
 2adb3069b0e04-5b8b2d4f6a7mr177569e87.14.1789467855333; Tue, 15 Sep 2026
 03:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260915070418.3209779-1-fuad.tabba@linux.dev>
 <20260915070418.3209779-2-fuad.tabba@linux.dev> <aqkbS810aDLyfS7D@e143914.arm.com>
In-Reply-To: <aqkbS810aDLyfS7D@e143914.arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 11:23:39 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyc_OL6H8iyjO+hjU9gqxCaJQUv4CUSQ-R6ZRJvG=siDg@mail.gmail.com>
X-Gm-Features: AcwNN1URDJWh2M5sOKluQk7udRVOG1eRZZAroybUEQB5EN27YFtm1788x3yXVpc
Message-ID: <CA+EHjTyc_OL6H8iyjO+hjU9gqxCaJQUv4CUSQ-R6ZRJvG=siDg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: arm64: Validate the host vCPU's VM before
 reading it under pKVM
To: Joey Gouly <joey.gouly@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	steven.price@arm.com, vdonnefort@google.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_032421_483169_F11E5797 
X-CRM114-Status: GOOD (  13.03  )
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

Hi Joey,

On Tue, 15 Sept 2026 at 11:17, Joey Gouly <joey.gouly@arm.com> wrote:
[...]
> > -     if (kvm_has_mte(kern_hyp_va(vcpu->kvm)))
> > +     kvm = vcpu_get_kvm(vcpu);
> > +     if (kvm && kvm_has_mte(kvm))
>
> It's fine to use the "host->kvm" here because even if sets this bit on
> the host vCPU, the per-entry handlers in the other series won't copy
> across the TCO bit.
> Right?

Yes.

> >               new |= PSR_TCO_BIT;
> > +     vcpu_put_kvm(vcpu, kvm);
> >
> >       new |= (old & PSR_DIT_BIT);
> >
>
> [snip]
>
> Agree with the nits that Vincent suggested!
>
> Let's see if this sticks this time:
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Carrying it over for the respin, thanks again!
/fuad

> Thanks,
> Joey

