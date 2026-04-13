Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9E1EBFD16
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIdYpFbPqSqa+u+cU5dz39tKUt9/tNGlnr2A4nJKPQc=; b=c5Xb8VNJcuX5spr4v5PvtJldXr
	ieK9vBsN9KcuBPiBiYVMOjpwnRJq6BZKg+8ccjBxRXZh8NXyu7Ll2SkGqcSv6iyBN0lweSYYKmh2t
	cFnd96ig/cfFy0N+aoIIzBLjJcnyyTBL9MVYIc0YRlVKMHxoXmG6Yae3hjqJsSlaDAyXgn9cTSmZQ
	L8+eY66LW4fQBXUItAT4nHjkCh55ZhN6pGl44jBmx1OWCKYxJvrvIIVpHO57scQgJozBQQ+rplIWG
	pEBdgaWY8Ir0yed3bYSMXSkUwp6Cn6LJJ2kYOJDmXJBouOe/cqnVgw0KB4/yyQmnuAYH05lGO+ZY3
	wCYZBmow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCWD-0000000FFoX-24aD;
	Mon, 13 Apr 2026 08:19:41 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCWA-0000000FFnm-3m92
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:19:40 +0000
Received: from [133.11.54.205] (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 63D8J8cC090058
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 13 Apr 2026 17:19:08 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=YIdYpFbPqSqa+u+cU5dz39tKUt9/tNGlnr2A4nJKPQc=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1776068348; v=1;
        b=N/78aSf7BKLE/mhBIYGN+F/5dKx6SwzbvqrDHIasYyVw/aKVfhhmFa0CfwiWT9Vq
         5C7XQrFOXxEUuS9Fl6Q8apVejmFUaBu5cFFWM2omcvnQpaOAvCa8nsHh1sglVrQO
         FA6whf71D/7H5pECjdIdm8onyW0668ZqGcflfz1mXGxqeY0C6YQDbQCDb1B1ycj1
         ds6/XeJfSOHn3GcnpzFsp3iFc6UPezdvPp0byfSxOcZWxfafupy8qgwv5yjLtcA5
         DsisRNRwyv7RsLZ4KUIcOmy1+xWsnR++aS+M+R6skoaujXWXwlP2coNfL8UKQBsb
         r7m3rQXqqlkwk3qM47PXhw==
Message-ID: <0ea0ac1a-12dd-4b62-956f-fb6ee64cc8da@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 13 Apr 2026 17:19:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] KVM: arm64: selftests: Test
 PMU_V3_FIXED_COUNTERS_ONLY
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
References: <20260413-hybrid-v6-0-e79d760f7f1b@rsg.ci.i.u-tokyo.ac.jp>
 <20260413-hybrid-v6-4-e79d760f7f1b@rsg.ci.i.u-tokyo.ac.jp>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260413-hybrid-v6-4-e79d760f7f1b@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_011939_173856_4AFC5E6E 
X-CRM114-Status: GOOD (  29.54  )
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

