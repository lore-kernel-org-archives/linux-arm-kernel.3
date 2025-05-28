Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58286C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 13:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MY7dIzvhqKQ78x3ZBXAWRPIno47BbkAAxPa3qgWZaRY=; b=fDV4RbTYOcCT2xNkfC3p3GQRR8
	g/GvbYadeAb3OMdB8JiSf4gO/ApdivLx8ILP2V+Qu5xj7+QNYtBMqYn3L94jO8CF91hbdmaZgMqrf
	9xCnNcJyep9tONfPW0ErZy3RTXKR0dEkrwge2QSMqfFNJyhkB7ApZOVaqtiw9oIlj5dfvqu74kwLo
	5f2T0YGho19RIJcja07d7RhZIBOrHbh/vda36GQvd/RtCpXjJ8e3wyIwi+l2zvzes1gwrpj8mFWSz
	xkZ+O9Ig1cr3LVKBqL2raeY77biPi6Iz3vPYIWA9JqOoViDh5lR4kNuNgAK56qGcRvghuOqQUcwCp
	lVhD6V7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHHb-0000000DIi0-2hlU;
	Wed, 28 May 2025 13:57:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGv1-0000000DFqC-2rw2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 May 2025 13:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=MY7dIzvhqKQ78x3ZBXAWRPIno47BbkAAxPa3qgWZaRY=; b=U9wQhjrszj1PRh4lyOcwRavi6H
	KgLysLHRB8Gn5ub1NDBDpLOaUC57UPBJeLVjqC+5cvakwq4nGcaRuJw61jyLay7/T/jZSnU3Xka2X
	P4EYuRiuZck4x44cPOzcyZ+9REt3knSbVfSIlU391MZ5co5WiVrl8sKMJzoF1o3Spk/B1Z8fjvIiO
	R1cUSfX2zl4dejBzlN7N9+m5Rbc6Tk3qNcQ447lY889TYmHZkUSeAy3dUGOJQKxOb+UhDxYKxdsPo
	uM73k8cY9rs7ht4Z/zc+bXt2xoT+f0eyUY8ydMH4B/+8f9hZN/AVTVMdiHl/a2pEJjVazIX8Lx8wr
	1XPzOGtg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGuy-0000000DgZW-0daN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 13:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748439228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MY7dIzvhqKQ78x3ZBXAWRPIno47BbkAAxPa3qgWZaRY=;
	b=E4k91/RMW90JAd1qMCCHDOfyPXTLSMOGALCoS8/EydDk3L4SIprYnPq14IXkmSoLrYpvdd
	cEgSlhra4NZu2ARvawcpTjLQJ83zpnlGHNq7Tpl1qNNZzfqf4r9rz5wLrs1uMKJ1vFDeiw
	OWrOCh+7GJWFeDN95/oixCcQ17TkBzg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748439228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MY7dIzvhqKQ78x3ZBXAWRPIno47BbkAAxPa3qgWZaRY=;
	b=E4k91/RMW90JAd1qMCCHDOfyPXTLSMOGALCoS8/EydDk3L4SIprYnPq14IXkmSoLrYpvdd
	cEgSlhra4NZu2ARvawcpTjLQJ83zpnlGHNq7Tpl1qNNZzfqf4r9rz5wLrs1uMKJ1vFDeiw
	OWrOCh+7GJWFeDN95/oixCcQ17TkBzg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748439240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MY7dIzvhqKQ78x3ZBXAWRPIno47BbkAAxPa3qgWZaRY=;
	b=I0sJvx9/nHZrj7DBmzKYYNkPoLU/JLxiKY1ooQBpjo/+Nl2wPTLnSUd4TNe3cpZPJbmyEF
	9O9XHTsRRDnDNdgWqIHNFkNx2fES5F+0pvJLB0PXdTfBqTaMwGDsdFmzH2e8N0p5dhrOfw
	QyamMtIYxAkk0IXMGVmyl/4gvgM7dAA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-H4BZcmwlPgq8uWiwwH7_HA-1; Wed, 28 May 2025 09:33:46 -0400
