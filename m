Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9CDC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VA2BpY1RprxIVjKDa8wnO4x1UZu8z1xRvCFWVXDq1RU=; b=SQOgWJqWoYJClANjMuN+ovkGv1
	FrNsGSq5Td127pbB76JFeK1NKL7lXqNBv3YCWro7WfxUf9yyBrVo7Vyss0/pc5rJslFB9wz+UFWPp
	uU6wajx8eRxODJNjNHWhCXybPO4SZo38N34nENn10JpuzZ/lJyWTCps23i8jtPcvjDW6mxt2LQ2oJ
	cj11fmi4IkohBlDlDD3csiPt1rMoQj+CfUqsSdMiy3hs3jKWQwRNKOMbHRx6MZx6qkLGxe9PbI9HS
	W5TXYWnXg+LpYGsb4jUgy7pVUqMHGCaMADUCT6U714qlNO7hLOGJB9r1UBHF8ldTxdT47X+ykKETr
	iVHnP4Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyAIb-0000000FSFO-1qS6;
	Sun, 23 Aug 2026 15:39:53 +0000
Received: from out-233.mta0.migadu.com ([2001:41d0:1004:224b::e9] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyAIZ-0000000FSEy-0iv7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 15:39:53 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=W0TlGb6F34q6Kl5UWG4lZXAn8pUN8AHkhRFYqa9i08k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787499588; v=1; x=1788104388;
 b=b/tRiIGPdhOV0e2DLocmqNoU8j0p0drjU2CPlRJIZrzTerB20k9WOvIinMsw8wQdXq5vq8IG
 CzdgnLcwL0ha6AdSJL2+WHwsoFhqdt2HW5sJ1KrFUW48YJPOyECthSAOXsl4ag8QjNTlfnsjYJD
 FnYU1Voj6d3HjEZLvzov/oU4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f46.google.com (209.85.167.46)
	by smtp.migadu.com with ESMTPS id 3dabbba86fb9ba55;
	Sun, 23 Aug 2026 15:39:48 +0000
X-Mizu-Trace-ID: 3dabbba86fb9ba55
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b2a8173142so5435e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 08:39:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoOiYNSj6zWESMUjLAanRkxPctNjLcg8fIQzMcJMwE9WHo+M+yrIzNs+1yVmDU8WvcwiIWtYoST5ubNbeI3Hdkf@lists.infradead.org
X-Gm-Message-State: AFuF++mMM9Z3sV8Z5Hr0v+/xr6Pr9S3VER01tQ2ng5ihD8FeF6w+5e5i
	waQTh23iVH/Rp/XIXs6AjzL+zlQ8uhFZ0QyPYbeM1tw1Upwm+EESjUzsBkG3ebI3903yYwUjP07
	NEMK2DQn0zN8KXoG//gAqxAwdhyJV1GqFXAuRT2pR
X-Received: by 2002:a05:6512:1093:b0:5b1:571f:715f with SMTP id
 2adb3069b0e04-5b48c2f784amr130059e87.3.1787499583194; Sun, 23 Aug 2026
 08:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260822095346.53882-1-kmehltretter@gmail.com>
In-Reply-To: <20260822095346.53882-1-kmehltretter@gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 23 Aug 2026 16:39:06 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwcJ7zvw5bgqmt2-OiW7q01Vwm3rn1gTFn-39Lu4qDWJg@mail.gmail.com>
X-Gm-Features: AcwNN1U6KyA3LCwgTCyTTj8u2ge9LgDR8EDiemOl63d62mt3Rz0sod8kkzdxcH4
Message-ID: <CA+EHjTwcJ7zvw5bgqmt2-OiW7q01Vwm3rn1gTFn-39Lu4qDWJg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] KVM: arm64: fix VGICv3 redistributor rollback
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Eric Auger <eric.auger@redhat.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_083951_532628_B9205087 
X-CRM114-Status: GOOD (  14.19  )
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

Hi Karl,

On Sat, 22 Aug 2026 at 10:53, Karl Mehltretter <kmehltretter@gmail.com> wrote:
...
> Testing: built the patched kernel and the arm64 vgic_init selftest with
> GCC 13.3.0 in an arm64 Linux container. The selftest passed under QEMU
> 11.0.2 TCG with -machine virt,virtualization=on,gic-version=3 and -cpu max.

Applied this on kvmarm/next: protected and non-protected guest boots
under pKVM, plus VHE and nVHE, and the vgic_init, vgic_irq and
vgic_lpi_stress selftest. Also built the base with only patches 4-5
and confirmed the new test fails without patches 1-3.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


> ---
> Changes since v2:
> - Patch 1: limit free_index rollback to the immediate registration failure
>   under slots_lock instead of generic unregistration. (Sashiko)
> - Patch 2: reset all assignments and region counters after a failed region
>   update (Marc), and serialize REDIST and REDIST_REGION writes with vCPU
>   creation so rollback cannot miss an unpublished assignment.
> - Patch 3: add an already-locked unassignment primitive, move failed-vCPU
>   cleanup to kvm_vgic_vcpu_destroy(), and remove the redundant base_addr
>   reset. (Marc)
> - Patch 4: match vm_create_with_vcpus() by using void * for the guest-code
>   argument. (Sashiko)
> - Patch 5: document how the first three redistributors span regions 0
>   and 1; no functional change.
>
> Previous version:
> v2: https://lore.kernel.org/r/20260819224229.82948-1-kmehltretter@gmail.com
>
> Karl Mehltretter (5):
>   KVM: arm64: vgic-v3: Undo assignment on iodev registration failure
>   KVM: arm64: vgic-v3: Reset redistributors after failed region setup
>   KVM: arm64: vgic-v3: Separate redistributor teardown from unassignment
>   KVM: arm64: selftests: Pass guest code to vm_gic_create_with_vcpus()
>   KVM: arm64: selftests: Test VGICv3 redistributor region retry
>
>  arch/arm64/kvm/vgic/vgic-init.c               |  46 +++----
>  arch/arm64/kvm/vgic/vgic-kvm-device.c         |  20 +++
>  arch/arm64/kvm/vgic/vgic-mmio-v3.c            |  83 ++++++++-----
>  arch/arm64/kvm/vgic/vgic.h                    |   1 +
>  tools/testing/selftests/kvm/arm64/vgic_init.c | 116 ++++++++++++++++--
>  5 files changed, 200 insertions(+), 66 deletions(-)
>
>
> base-commit: 57e7cf13ac26bf1a3dba6cfa601f7b2481811575
> --
> 2.39.5 (Apple Git-154)

