Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEC6C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 06:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlYljchxQ5reT/eVU8Xnl/sWmMhVEbgvnN8Wduj0Ep0=; b=Mqzr6s4ksR1cjZ427Cs3SINcQE
	VHNywgg1p4RUwxMgXHL5O1T1LJXzqByF4phxDWxT1bArKD6PxIBhBLg3B8YUUfJJ2Ns6TJpcFDb/x
	WxdLoI9rCK/iwV4wfQVxobW/ninynJlg+MRmI8UuQpQto7/BkjuwwueCSa66I32pxetEqMIzbJh8X
	AGSrcdE0VvisrW/vo5Pv6nTAriSBqVAAdyprczZfPxTU4ZM82vYrnFjbkNRTUsFULxe++V5CCr3su
	ivr09bDRqRyE1JIGah76OhQBym/nqQ5Rgjoz4l9IoepVM8KJSUKcN8rlqkCJ9/jFTthj9AjxIZZyr
	u2mcbvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKJP-00000009cTn-1nFI;
	Thu, 30 Jul 2026 06:32:11 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKJK-00000009cTC-3x6s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 06:32:09 +0000
X-Forwarded-Encrypted: i=1; AHgh+RriiUYyheV6Xv3kpL4CnGl9yhafW0/NHCndigb7ZUYaQAYIuwO7zop0eehTF+yF2L4W8U02BUyTpTS5u9PjomZ+@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785393118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vlYljchxQ5reT/eVU8Xnl/sWmMhVEbgvnN8Wduj0Ep0=;
	b=bhsMJjpO5V5Ql9j2czWTeoq/Vo5mLpB3dCOmEoJoNxc6vCFEZWX8UWB5Sg0iwInENtzJMK
	gExl5TG7UEw4huphDvFziUfFvO6TgVrOt2Uyo76KJNVI62GYTIHTioLxDlubo+X9VA+5Qm
	ikimQWdF3zKNrzIlJFegMnIJiCEQDVM=
X-Gm-Message-State: AOJu0YwmZhrtTFXEjKtSDwTEj7A8+CJ4FKndbOOS221NNqSe5dv6Xeey
	XiNjusJ74aE8+FQij+nhFYXAATo/CzlnsJFRzKxuVP3aWVGvIT9qwESa4arBf/HmqIr+vbKhAvD
	8wtqV2RRvIoCmvvuJRwC8q1SNhwsQfX/fTRb0R2j/
X-Received: by 2002:a05:622a:684e:20b0:517:5ac7:332e with SMTP id
 d75a77b69052e-52b3933f844mr5275111cf.6.1785393052137; Wed, 29 Jul 2026
 23:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 30 Jul 2026 07:29:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyAtAg=u61nwqGYPstRkq1qiBJ=Up_9e=J_3FUOONZ9YA@mail.gmail.com>
X-Gm-Features: AUfX_mwGOo05YLjkVSJlO76kvHbah6i3Ay-YiXXIqVAHXXpYgYhu4HvJ-rdWTks
Message-ID: <CA+EHjTyAtAg=u61nwqGYPstRkq1qiBJ=Up_9e=J_3FUOONZ9YA@mail.gmail.com>
Subject: Re: [PATCH v9 00/16] KVM: arm64: PMU: Use multiple host PMUs
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
X-CRM114-CacheID: sfid-20260729_233207_157839_207C03CB 
X-CRM114-Status: GOOD (  23.87  )
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
...
> A QEMU patch that demonstrates the usage of the new attribute is
> available at:
> https://lore.kernel.org/qemu-devel/20260706-kvm-v4-1-089cac8c25c3@rsg.ci.i.u-tokyo.ac.jp/
> ("[PATCH RFC v4] target/arm/kvm: Choose PMU backend")
>
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

I didn't test with the QEMU patch, but I tested on QEMU: booting the
host and a KVM guest, plus the vpmu_counter_access and get-reg-list
KVM selftests under nvhe, vhe, andvhe with kvm-arm.mode=nested.

