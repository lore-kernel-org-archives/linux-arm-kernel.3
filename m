Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0637D606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tLa4Hoia;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y0LSliA4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ctm+OvOOdF3/eRDZQ9mCZGJ4OrDu4+sLjWj8shOpss4=; b=tLa4HoiawsBOeKbyPolnUWC+FY
	kWbLqBaiFPzSU6UYEck4+qiapdatb4aHkgoX3KVFX4SjeRma4HdC8q7Bw5taTU72BnzTLr16oQ6gE
	bkHmq+n4SH7cN2HpSBpKyeZq63WO7fLHPnolFy5LABH6j2Pt7lAgqhLv4j7hykphjPtSErxHQHCsn
	BDyGSXsc9laVv63f1HjOyXDYAcCI4bbkrxJr81f4wSuJB3gBbLkLGaosDbCGTkJ2Vxi3aUVFpKIc8
	zM9t/SLmHVPML8hskMC/NsBPSJ3l6NAdOf8qPobCzF5zRJeBFIYRpfAJXQjPytYT+jAIEM/bpFZ5T
	h0BLaznw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHAs-000000035cH-3Pae;
	Tue, 03 Nov 2026 16:15:50 +0000
Received: from out-26.mta0.migadu.com ([2001:41d0:1004:224b::1a] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHAq-000000035bv-1HyL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:15:49 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=K8R3zoPWS9GjOtmgfFeCE0/yDhy3x8tsootf9dJemic=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793722546; v=1; x=1794327346;
 b=Y0LSliA4mZEhLLYOtJd6RLW45ykAB1wMAQCOESHJOMDQX/K40Q9OJdH27HYKP6rf/6Dw1hun
 68IEyz58Gu0KQnewRBoReTyeOKy/5DqYsRwXj8+h9kKD0W1TsVR4jl9RVzb/b5lvu1ZG/4SLNER
 u1W8CLzEEbd0J/pVROydWHkQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c80196d3b03f1563;
	Tue, 03 Nov 2026 16:15:46 +0000
X-Mizu-Trace-ID: c80196d3b03f1563
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so8561e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:15:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxlssg+YIvJLVQ9a+IyiXOw4ECWVn7Iu8/udLbnHCsDz0bkG69myIvqQIcNT+HG8cCuwqdq9W6wMHnFoacp29G5@lists.infradead.org
X-Gm-Message-State: APuU4Z+mt2/cQiBoaqWn4S6RjlvNiVxq3t3MKTrxlLXL0AbXofjj1oHz
	tuaobpVnC0ArCtapbh/IEF3C93yr4FO/4i6vFAWa1H0Z7YwmM8EOcDz7jZjdiYyCvM2oqL/XTie
	triK/rVdvtYt2MqK+4lRYpQXu4bHKgGRE48n4DGNX
X-Received: by 2002:a05:6512:1247:b0:5bf:f0b8:f896 with SMTP id
 2adb3069b0e04-5bff0b8fd75mr147439e87.0.1793722540055; Tue, 03 Nov 2026
 08:15:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
 <20261103084742.1302597-2-fuad.tabba@linux.dev> <aun1NJNtnOeSL4oc@google.com>
In-Reply-To: <aun1NJNtnOeSL4oc@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 16:15:03 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwCPHp_odMPJAJ8pfPtymtU5ia_RrH30DavFeiZqvhVAQ@mail.gmail.com>
X-Gm-Features: AclHuK9jF3GIRHTl9ZfS7oE87Qhpm2sxTx6SMNL-HGm4GrBCk1nlKw1LtRNf6Po
Message-ID: <CA+EHjTwCPHp_odMPJAJ8pfPtymtU5ia_RrH30DavFeiZqvhVAQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Don't walk the whole IPA space when
 destroying a pKVM stage-2
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Raghavendra Rao Ananta <rananta@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_081548_483585_ECBF54B5 
X-CRM114-Status: GOOD (  19.71  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vincent,

On Tue, 03 Nov 2026 14:52:36 +0000, Vincent Donnefort
<vdonnefort@google.com> wrote:
[...]
> > Walk the mapping tree once instead, and reschedule after passing each
> > mapping to the reclaim or unshare helper. The unshare helper can't
> > reschedule itself, as the map and unmap paths call it under the
> > mmu_lock. A failed unshare now leaves only its own mapping behind, not
> > the rest of its chunk.
>
> Not a problem now, but don't we make the device assignment story harder?

I don't think so. In Android, the host doesn't track the MMIO of a
device assigned to a protected guest. The hypervisor maps it into the
guest, and gives it back to the host in __pkvm_start_teardown_vm(),
before the host reclaims anything. So the walk this patch changes
shouldn't reach it.

>
> >
> > Fixes: 4ddfab5436b69 ("KVM: arm64: Reschedule as needed when destroying the stage-2 page-tables")
>
> Isn't it an optimisation?

No, it fixes a regression: 4ddfab5436b6 replaced a single walk of the
mapping tree with the 2^27 lookups, as described in the commit
message.

[...]
> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
[...]
> > @@ -513,10 +514,18 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
[...]
> > +        for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
> > +                u64 start = __pkvm_mapping_start(mapping);
> > +                u64 end = __pkvm_mapping_end(mapping) + 1;
>
> __pkvm_mapping_* are rb-tree internals. I think it is better to use explicitly:
>
>   start = gfn_to_gpa(mapping->gfn);
>   end = start + (mapping->nr_pages * PAGE_SIZE)

Ack.

>
> Also, I wonder if we'd better WARN if the mapping isn't aligned with the
> destroyed range?

No need. The function's only caller passes the whole IPA space, so
every mapping is inside the range.

Cheers,
/fuad

