Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80414CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JH3eoYO9edG0lkwIXSmK/Z5XTvYzAyF6ATNGOjNQG00=; b=binIDdgdmAeguvd4roHgn3GnmD
	xFHcAB9RuVS+t6hbHPy93B4cmef/kQ7BqrFyUWIoJuKZQjLjD4wzK8xp+KHR6+auTe7uloeZXJ/R/
	dznLLV5ARGzHLtxAGWgn+tI6DxZYIFxYqgcE3dwgHNiwhW3IAjVasLwEtephG3cKUlpPAinfmn+Dc
	wJNFu4e95hfpw2sh7Vbyqf5JWLWx6/xzx9pHEDYM1Y0O5v3dyU6OeWy+aLDNgLAGo5T+tC1vSDVgJ
	ZbiddX5J3fc3pS9rXHFw68zRXtdqDXeK9n2tLO+qgVnSka8X82SaWN0FwEvRSnLNWFWHQQj5uG+xZ
	BvTeRirg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdC2-00000005xP1-4936;
	Thu, 28 May 2026 16:02:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdC0-00000005xO7-34AO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 16:02:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B3E51516;
	Thu, 28 May 2026 09:02:36 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65DB83F632;
	Thu, 28 May 2026 09:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779984161; bh=+3NZq5dyM0nlToai4ZJnLVK01+vkOLwJqQPh16PmDi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AdVSrkJgUSXeylTFkCIm0mQxisd9y46JeZF7B3NwfLleUGnxVsprAjTCoxNnqgGT1
	 +GeybXY1oOSxQ1TFAo8hPvUlyb8DOi6eEaWL5XWPZI4PUT6E/cfrGXD7wvQvRkNjuf
	 so/Uqn5S9Lzi/YdIgjvxWnfGmh91Dnm2B4EJPG+o=
Date: Thu, 28 May 2026 17:02:30 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, maz@kernel.org, 
	oupton@kernel.org, pbonzini@redhat.com, shuah@kernel.org, suzuki.poulose@arm.com, 
	will@kernel.org, yuzenghui@huawei.com
Subject: Re: [PATCH] KVM: selftest: arm64: Run shadow_stage2 varying guest
 modes
Message-ID: <r2dui45c3mp2qzns6dplqj6pfima5tq7huhvbwus225xamuccn@aw753ihdimz5>
References: <20260516183003.799058-6-weilin.chang@arm.com>
 <20260528045930.450339-1-itaru.kitayama@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528045930.450339-1-itaru.kitayama@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_090244_806609_DDEC80D6 
X-CRM114-Status: GOOD (  16.31  )
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

Hi Itaru,

On Thu, May 28, 2026 at 01:59:30PM +0900, Itaru Kitayama wrote:
> Refactor main() to use for_each_guest_mode() helper to create
> a single VCPU VM with a guest mode ID.
> 
> Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> ---
>  tools/testing/selftests/kvm/arm64/shadow_stage2.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/arm64/shadow_stage2.c b/tools/testing/selftests/kvm/arm64/shadow_stage2.c
> index 5bce55abdea7..05acca22eafe 100644
> --- a/tools/testing/selftests/kvm/arm64/shadow_stage2.c
> +++ b/tools/testing/selftests/kvm/arm64/shadow_stage2.c
> @@ -105,7 +105,7 @@ static void guest_code(void)
>  	GUEST_DONE();
>  }
>  
> -int main(void)
> +int run_test(enum vm_guest_mode mode, void *unused)
>  {
>  	struct kvm_vcpu_init init;
>  	struct kvm_vcpu *vcpu;
> @@ -114,7 +114,8 @@ int main(void)
>  	gpa_t gpa;
>  
>  	TEST_REQUIRE(kvm_check_cap(KVM_CAP_ARM_EL2));
> -	vm = vm_create(1);
> +	vm = __vm_create(VM_SHAPE(mode), 1, 0);
> +
>  
>  	kvm_get_default_vcpu_target(vm, &init);
>  	init.features[0] |= BIT(KVM_ARM_VCPU_HAS_EL2);
> @@ -163,3 +164,7 @@ int main(void)
>  	kvm_vm_free(vm);
>  	return 0;
>  }
> +
> +int main(void) {
> +	for_each_guest_mode(run_test, NULL);
> +}
> -- 
> 2.43.0
> 

Thanks! I think this is valuable.
I can add your patch into the next version if you don't mind?

Thanks,
Wei-Lin Chang