For the series:
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
> Changes in v9:
> - Dropped patch
>   "KVM: arm64: Disallow vPMU when pPMUs do not cover all CPUs".
> - Added patch
>   "KVM: arm64: PMU: Stop updating MDCR_EL2.HPMN".
> - Added patch
>   "KVM: arm64: selftests: Cover PMU state in MDCR_EL2".
> - Added patch
>   "arm64: errata: Require Apple IMPDEF PMUv3 traps on all CPUs".
> - Added patch
>   "KVM: arm64: Don't clear vcpu->cpu in kvm_arch_vcpu_put()".
> - Noted that fixed-counters-only mode avoids relying on the default PMU.
> - Clarified why fixed-counters-only mode hides PMCEID.
> - Added patch "KVM: arm64: Serialize repeated vCPU initialization".
> - Added patch "KVM: arm64: PMU: Freeze counter count after first run".
> - Added patch
>   "KVM: arm64: selftests: Test SET_NR_COUNTERS after first run".
> - Added patch "KVM: arm64: PMU: Recreate events after MDCR_EL2 changes".
> - Clarified why extra IMPDEF PMUv3 trap support on a late CPU is safe.
> - Changed fixed-counters-only emulation to taint the kernel when it
>   encounters a CPU without a registered pPMU; see the commit message.
> - Added patch
>   "KVM: arm64: PMU: Keep implemented counter mask EL-independent".
> - Added a targeted bitfield helper type change to tools headers.
> - Link to v8: https://patch.msgid.link/20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp
>
> Changes in v8:
> - Added patch
>   "KVM: arm64: Disallow vPMU when pPMUs do not cover all CPUs".
> - Split patch "KVM: arm64: PMU: Introduce FIXED_COUNTERS_ONLY".
> - Documented the FEAT_PMUv3_ICNTR support plan.
> - Ensured KVM_ARM_VCPU_PMU_V3_FILTER and
>   KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY are mutually exclusive.
> - Ensured KVM_ARM_VCPU_PMU_V3_SET_PMU and
>   KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY are mutually exclusive.
> - Dropped the code to support KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS for
>   KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY.
> - Added a function to de-duplicate
>   "test_bit(KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY, ...)".
> - Link to v7: https://lore.kernel.org/r/20260418-hybrid-v7-0-2bf39ad009bf@rsg.ci.i.u-tokyo.ac.jp
>
> Changes in v7:
> - Fixed the vCPU run hang in test_fixed_counters_only().
> - Link to v6: https://lore.kernel.org/r/20260413-hybrid-v6-0-e79d760f7f1b@rsg.ci.i.u-tokyo.ac.jp
>
> Changes in v6:
> - Removed WARN_ON_ONCE() in kvm_pmu_create_perf_event(). It can be
>   triggered in kvm_arch_vcpu_load() before it checks supported_cpus.
> - Removed an extra lockdep assertion in kvm_arm_pmu_v3_get_attr().
> - Fixed error messages in test_fixed_counters_only().
> - Fixed the vCPU run in test_fixed_counters_only().
> - Link to v5: https://lore.kernel.org/r/20260411-hybrid-v5-0-b043b4d9f49e@rsg.ci.i.u-tokyo.ac.jp
>
> Changes in v5:
> - Rebased.
> - Fixed the order to clear KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY in
>   kvm_arm_pmu_v3_set_pmu().
> - Fixed the setting of KVM_ARM_VCPU_PMU_V3_IRQ in
>   test_fixed_counters_only().
> - Changed to WARN_ON_ONCE() when kvm_pmu_probe_armpmu() returns NULL in
>   kvm_pmu_create_perf_event(), which is no longer supposed to happen.
> - Link to v4: https://lore.kernel.org/r/20260317-hybrid-v4-0-bd62bcd48644@rsg.ci.i.u-tokyo.ac.jp
>
> Changes in v4:
> - Extracted kvm_pmu_enabled_counter_mask() into a separate patch.
> - Added patch "KVM: arm64: PMU: Protect the list of PMUs with RCU".
> - Merged KVM_REQ_CREATE_PMU into KVM_REQ_RELOAD_PMU.
> - Added a check to avoid unnecessary KVM_REQ_RELOAD_PMU requests.
> - Dropped the change to avoid setting kvm_arm_set_default_pmu() when
>   KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY is not set.
> - Link to v3: https://lore.kernel.org/r/20260225-hybrid-v3-0-46e8fe220880@rsg.ci.i.u-tokyo.ac.jp
>
> Changes in v3:
> - Renamed the attribute to KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY.
> - Changed to request the creation of perf counters when loading vCPU.
> - Link to v2: https://lore.kernel.org/r/20250806-hybrid-v2-0-0661aec3af8c@rsg.ci.i.u-tokyo.ac.jp
>
> Changes in v2:
> - Added the KVM_ARM_VCPU_PMU_V3_COMPOSITION attribute to opt in the
>   feature.
> - Added code to handle overflow.
> - Link to v1: https://lore.kernel.org/r/20250319-hybrid-v1-1-4d1ada10e705@daynix.com
>
> ---
> Akihiko Odaki (15):
>       KVM: arm64: Serialize repeated vCPU initialization
>       KVM: arm64: PMU: Stop updating MDCR_EL2.HPMN
>       KVM: arm64: PMU: Freeze counter count after first run
>       KVM: arm64: selftests: Test SET_NR_COUNTERS after first run
>       KVM: arm64: PMU: Keep implemented counter mask EL-independent
>       KVM: arm64: PMU: Recreate events after MDCR_EL2 changes
>       tools headers: Use u* types for bitfield helpers
>       KVM: arm64: selftests: Cover PMU state in MDCR_EL2
>       arm64: errata: Require Apple IMPDEF PMUv3 traps on all CPUs
>       KVM: arm64: PMU: Protect the list of PMUs with RCU
>       KVM: arm64: PMU: Pass the pPMU to kvm_map_pmu_event()
>       KVM: arm64: PMU: Pass the target CPU to kvm_pmu_probe_armpmu()
>       KVM: arm64: PMU: Implement fixed-counters-only emulation
>       KVM: arm64: PMU: Introduce FIXED_COUNTERS_ONLY
>       KVM: arm64: selftests: Test PMU_V3_FIXED_COUNTERS_ONLY
>
> Oliver Upton (1):
>       KVM: arm64: Don't clear vcpu->cpu in kvm_arch_vcpu_put()
>
>  Documentation/virt/kvm/devices/vcpu.rst            |  30 ++-
>  arch/arm64/include/asm/kvm_host.h                  |   4 +
>  arch/arm64/include/uapi/asm/kvm.h                  |   1 +
>  arch/arm64/kernel/cpu_errata.c                     |   2 +-
>  arch/arm64/kvm/arm.c                               |  18 +-
>  arch/arm64/kvm/pmu-emul.c                          | 241 +++++++++++------
>  arch/arm64/kvm/reset.c                             |  16 +-
>  arch/arm64/kvm/sys_regs.c                          |  31 ++-
>  include/kvm/arm_pmu.h                              |   5 +
>  tools/arch/arm64/include/uapi/asm/kvm.h            |   1 +
>  tools/include/linux/bitfield.h                     |  26 +-
>  .../selftests/kvm/arm64/vpmu_counter_access.c      | 284 ++++++++++++++++++---
>  12 files changed, 510 insertions(+), 149 deletions(-)
> ---
> base-commit: cb9360ae6549120975f20887840fb33d47c13898
> change-id: 20250224-hybrid-01d5ff47edd2
>
> Best regards,
> --
> Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
>
>

