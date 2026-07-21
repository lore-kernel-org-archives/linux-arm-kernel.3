Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BFFC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 17:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+kp8j8RQXqYz4HiL6BM9iRIWosOZOMzLCJGR/2Sk1c=; b=050+F89XKKTxrF17FzQlz75fMC
	tl1Ka8QbSqo2M+slsoOuyJ3tvgj4kZGaMqvNfz8k+q+t5J22BY1nnv26dRI77huFlrq8Vwzzfz+5P
	M+RY6wIGdAhsfEW0wUUXjxjzr03JfhD44JZZX0MM3IGAh08jquZmpYZc9/TGOb0uSHjAaUZ6354zR
	wcpr7ZWnD4KnH16JCQrR5sq75DDGw4eMfvhtnJsZ44gYtsTWxPceklWIt4SdqjLFD9HY03dwmfAAZ
	wQE2q0SAexmdE7AEgvAagPL9by/2e+P9EnR1N4XjvpjOxOUSKduXgVJ0fxs/489sDSAq3uRR/vouo
	9xKWN2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmE99-0000000A2aL-13pT;
	Tue, 21 Jul 2026 17:20:47 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmE95-0000000A2Z0-3whz;
	Tue, 21 Jul 2026 17:20:46 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 65B4E40E00C3;
	Tue, 21 Jul 2026 17:20:30 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RI_0lUk3GInp; Tue, 21 Jul 2026 17:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1784654418; bh=H+kp8j8RQXqYz4HiL6BM9iRIWosOZOMzLCJGR/2Sk1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OCGDcuY922zK8+thN0a62DX0OJ8S/zy6csu77s+HJDg7Tiw3kuK5DaR9HV84RC1uV
	 3muM6FhgECTBD1hnQJgreOzu3oTIVap397z/IHO1OgOzVK6cFrjeUW28/6/VeYios2
	 9xp7ox94bn7q8PR/PYxTspEHEVs/es3ZexKmoUo16HiBUiLfFdshRCBDoOEcrWQZ5X
	 gk5MMg+8crrVqEUe7nSTVz7F1fjDQRHShglfx9h/aocbLPYQcmp6GosBqFk70xDh3B
	 vFl7CPkaTEBTA36WZiBsymfJjORj0ceKVFGsmJxm/OfHppSGUE9eNkgMvxt5mRVdLE
	 rBsAYl2pQKQC2N8xuA5SALvB/zZ2grhAHKMFeaX3E1wjKQeD9MCnn0iwT+iGtRJtiC
	 1pyvm1Cu8SPrZH+szL96x3eOB3+s8AnVA9sNE/F3/fekNwhMmnR9eW0ILdZLGwE+v+
	 xk9X39suV3YKAWgnLxhJ6RlvC5WN7q7PH/fhr9JeeRvlTdzEE29AX7RAcPkHsgkgZ8
	 dXZGOS2Ox1+ZbRF/n5yWDJpdNyN1PqtbqLvkitI9T1cNJEW10+XufRbq7u85XyZNuD
	 ALc9/5Rr6AHbe0zLz5I9GTdYVu4AJ2S9D9ua13A2ocklLMRv/WEp8zzXVITKSYuBkq
	 twY8CxE2QiT4H9C4DrpesDGY=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9384340E00E6;
	Tue, 21 Jul 2026 17:19:46 +0000 (UTC)
Date: Tue, 21 Jul 2026 10:19:43 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: linux-mm@kvack.org, Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	x86@kernel.org, Dave Hansen <dave.hansen@intel.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 00/18] arch, mm: create a generic
 set_memory/change_page_attr core
Message-ID: <20260721171943.GEal-qLx4p5YbocQNV@fat_crate.local>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_102044_140733_32DCA3B2 
X-CRM114-Status: UNSURE (   9.96  )
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

On Tue, Jul 21, 2026 at 07:23:23PM +0300, Mike Rapoport (Microsoft) wrote:
> Currently there are 6 independent implementations for set_memory and
> set_direct_map APIs.

So with all mm/x86/CPA patches flying around, can we first agree on which tree
is going to collect everything?

And if I want to review patches in that area, what am I applying it ontop?
linux-next perhaps...

Let's sort out the workflow first so that we don't get lost on fruitless bug
chases and fingerpointing.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

