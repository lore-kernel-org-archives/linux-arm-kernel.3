Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEF3C55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 07:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5mDgbwvY3SqOuoz1jd042jQGZrilknm7rjQphy+tiA=; b=DDgzeMY9kOHxkGhSFArkjSmHbK
	aCyNqAmU32IK0Bt4gY2sGmMi6BmBp/Du19IxzbMIycwwFUbDoA8268UvtUNvMkvv0SCW0fLwXbR8n
	bPihXIYjNIvzNPZpo6DiSgxfQuyuH/GpRoY5pk/8nfiOAP2tKm3CdwGYhMPMNosn37Q/XzBEDE1c1
	mTvFVDoZ0zQ4pnKIvBvxGNmpf+Spm9amKuNt/M0FumZmBKkY5VoNYFCtPv82UAHARWm0s2G5FN9Nt
	bu6WTlYwJbzgWdeyMWyRRDSXZc2+KyCbAo9FcO48dGW3tG8BY4+YYX4MkJOlb+RJeb6NPNiN+K0UC
	mqU8w7uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrskf-00000005AAT-1FsQ;
	Thu, 06 Aug 2026 07:42:53 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrskd-00000005A9l-0kU1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 07:42:52 +0000
X-Forwarded-Encrypted: i=1; AHgh+RoYbA6lHRmY0Ulx81lH3Pbsagr2R65eRr2bxE3LVKpN6dF5eRythPHfVJ89dFsmfYmXczp6nLZ0rtCjeYUIv2xE@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786002166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s5mDgbwvY3SqOuoz1jd042jQGZrilknm7rjQphy+tiA=;
	b=uTZhyzq70IcORWpPjKpq4xQ40ZwrM9sY4JLfDrJrSaSWIlGPPtQg8MjxnNIUxRRrUSTw+H
	BBtbT/zLqoQVnY37eOkgipNwXLBrzS3GZMXq2aSJrU6GwIHdxAu02StlFRHIzn3sD4E5TQ
	YEX0tHpVMyMW3SWLJIbR/vaHgHZRKZo=
X-Gm-Message-State: AOJu0Yw4AF7O2FItlOStwdsr3kRY40rUnTymDG7RuEKdyk7Z2nLMsvVa
	wypRFLtdNOwaxilmsnLeof69VFjGXQ43BBztUYGmUkmsnjH034Iywrl3FyGJgsAKMMelhfKRAjT
	0skq7cvkydbGWgDEgJ5WI7vaKGxFGlw0SUfIGcexW
X-Received: by 2002:ac8:7c4c:0:b0:517:5d71:84e5 with SMTP id
 d75a77b69052e-52cfea0149dmr8214081cf.5.1786002153058; Thu, 06 Aug 2026
 00:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260805093828.3626610-1-fuad.tabba@linux.dev>
 <20260805093828.3626610-2-fuad.tabba@linux.dev> <anQQ3dcbk72N1g1a@kernel.org>
In-Reply-To: <anQQ3dcbk72N1g1a@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 6 Aug 2026 08:41:56 +0100
X-Gmail-Original-Message-ID: <CA+EHjTymdanCKoQO3ATmUZ=7Ph2wv4ES8SfkSsTgmOYAYBWayQ@mail.gmail.com>
X-Gm-Features: AUfX_myxDlOAjmYWKzMHR0N2hwA_2mNGaJp6De5XS0c3Q0cWjlphcGHmt0zum28
Message-ID: <CA+EHjTymdanCKoQO3ATmUZ=7Ph2wv4ES8SfkSsTgmOYAYBWayQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: arm64: vgic-its: Don't dereference a NULL
 collection on ITT save
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Sascha Bischoff <sascha.bischoff@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_004251_360075_84D5511F 
X-CRM114-Status: GOOD (  26.08  )
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

Hi Oliver,

On Thu, 6 Aug 2026 at 05:43, Oliver Upton <oupton@kernel.org> wrote:
>
> Hi Fuad,
>
> Thanks for fixing this.
>
> On Wed, Aug 05, 2026 at 10:38:26AM +0100, Fuad Tabba wrote:
> > @@ -2119,6 +2119,14 @@ static int vgic_its_save_ite(struct vgic_its *its, struct its_device *dev,
> >       u32 next_offset;
> >       u64 val;
> >
> > +     /*
> > +      * MAPC with V=0 keeps the ITEs mapped but drops their collection,
> > +      * and with it the ICID. Save a zeroed entry, which the restore path
> > +      * reads back as invalid.
> > +      */
> > +     if (!ite->collection)
> > +             return vgic_its_write_entry_lock(its, gpa, 0ULL, ite);
> > +
>
> Writing a zero entry results in a suboptimal scan on the target,
> compute_next_eventid_offset() should just skip ITEs that are known
> invalid.

Agreed, I can do that on top on the respin (I still owe Sashiko one
for patch 3/3 [1]). The predecessor's next_offset still points at the
zeroed slot today, so the restore crawls from there to the next valid
ITE.

I don't think it replaces the write, though. Restore starts at event 0
and walks forward until it finds a valid entry, so an orphaned ITE at
or before that point is read directly, with no predecessor to skip it.
Leave the slot alone and an earlier save's entry is still sitting in
it: restore fails find_collection() and the migration dies with
-EINVAL on the destination. Zeroing is what DISCARD already does.

> Or better yet, we should just make the ITS emulation consistent
> with the migration behavior and delete ITEs when their corresponding
> collection is deleted. As you note, this is UNPRED after all :)

Happy to do that for MAPC(V=0), but I think it might not remove the
need for the check. vgic_its_free_collection() has a second caller:
with the ITS disabled, clearing GITS_BASER<coll>.Valid frees every
collection through vgic_its_free_collection_list() and NULLs
ite->collection, while the device list and the ITTs survive and
vgic_its_save_device_tables() only looks at the device BASER. I have a
selftest that oopses in vgic_its_save_ite() that way, with no MAPC in
it. And that one isn't UNPRED, so I'm not sure we can answer it by
deleting ITEs and zeroing their ITTs.

Cheers,
/fuad

[1] https://lore.kernel.org/all/CA+EHjTxuYLBwNsDnZd4B_jYWBDvGxXMWSDKPiMqjJjdCMYySaw@mail.gmail.com/

>
> Thanks,
> Oliver

