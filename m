Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86221C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 03:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmdoW92ozb614B0US2yeVMuGdKGqmA8u64UZkV8QgO0=; b=U6zvDEicQDWv1Ko5KL7Is0YVCv
	PZhd8hWKGzIZJfhzeA/tCNltoXcjE9K/6n4z1TLbiuF71Lgda8DXIsZLQBmx5APbqmcXXUdfnxJa6
	HA+F0tbeVdsYN+BIucjdP6j8LlLqSDEmC749SPA2d6b350yxC95KnXCvDU/6Rit9+tctRbar3fDsA
	Vx8i+jvd4bkcc5YuYsh/im4VdtfkWCyPWtiVZ+2Phr/rQ2bJ4Ggqx5rWj046rEo2xC4TjNXoUKdzi
	AdpEclM+A0D/HyiXhx5DZ3wVhzz7b/aw81qN418oMIUfmnux9NI/WcsUIroSuifK1QF1OZ/Xtg14s
	kctwHhnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOT0S-00000003KKj-22kF;
	Mon, 09 Jun 2025 03:17:04 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOSyI-00000003K7w-3XCk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 03:14:52 +0000
Date: Mon, 9 Jun 2025 12:14:36 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749438885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lmdoW92ozb614B0US2yeVMuGdKGqmA8u64UZkV8QgO0=;
	b=wjAcwwkKVcWrOHIi2Zd49lxWYxwFo3SnglOJzz6JfAtOcYly83irJO2lauQQFNmENpiz/9
	LFfPgOmdGgBBM48jiWDlEOvZBd4ScN8oeriDbny02luqN7D27nTJOV8yRC1M3YcXNhKVGu
	V6EG1lawUnRAc88TO/+QQiLXVieN+vQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Itaru Kitayama <itaru.kitayama@linux.dev>
To: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, seanjc@google.com,
	darren@os.amperecomputing.com
Subject: Re: [RFC PATCH v2 2/9] KVM: arm64: nv: selftests: Add simple test to
 run guest code in vEL2
Message-ID: <aEZRnBK7pD4rkgdi@vm4>
References: <20250512105251.577874-1-gankulkarni@os.amperecomputing.com>
 <20250512105251.577874-3-gankulkarni@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512105251.577874-3-gankulkarni@os.amperecomputing.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_201451_030463_3F8B5F43 
X-CRM114-Status: GOOD (  20.34  )
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

On Mon, May 12, 2025 at 03:52:44AM -0700, Ganapatrao Kulkarni wrote:
> Add simple test to run guest code with NV enabled. With NV enabled,
> guest code runs in vEL2 context.
> 
> Signed-off-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
> ---
>  .../selftests/kvm/arm64/nv_guest_hypervisor.c | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/arm64/nv_guest_hypervisor.c
> 
> diff --git a/tools/testing/selftests/kvm/arm64/nv_guest_hypervisor.c b/tools/testing/selftests/kvm/arm64/nv_guest_hypervisor.c
> new file mode 100644
> index 000000000000..7d7b3944e229
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/arm64/nv_guest_hypervisor.c
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Ampere Computing LLC
> + */
> +#include <kvm_util.h>
> +#include <nv_util.h>
> +#include <processor.h>
> +
> +static void guest_code(void)
> +{
> +	if (read_sysreg(CurrentEL) == CurrentEL_EL2)
> +		GUEST_PRINTF("Test PASS\n");
> +	else
> +		GUEST_FAIL("Fail to run in vEL2\n");
> +
> +	GUEST_DONE();
> +}
> +
> +static void guest_undef_handler(struct ex_regs *regs)
> +{
> +	GUEST_FAIL("Unexpected exception far_el1 = 0x%lx", read_sysreg(far_el1));
> +}
> +
> +static void test_run_vcpu(struct kvm_vcpu *vcpu)
> +{
> +	struct ucall uc;
> +
> +	do {
> +		vcpu_run(vcpu);
> +
> +		switch (get_ucall(vcpu, &uc)) {
> +		case UCALL_ABORT:
> +			REPORT_GUEST_ASSERT(uc);
> +			break;
> +		case UCALL_PRINTF:
> +			printf("%s", uc.buffer);
> +			break;
> +		case UCALL_DONE:
> +			break;
> +		default:
> +			TEST_FAIL("Unknown ucall %lu", uc.cmd);
> +		}
> +	} while (uc.cmd != UCALL_DONE);
> +}
> +
> +static void test_nv_guest_hypervisor(void)
> +{
> +	struct kvm_vcpu *vcpu;
> +	struct kvm_vm *vm;
> +	int gic_fd = -1;
> +
> +	vm = nv_vm_create_with_vcpus_gic(1, &vcpu, &gic_fd, guest_code);
> +	vm_init_descriptor_tables(vm);
> +	vcpu_init_descriptor_tables(vcpu);
> +	vm_install_sync_handler(vm, VECTOR_SYNC_CURRENT,
> +				ESR_ELx_EC_UNKNOWN, guest_undef_handler);
> +
> +	test_run_vcpu(vcpu);
> +
> +	vgic_v3_close(gic_fd);
> +	kvm_vm_free(vm);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	test_nv_guest_hypervisor();
> +	return 0;
> +}

The kernel this v2 series applied is based off of the latest kvmarm-next 
and tested this on QEMU TCG mode with the kvm-arm.mode=nested option added at boot.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>

> -- 
> 2.48.1
> 

