Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E6BC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 18:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/A6KjObyhq7cVhHMbT2KKH6Oo7ujhT7xd/MtfUsrEqQ=; b=xVJW6huErm4i4/Ferk3ycMghFv
	nL8zGjWM/aGw0Wl5po9BJOvxAJz8nGUTm2Lg9hwhTCm5hypirBsM1PkdQfJIWXBhgF3RNDVxZOXao
	nBDoeB82YgGc4RY4H4nhbQdv7iDb8rb9XdSol+12EVFKhZmQZvGgMGLjafC6k0UdfpxxMxQvRHpwB
	BAIvBj310jY2grTIQw02YY9O+jYhL0Uqe6HS/NvlPEhNY/PkU6vwm+vh+KCzxynZFPqarL8S5c4v7
	XcfOwzVu37LfkjcdrH2nKAjxS6Z3hVKIK4go5JKfivLPWSAjHdI4gPfk97kuCNkRfRmApXQ6zU/DE
	7cf7KYqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww1yT-00000006en9-20Xy;
	Mon, 17 Aug 2026 18:22:17 +0000
Received: from out-141.mta0.migadu.com ([2001:41d0:1004:224b::8d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww1yQ-00000006emA-1nmK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 18:22:16 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=/A6KjObyhq7cVhHMbT2KKH6Oo7ujhT7xd/MtfUsrEqQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786990932; v=1; x=1787595732;
 b=WgUK+CahFl/1QXc6w53iEksPUTHbWXHOeAbMBF3cUOp4WJ7UgNtGtjv1smMX19VjUGmE7GQ0
 GwhWsKnQfObNoqEhy1YHVrt1x5sAPKyrTEznqnOnXJqXb99ejyH13vLx9xMgt4VPCth00+hOKwC
 clh/6qZZNFjOTe/0nuojsZIc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f52.google.com (209.85.167.52)
	by smtp.migadu.com with ESMTPS id ac080a5c979033c5;
	Mon, 17 Aug 2026 18:22:02 +0000
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeb688ae83so918e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 11:22:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro2FyfUpfOrd1Cu8l1ABShDq3rmMbRyFb5KsbU6+EAiZ12av8IPY0EVjOvdlwDxrCLyLJzDyUZW1v+ncaPMv5It@lists.infradead.org
X-Gm-Message-State: AOJu0YzSWoSgAQmJOJNatloaNb9VtXaKeSu+pdKxYb4ddB4f4MsmSYYg
	7BCm46m9AZq8vEtzwpwv6lMzsfkh9sUwkkdnI1fVU1g/cFp14BmYoEQqNgHQFO9kmcl9vUZlmK+
	xHmPbzhILB6t+zsalDAyj/8t8aoBZivVrqu0i4xF0
X-Received: by 2002:a05:6512:3b82:b0:5ae:b1b3:145a with SMTP id
 2adb3069b0e04-5b471fc851emr21997e87.6.1786990920611; Mon, 17 Aug 2026
 11:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260807104102.2410744-1-fuad.tabba@linux.dev>
 <20260807104102.2410744-4-fuad.tabba@linux.dev> <87ecg9owwa.wl-maz@kernel.org>
In-Reply-To: <87ecg9owwa.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 17 Aug 2026 19:21:24 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy90YP8dzUy724VQ7vzVusr+mGocFxyHoQZ2c4OJnpBcQ@mail.gmail.com>
X-Gm-Features: AcwNN1VsZZX6k3eIXS5T0yPwB2Cj45iz_ikQ2tsaPPV3wj_Pap_RqK51TbezACk
Message-ID: <CA+EHjTy90YP8dzUy724VQ7vzVusr+mGocFxyHoQZ2c4OJnpBcQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] KVM: arm64: vgic-its: Don't save collections the
 table cannot hold
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Sascha Bischoff <sascha.bischoff@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_112214_971887_C4E08076 
X-CRM114-Status: GOOD (  17.67  )
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

Hi Marc,

Sorry for the slow reply, I was away.

On Sat, 8 Aug 2026 at 09:09, Marc Zyngier <maz@kernel.org> wrote:
...
> > A guest that disables the ITS and rewrites GITS_BASER with fewer pages,
> > VALID still set, keeps every collection it mapped against the larger
> > table: KVM stores the new BASER unconditionally and frees the list only
> > when VALID is cleared.
>
> But isn't that the *real* problem? Shouldn't we instead nuke the
> collections entirely and go through a reload sequence?

Agreed, that is the problem. The fix belongs in vgic_mmio_write_its_baser().

Should it drop everything, or only the collections that no longer fit?
On a shrink in place the low ICIDs are still in the table. Or is no
realistic guest doing this, so the simpler rule wins? I can do the
unconditional drop if you prefer.


> > Validate each collection against the current table with
> > vgic_its_check_id() and return -EINVAL, as vgic_its_save_device_tables()
> > does for devices. Collection IDs are unique and the collection table is
> > never indirect, so the check also bounds the walk.
>
> I think returning -EINVAL here was a mistake, as it aborts the save
> procedure that userspace should be able to issue reliably, even if
> that means the state is crap. I don't think we should expand that
> behaviour any further.

Fair enough. Either way the check goes with the fix rather than being
expanded: MAPC, MAPTI and the restore path already validate against
the current table.

vgic_its_save_device_tables() is harder: with an indirect table the
guest can invalidate an L1 entry without touching GITS_BASER, so that
check can still fire. Skip the device rather than fail the save?

Cheers,
/fuad

