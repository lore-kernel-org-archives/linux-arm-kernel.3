Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60C8C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 07:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IpqXFrS1NB1BDTCOO0C+m5oC/RZho0KkGZKJQ40BZfg=; b=uw0a7g/ZAMKpiUBNHVLRC/aZc2
	+ZZUdizHFe8m1snBw3PxK0mpenVsZr8bAwvHitY4HqcUUOjUuXsZOm8sFUozO6DxamVayYZc7AfWi
	IoFZRmqp6CnwO6HgXHi9kazC2it9WzEvdrt+l0Q6aryPalR5O8jiu9qYcG47NJBibPL21l42t5MUb
	Hc+qX3frbNEShEcCAH+MxGYagLKlO/p6lhOXsuPhFnYm/WElQLB/6PzdINmhtGt2JTcgXxln1GXr1
	/FL4+i5Do82uOr5oQVK/OngJWvZsZ25d7s4t07WMp9NWvOvVINQ4E18MrKQTEI1Tz9capFUoYyBWI
	W5zPYROA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YPF-00000001Cje-3V3t;
	Mon, 21 Sep 2026 07:25:41 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YPD-00000001Cj0-3YUu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 07:25:41 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=SahGD8wStb0BEVF7yvvFemwPhMiROYcEgpClXUQfv20=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789975537; v=1; x=1790580337;
 b=qxnypM6+uUXKE0+wizVi1a0TkfwqU8fcG55x2xSHwjQKMc68D5ufFsX1kCVyUFVynpVyoZP3
 pVGlI34XJY/+YFFgEDWlAH3bxJOCPlnTzACAcCHC6KFJfxsKzdbbpeBtbVGxfBVgh9Vql6vjiud
 ibpLL5nUiPI6m2r1Xd48bdRs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id df7dcbebfd6fb735;
	Mon, 21 Sep 2026 07:25:37 +0000
X-Mizu-Trace-ID: df7dcbebfd6fb735
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso6147e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 00:25:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxYUZQQi8X3HSAftGuYQCwQVIpMbSHDM9oPYm3pBTUGX4ZVdC9d2ReE0OaTYLADxiaQsRQvxBay1CVOfbODc/TJ@lists.infradead.org
X-Gm-Message-State: AFuF++nC0vlvA6rXL+dB9YkW6q4drbasEZzMEw+F5Mj07NZekbxkLhrC
	FdPhV7SwbW4RuhPe7qE3LSPURQ4+U0giI6Yt7rOUgqdQgViIRaBafY89Bl9ZdycpdrDXoFLBIFb
	vr5N6dGOBpAgMJmp+9OVDUFOcHLDlAlNQBWy/tYXj
X-Received: by 2002:a05:6512:10cd:b0:5b4:9dba:7403 with SMTP id
 2adb3069b0e04-5b8c7eaef8bmr111208e87.13.1789975532579; Mon, 21 Sep 2026
 00:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260921063718.1604533-1-fuad.tabba@linux.dev> <arDYHSlFHm_XzGvN@kernel.org>
In-Reply-To: <arDYHSlFHm_XzGvN@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 21 Sep 2026 08:24:56 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz0-qS8RRhdT8XjAgWqKhgjjzbRsZ_jwTBVqM-8pXk7Vw@mail.gmail.com>
X-Gm-Features: AcwNN1VMg6PbfnlRIzn1fjVR1-_CkT5UjrC7WdHauJujyrzeyYN_lrO0wc8jZWk
Message-ID: <CA+EHjTz0-qS8RRhdT8XjAgWqKhgjjzbRsZ_jwTBVqM-8pXk7Vw@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Restore the VM's feature bitmap when
 kvm_setup_vcpu() fails
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Jack Thomson <jackabt@amazon.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_002540_027455_440E9CF1 
X-CRM114-Status: GOOD (  17.07  )
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

On Mon, 21 Sep 2026 00:09:17 -0700, Oliver Upton <oupton@kernel.org> wrote:
[...]
> > Nothing in the tree loads a vCPU whose init failed, so this is latent.
> > The upcoming series that enables KVM_PRE_FAULT_MEMORY for arm64 exposes
> > it: the generic kvm_vcpu_pre_fault_memory() calls vcpu_load() whether
> > or not the vCPU has been initialised.
>
> That's a bug, not a feature. We should require an initialized vcpu for
> the ioctl.

That one is for Lorenzo then :) I'll reword the message so the stale
bitmap comes first and the pre-fault crash is just how it showed up.

[...]
> The bitmap copy is a bit confusing because there's only two possible
> situations:
>
>  - KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED is unset and the bitmap was
>    previously zero
>
>  - KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED is set and @init->features is
>    identical to vcpu_features (see kvm_vcpu_init_changed())
>
> While there's nothing wrong with your diff, I'd prefer if the above
> detail was represented directly.
>
>         ret = kvm_setup_vcpu(vcpu);
>         if (ret) {
>                 /*
>                  * Clear the bitmap if setup fails on the first vCPU to be
>                  * initialized.
>                  */
>                 if (!test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags))
>                         bitmap_zero(kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);
>
>                 goto out_unlock;
>         }

I'd gone for the restore so the failure path didn't depend on the
flag, but those two states are all there is and your version makes
that explicit. I'll use it in v3.

Thanks,
/fuad

