Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3A7C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 06:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0xDEdzgIvp1jXjtMCIvp5g1TCOxOf/z9+CMM5yvNJ0=; b=AwjlDvhrw+61Ge+q3vEcevCBCE
	beSFMC21GC1T0G2rsCaBke6fXheecv1+YumpsMF1trp7d2zWLVoXrCyA37zHKr/JZLRwmlYqH6h8Y
	oBwryPmmBOH0mdz3BW9rkfZHKjOJxS8NYhRiKIwKZRbhvYtyzAQ9avtkLVeKzMkDP25gGNvCsf/gR
	wlMFfrb6XrH61Pkaypynl2Pxu+lG99NN7IcQHagDdtI6rxqU9+YTwaB4rszFE+C68VNNMS4eN2PVw
	SxyctC0oEyciah8kbDNAVyvlVVAEWpUnv8jrxJm78Vt7EoG0GAzywz8ou7JqKfyVFYFFqVsCmr2dY
	D/MU91GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60Eq-00000002RSd-41m8;
	Mon, 14 Sep 2026 06:32:24 +0000
Received: from out-245.mta0.migadu.com ([2001:41d0:1004:224b::f5] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60Eo-00000002RSB-247Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 06:32:23 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=u0xDEdzgIvp1jXjtMCIvp5g1TCOxOf/z9+CMM5yvNJ0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789367540; v=1; x=1789972340;
 b=Wi+as+e2fxIEdGdAXuJAhreqaVnuqvi2o7k44QtsDtkFmUMo0fuUQslBmBZ/vYX0aI++E7aJ
 dixO9tVWhvn+OX52Lfmw8Z+GAl3rXKDMEQ5hTXzAC/pALqaIVzvSiAG/B8wKRfNIcKF5owHLFJP
 6ns11EdcQgzxPX0Sbw+DboPk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id bf089fa553549ae1;
	Mon, 14 Sep 2026 06:32:20 +0000
X-Mizu-Trace-ID: bf089fa553549ae1
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so5006e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 23:32:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwdG4eFkyA7Sq1XI82a9L6c2vRezY0fMvFRItp5piD+ocYPDitG23H3GWFQrllN7GNXyowZ0jCpGD4+1URrTIf3@lists.infradead.org
X-Gm-Message-State: AFuF++mgz4jnUcbHZbRreuNk9rUPsVK5E/X12Mxq3hSZDrDjqEfRK+rP
	va5DAlR1iFsQ4WcIpGtSG1BYC+GQUH0ZLKJSG/sJFWMqlSt9QHf+Btgry1j5Vs2DaVBbs5AIL9p
	DdR05pLexDhEXPgI8a1/4+Csh7ckowxzZmYf8fpFQ
X-Received: by 2002:a05:6512:3e0e:b0:5b8:9e63:dfb9 with SMTP id
 2adb3069b0e04-5b8ae42ae97mr21520e87.0.1789367538566; Sun, 13 Sep 2026
 23:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
 <20260907070002.3333525-15-fuad.tabba@linux.dev> <86jyos6j2o.wl-maz@kernel.org>
In-Reply-To: <86jyos6j2o.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 14 Sep 2026 07:32:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwL4dUC6_ok+OE=zhFK_Dhosc1Nji4Vp4hr+HYibF6cgQ@mail.gmail.com>
X-Gm-Features: AcwNN1V3-IRZLy4EhuEzKp1SiumXuAoMIBvvNz1M8aC8VCuBKY3hnZnOfpboMkk
Message-ID: <CA+EHjTwL4dUC6_ok+OE=zhFK_Dhosc1Nji4Vp4hr+HYibF6cgQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/17] KVM: arm64: Reject host access to protected VM
 private state
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_233222_679881_8F0A21B4 
X-CRM114-Status: UNSURE (   9.95  )
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

Hi Marc,

On Fri, 11 Sept 2026 at 13:58, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Why can't these be moved to the ioctl callback? Something like:
>
[...]
> +static long pkvm_filter_vcpu_ioctl(struct kvm_vcpu *vcpu, unsigned int ioctl)
[...]

Much nicer, I'll move the three has-run checks into that filter for
v3. I think we need the other two where they are, though: the
ext_dabt_pending check reads the payload, and KVM_SET_GUEST_DEBUG has
its own case in kvm_vcpu_ioctl(), so it never gets as far as
kvm_arch_vcpu_ioctl().

> Where is KVM_CAP_ARM_INJECT_EXT_DABT rejected?

In kvm_pkvm_ext_allowed(): on a protected VM it returns false for any
capability it doesn't list, and patch 16 doesn't add this one, so
KVM_CHECK_EXTENSION on the VM fd returns 0 for it (and for
KVM_CAP_SET_GUEST_DEBUG). I'd keep the ioctl check too, for the VMM
that doesn't ask, since userspace has been known to act silly. I'll
say so in the commit message and in pkvm.rst (maybe not the silly
part).

Thanks,
/fuad

