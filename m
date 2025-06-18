Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32657C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 08:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+79qAmMyL5KTQBYuGU9+72mClK6xwDGJMdd6tFcpDc=; b=0MOdXFL+l3j7MhQKyR3sidP0bk
	Lji2l6KFFy5pmNlvHc8Wa18zjv3LDpVOVGnlDv49mdLD+NyeCHYmzE38NUgE+vQqCab7b3SHLnTea
	Q102Ax3KjgPF3aiJ2d0/ytSqNhVGY1EOULDOFwkzzzd+Mi5pyRsnhe9b+s1L39r400AGXbddN7Mo9
	PxIFAR0T3Rycka5rINRnKftXtMNBiOMhNfF+tu0Rlglz10isC/KCzAyldmq7SK/88vgZke0dF0aff
	MhvXmtzcH2pfL6YQdJfz++lpViKzx8ZmnZlpDuMCyAZJIeBAZcag7eIt58qiTa1YJaDXkLDHpVYYu
	3O63RDNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRo2j-00000009OhR-1coS;
	Wed, 18 Jun 2025 08:21:13 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnzs-00000009O2L-1rhU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 08:18:17 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7253A211A0;
	Wed, 18 Jun 2025 08:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750234693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/+79qAmMyL5KTQBYuGU9+72mClK6xwDGJMdd6tFcpDc=;
	b=lvNCcDuZyPpwud7LLz49EqFjWEaMWFwBSzpqFmT5P8oawjW3d0Kgyf3omlGm2Bi7jrq48g
	WJKwf3HwnLZv+9VfzV9hL2J84jnbNpketG4kCl07+mTaZ1BygW6h2jCUbdnzkfnuNs7ArY
	oSDHxEhU5xJVUUzF2doCm1n7y1yy8Ok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750234693;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/+79qAmMyL5KTQBYuGU9+72mClK6xwDGJMdd6tFcpDc=;
	b=6l8aTBesBb5QubYuxPC9jMdhzLDUPxO0IqYxXfWZrWgi8j/jWJl/Oxzdw2wv9iXY3kxhtl
	knZk+6cqH/IcQ5AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750234693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/+79qAmMyL5KTQBYuGU9+72mClK6xwDGJMdd6tFcpDc=;
	b=lvNCcDuZyPpwud7LLz49EqFjWEaMWFwBSzpqFmT5P8oawjW3d0Kgyf3omlGm2Bi7jrq48g
	WJKwf3HwnLZv+9VfzV9hL2J84jnbNpketG4kCl07+mTaZ1BygW6h2jCUbdnzkfnuNs7ArY
	oSDHxEhU5xJVUUzF2doCm1n7y1yy8Ok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750234693;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/+79qAmMyL5KTQBYuGU9+72mClK6xwDGJMdd6tFcpDc=;
	b=6l8aTBesBb5QubYuxPC9jMdhzLDUPxO0IqYxXfWZrWgi8j/jWJl/Oxzdw2wv9iXY3kxhtl
	knZk+6cqH/IcQ5AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2CA7B13721;
	Wed, 18 Jun 2025 08:18:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CHuPCUV2UmiiBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Jun 2025 08:18:13 +0000
Date: Wed, 18 Jun 2025 10:18:12 +0200
Message-ID: <87bjqlzcmz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdicheng <wangdich9700@163.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH v2] ALSA: hda/conexant: Renaming the codec with device ID 0x1f86 and 0x1f87
In-Reply-To: <20250616074331.581309-1-wangdich9700@163.com>
References: <20250616074331.581309-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[163.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,alsa-project.org,lists.infradead.org,kylinos.cn];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_011816_633238_51E67E35 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

On Mon, 16 Jun 2025 09:43:31 +0200,
wangdicheng wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Due to changes in the manufacturer's plan, all 0x14f11f86 will be named CX11880, and 0x14f11f87 will be named SN6140
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Applied now.  Thanks.


Takashi

