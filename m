Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7DAEA4FBB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVEJ1r6FOlyG4Cpi7q1mYna0gup2PMjct/OLJuDuu38=; b=yPIWx+nomM0Zs1iB7MZzaI+oYQ
	ZSXSPz4g7jtcI6i847oiCMyXVMaNK4zdYmfR3w5lxNbBcwUE7pR4uNXbKnye4yTNf03uFVk/gXZqs
	ogOQuAQkWlgWlBcpHQ8skLNai398xobX9JdxkdFP3w0iAV3YEbHMAUCeP01b3jEHTrDxsT36kgwTM
	fUwXUWENIRmhIBUhQXX+yIvt+Eoz23mrfKli773TfFwUEE5LomUT2FtdroTGpvTBqNMXhXDdbmbAB
	62vHjEH0yw5NgNwUKaa3ApK58zMGUlnRuMgWcJivetMPAEfnVZ0J5nn5EHY7IkebtWvwc3Eibhrgs
	6ig/9C2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVaW-00000000KBQ-2FKH;
	Mon, 23 Feb 2026 13:03:00 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVaR-00000000K8i-3YNF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:02:57 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 94B135BD1A;
	Mon, 23 Feb 2026 13:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1771851772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pVEJ1r6FOlyG4Cpi7q1mYna0gup2PMjct/OLJuDuu38=;
	b=pnKlAEtZgmUOCttcp4oSzoCnKnvhyCPS2971xlB0knZzxkDguYRY8/gEQ5eB/ogtbshMeS
	GMw+kDe2KCrRartxRphHGpvb//VBzHQZHCUwZcdh9bhXK5xjxTH9hywtryB3WoXfBsGgrg
	VLRZsDarRzf15cMmHxIwMHpLJ0f7ZfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1771851772;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pVEJ1r6FOlyG4Cpi7q1mYna0gup2PMjct/OLJuDuu38=;
	b=vuz5TVcSot9WTr9zKNiQ17wzfzc2NyL1HiKWDnvLl224g4ClWijW6Zc7AG0DZN09lfiWig
	doXIGXstrhcp9YCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1771851772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pVEJ1r6FOlyG4Cpi7q1mYna0gup2PMjct/OLJuDuu38=;
	b=pnKlAEtZgmUOCttcp4oSzoCnKnvhyCPS2971xlB0knZzxkDguYRY8/gEQ5eB/ogtbshMeS
	GMw+kDe2KCrRartxRphHGpvb//VBzHQZHCUwZcdh9bhXK5xjxTH9hywtryB3WoXfBsGgrg
	VLRZsDarRzf15cMmHxIwMHpLJ0f7ZfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1771851772;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pVEJ1r6FOlyG4Cpi7q1mYna0gup2PMjct/OLJuDuu38=;
	b=vuz5TVcSot9WTr9zKNiQ17wzfzc2NyL1HiKWDnvLl224g4ClWijW6Zc7AG0DZN09lfiWig
	doXIGXstrhcp9YCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 819D53EA68;
	Mon, 23 Feb 2026 13:02:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id clmgH/xPnGnCDgAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 23 Feb 2026 13:02:52 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 4D487A0A4A; Mon, 23 Feb 2026 14:02:52 +0100 (CET)
Date: Mon, 23 Feb 2026 14:02:52 +0100
From: Jan Kara <jack@suse.cz>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Dev Jain <dev.jain@arm.com>, 
	lsf-pc@lists.linux-foundation.org, ryan.roberts@arm.com, catalin.marinas@arm.com, will@kernel.org, 
	ardb@kernel.org, hughd@google.com, baolin.wang@linux.alibaba.com, 
	akpm@linux-foundation.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [Lsf-pc] [LSF/MM/BPF TOPIC] Per-process page size
Message-ID: <pqwem5hownnfwcqrubksdwwraqbkthpzucknhavrghmw5lyszs@vdorbx4fyyaf>
References: <20260217145026.3880286-1-dev.jain@arm.com>
 <aZSHvt9Trlq7k7aH@casper.infradead.org>
 <2e68ef61-dcf2-46b2-913f-14980a104faf@kernel.org>
 <aZfn0tbKl_1JD-VM@casper.infradead.org>
 <5f61a5fd-ab38-4635-aab8-5de515c4015a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f61a5fd-ab38-4635-aab8-5de515c4015a@kernel.org>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_050256_178246_D41BE7B7 
X-CRM114-Status: GOOD (  17.38  )
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

On Fri 20-02-26 17:50:44, David Hildenbrand (Arm) via Lsf-pc wrote:
> On 2/20/26 05:49, Matthew Wilcox wrote:
> > And if no pages from the file have been mmaped yet, they cannot be pinned
> > or mlocked.
> 
> Is there some other way for someone to block a page from getting evicted
> from the pagecache?
> 
> We have this memfd_pin_folios() thing, but I don't think we have something
> comparable for ordinary pagecache files.
> 
> ... putting them into a pipe and never reading from the pipe maybe (I assume
> that's what splice() does, but not sure if it actually places the pages in
> there or whether it creates a copy first)?

Standard splice copies data first (it's using standard IO callbacks such as
->read_iter) so that doesn't pin page cache AFAICT. Only vmsplice(2) does
but that requires mmap.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

