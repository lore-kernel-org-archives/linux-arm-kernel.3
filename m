Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED217E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 10:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YAg0YpSiEYHy04uZdiQTEpl5KVnoLqEM0qII/Nidds=; b=V8cM5cpdh18j3IpF2U43e1gy8J
	wPht6y0ru1ahrbJWjkdmwCGMH0J7NVSJkLHUiF0y9/2aDAwcKHYzJs//ifbdbMDRzPnmlZJbvJB7b
	1K4Cu0CJ2D5zEb6QuvqtNElZCyGvRMSpk3Yx475js3XHHEGTS+wuvbRWY7TFHPuCxfl7M244bQMQP
	I0Dug8SCckY0NUIzr/CbvpWPUcXnBTlzy7TBVbLKTUSEYyEUqiZDY8vKjOeDGRT6mxB9tGh8ZasRd
	jaZ00/UGFAE5BXs3GU6hfDP/OQAUKuKbFyMcYg50wkOOQdvFdQIcopntJe64Pui8LuIxhMG6zHZRQ
	nyOGmEaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXHmH-00000004nkc-0v3q;
	Mon, 13 Jan 2025 10:34:37 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXHl3-00000004nbC-1IOR;
	Mon, 13 Jan 2025 10:33:22 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 56AC540E0269;
	Mon, 13 Jan 2025 10:33:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 44t9bF7uA_eu; Mon, 13 Jan 2025 10:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1736764394; bh=1YAg0YpSiEYHy04uZdiQTEpl5KVnoLqEM0qII/Nidds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K+EMIWQk8WEi1SZnmV0P2JV4bYxukiYLA54qWzk86NFeV3epUUZCeca9u2L5n9P0E
	 LpzIa+lx4YydRs1fIN7BKHu3nzp6rB87sIjJmGJ99V6hS0DgT/3rLZQdZbxkjW7+Yo
	 FEQN8hNHMfG4NvXbq9OG9bFMgM2NIGgR5axG9G7NXZBTOuKNQfkSgQYm8gyRlWWKeq
	 rVbTzkI+yk2Z0AxKMbBrVVQjIDL4xbIZc/110fkUfbrI6OAGjNXu5VnNwBJiOWm1L5
	 rx11poD/DmHI/DaWjIq6EwLTaFFtDn2j3JPdJpjT1Bg5Omjsa02dn834AalXC6G4xe
	 H7DEiXBwOIpZxaFBanAsxQ08DvWiMSECeZNk/LGwLnxKl0hUALCNakpEANuApExibj
	 lePjysDbMECgWWQ1uvRpBJRFNbuwqE7M0bqM9JKDgoVMK8ebDYnIuVG8pCNbioibbg
	 A3wk+AfTiIwv6GMxRr7ztm+GMm+4OJIkaFDR311ZiFSFu202yKPdUV/AuWUDVLwNY0
	 nPNWVZEp3FxjV2/rXxxzZtE8W4FTydvSfdEJHkAd3xB1RLT/gbgUhUd0IJMPVKeZy2
	 DdCkE/H7k5SgA9wABr7ZHtmZR3cbJhyVtdWkL2MxZnSqn16Ve5qbAdf8f0DNt+jwHq
	 puXr2LJB5F9JK2neGSR9z39Q=
Received: from zn.tnic (pd953008e.dip0.t-ipconnect.de [217.83.0.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AEAF040E0163;
	Mon, 13 Jan 2025 10:32:44 +0000 (UTC)
Date: Mon, 13 Jan 2025 11:32:38 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eric Chan <ericchancf@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Kai Huang <kai.huang@intel.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Russell King <linux@armlinux.org.uk>,
	Samuel Holland <samuel.holland@sifive.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCHv2 2/2] x86/mm: Make memremap(MEMREMAP_WB) map memory as
 encrypted by defaultk
Message-ID: <20250113103238.GCZ4TrxlX-VbHLkoNo@fat_crate.local>
References: <20241021105723.2707507-1-kirill.shutemov@linux.intel.com>
 <20241021105723.2707507-3-kirill.shutemov@linux.intel.com>
 <20241118164616.GAZztvWGs9cOV8t20_@fat_crate.local>
 <s4frmqwtuvclinuu7ttyzfpe7bj7hju5xgt6sxzy3gyt3prr62@rrgvhkv4lgwv>
 <20241121114952.GCZz8eYEVa3yubYQzO@fat_crate.local>
 <bz3vlh3lri7yfckdkddopwhsgvkmizhw5q6ecomgeba7q22ufp@ntu2kugiho4o>
 <ejh2llcaxahkgz3k2ji3b35dfdss3bfgztyhsfgtu6adejasr7@ajehr7ac3bp3>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ejh2llcaxahkgz3k2ji3b35dfdss3bfgztyhsfgtu6adejasr7@ajehr7ac3bp3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_023321_503892_18F9A1ED 
X-CRM114-Status: GOOD (  10.05  )
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

On Mon, Jan 13, 2025 at 12:03:22PM +0200, Kirill A. Shutemov wrote:
> Borislav,
> 
> Is there anything I need to do to get this patchset merged?

Your updated commit message here:

https://lore.kernel.org/r/bz3vlh3lri7yfckdkddopwhsgvkmizhw5q6ecomgeba7q22ufp@ntu2kugiho4o

Reads better, yes.

> This change fixes the crash on kexec in TDX guests if CONFIG_EISA is
> enabled.

s/This change fixes/Fix/

In imperative tone pls.

And that sentence begs the question: does this need to go to stable?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

