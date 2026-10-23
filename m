Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327C1606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 12:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PJve/Yi/;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=U0CC491G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GDyUAHq5EnMm1c2jA/kc6vkZKZbH8Rr6Mm2+HOczy9s=; b=PJve/Yi/onBbGE/J53FQAA5XlO
	xtvfhVm7zvaikmi4p8gwhVP6Z/bxy8LAssT2kz8S562fez0qYp7A3iqTDtWnvis2mmjFnzeGuGVMl
	e9aVQHFW5HFhGfP1MuQH19asskZ9f9/EVjeZQB0xOU796rXQjbtSJ++NBhA1mfnraUP7oP2KIyyCW
	OABHuwDa7dBZ0UdXB91WScjvpWyExBk1Zfx4nf4Rq5gRqaCGy04gp5xJXeHwDLg2DE77lpubVKhX0
	d9u3fFa+L1CVE3MpnecjASlkVMmRYPLMpj+oItI+xEe9dOGnfF8ZMUIBvJ5uNNoNfe8HPiH697JOn
	rKJvvh7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKEeo-0000000GJh0-0Lji;
	Fri, 23 Oct 2026 12:46:02 +0000
Received: from out-76.mta0.migadu.com ([2001:41d0:1004:224b::4c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKEek-0000000GJg2-3MQi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 12:46:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=c6sAixXJP4HRlc6nJBz9ZvqV2918RZfRoqM9ID70+bM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792759556; v=1; x=1793364356;
 b=U0CC491GXrlC+Rxm/aJsxgRIi+HUdJx9klMV8uSTsFfEg3nRJsCn6zzu7hRoKqrME4gnOjfy
 mp3ChC2eppR1HAW5z1HLYlkbmvyuQM5lS8FHSj6dMdYFhRMk6Jz78tYZmI3vjuLJk+Hc08xntDV
 mMOwztamGLhAMnE9QzuYRpZ0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ee52163fc1968f11;
	Fri, 23 Oct 2026 12:45:56 +0000
X-Mizu-Trace-ID: ee52163fc1968f11
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be4a7b9e6fso5780e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 05:45:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBywT6JQUMN/fzqejbeo+YOdM31XtZi9JO3LiPHZoi2apbJUSyCIOIRpgoGxMStBTEd7+cf4C+8zPI02w7Mnzotk@lists.infradead.org
X-Gm-Message-State: AFq9FYLLTXSnO0+t9qv3tfHeredw/WwXTOHBKNBFsgwSBT3xfBtgyX3d
	kbc1LI+DzPHbfFHzyAMRtkEi2SoZO+PNN5BwucCjooXg/I+ZDXgSTNphQZ8sYhAeNoaMy6OBzdc
	ZuOvmc9aQbDseDNI7/Eln3xyrvPNJ7kuJBpKRpXdv
X-Received: by 2002:a05:6512:a94:b0:5bf:a5c1:d20 with SMTP id
 2adb3069b0e04-5bfb07f2065mr115256e87.16.1792759555215; Fri, 23 Oct 2026
 05:45:55 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023092007.3918848-1-vdonnefort@google.com>
 <CA+EHjTwNOJCphq8YNxK4nUZFj0Xrw31Okx1fiFAS=sHY1Z3cnA@mail.gmail.com> <86bj8kzix4.wl-maz@kernel.org>
In-Reply-To: <86bj8kzix4.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 23 Oct 2026 13:45:18 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxr9g3oir1UvPZFrYAsOVODfWRRtW8rqbD7DxFmr-Ddvg@mail.gmail.com>
X-Gm-Features: AclHuK-tQ-Fh_fw4NY0r1RDT4Ce-dOpOYM6PPBXIKh7mshfcyGMDD02YdETdbGA
Message-ID: <CA+EHjTxr9g3oir1UvPZFrYAsOVODfWRRtW8rqbD7DxFmr-Ddvg@mail.gmail.com>
Subject: Re: [PATCH v1] KVM: arm64: Use the host kvm_host_data for nr_event_counters
To: Marc Zyngier <maz@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_054559_206892_F844C37E 
X-CRM114-Status: GOOD (  14.80  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026 at 13:43, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > I tested this in pKVM with a non-protected guest counting with
> > perf_event_open(). On its own the patch doesn't change what the guest
> > sees: every counter, the cycle counter included, still reads 0. That's
> > a separate bug: flush_hyp_vcpu() never copies vcpu->arch.pmu.events to
> > the hyp vCPU, so the guest's events are never enabled on entry. I'll
> > send a fix for that shortly.
>
> Please synchronise with Vincent and sent this as a series fixing PMU
> handling on pKVM, not as discrete patches.
>
> The approach taken for this patch is wrong anyway, so you have plenty
> of opportunity to work together.

Will do.

Cheers,
/fuad
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
>