On 2026/04/13 17:07, Akihiko Odaki wrote:
> Assert the following:
> - KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY is unset at initialization.
> - KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY can be set.
> - Setting KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY for the first time
>    after setting an event filter results in EBUSY.
> - KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY can be set again even if an
>    event filter has already been set.
> - Setting KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY after running a VCPU
>    results in EBUSY.
> - The existing test cases pass with
>    KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY set.
> 
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>   .../selftests/kvm/arm64/vpmu_counter_access.c      | 147 +++++++++++++++++----
>   1 file changed, 123 insertions(+), 24 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> index ae36325c022f..6e2bf3ad63b2 100644
> --- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> +++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> @@ -403,12 +403,7 @@ static void create_vpmu_vm(void *guest_code)
>   {
>   	struct kvm_vcpu_init init;
>   	uint8_t pmuver, ec;
> -	uint64_t dfr0, irq = 23;
> -	struct kvm_device_attr irq_attr = {
> -		.group = KVM_ARM_VCPU_PMU_V3_CTRL,
> -		.attr = KVM_ARM_VCPU_PMU_V3_IRQ,
> -		.addr = (uint64_t)&irq,
> -	};
> +	uint64_t dfr0;
>   
>   	/* The test creates the vpmu_vm multiple times. Ensure a clean state */
>   	memset(&vpmu_vm, 0, sizeof(vpmu_vm));
> @@ -434,8 +429,6 @@ static void create_vpmu_vm(void *guest_code)
>   	TEST_ASSERT(pmuver != ID_AA64DFR0_EL1_PMUVer_IMP_DEF &&
>   		    pmuver >= ID_AA64DFR0_EL1_PMUVer_IMP,
>   		    "Unexpected PMUVER (0x%x) on the vCPU with PMUv3", pmuver);
> -
> -	vcpu_ioctl(vpmu_vm.vcpu, KVM_SET_DEVICE_ATTR, &irq_attr);
>   }
>   
>   static void destroy_vpmu_vm(void)
> @@ -461,15 +454,25 @@ static void run_vcpu(struct kvm_vcpu *vcpu, uint64_t pmcr_n)
>   	}
>   }
>   
> -static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters, bool expect_fail)
> +static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters,
> +						 bool fixed_counters_only,
> +						 bool expect_fail)
>   {
>   	struct kvm_vcpu *vcpu;
>   	unsigned int prev;
>   	int ret;
> +	uint64_t irq = 23;
>   
>   	create_vpmu_vm(guest_code);
>   	vcpu = vpmu_vm.vcpu;
>   
> +	if (fixed_counters_only)
> +		vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +				     KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY, NULL);
> +
> +	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +			     KVM_ARM_VCPU_PMU_V3_IRQ, &irq);
> +
>   	prev = get_pmcr_n(vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0)));
>   
>   	ret = __vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> @@ -489,15 +492,15 @@ static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters, bool
>    * Create a guest with one vCPU, set the PMCR_EL0.N for the vCPU to @pmcr_n,
>    * and run the test.
>    */
> -static void run_access_test(uint64_t pmcr_n)
> +static void run_access_test(uint64_t pmcr_n, bool fixed_counters_only)
>   {
>   	uint64_t sp;
>   	struct kvm_vcpu *vcpu;
>   	struct kvm_vcpu_init init;
>   
> -	pr_debug("Test with pmcr_n %lu\n", pmcr_n);
> +	pr_debug("Test with pmcr_n %lu, fixed_counters_only %d\n", pmcr_n, fixed_counters_only);
>   
> -	test_create_vpmu_vm_with_nr_counters(pmcr_n, false);
> +	test_create_vpmu_vm_with_nr_counters(pmcr_n, fixed_counters_only, false);
>   	vcpu = vpmu_vm.vcpu;
>   
>   	/* Save the initial sp to restore them later to run the guest again */
> @@ -531,14 +534,14 @@ static struct pmreg_sets validity_check_reg_sets[] = {
>    * Create a VM, and check if KVM handles the userspace accesses of
>    * the PMU register sets in @validity_check_reg_sets[] correctly.
>    */
> -static void run_pmregs_validity_test(uint64_t pmcr_n)
> +static void run_pmregs_validity_test(uint64_t pmcr_n, bool fixed_counters_only)
>   {
>   	int i;
>   	struct kvm_vcpu *vcpu;
>   	uint64_t set_reg_id, clr_reg_id, reg_val;
>   	uint64_t valid_counters_mask, max_counters_mask;
>   
> -	test_create_vpmu_vm_with_nr_counters(pmcr_n, false);
> +	test_create_vpmu_vm_with_nr_counters(pmcr_n, fixed_counters_only, false);
>   	vcpu = vpmu_vm.vcpu;
>   
>   	valid_counters_mask = get_counters_mask(pmcr_n);
> @@ -588,11 +591,11 @@ static void run_pmregs_validity_test(uint64_t pmcr_n)
>    * the vCPU to @pmcr_n, which is larger than the host value.
>    * The attempt should fail as @pmcr_n is too big to set for the vCPU.
>    */
> -static void run_error_test(uint64_t pmcr_n)
> +static void run_error_test(uint64_t pmcr_n, bool fixed_counters_only)
>   {
>   	pr_debug("Error test with pmcr_n %lu (larger than the host)\n", pmcr_n);
>   
> -	test_create_vpmu_vm_with_nr_counters(pmcr_n, true);
> +	test_create_vpmu_vm_with_nr_counters(pmcr_n, fixed_counters_only, true);
>   	destroy_vpmu_vm();
>   }
>   
> @@ -622,22 +625,118 @@ static bool kvm_supports_nr_counters_attr(void)
>   	return supported;
>   }
>   
> +static void test_config(uint64_t pmcr_n, bool fixed_counters_only)
> +{
> +	uint64_t i;
> +
> +	for (i = 0; i <= pmcr_n; i++) {
> +		run_access_test(i, fixed_counters_only);
> +		run_pmregs_validity_test(i, fixed_counters_only);
> +	}
> +
> +	for (i = pmcr_n + 1; i < ARMV8_PMU_MAX_COUNTERS; i++)
> +		run_error_test(i, fixed_counters_only);
> +}
> +
> +static void test_fixed_counters_only(uint64_t pmcr_n)
> +{
> +	struct kvm_pmu_event_filter filter = { .nevents = 0 };
> +	struct kvm_vm *vm;
> +	struct kvm_vcpu *running_vcpu;
> +	struct kvm_vcpu *stopped_vcpu;
> +	struct kvm_vcpu_init init;
> +	int ret;
> +	uint64_t irq = 23;
> +
> +	create_vpmu_vm(guest_code);
> +	ret = __vcpu_has_device_attr(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +				     KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY);
> +	if (ret) {
> +		TEST_ASSERT(ret == -1 && errno == ENXIO,
> +			    KVM_IOCTL_ERROR(KVM_HAS_DEVICE_ATTR, ret));
> +		destroy_vpmu_vm();
> +		return;
> +	}
> +
> +	/* Assert that FIXED_COUNTERS_ONLY is unset at initialization. */
> +	ret = __vcpu_device_attr_get(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +				     KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY, NULL);
> +	TEST_ASSERT(ret == -1 && errno == ENXIO,
> +		    KVM_IOCTL_ERROR(KVM_GET_DEVICE_ATTR, ret));
> +
> +	/* Assert that setting FIXED_COUNTERS_ONLY succeeds. */
> +	vcpu_device_attr_set(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +			     KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY, NULL);
> +
> +	/* Assert that getting FIXED_COUNTERS_ONLY succeeds. */
> +	vcpu_device_attr_get(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +			     KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY, NULL);
> +
> +	/*
> +	 * Assert that setting FIXED_COUNTERS_ONLY again succeeds even if an
> +	 * event filter has already been set.
> +	 */
> +	vcpu_device_attr_set(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +			     KVM_ARM_VCPU_PMU_V3_FILTER, &filter);
> +
> +	vcpu_device_attr_set(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +			     KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY, NULL);
> +
> +	destroy_vpmu_vm();
> +
> +	create_vpmu_vm(guest_code);
> +
> +	/*
> +	 * Assert that setting FIXED_COUNTERS_ONLY results in EBUSY if an event
> +	 * filter has already been set while FIXED_COUNTERS_ONLY has not.
> +	 */
> +	vcpu_device_attr_set(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +			     KVM_ARM_VCPU_PMU_V3_FILTER, &filter);
> +
> +	ret = __vcpu_device_attr_set(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +				     KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY, NULL);
> +	TEST_ASSERT(ret == -1 && errno == EBUSY,
> +		    KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
> +
> +	destroy_vpmu_vm();
> +
> +	/*
> +	 * Assert that setting FIXED_COUNTERS_ONLY after running a VCPU results
> +	 * in EBUSY.
> +	 */
> +	vm = vm_create(2);
> +	vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &init);
> +	init.features[0] |= (1 << KVM_ARM_VCPU_PMU_V3);
> +	running_vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code);
> +	stopped_vcpu = aarch64_vcpu_add(vm, 1, &init, guest_code);
> +	kvm_arch_vm_finalize_vcpus(vm);
> +	vcpu_device_attr_set(running_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +			     KVM_ARM_VCPU_PMU_V3_IRQ, &irq);
> +	vcpu_device_attr_set(running_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +			     KVM_ARM_VCPU_PMU_V3_INIT, NULL);
> +	run_vcpu(running_vcpu, pmcr_n);

Sorry, I sent a series before testing by mistake. This hangs the test 
and I'll send a fix later. Anything else is fine and ready for review.

Regards,
Akihiko Odaki

> +
> +	ret = __vcpu_device_attr_set(stopped_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +				     KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY, NULL);
> +	TEST_ASSERT(ret == -1 && errno == EBUSY,
> +		    KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
> +
> +	kvm_vm_free(vm);
> +
> +	test_config(0, true);
> +}
> +
>   int main(void)
>   {
> -	uint64_t i, pmcr_n;
> +	uint64_t pmcr_n;
>   
>   	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_PMU_V3));
>   	TEST_REQUIRE(kvm_supports_vgic_v3());
>   	TEST_REQUIRE(kvm_supports_nr_counters_attr());
>   
>   	pmcr_n = get_pmcr_n_limit();
> -	for (i = 0; i <= pmcr_n; i++) {
> -		run_access_test(i);
> -		run_pmregs_validity_test(i);
> -	}
> -
> -	for (i = pmcr_n + 1; i < ARMV8_PMU_MAX_COUNTERS; i++)
> -		run_error_test(i);
> +	test_config(pmcr_n, false);
> +	test_fixed_counters_only(pmcr_n);
>   
>   	return 0;
>   }
> 


