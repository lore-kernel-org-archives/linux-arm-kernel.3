Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B97CC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 12:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72wmxbqaTQSd4Gp56E8IKCIL1P/wg2sKYEhljEbcwmk=; b=pY0ZnUq+dj9nAE6s//g/E+KaQQ
	bNP6LQ1lAx08iJ2dahnrPeg6zSdbi/2QEFNJmJwaoqmvtfzupY9MwekukGUAcEc9e43eEGddrLH+U
	8c+kur0Num5TRSz8eM3raC0swzmhpEeFhl3mD7yqGGs8kd1My6Qw+8PFNxuHuVZ9GckXDa3dHTvRc
	B+CMhhDC5ORizqmlNYXk4QTvMRcZmmj6ToJH8Fxf8adM0CPzBI1ltiYZ9nsUsMSHDckK8NyEHIgVx
	GqaX1NkmBkAvtXnyO620qCXQTnKCvY+eBDhHDjVZ+zvgJcjtJ9tUR2dndDeUDi9IcTqRAEAOXonXk
	pmAHoF/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1k2g-0000000Efo4-0VnA;
	Wed, 02 Sep 2026 12:26:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1k2e-0000000Efnr-2PiY
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Sep 2026 12:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=72wmxbqaTQSd4Gp56E8IKCIL1P/wg2sKYEhljEbcwmk=; b=JW2VM3lm8XzAANXVMQoJiuC57y
	suN027AKKbnZIyoUerMiFD1pap2NSFR60CG1DPq3oo5XPJLkpHCzPqz8SwfKujdKM3yNhgalcNgyB
	l64eFJJtsdoYu9Yr8/qXEm6Pb947hR4xW/CbKAHt8h5UqLbVj2vvJM/Z13jaHaB7MSZp6fimbnLSH
	LPKV5tj9KjOGyIHn0BtIns9gQ06yqtuEg+2J5mLQ3L/mN7t7PhMkaOrg9rF4hAJJzl6oCpyY0Ediv
	H+aMUAAPKoOj/KZrn64/yqjnknLXoBlOFFaoN258AMPG457sZL6z8TxnixXJ7IFE0P0WBEiiXkc2X
	DJYs5wKQ==;
Received: from smtp-out1.suse.de ([195.135.223.130])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1k2b-0000000ByaM-3OEA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 12:26:11 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 72DD821BB8;
	Wed,  2 Sep 2026 12:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788351963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=72wmxbqaTQSd4Gp56E8IKCIL1P/wg2sKYEhljEbcwmk=;
	b=x1Q6TggcPtez2lMc9t1LJxDfCFOroZzUPuE215pcy3bgD2jsC37ZpYg4P13H4o/f5wzFIm
	HSU5ScbS/XeyJffItdex38NWzGJSfwiTaPTS1lkieWvEBkUi86ccDJVBeURwNfahRw+mat
	D4BbQnth94hZLTU2EcHt4j3SpZ231sM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788351963;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=72wmxbqaTQSd4Gp56E8IKCIL1P/wg2sKYEhljEbcwmk=;
	b=3durs7Te3aKAet7Jjsj4xs6oNNc0jHuTtEvxdqihoOhy2u1nODy8wyWCScAUrE5Bmu1CmP
	6KKsFvsxjZYRG+Aw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=15LelkYh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qXLs1ktp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788351959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=72wmxbqaTQSd4Gp56E8IKCIL1P/wg2sKYEhljEbcwmk=;
	b=15LelkYhGFxoxKG40ubqTifGBsBkpTlf4Iiv0cN9eWMdXd314rrLcQCI+/tvWZGjcQsnDz
	dhZo2y66uqir3aNVJ3TImyFFgx40HUJls2F0ceilgYo2cktUai+lRm7FYo1WbmI5w25osC
	SjGOAaEEAW+amBQsHJP44d6mZGtDU5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788351959;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=72wmxbqaTQSd4Gp56E8IKCIL1P/wg2sKYEhljEbcwmk=;
	b=qXLs1ktpcsphdNzSyYz5f2yVT3+2ck4Wc3VpSdApALk2BBvu2YFZw3GOiiKQCymwMYWS9c
	5mU9W8b/qTWn+TCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F53D136E6;
	Wed,  2 Sep 2026 12:25:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uZYNENYVmGplFwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 02 Sep 2026 12:25:58 +0000
Date: Wed, 2 Sep 2026 13:25:56 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Eli Billauer <eli.billauer@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>, 
	David Laight <david.laight.linux@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brad Warrum <bwarrum@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michal Simek <michal.simek@amd.com>, Ritu Agarwal <rituagar@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
Message-ID: <apgTKYKSBzbdDJZa@pedro-suse>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
 <20260831123937.32255a49@pumpkin>
 <apaF1HUtJnstuUN4@kernel.org>
 <1729fb06-6beb-f8ef-3e71-47fc3f00345d@outbound.gmail.com>
 <apcPg_y-HsMki7we@kernel.org>
 <9a3d6a08-339c-3315-cc81-46907d0836ad@outbound.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a3d6a08-339c-3315-cc81-46907d0836ad@outbound.gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 72DD821BB8
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,arndb.de,linux.ibm.com,linuxfoundation.org,amd.com,linux-foundation.org,infradead.org,lists.infradead.org,vger.kernel.org,kvack.org,lists.ozlabs.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_132609_997292_8253E616 
X-CRM114-Status: GOOD (  21.39  )
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

On Wed, Sep 02, 2026 at 01:41:54PM +0200, Eli Billauer wrote:
> On 01/09/2026 19:46, Mike Rapoport wrote:
> > > * Does vmalloc() guarantee that non-pageable physical RAM is allocated when
> > > it returns?
> > It's not pageable in the sense of demand paging. Some architectures lazily
> > synchronize vmalloc page tables and this can cause page faults that will
> > take care of the page table synchronization.
> > 
> 
> Thanks for this clarification.
> 
> This sounds like a showstopper to me. Immediately after the allocation of
> these buffers, data from the USB device can arrive at 400 MB/s. If the data
> flow is throttled as a result of handling page faults while trying to write

Note that these page faults are supposed to be uncommon in nature. They will
only happen in architectures where the top-level page tables are not
pre-populated, and when they weren't populated before. On a 64-bit architecture
that would be something like every 512 GiB of address space :)

> the data to these buffers, this could lead to an overflow in the USB
> device's own RAM buffers. This is because the USB device is an FPGA, where
> RAM is an expensive resource.
> 
> So using vmalloc() may result in a malfunction in the data transport where
> the __get_free_pages() would have been successful. This outweighs the
> benefit of a somewhat higher probability of success in allocating very large
> buffers, and surely the improved aesthetics of the kernel code.
> 
> Regards,
>    Eli
> 

-- 
Pedro