X-MC-Unique: H4BZcmwlPgq8uWiwwH7_HA-1
X-Mimecast-MFC-AGG-ID: H4BZcmwlPgq8uWiwwH7_HA_1748439226
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a1f6c5f4f2so1578052f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 06:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748439226; x=1749044026;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MY7dIzvhqKQ78x3ZBXAWRPIno47BbkAAxPa3qgWZaRY=;
        b=sxDuLreYzC01gKhHz9GNS0FryQwi7/Li+HMIJS6C082qzXrxweXRl7i3k6Y4k0Ysev
         3ItD9AoalBlQq+qSwBn0emAqxbbygvCGR4GvEIhorjtoLOQJsW8rFEGKRK454QZf+TSh
         ruB1m7dfLtUPDlhfAmGIcba6D91B95XNe7wrxEtP80uzjUjo2WYgF0H2XZdq4zVU0bgZ
         5feEE3Z0N4TS4R1bOj9xLeJ8/7E0TLB/3lMD3HOSGtaAx64UROp8im1vWxrUEPFe2O6D
         UPZRMLPUjJk3teHtWSLdaXZqR6KnKUEUygwPZZ/cTyODId/Eg8wzn/PBVymO0nMBcXwv
         Sm5g==
X-Forwarded-Encrypted: i=1; AJvYcCUu74UUJ1eC8CyN1QbdHbh9LvYNKsNKozGXt7r3P7Skt0wBEuUJ7zns/ISSG6MaK01Wnpv4kL87I5KUMyraaGQ3@lists.infradead.org
X-Gm-Message-State: AOJu0YxjCog7thAFrXYelPdKYYY9WIosBy7Y5uMe+Znbg2wymT7hknEE
	kPDoPZwaJ4UtjblDDrp4yPJNf4Yf3QhG3HQFkAYF4Xh8PlDdyhSBp3autnh9Tnbq3RRIre2Emb6
	WuCEyTB3tPiBqo7exiuXZyC+2vUehYVsAQ3Qdugwp3MoRHc77iD02u+wns82ttf/1tDbK5/DMWx
	JN
X-Gm-Gg: ASbGnctQkGfQqtP0L1ZjtfSjRgIUdJqdGWvk40SUyKAH0oJLhwCanDkwnh5tGh7WWBs
	3oc2rjcjnPtD8CPMlhF8Lxr3TXDUy7/ivaNY8mdpcccqKwulhNe5a4YFugqIe5rS6ySWjnGc7XI
	LSCZXEh5R7sFjTv7TOkaW+WfgmV3TrRSOBFRT55GqNb8i3W4hS8AjXJH0+PCmW0BKjV6NnAk9Up
	FQgxZwMm2Oo6zHKzOS0sTR0Wn3q1oXXJpA8rBSuD9PdSDVwjD5OhEqwS9DX/Gl5tM/x++ksRm15
	b/6AIhFBU8eFSwxNfUbbRheWgnlv4q/7qUc3TWCsdX0fohKAyomf3g==
X-Received: by 2002:a05:6000:18ac:b0:3a4:d3ff:cef2 with SMTP id ffacd0b85a97d-3a4d3ffd31bmr10702827f8f.27.1748439225669;
        Wed, 28 May 2025 06:33:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAIpa+RxRPf6tIbm4faSkGMORwUvQ1kSvzXDebp/C9JP6wXZATaOvGCzJaeUMMdK7sedyDUA==
X-Received: by 2002:a05:6000:18ac:b0:3a4:d3ff:cef2 with SMTP id ffacd0b85a97d-3a4d3ffd31bmr10702799f8f.27.1748439225216;
        Wed, 28 May 2025 06:33:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eace3a76sm1507826f8f.98.2025.05.28.06.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 06:33:44 -0700 (PDT)
Message-ID: <8ab8b36b-7e5a-4790-92c2-1b1ff456a1e6@redhat.com>
Date: Wed, 28 May 2025 15:33:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/9] KVM: arm64: nv: selftests: Add support to run
 guest code in vEL2.
To: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, seanjc@google.com,
 darren@os.amperecomputing.com
References: <20250512105251.577874-1-gankulkarni@os.amperecomputing.com>
 <20250512105251.577874-2-gankulkarni@os.amperecomputing.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20250512105251.577874-2-gankulkarni@os.amperecomputing.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _gCLvIcFPTRz0YIP-eqSqFu3rNvqKkAnhqpoPguepzg_1748439226
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_143404_401125_83A10F41 
X-CRM114-Status: GOOD (  27.62  )
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

Hi,

