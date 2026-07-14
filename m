Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73F6C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 20:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7UqnmRNp9z0SOtGksM14OWDF721FdDHrzQmlOywusk=; b=33qy0MSeBf/7qBt0WJhfbG/AgA
	aSvqlLpD6Ub3odwV7iKO3cHRUPf944ATDR3J3qyxkreXj1BFTDMG3jey2PogZHYhIDeMbBpb1hsH2
	UizngXSv3xdlq6WPG1h4+TIc+ZfqGcLPBfR+fV5844kneCpFwikXLitWCXGEApELNykWbjNaBbrFb
	w0tDqSgXn3kACSXwZ+vBKDgZ3tXPo6LoLeO+zg93/UQ3AvFYsUyV1AXeWs0qZI6sS73qO3idTOVWt
	eEMPXNC1+X+TpZ71EgPy1U8y31ppEhN96tihdsAezNTC0LLobZuihVrC0D0HJfZxd2VTh2AYQbJwx
	WL1/F8rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjj4F-0000000D9f9-2C6u;
	Tue, 14 Jul 2026 19:45:23 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjj4B-0000000D9dp-1jPJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:45:21 +0000
X-Forwarded-Encrypted: i=1; AHgh+RpCAqJL/jpsnm+R8n1Dt522nzGhBMC/7oCnK/sAYywyqNdsvZDbctKl9YzkHBl5hBFmQJXRXyQPmukoCZFY82u+@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784058316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G7UqnmRNp9z0SOtGksM14OWDF721FdDHrzQmlOywusk=;
	b=jWvjfx9M0IqG0wsZKitWEp6nFQYcBa+iEpRiHIo2/MwBo2UwHXkFnclplldK7Qcoyh8HUV
	Eh3qYled9gO0BjkZajMlIRyty076mRp3TVfbIaQsphC9N2oYgsEGzG+o/uYjpI+OliuRaM
	J8wYMcVPAwPFNi/zKiydn3G52MwuqkQ=
X-Gm-Message-State: AOJu0Yx25mR4/Hwu/h5uUJxb3GSTcJxgQhtVsjiIF7aG++c+VBRWAKRA
	lhgWwZ0aSu8K5g9pK2sUFcC1WPGnmYtSDT8HIBKVj6a5QKvy6eXMzTxAIuYtq/JRQPdQOaCP16N
	OumKjAb3g7Ru0fLokpwZCUWifUSrmERhgTr+EGa2I
X-Received: by 2002:a05:622a:4d47:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-51d7bc5094cmr18195991cf.10.1784058306364; Tue, 14 Jul 2026
 12:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com> <20260706175415.2604046-8-vdonnefort@google.com>
In-Reply-To: <20260706175415.2604046-8-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 14 Jul 2026 20:45:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyM63=A+jLAPD_MHOKHM=KS_PeKxdD6s53GL7MzZzRjLQ@mail.gmail.com>
X-Gm-Features: AUfX_mygvh_NbeI0_5exPC82Fp0Y9FQvBOfPvo4tVhv8gReqUd8S06tPliOP4O4
Message-ID: <CA+EHjTyM63=A+jLAPD_MHOKHM=KS_PeKxdD6s53GL7MzZzRjLQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/18] KVM: arm64: Add pkvm_hyp_req infrastructure
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_124519_607129_5725A596 
X-CRM114-Status: GOOD (  25.29  )
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

On Mon, 6 Jul 2026 at 18:54, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> Introduce a struct pkvm_hyp_req to enable the pKVM hypervisor to request
> resources from the host.
>
> Provide serialisation helpers to transport these requests via SMCCC
> registers (starting from a2):
>
>   pkvm_hyp_req_to_smccc() to encode into the SMCCC args.
>   smccc_to_pkvm_hyp_req() to decode them.
>
> When the hypervisor raises a request, the host must handle it and retry
> the HVC. To automate this sequence, introduce the pkvm_call_hyp_req()
> macro. This intercepts pending requests, invokes the handler and retries
> the HVC.
>
> Additionally, introduce a trace event to track the handling of these
> requests.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

