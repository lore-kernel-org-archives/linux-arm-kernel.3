Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5E4C55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 09:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CU4WpIubcpWK9hCH2PEh/5TTaHzVeki/xiz4teIymqk=; b=oz7JIqH3jrOfkMhHZvGhE95Og0
	NVHSyXj21GizV17VeHxsoXyV+lSALamDCMsmTt3/TlBxR592bcL1KCtTSF1K74ZcBBfim3u0Sn5rf
	1mRmNL38qxrPGlSlHcTIOv26JiOnVHv1XTjeluU6vETcIOnC6W2ZGZjyNUxUfhBqOJOphgM9HuCjv
	/7d6v0cz3/hFbTyJN0J2IaYd51IVspG7+gkjPvpDxXkMKbI8rNztdqUX2SGzP7Ue6ltTaq4pEDLNj
	tshNr5f+J2fuFPJY4rEhvfw0PpHhy0GuJaQKXt65qYreKXnOW+84Gz7kc2YGYOBWsDMfiI905JE0b
	e9jlFA2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYKL-00000003fj4-3h3v;
	Wed, 05 Aug 2026 09:54:21 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYKJ-00000003fiW-05qn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 09:54:20 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E35817FD43;
	Wed,  5 Aug 2026 09:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785923653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CU4WpIubcpWK9hCH2PEh/5TTaHzVeki/xiz4teIymqk=;
	b=wzR+ohd4v+0lgQWsYVhJoHKuZEtEb3YNwJc3v7q8zHLgDVW4LNwaXDrXwWIpNBFvtlK4Mj
	TKoKJO3eGxFZFt+KE9G87nTZpQhcrz1VGNbvP2VnMvCS7Rs9WCoI3nygsN7hvZ2XNO9V/b
	w0zcXDOVtiV3ZIsR0/uj9pv0VbIowqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785923653;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CU4WpIubcpWK9hCH2PEh/5TTaHzVeki/xiz4teIymqk=;
	b=0NO3IQ4xJEXNmoj/S5jhj6eu/u4nn6+Hww7p8Rcaf6NIkFyJHxb5+ggX0+7QrXFe3cTYaZ
	BY/vkPKrr8vVfjAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785923648; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CU4WpIubcpWK9hCH2PEh/5TTaHzVeki/xiz4teIymqk=;
	b=sfuHkkSYBH/rMYK9Ymy4w/oFuE/D0G/iXwSNRfeVql/WBcnVstNmrxr04BS1enCpHmVVeM
	2t3u0+WlVHt1sG3GP4x7Yh9a4D3BVInpfVYmHLxHpBLQuBgvnFYLIAZItUdgpCmRDbP52k
	x780PSShWatmHhVTu0TKjUxoZm6GEIk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785923648;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CU4WpIubcpWK9hCH2PEh/5TTaHzVeki/xiz4teIymqk=;
	b=OyGd9H2+JlMMeeivriHeQILv068qUPXI16OSZOsL+0ColwikZcoY/8I86KN0BqQvpuUhe1
	Vlk/VTgRxbyvOLDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CFCEE779C2;
	Wed,  5 Aug 2026 09:54:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wl97Lz4Ic2p2TQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 05 Aug 2026 09:54:06 +0000
Date: Wed, 5 Aug 2026 10:54:05 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Muhammad Usama Anjum <usama.anjum@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] mm: constify the pte_offset_map_ro_nolock()
 return value
Message-ID: <anMHQn_mBs6DTrZB@pedro-suse.lan>
References: <20260803164400.531199-1-pfalcato@suse.de>
 <20260803164400.531199-7-pfalcato@suse.de>
 <anHJ48Glq8EdHatd@lucifer>
 <anI6BEyTJFzQY-N9@pedro-suse.lan>
 <595fe323-59d3-4f4a-92a3-ac5d67b7461b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <595fe323-59d3-4f4a-92a3-ac5d67b7461b@kernel.org>
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,arm.com,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,infradead.org,google.com,suse.com,suse.cz,nvidia.com,linux.alibaba.com,redhat.com,linux.dev,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,kvack.org];
	R_RATELIMIT(0.00)[to_ip_from(RLxu57a9hfgn7tttf5jiwuqe5o)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_025419_211927_CC3163D8 
X-CRM114-Status: GOOD (  20.43  )
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

On Wed, Aug 05, 2026 at 07:58:02AM +0200, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 04/08/2026 à 21:22, Pedro Falcato a écrit :
> > On Tue, Aug 04, 2026 at 12:22:19PM +0100, Lorenzo Stoakes (ARM) wrote:
> > 
> > > 
> > > >   			if (!pte) {
> > > >   				mmap_read_unlock(mm);
> > > >   				result = SCAN_NO_PTE_TABLE;
> > > > diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> > > > index b91b1a98029c..2cfc6e608ef4 100644
> > > > --- a/mm/pgtable-generic.c
> > > > +++ b/mm/pgtable-generic.c
> > > > @@ -308,8 +308,8 @@ pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
> > > >   	return NULL;
> > > >   }
> > > > 
> > > > -pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
> > > > -				unsigned long addr, spinlock_t **ptlp)
> > > > +const pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
> > > 
> > > Can pmd be const too?
> > 
> > I was going to say "yes but then pmdp_get() also needs to be constfified" but
> > actually no, it can't:
> > 
> > pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp) {
> >          if (unlikely(pmd_bad(pmdval))) {
> >                  pmd_clear_bad(pmd);
> >                  goto nomap;
> >          }
> > }
> > 
> > so PTE mapping actually needs to write to the pmdp if the pmd looks bad.
> > Tricky stuff :)
> 
> But if pmd is const, can it be bad at all ?

Yes, you just need a stray write or a bit of memory corruption and it can
go bad. And then we need to do clear_bad() :)

(it's unclear to me whether this is actually common or useful enough these
days; the way this was explained to me, page tables can be best-effort
redundant; but it's not like we know clearing the whole range is ok, and
the way pmd_ERROR, etc work they don't even communicate to userspace what
happened, unlike normal hwpoison mechanisms)

-- 
Pedro

