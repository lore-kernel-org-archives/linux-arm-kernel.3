Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9428F606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iKr4r0oN;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m2xj551U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7WhTA0Y8V6vZp2rorlhZwrgj9nL0x892/MR/HRLGhZE=; b=iKr4r0oNGQ5CGk6m/jRvM/cib5
	6C+038H77cIMaPWnYtwcn/EQFWTNxm7xnK3HTHeRG5hQWRqpH6g1TMvg5PpkQ9ZV0rYBLPYsrKXbQ
	AJpaKDY3Qni0WR+QNucCyJXqDYrCvFWRFcRuzU2XymFvkj8JyOMhfAcEOQrbWN5zl3YmlllGehwgY
	Po22c0nDn9IlCC6isiJm8B5xZP/dglp87oRMTd7LNisW6WmWNAVT+gP+tvgDQlte7793RK0Am+Hvm
	NDrJsP5hz7TlVJlXlP7nV/g4awCcDrNrLaTRHpYhwIayp8ragAUd1yjM0tBtShle370Adxk/KCQ4G
	7et4ZrFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoZH-0000000G3CK-12Dz;
	Mon, 02 Nov 2026 09:43:07 +0000
Received: from out-64.mta1.migadu.com ([2001:41d0:203:375::40] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoZE-0000000G3BJ-1K1Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:43:06 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=R0ifyYqy3IXOuNSpfX4Jz2GTYZxqEkqpRu+RTCJxyeU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793612582; v=1; x=1794217382;
 b=m2xj551UgRrE81oHG0d+QSgJ41Q680vBa4Qe8kLQXs+tvXbOvpVoO46ep050VOzEMOPNYOgq
 N4iM2QojHe9tL/bziYIjXTK6/FZl3W5JLJCB8zWL3g0PwBPWleIrTJ2Fq4TKvOela7xzJ9G9y6S
 JMH1wz1fi2blq6ybBFfImBG0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a430f5fa2618615b;
	Mon, 02 Nov 2026 09:43:02 +0000
X-Mizu-Trace-ID: a430f5fa2618615b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be58ad9600so10153e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:43:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzhpS6InvTDnPpZSTyjkOZBuOdodGYYR8PIAJ2Az9GriHC6hcYrYU5513QbgCyy/P/rdth8NzackstsTAgG9LLj@lists.infradead.org
X-Gm-Message-State: APuU4Z/+gY1JMciLcPcb8v3nJSy35RKFkpGK7rU13HMsDZVuCvDHS3P5
	kRjKoaa0asme6jflZXHGzj1P+LcISq+gTpk+6COjn5EaQcco3i2L2AN0JFvpx1qQck4ztjJA2fA
	mAP8hLJhbWO7t6b/e1PFyzFr0aZG7tbu/vPiKmmWC
X-Received: by 2002:a05:6512:3353:b0:5b4:74e2:4171 with SMTP id
 2adb3069b0e04-5bfd13fc8d8mr558803e87.4.1793612581038; Mon, 02 Nov 2026
 01:43:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102075843.2556018-1-fuad.tabba@linux.dev>
 <20261102075843.2556018-2-fuad.tabba@linux.dev> <07d0afa8-1b9a-4991-a419-9840cf629d57@arm.com>
In-Reply-To: <07d0afa8-1b9a-4991-a419-9840cf629d57@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 2 Nov 2026 09:42:24 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwNSxBa8-_0Q6zmgqW0RGyVhpUU3xnFg3-sqqmsdL4s8A@mail.gmail.com>
X-Gm-Features: AclHuK8-iGCZpGhNLfgi22ISGBTFMIXgkMtlm2Ix60vIMu408Jz2-z6XjUn9gQI
Message-ID: <CA+EHjTwNSxBa8-_0Q6zmgqW0RGyVhpUU3xnFg3-sqqmsdL4s8A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] KVM: arm64: Clear the VM's feature bitmap when
 kvm_setup_vcpu() fails
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Will Deacon <will@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Jack Thomson <jackabt@amazon.com>, 
	Congkai Tan <congkai@amazon.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_014304_516416_69A64F19 
X-CRM114-Status: GOOD (  15.77  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Suzuki,

On Mon, 02 Nov 2026 09:24:15 +0000, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> > @@ -1856,8 +1856,13 @@ static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
> >          bitmap_copy(kvm->arch.vcpu_features, &features, KVM_VCPU_MAX_FEATURES);
> >
> >          ret = kvm_setup_vcpu(vcpu);
> > -        if (ret)
> > +        if (ret) {
> > +                /* Clear the bitmap if setup fails on the first vCPU to be initialized. */
> > +                if (!test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags))
>
> Is this check necessary ? We go into kvm_setup_vcpu() only if the bit is
> cleared and we do this under the config_lock mutex. The flag is only set
> after we have finished the kvm_setup_vcpu() successfully, later down.

It is. An INIT on a second vCPU with the same features also calls
kvm_setup_vcpu(), with the flag already set, and
kvm_vcpu_init_nested() can return -ENOMEM there.

Thanks,
/fuad

