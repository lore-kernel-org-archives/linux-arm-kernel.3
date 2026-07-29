Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08ED5C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZkD05VF0k87b16ZMBfeT0j3aww6dW2ILKTzqN3+UtU=; b=CRUQdPmpabDR6i6nxo2ijBJbAK
	grXlurMJ5k4jSZso2UdyoTP2rXPAy7TrCAVLU2HDLLRSeD2lMadgpaVrvEwHSzpXKminN8dP2CH06
	QETVLvXLJx1Bo1fsTENzA9qbJKQNZxMgbkhMlUhzu+XvIwTz/D157+mLGxGsmKLDZ9b3qnVMQpaW8
	sz1t1i38CzUHMby5UlfYT/hL/zZW+6lU+V0+WE/6Q3olBXYwFAmeUQy4BwtrEcAWF+TFvmZ1L0DO0
	x+SE+R8iXv7tw90QxQS5GGQPcb95ERl5sWwzUXkuvXzHxJwsB9uA0SWMQrRtEVxNZjVDR/EcVb2GM
	07AyMmqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5xR-00000008MTY-2CFq;
	Wed, 29 Jul 2026 15:12:33 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5xO-00000008MT9-29Q2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 15:12:32 +0000
X-Forwarded-Encrypted: i=1; AHgh+RowLogtlZD8uh4mNkYQYG2IryjHkmz/ctOLTecyq097MHgUIVB4Tw+1Nm0b75Bx/l2M7uQiRkB4X5w/3Q1cqaG3@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785337947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GZkD05VF0k87b16ZMBfeT0j3aww6dW2ILKTzqN3+UtU=;
	b=ZA34wSP7Vj5w+Jsl1DRXscwef7lb0K4hDHhrF3cMOTBLNxraFZ7DorZl5YkqRUW88Ls9VF
	Fc4WYRNQ+9iOsisiSCj+vbRFoqa0Wl58k3BprN1RISbnKvGFbtzuIdSRZFzYLgocAnPOX7
	5+f8EMJyXQ6FLOLDnOzGyaqW/bWzWjg=
X-Gm-Message-State: AOJu0YyANMhuDEJ8b8IEz+ZvE/CVphI8FbVRmtjGimXej6p3KGtm7Gut
	L379K8NuKYE0+toevoKFW3W5ynoLcW50/PPfcxl3BGYZmiQdY/6xIyeNwXoViLU6cjgc3sn+kKm
	Yplu8jWAfFOzccjXA2nBHK3dNGOMvklZaQ5jt2uri
X-Received: by 2002:ac8:7e8e:0:b0:51b:ff0a:2048 with SMTP id
 d75a77b69052e-52b350e5e9dmr111891cf.3.1785337931850; Wed, 29 Jul 2026
 08:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-1-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-1-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 16:11:34 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxy6f2EPhtOkHju39hGi91ZM5heu5ZA0upmmDxBq2GstQ@mail.gmail.com>
X-Gm-Features: AUfX_myxJfjxAZR1tFLm51zrI58rRpwUPxuAUzGX7sj7-3UdzYo6Sjg9A4wrAHA
Message-ID: <CA+EHjTxy6f2EPhtOkHju39hGi91ZM5heu5ZA0upmmDxBq2GstQ@mail.gmail.com>
Subject: Re: [PATCH v9 01/16] KVM: arm64: Serialize repeated vCPU initialization
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steffen Eiden <seiden@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_081230_906385_736767F9 
X-CRM114-Status: GOOD (  17.56  )
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

On Mon, 20 Jul 2026 at 06:39, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> The initial KVM_ARM_VCPU_INIT path holds config_lock while resetting the
> vCPU, but repeated initialization of an existing vCPU does not. As a
> result, reset_mdcr() can race with VM-wide PMU configuration and
> overwrite MDCR_EL2 with a stale counter count.
>
> Take config_lock around the repeated-init checks and reset. The vCPU
> ioctl already holds vcpu->mutex, matching the established lock ordering.
>
> Fixes: c8823e51b534 ("KVM: arm64: Fix MDCR_EL2.HPMN reset value")
> Closes: https://sashiko.dev/#/patchset/20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp?part=1
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/arm.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 50adfff75be8..a06ea39f57b1 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1652,29 +1652,26 @@ static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
>  {
>         unsigned long features = init->features[0];
>         struct kvm *kvm = vcpu->kvm;
> -       int ret = -EINVAL;
> +       int ret;
>
> -       mutex_lock(&kvm->arch.config_lock);
> +       lockdep_assert_held(&kvm->arch.config_lock);
>
>         if (test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags) &&
>             kvm_vcpu_init_changed(vcpu, init))
> -               goto out_unlock;
> +               return -EINVAL;
>
>         bitmap_copy(kvm->arch.vcpu_features, &features, KVM_VCPU_MAX_FEATURES);
>
>         ret = kvm_setup_vcpu(vcpu);
>         if (ret)
> -               goto out_unlock;
> +               return ret;
>
>         /* Now we know what it is, we can reset it. */
>         kvm_reset_vcpu(vcpu);
>
>         set_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags);
>         vcpu_set_flag(vcpu, VCPU_INITIALIZED);
> -       ret = 0;
> -out_unlock:
> -       mutex_unlock(&kvm->arch.config_lock);
> -       return ret;
> +       return 0;
>  }
>
>  static int kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
> @@ -1690,6 +1687,8 @@ static int kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
>         if (ret)
>                 return ret;
>
> +       guard(mutex)(&vcpu->kvm->arch.config_lock);
> +
>         if (!kvm_vcpu_initialized(vcpu))
>                 return __kvm_vcpu_set_target(vcpu, init);
>
>
> --
> 2.55.0
>
>