>
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index 870f7870bb62..0be1469e7874 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -203,6 +203,95 @@ struct pkvm_mapping {
>         u64 __subtree_last;     /* Internal member for interval tree */
>  };
>
> +enum pkvm_hyp_req_type {
> +       PKVM_HYP_NO_REQ = 0,
> +       __PKVM_HYP_REQ_TYPE_MAX,
> +};
> +
> +#define PKVM_HYP_REQ_SMCCC_ARG_SIZE_MAX \
> +       (sizeof(struct arm_smccc_res) - offsetof(struct arm_smccc_res, a2) - 1)
> +
> +struct pkvm_hyp_req {
> +       u8 type;
> +       union {
> +               struct {
> +                       u32     nr_pages;
> +               } mem;
> +               struct {
> +                       /* Helper for SMCCC encoding/decoding */
> +                       u8      args[PKVM_HYP_REQ_SMCCC_ARG_SIZE_MAX];
> +               } args;
> +       };
> +};
> +
> +static inline size_t pkvm_hyp_req_arg_size(u8 type)
> +{
> +       switch (type) {
> +       case PKVM_HYP_NO_REQ:
> +               return 0;
> +       default:
> +               WARN_ON(1);
> +       }
> +
> +       return 0;
> +}
> +
> +/* Encode the pending pkvm_hyp_req type into the SMCCC args */
> +static inline void
> +pkvm_hyp_req_to_smccc(struct kvm_cpu_context *host_ctxt, struct pkvm_hyp_req *req)
> +{
> +       u8 *dst, type = req->type;
> +       size_t size;
> +
> +       if (type == PKVM_HYP_NO_REQ || type >= __PKVM_HYP_REQ_TYPE_MAX) {
> +               host_ctxt->regs.regs[2] = 0;
> +               return;
> +       }
> +
> +       size = pkvm_hyp_req_arg_size(type);
> +       if (WARN_ON(size > PKVM_HYP_REQ_SMCCC_ARG_SIZE_MAX))
> +               return;
> +
> +       dst = (u8 *)&host_ctxt->regs.regs[2];
> +       *dst = type;
> +
> +       memcpy(dst + 1, &req->args, size);
> +}
> +
> +/* Return true if a pkvm_hyp_req has been decoded from the SMCCC args */
> +static inline bool smccc_to_pkvm_hyp_req(struct pkvm_hyp_req *req, struct arm_smccc_res *res)
> +{
> +       u8 *src = (u8 *)res + offsetof(struct arm_smccc_res, a2);
> +       u8 type = *src;
> +
> +       if (type == PKVM_HYP_NO_REQ || type >= __PKVM_HYP_REQ_TYPE_MAX)
> +               return false;
> +
> +       req->type = type;
> +       memcpy(&req->args, src + 1, pkvm_hyp_req_arg_size(type));
> +
> +       return true;
> +}
> +
> +int __pkvm_handle_smccc_req(struct arm_smccc_res *res);
> +
> +#define pkvm_call_hyp_req(f, ...)                                                              \
> +({                                                                                             \
> +       struct arm_smccc_res __res;                                                             \
> +       int __ret;                                                                              \
> +       do {                                                                                    \
> +               __ret = -1;                                                                     \
> +               arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(f), ##__VA_ARGS__, &__res);               \
> +               if (WARN_ON(__res.a0 != SMCCC_RET_SUCCESS))                                     \
> +                       break;                                                                  \
> +               __ret = __res.a1;                                                               \
> +               if (!__ret)                                                                     \
> +                       break;                                                                  \
> +               __ret = __pkvm_handle_smccc_req(&__res);                                        \
> +       } while (!__ret);                                                                       \
> +       __ret;                                                                                  \
> +})
> +
>  int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
>                              struct kvm_pgtable_mm_ops *mm_ops);
>  void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index e2c8714e8ccc..5ba8b81b8c6c 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -16,6 +16,9 @@
>
>  #include "hyp_constants.h"
>
> +#define CREATE_TRACE_POINTS
> +#include "trace_pkvm.h"
> +
>  DEFINE_STATIC_KEY_FALSE(kvm_protected_mode_initialized);
>
>  static struct memblock_region *hyp_memory = kvm_nvhe_sym(hyp_memory);
> @@ -617,3 +620,25 @@ bool pkvm_force_reclaim_guest_page(phys_addr_t phys)
>
>         return !ret || ret == -EAGAIN;
>  }
> +
> +static int pkvm_handle_hyp_req(struct pkvm_hyp_req *req)
> +{
> +       int ret = -EINVAL;
> +
> +       switch (req->type) {
> +       }
> +
> +       trace_kvm_handle_pkvm_hyp_req(req, ret);
> +
> +       return ret;
> +}
> +
> +int __pkvm_handle_smccc_req(struct arm_smccc_res *res)
> +{
> +       struct pkvm_hyp_req req;
> +
> +       if (smccc_to_pkvm_hyp_req(&req, res))
> +               return pkvm_handle_hyp_req(&req);
> +
> +       return res->a1;
> +}
> diff --git a/arch/arm64/kvm/trace_pkvm.h b/arch/arm64/kvm/trace_pkvm.h
> new file mode 100644
> index 000000000000..4bf57c12e7de
> --- /dev/null
> +++ b/arch/arm64/kvm/trace_pkvm.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#if !defined(_TRACE_PKVM_ARM64_KVM_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_PKVM_ARM64_KVM_H
> +
> +#include <linux/tracepoint.h>
> +#include <asm/kvm_pkvm.h>
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM kvm
> +
> +TRACE_EVENT(kvm_handle_pkvm_hyp_req,
> +       TP_PROTO(struct pkvm_hyp_req *req, int ret),
> +       TP_ARGS(req, ret),
> +
> +       TP_STRUCT__entry(
> +               __field(u8,     type)
> +               __field(int,    ret)
> +       ),
> +
> +       TP_fast_assign(
> +               __entry->type = req->type;
> +               __entry->ret = ret;
> +       ),
> +
> +       TP_printk("type: %u ret: %d",
> +                 __entry->type, __entry->ret)
> +);
> +
> +#endif /* _TRACE_PKVM_ARM64_KVM_H */
> +
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH .
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_FILE trace_pkvm
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>
> --
> 2.55.0.rc2.803.g1fd1e6609c-goog
>

