Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C28C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 16:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0mSGKSljGbp3wm1OkPuo0d6XMXK1FIsRCwQHXpgKVI=; b=F8ZRVm9XvfvbYhZM9fFCjrslLf
	fGqlvnsIqsvKZFWhqkSQMrY58K7DBsqJkWJUul1SNYHkntWiI0eDIegMegg68ti4D24g0st1A6wP3
	S8V2ESn1ZWzfT+V1CbHXg2RcX4ux+aX0TuSDP00xgNJECa/wXDoJvRnWqnYe67WPm55jUzJB6tTcb
	TaCHF1J8RYaSK8KFV1CGxmCM8GrJgpy5TooRkP95B8fYC0B/OoKFICgeapabX0Qb4iXdEph0nQWIE
	qezEFXLEzm4BEQY9AGtDJ0Ck7w0wqYTK4zAHZtXBVmLr5p0TvN3U6etbXLxpfdZxZFSikG3UECQ1y
	7VhuAE3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wixRy-00000007cz1-2HQ6;
	Sun, 12 Jul 2026 16:54:42 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wixRv-00000007cy0-1Uai
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 16:54:41 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0C99240E029F;
	Sun, 12 Jul 2026 16:54:25 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id srior6ed563w; Sun, 12 Jul 2026 16:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783875255; bh=y0mSGKSljGbp3wm1OkPuo0d6XMXK1FIsRCwQHXpgKVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hZd3B02yURgxnaN2bOuG5eS5BGaZkYAs2AweWjgF8MPvxxPq1Pt2vhEEqnCqz6wWA
	 8dNkaOdtd19u+IcSBM/HjAx7JcHZLN7A5upeotFOjvVZJuJPXZ2xLlJORfsSwePPkj
	 s2QScnUZnorDzAAJHT7r+lAsUwSUICK0TK1gzPA+4BNove0iPem796CCGh6+vQ2uTF
	 IaaWP96Soy2OIRtZQ4wj3sYYMzUU7eb9vJwS5dkoeTmPjJv/vViw09zNDbqo+F8B9q
	 AyltvY6d3w6OaBCUM9eOqQsnsnrBBcZmFjmra1vn3CEnFOv/wKIU6VNf/oyr4hwPGu
	 7M7+2UxNFU+pg0Lto33EIt9lKX7i+Z29412SELwxHS1ldaxuC8r38fIiiBJ/60gssa
	 pi0hvyvsYutR7Ji2QjYroHz3Tz4NoMG/Ar3Egs6W/tT79qOi1QngXwmUMBYQyqPoUH
	 Ruz1xqCCFqxR3bLPqeiF9m4mB9wan85MmnjIRAYyecU6ELmJSYolJcfG5wxdEz+Bdf
	 GsCumXAiqGmZg2okklasr3ESHBzuoOl7c9q1iHAJ7QaMfNvEci61R9mQ2/96kYvjQ6
	 X2EbOcc7yHrtpWfN6qHdZShRWsJAMFRBQB9QrCT/E+9KlUi/jyYAcpQpaMbn/8DBjw
	 Da+sRgL8/If7qfYW8RZJTeHc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 22D5740E00C3;
	Sun, 12 Jul 2026 16:53:45 +0000 (UTC)
Date: Sun, 12 Jul 2026 09:53:41 -0700
From: Borislav Petkov <bp@alien8.de>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Toshi Kani <toshi.kani@hpe.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Carlier <devnexen@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH mm-hotfixes v2 2/4] x86/mm/pat: acquire mmap lock on page
 table free to avoid ptdump UAF
Message-ID: <20260712165341.GAalPGldsKpBs5treJ@fat_crate.local>
References: <20260712-series-vmap-race-fix-v2-0-ad134cc3a12a@kernel.org>
 <20260712-series-vmap-race-fix-v2-2-ad134cc3a12a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260712-series-vmap-race-fix-v2-2-ad134cc3a12a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_095439_552759_359613B9 
X-CRM114-Status: GOOD (  11.07  )
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

On Sun, Jul 12, 2026 at 11:42:25AM +0100, Lorenzo Stoakes wrote:
> This patch resolves the issue by acquiring the mmap read lock on init_mm to

s/This patch resolves/Resolve/

> provide mutual exclusion against ptdump, which acquires the init_mm write
> lock.

...

> We also include cleanup.h in order to use a scoped_guard() to implement
> this cleanly.

You don't need to explain that.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