On 5/12/25 12:52 PM, Ganapatrao Kulkarni wrote:
> This patch adds required changes to vcpu init to run a guest code
> in vEL2 context and also adds NV specific helper functions.
> 
> Signed-off-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
> ---
>  tools/testing/selftests/kvm/Makefile.kvm      |  2 +
>  .../kvm/include/arm64/kvm_util_arch.h         |  3 +
>  .../selftests/kvm/include/arm64/nv_util.h     | 45 ++++++++++++++
>  .../selftests/kvm/include/arm64/vgic.h        |  1 +
>  .../testing/selftests/kvm/include/kvm_util.h  |  3 +
>  tools/testing/selftests/kvm/lib/arm64/nv.c    | 46 ++++++++++++++
>  .../selftests/kvm/lib/arm64/processor.c       | 61 ++++++++++++++-----
>  tools/testing/selftests/kvm/lib/arm64/vgic.c  |  8 +++
>  8 files changed, 155 insertions(+), 14 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/include/arm64/nv_util.h
>  create mode 100644 tools/testing/selftests/kvm/lib/arm64/nv.c
> 
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index f773f8f99249..3348f729d3b2 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -37,6 +37,7 @@ LIBKVM_arm64 += lib/arm64/processor.c
>  LIBKVM_arm64 += lib/arm64/spinlock.c
>  LIBKVM_arm64 += lib/arm64/ucall.c
>  LIBKVM_arm64 += lib/arm64/vgic.c
> +LIBKVM_arm64 += lib/arm64/nv.c
>  
>  LIBKVM_s390 += lib/s390/diag318_test_handler.c
>  LIBKVM_s390 += lib/s390/processor.c
> @@ -155,6 +156,7 @@ TEST_GEN_PROGS_arm64 += arm64/vgic_irq
>  TEST_GEN_PROGS_arm64 += arm64/vgic_lpi_stress
>  TEST_GEN_PROGS_arm64 += arm64/vpmu_counter_access
>  TEST_GEN_PROGS_arm64 += arm64/no-vgic-v3
> +TEST_GEN_PROGS_arm64 += arm64/nv_guest_hypervisor
>  TEST_GEN_PROGS_arm64 += access_tracking_perf_test
>  TEST_GEN_PROGS_arm64 += arch_timer
>  TEST_GEN_PROGS_arm64 += coalesced_io_test
> diff --git a/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h
> index e43a57d99b56..ab5279c24413 100644
> --- a/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h
> +++ b/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h
> @@ -2,6 +2,9 @@
>  #ifndef SELFTEST_KVM_UTIL_ARCH_H
>  #define SELFTEST_KVM_UTIL_ARCH_H
>  
> +#define CurrentEL_EL1		(1 << 2)
> +#define CurrentEL_EL2		(2 << 2)
nit: not yet used in this patch.
> +
>  struct kvm_vm_arch {};
>  
>  #endif  // SELFTEST_KVM_UTIL_ARCH_H
> diff --git a/tools/testing/selftests/kvm/include/arm64/nv_util.h b/tools/testing/selftests/kvm/include/arm64/nv_util.h
> new file mode 100644
> index 000000000000..622a17c9d142
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/include/arm64/nv_util.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Ampere Computing
> + */
> +#ifndef SELFTEST_NV_UTIL_H
> +#define SELFTEST_NV_UTIL_H
> +
> +#include <linux/bitmap.h>
> +#include <vgic.h>
> +
> +#define HCR_NV2		(UL(1) << 45)
> +#define HCR_AT		(UL(1) << 44)
> +#define HCR_NV		(UL(1) << 42)
> +#define HCR_E2H		(UL(1) << 34)
> +#define HCR_TTLB        (UL(1) << 25)
> +
> +/* Enable NV2 and guest in VHE mode */
> +#define HCR_EL2_NV_EANBLE (HCR_E2H | HCR_NV | HCR_NV2 | HCR_AT | HCR_TTLB)
ENABLE
> +
> +struct kvm_vm *nv_vm_create_with_vcpus_gic(uint32_t nr_vcpus,
> +		struct kvm_vcpu **vcpus, int *gic_fd, void *guest_code);
> +
> +struct kvm_vm *__nv_vm_create_with_vcpus_gic(struct vm_shape shape,
> +		uint32_t nr_vcpus, struct kvm_vcpu **vcpus,
> +		uint64_t extra_mem_pages, int *gic_fd, void *guest_code);
> +
> +/* NV helpers */
> +static inline void init_vcpu_nested(struct kvm_vcpu_init *init)
> +{
> +	init->features[0] |= (1 << KVM_ARM_VCPU_HAS_EL2);
> +}
> +
> +static inline bool kvm_arm_vcpu_has_el2(struct kvm_vcpu_init *init)
> +{
> +	unsigned long features = init->features[0];
> +
> +	return test_bit(KVM_ARM_VCPU_HAS_EL2, &features);
> +}
> +
> +static inline bool is_vcpu_nested(struct kvm_vcpu *vcpu)
> +{
> +	return vcpu->nested;
> +}
> +
> +#endif /* SELFTEST_NV_UTIL_H */
> diff --git a/tools/testing/selftests/kvm/include/arm64/vgic.h b/tools/testing/selftests/kvm/include/arm64/vgic.h
> index c481d0c00a5d..46142fa36199 100644
> --- a/tools/testing/selftests/kvm/include/arm64/vgic.h
> +++ b/tools/testing/selftests/kvm/include/arm64/vgic.h
> @@ -17,6 +17,7 @@
>  	index)
>  
>  int vgic_v3_setup(struct kvm_vm *vm, unsigned int nr_vcpus, uint32_t nr_irqs);
> +void vgic_v3_close(int gic_fd);
>  
>  #define VGIC_MAX_RESERVED	1023
>  
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 373912464fb4..9b26b9124dc3 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -65,6 +65,9 @@ struct kvm_vcpu {
>  	struct kvm_dirty_gfn *dirty_gfns;
>  	uint32_t fetch_index;
>  	uint32_t dirty_gfns_count;
> +#ifdef __aarch64__
> +	bool nested;
> +#endif
>  };
>  
>  struct userspace_mem_regions {
> diff --git a/tools/testing/selftests/kvm/lib/arm64/nv.c b/tools/testing/selftests/kvm/lib/arm64/nv.c
> new file mode 100644
> index 000000000000..e930808a7ed4
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/lib/arm64/nv.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Ampere Computing LLC
> + */
> +
> +#include <linux/compiler.h>
> +#include <assert.h>
> +
> +#include "guest_modes.h"
> +#include "kvm_util.h"
> +#include "nv_util.h"
> +#include "processor.h"
> +
> +struct kvm_vm *__nv_vm_create_with_vcpus_gic(struct vm_shape shape, uint32_t nr_vcpus,
> +		struct kvm_vcpu **vcpus, uint64_t extra_mem_pages, int *gic_fd, void *guest_code)
> +{
> +	struct kvm_vcpu_init init;
> +	struct kvm_vm *vm;
> +	int i;
> +
> +	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_EL2));
> +
> +	vm = __vm_create(shape, nr_vcpus, extra_mem_pages);
> +	vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &init);
> +	init_vcpu_nested(&init);
> +
> +	for (i = 0; i < nr_vcpus; ++i) {
> +		vcpus[i] = aarch64_vcpu_add(vm, i, &init, guest_code);
> +		__TEST_REQUIRE(is_vcpu_nested(vcpus[i]), "Failed to Enable NV");
> +	}
> +
> +	/* vgic is not created, If gic_fd argument is NULL */
> +	if (gic_fd) {
> +		*gic_fd = vgic_v3_setup(vm, nr_vcpus, 64);
> +		__TEST_REQUIRE(*gic_fd >= 0, "Failed to create vgic-v3");
> +	}
> +
> +	return vm;
> +}
> +
> +struct kvm_vm *nv_vm_create_with_vcpus_gic(uint32_t nr_vcpus,
> +		struct kvm_vcpu **vcpus, int *gic_fd, void *guest_code)
> +{
> +	return __nv_vm_create_with_vcpus_gic(VM_SHAPE_DEFAULT,
> +				nr_vcpus, vcpus, 0, gic_fd, guest_code);
> +}
> diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
> index 7ba3aa3755f3..6e759981bf9e 100644
> --- a/tools/testing/selftests/kvm/lib/arm64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
> @@ -10,6 +10,7 @@
>  
>  #include "guest_modes.h"
>  #include "kvm_util.h"
> +#include "nv_util.h"
>  #include "processor.h"
>  #include "ucall_common.h"
>  
> @@ -258,14 +259,49 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
>  	}
>  }
>  
> +static void aarch64_vcpu_set_reg(struct kvm_vcpu *vcpu, uint64_t sctlr_el1,
> +			uint64_t tcr_el1, uint64_t ttbr0_el1)
I am not sure it is worth introducing this helper. Some reg values are
set externally while fpen is set here. That looks odd to me.
> +{
> +	uint64_t fpen;
> +
> +	/*
> +	 * Enable FP/ASIMD to avoid trapping when accessing Q0-Q15
> +	 * registers, which the variable argument list macros do.
> +	 */
> +	fpen = 3 << 20;
> +
> +	if (is_vcpu_nested(vcpu)) {
> +		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_CPTR_EL2), fpen);
> +		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_SCTLR_EL2), sctlr_el1);
> +		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TCR_EL2), tcr_el1);
> +		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MAIR_EL2), DEFAULT_MAIR_EL1);
> +		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TTBR0_EL2), ttbr0_el1);
> +		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2), HCR_EL2_NV_EANBLE);
> +	} else {
> +		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_CPACR_EL1), fpen);
> +		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_SCTLR_EL1), sctlr_el1);
> +		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TCR_EL1), tcr_el1);
> +		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MAIR_EL1), DEFAULT_MAIR_EL1);
> +		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TTBR0_EL1), ttbr0_el1);
> +
> +	}
> +
> +	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TPIDR_EL1), vcpu->id);
> +}
> +
>  void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
>  {
>  	struct kvm_vcpu_init default_init = { .target = -1, };
>  	struct kvm_vm *vm = vcpu->vm;
>  	uint64_t sctlr_el1, tcr_el1, ttbr0_el1;
>  
> -	if (!init)
> +	if (!init) {
>  		init = &default_init;
> +	} else {
> +		/* Is this vcpu a Guest-Hypersior */
> +		if (kvm_arm_vcpu_has_el2(init))
> +			vcpu->nested = true;
> +	}
>  
>  	if (init->target == -1) {
>  		struct kvm_vcpu_init preferred;
> @@ -275,12 +311,6 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
>  
>  	vcpu_ioctl(vcpu, KVM_ARM_VCPU_INIT, init);
>  
> -	/*
> -	 * Enable FP/ASIMD to avoid trapping when accessing Q0-Q15
> -	 * registers, which the variable argument list macros do.
> -	 */
> -	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_CPACR_EL1), 3 << 20);
> -
>  	sctlr_el1 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_SCTLR_EL1));
>  	tcr_el1 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TCR_EL1));
>  
> @@ -349,11 +379,7 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
>  	if (use_lpa2_pte_format(vm))
>  		tcr_el1 |= (1ul << 59) /* DS */;
>  
> -	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_SCTLR_EL1), sctlr_el1);
> -	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TCR_EL1), tcr_el1);
> -	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_MAIR_EL1), DEFAULT_MAIR_EL1);
> -	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TTBR0_EL1), ttbr0_el1);
> -	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TPIDR_EL1), vcpu->id);
> +	aarch64_vcpu_set_reg(vcpu, sctlr_el1, tcr_el1, ttbr0_el1);
>  }
>  
>  void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, uint8_t indent)
> @@ -387,7 +413,11 @@ static struct kvm_vcpu *__aarch64_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
>  
>  	aarch64_vcpu_setup(vcpu, init);
>  
> -	vcpu_set_reg(vcpu, ARM64_CORE_REG(sp_el1), stack_vaddr + stack_size);
> +	if (is_vcpu_nested(vcpu))
> +		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_SP_EL2), stack_vaddr + stack_size);
> +	else
> +		vcpu_set_reg(vcpu, ARM64_CORE_REG(sp_el1), stack_vaddr + stack_size);
> +
>  	return vcpu;
>  }
>  
> @@ -457,7 +487,10 @@ void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu)
>  {
>  	extern char vectors;
>  
> -	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_VBAR_EL1), (uint64_t)&vectors);
> +	if (is_vcpu_nested(vcpu))
> +		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_VBAR_EL2), (uint64_t)&vectors);
> +	else
> +		vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_VBAR_EL1), (uint64_t)&vectors);
>  }
>  
>  void route_exception(struct ex_regs *regs, int vector)
> diff --git a/tools/testing/selftests/kvm/lib/arm64/vgic.c b/tools/testing/selftests/kvm/lib/arm64/vgic.c
> index 4427f43f73ea..67822b803d0f 100644
> --- a/tools/testing/selftests/kvm/lib/arm64/vgic.c
> +++ b/tools/testing/selftests/kvm/lib/arm64/vgic.c
> @@ -79,6 +79,14 @@ int vgic_v3_setup(struct kvm_vm *vm, unsigned int nr_vcpus, uint32_t nr_irqs)
>  	return gic_fd;
>  }
>  
> +void  vgic_v3_close(int gic_fd)
> +{
> +	if (gic_fd < 0)
> +		return;
> +
> +	close(gic_fd);
> +}
> +
>  /* should only work for level sensitive interrupts */
>  int _kvm_irq_set_level_info(int gic_fd, uint32_t intid, int level)
>  {

Thanks

Eric


