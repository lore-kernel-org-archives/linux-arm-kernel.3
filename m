Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C54B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 11:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kquK7ZEp;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HxTQ6Kan
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Mk/nez9nenBsnQjciCAGiDdqXpw8qDo2kH67Oa3IArQ=; b=kquK7ZEpVQ1h6l
	wTqZGQ9g0UpIDALRi3OLmtOZLJWhzZ4cow/gVmR8YiloB4I7lMWHtuMdU2x5Pc9xZuWb78ZfQ3FLS
	Cw85/eqdX0gZxFJSQCxckUQ2rD0FtW72I3TElUh6hyqtVUdBjSkS3id+taoVM5bAY/wIslDtMbMYI
	zjKcNMMpptp1pD6X0gVTX1OUFGpTJyErDAavtnvySye9mrsj7PsaI4/KEGq7X7HH7tiuwX9r3KXGf
	7aP3LKHvmyXF69lZ9vyc5x0ml5KUTntUczLqW7P1rNfe2eZK2QoSwsK4O33Zj3HcTeMCQGQ7mh/2i
	rvouQzv06We9vehtUshQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKZUv-000000007OW-0Ocf;
	Sat, 24 Oct 2026 11:01:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKZUu-000000007OP-0Ov0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 11:01:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D4AC40123
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 11:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60FBE1F01825
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 11:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792839671;
	bh=Mk/nez9nenBsnQjciCAGiDdqXpw8qDo2kH67Oa3IArQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HxTQ6KanFVkN6lxvAOgHmwYYWTVapA9CWnHEU7aSzt9ng/nx7AkCgYSxnEzxfpvPj
	 vK2BNVC+Hz2bKcBcjc0O+0RH3rSdJxaOzdIExJa1Tb9buwOq5k2a1uYfAekhp2H99S
	 LRI0PcZgNRAVEPPs7ItYR0GD12tExEYIcTE43oQwTTlKfI4LS+P6QsndKON3OPDSrB
	 i3ISuYf6GGsw4zy3enAfiN5A8/j7+pWIbX0Zs0Ww7GMlI6P0G3Pj4WWUy+AsbPbRFg
	 IW4Ee47COAzx6qcwkaezXcb6k1jWVvJPprh7ZDF4iM0PemeA6fiR3ynxT9B8ed5/ua
	 opiJm+DkbE1aw==
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f2b8cf037so144438285a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 04:01:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwDu3/NTim4QIenbMTD6OhJ1Rp/Ufp9ju1eaqgaEu+Q/WbiMZ3TLnZCT7HSU10dWI6e5X1TQYHQ8Va/XktEGW8r@lists.infradead.org
X-Gm-Message-State: AFq9FYJyO1KPKNU1Bidsqs3zvL2EPoGxb5Hpx0muP8DdU9IXfTD19zeP
	qO1LixwU5RLcL6Kd4+rfijHOKVweVOPhl6WnXCHu5KcO1v9TYga6+MC2gHm69tF/003LugUXx0l
	rAgGKXM3p4/JdYtZIFMuq4WzHqXvaTrg=
X-Received: by 2002:a05:620a:262a:b0:93f:3863:268a with SMTP id
 af79cd13be357-940ef92bffbmr223374585a.37.1792839669908; Sat, 24 Oct 2026
 04:01:09 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260802074018.73887-1-baohua@kernel.org> <20260802074018.73887-2-baohua@kernel.org>
 <anCu3DOrXDeMrwi5@lucifer> <CAGsJ_4xM7mmv_Xa3g2mB_0gW0_VtYhMtwz0idgYLyoAYiHFmfg@mail.gmail.com>
 <anH3jVrBlUMLd-28@lucifer>
In-Reply-To: <anH3jVrBlUMLd-28@lucifer>
From: Barry Song <baohua@kernel.org>
Date: Sat, 24 Oct 2026 19:00:59 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w9eTngW4TbqhmgDgCW6ugd=3Thq+u8ufqJ1WX-c_4p=A@mail.gmail.com>
X-Gm-Features: AclHuK91tBy5WqlUSNbGFKdzZTc1OWL-WRH6V00N6zby1epMlwqFq2F3wTNVRPE
Message-ID: <CAGsJ_4w9eTngW4TbqhmgDgCW6ugd=3Thq+u8ufqJ1WX-c_4p=A@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/2] x86/mm: use VMA lock for kernel faults on user addresses
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, surenb@google.com, liam@infradead.org, 
	vbabka@kernel.org, shakeel.butt@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, zhanghongru@xiaomi.com, willy@infradead.org, 
	zhangbo56@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Aug 4, 2026 at 10:46=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
[...]
> > >
> > > And finally - Willy is working on a grand clean up of this stuff _I t=
hink_ so
> > > you probably should coordinate with him also?
> >
> > I have no problem waiting for Matthew's work. It is the right
> > thing to refactor the duplicated code across architectures for
> > the VMA lock page fault path.
>
> Seems sensible thanks!
>

I'm not quite sure when Matthew's cleanup series will be sent.
Matthew, what's your plan for this?

Maybe we should send RFC v2 of this series on using per-VMA
locks for kernel faults on user-space addresses to collect
feedback across different architectures? RFC v1 only included
demos for two architectures.

We may need feedback from architecture maintainers to confirm
that we're correctly checking for page faults triggered by
kernel-space accesses to user-space addresses.

I also think the cleanup series might need to take this
requirement into account. So, even if the cleanup series hasn't
been sent yet, it might make sense to discuss these changes in
parallel=EF=BC=9F

Another suggestion I made earlier [1] was to wait for the writer
to finish and then retry acquiring the VMA lock, rather than
falling back to mmap_lock when lock_vma_under_rcu() fails on
the first attempt. I guess this is also something to take into
account when working on the cleanup series?

[1] https://lore.kernel.org/linux-mm/CAGsJ_4wXGf90BMoJp3_z8G4fMTAgED88RXvbp=
6C4Gf+iy_2nvg@mail.gmail.com/

Best Regards
Barry

