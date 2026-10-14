Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E18DCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPK1bO+LXpPtESmAcGbr+PUjeJvdQgm8uDzrK6v76Fc=; b=ayHHQAspS24FuySKVJGol499Hh
	ylbK2Yc6SYDPPfnCxugV514YcoG5CeqWg64Ac1dACmZU6EheHUlfbI14TGQzYlQVi0L7rMF0c+52Y
	RNWtkw4Fse/bt2AAp303UJxpwaFsUCKD9RAdTDyqJWZUCORQiAydT+rqRmFS6RRLuF8cef/cSSnaV
	xCvfYoMKJ8fTwkKxrnrHHmJBiDCjnt9xbbOdOmA2Qfq/jqtYm1s6mzuNyquYUsihqNf6p2GuKGR3T
	kBsWB9Gbx1sdqacTB12pMJArM6hi5CVkdpxQEGHswEHdwhF5VOaMLcJ0FbM7dReZ7EmixgGResMQM
	+0hqYYOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGytQ-0000000FZCA-3hGh;
	Wed, 14 Oct 2026 13:19:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGytD-0000000FZAS-422D
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 13:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RPK1bO+LXpPtESmAcGbr+PUjeJvdQgm8uDzrK6v76Fc=; b=OiHZstkNYOyyMJuQGS38hada6T
	cPdjPqvm75uY3nYzYdbbta7KpBuVT0f0sApw6j69EWZrq3FfCNy30nxz4MqMeotm4o7PbN4fUGeF6
	jtM7LR+WlNpjQjfWL/AUnyZUFIewxu1tCGjLCHa0ahqXwa8WYEQvwmv8excX2kdk0mk9zQH3svS1t
	clp1FLiyc3STrJHLv7nSBB84wMCmV/DrQHLNF2wxaA7oRaseeq7A2FRisobjloJ9DwCuI7N8aOhKy
	cuYwzX1BcDk/s3MlwAiwpkladuSWu+9Ym0a1zfP+bybmfxY9XM7Wtf4lEZcXdvApOyrSvRpexS41E
	0fZvix2w==;
Received: from out-199.mta1.migadu.com ([2001:41d0:203:375::c7] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGytB-0000000GoAJ-11fj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:19:26 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=aTzHnXwYVJUGpYRSUlHI4kXeHhU4f+c16/CqGgZrLhs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791983956; v=1; x=1792588756;
 b=O+fFGxex70SQtPkhYVoilLcRD2wa0HqqW4VaSKdS83kdt+b0kvjVebAgBzu3u//KHD5ie200
 2P5gBq76HMSWqD7u8rGroL0Nq8uM3SgJ9Qy4H+eYIKTqO0Od44CGPNJqIBp5ap+sO46+CRcAB4W
 m2yJpxCJ8xi9ZuPLm5fSPvLo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1f0b7d1ecd776177;
	Wed, 14 Oct 2026 13:19:12 +0000
X-Mizu-Trace-ID: 1f0b7d1ecd776177
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcf03d95b8so28637e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 06:19:08 -0700 (PDT)
X-Gm-Message-State: AFq9FYIv2o1NXdfzTgM5yjhBDh1oOSZFWFnrHPoBpQmsvDmLqY4SS8Jg
	ePGdH0FDTRiDogdSUlDditNoCUDFSnRHxaKZtv2+4VIaSyqXtYZMJxy+J0fsvExoDP8I11TkHcT
	58Z+N6ReJFhr37A2JjVWFEXkJDfMBne9gLubUScUB
X-Received: by 2002:a05:6512:1352:b0:5bc:f0ab:1f39 with SMTP id
 2adb3069b0e04-5be35a3ccc9mr104769e87.2.1791983945579; Wed, 14 Oct 2026
 06:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260605153248.2412064-1-weilin.chang@arm.com> <20260605153248.2412064-2-weilin.chang@arm.com>
In-Reply-To: <20260605153248.2412064-2-weilin.chang@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 14 Oct 2026 14:18:29 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwK092o8YZjV0vzBDLSY=cesOvhqj39zDd1MF-toOVTwA@mail.gmail.com>
X-Gm-Features: AclHuK-D4V7-XOOYkcs71Ak9kbmSkq3X3DlhkeEjLZk_QZspZkb75DxTMMqKDzg
Message-ID: <CA+EHjTwK092o8YZjV0vzBDLSY=cesOvhqj39zDd1MF-toOVTwA@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Replace memslot_is_logging() with kvm_slot_dirty_track_enabled()
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Gavin Shan <gshan@redhat.com>, Leo Soares Passos <Leo.Bras@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_141925_343232_C072E6C8 
X-CRM114-Status: GOOD (  23.20  )
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

Hi Wei-Lin,

On Fri, 05 Jun 2026 16:32:47 +0100, Wei-Lin Chang <weilin.chang@arm.com> wrote:
> When checking whether a memslot has dirty logging enabled, the
> KVM_MEM_LOG_DIRTY_PAGES flag is the source of truth. Previously we were
> using memslot_is_logging() which only tests dirty bitmap and did not
> consider dirty ring. This was not detected because
> KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP was introduced together with KVM
> arm64 dirty ring, and users need to enable it to ensure dirty
> information is not lost for the case of VGIC LPI/ITS table changes.

I ran into the same bug while testing the arm64 KVM_PRE_FAULT_MEMORY
series, and then found that you'd already fixed it.

It might be worth mentioning the impact in the commit message: with
the ring and no bitmap, a logged memslot still gets block mappings, so
guest writes to most of a block are never logged and a migration can
copy stale memory. That would also make the case for a Cc: stable.

> Note that memslot_is_logging() also treats a memslot as not logging if
> KVM_MEM_READONLY is set, hence a memslot with both dirty logging and
> read only would be seen as not logging for memslot_is_logging(), but
> logging for kvm_slot_dirty_track_enabled(). This allows a read only
> mapping of size > PAGE_SIZE to be built when memslot_is_logging() is
> used, leading to a better read performance compared to
> kvm_slot_dirty_track_enabled(). However memslots that have both
> KVM_MEM_LOG_DIRTY_PAGES and KVM_MEM_READONLY set do not really make
> sense as dirty logging is essentially nop for a read only memslot, so
> this shouldn't affect real workloads much.

FWIW, I'd go with Leo's suggestion of keeping the KVM_MEM_READONLY
check, so those memslots keep their block mappings.

[...]
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
> @@ -2084,7 +2079,7 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>          * and a write fault needs to collapse a block entry into a table.
>          */
>         memcache = get_mmu_memcache(s2fd->vcpu);
> -       if (!perm_fault || (memslot_is_logging(s2fd->memslot) &&
> +       if (!perm_fault || (kvm_slot_dirty_track_enabled(s2fd->memslot) &&
>                             kvm_is_write_fault(s2fd->vcpu))) {

FYI, this no longer applies to kvmarm/fixes or kvmarm/next, where the
condition now ends in memslot_is_logging() ||
is_protected_kvm_enabled().

I tested the series on v7.3-rc7 (with that conflict resolved) in QEMU,
with dirty_log_test changed to back the memslot with THP. In ring-only
mode it fails on the first iteration without the series and passes
with it. I'll send the test change later.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

