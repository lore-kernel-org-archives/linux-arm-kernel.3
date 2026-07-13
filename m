Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6F0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 17:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sT8ncCoskQ+pPBlVmZsj1ldkcql22WoFMry/YNTn7dY=; b=d3/2ivqFkslOoyLCpHEggVIV3+
	sXsFmUbARbF2e1KxWOvfWEEEc+wS16qnPPk+CzV46VLD+8B9kQwh/NvuiQNrdxJuL8pJ9rH6J3Jpl
	IR6RihlikTVVy4IAkzpCU5xQ8VnKncpUxNNY/Yp6ODC/FyCJBSOT7/NoVqx61E2qCWgzjW7tNo9Pa
	GklC4ljG9XlGaTfoUeaHaxchyKBShYZ7W5A+VxPv2106k8W5HVFSEtRauNc+UeHfXVWGa5+eduUL4
	foXXwVYZKwxksgtAr695Thtfza246EYtRvBeMuvhAc/lX24MbVwVSPoh1YTgGjXLBh5HvmLfc/YsL
	9VwLCJAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKJC-0000000A6Ry-01fe;
	Mon, 13 Jul 2026 17:19:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKJA-0000000A6RX-47jl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 17:19:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 66C1040545;
	Mon, 13 Jul 2026 17:19:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A44D1F00A3A;
	Mon, 13 Jul 2026 17:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783963148;
	bh=sT8ncCoskQ+pPBlVmZsj1ldkcql22WoFMry/YNTn7dY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=boJ4VxMEmG63STqe+XFCnj16oQ7l+0rEaBTr5BJHY/4QyYwdcOPLk/CHmde/re4iF
	 fEh0mglmtEmzRuQhUOEqnWlQt0tNYHyA87uDBHT4b4eL/9psB7SXrBl/4bqVXFwHh0
	 l7qy6tODw0b+aIxGBGn7vD44LU8rX1Zp+c/ToNTc2uPGrxPaPSqjqSs2f5z9OBXHUd
	 6Ay1qFpyMD142+txfZQ+JBuhv8KK+GOMsU6TVRKs/7SR2+5/454lJUVIwvwoNuuOuL
	 ASVfuIEZbms/fzPv86YOTlYqCDS7kM8Ui9XQKZ/7H784DFE+qnfoQFLk9EJJ4zKObG
	 AuoKKLf26ZUYw==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id BF36FF4027E;
	Mon, 13 Jul 2026 13:19:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 13 Jul 2026 13:19:06 -0400
X-ME-Sender: <xms:Ch5Vapkw_J_hWklNR21wK1KKIBeblcJH9nG69vBtUr8uQjtvdjbPzA>
    <xme:Ch5VaoEfePqA02oVSHz1UNta3XSzzWuL7PMDrX_CqI7wdD4WRaeY1Lg0laPXMYiCN
    wCRW_Yo5Hc-hxCmB9N_B7KSofxg-hYvVALdgo1XQkJBX2WtxtdL8H0>
X-ME-Received: <xmr:Ch5VanIsgv6d1HLy3wvj80hRkRg2wnsowoe86iILxc08bdfEiELSDRpW4Pq-ZQ>
X-ME-Proxy-Cause: dmFkZTEJ4lXnpy7cJu3kFZKie8XWmk7c16mf9c3dcg0mO/FRWw9JnqjgAXFL0YAMoBP1EJ
    3xyuhbt9BpRDEzXMxnJfwaKFHYcsya5wGuyrDMTWWxzCkKI4Pv2rog+fL8gPL5WqfWAbUY
    ICsHYG56N5Gu45mM1QaSisXid9T5TyNpxl5uf69gdMIrqWPh+JXRP5hXTFb/mkMc+UZAKA
    CjLTsZZCg8zJeTPMIApQmEoo4QI6fow3qIeTeBGGYfSrtF8keWO2+L4+L3246fvQcvYPsD
    o3OWDXJkLyganHi/46YNGLhBEpkTvo55OAnPmHxwvEvEXua41QXG/KQ5VQtjTJBqbr2LtQ
    dDHAxskcep2CzldPvnyC0cQU9W5m7ZnNLvHQD32nI/REFI51GAnENKrKi4nGZu44nogMkA
    M8DvSGtHMwaG3Tq9XiOUMo/oggtZVqfJkJPMieBMIykGMstIdx+hkm4v7j82UolMzsQaKn
    70uRX+2FasfCx9DVifeP+mFUBYMOEemngKsgGj32mI1qPdvsXdWFgZt7NlfGVd7V1zgeGB
    DeSZN38Ez3MKW0qgKNsGPX+mFRnIWtMdEJfdqszTSk7PJbHp4kYi0PT6dwN/ZcHV+jX76K
    2xvLHjPdyR5tLmOwT7JWSXJxl4RH8Aa4m3eU/bqdZeoNZrBgBUfZ+bMC9wNQ
X-ME-Proxy: <xmx:Ch5VanNriCjfnz8yYshIDIf3p97N9HWCROMmDfgsNcmm-xkWsAc9kw>
    <xmx:Ch5VapEYQMiAAASjG9sGsIVxLSdOmHJNRPEhZi9iQBk3ZTFu7vi6sw>
    <xmx:Ch5VaomSoAAa4XNbLcCuZxhmsnahq9uskwAhdsHd75mnMcxahDPxRg>
    <xmx:Ch5VakcdkwWfOV1Xn37kJWx2WqlIHFcP2GCFH0zriKVprx1VvV2Dow>
    <xmx:Ch5VaiYvYAoJxn7KpCO1wmZUIlSx6AbdaYmo4o1S8m3emWW2DXghwl4Q>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jul 2026 13:19:05 -0400 (EDT)
Date: Mon, 13 Jul 2026 18:19:05 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	David Carlier <devnexen@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH mm-hotfixes v2 3/4] mm/ptdump: always stabilise against
 page table freeing using init_mm
Message-ID: <alUdUKk0zGmskSib@thinkstation>
References: <20260712-series-vmap-race-fix-v2-0-ad134cc3a12a@kernel.org>
 <20260712-series-vmap-race-fix-v2-3-ad134cc3a12a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-series-vmap-race-fix-v2-3-ad134cc3a12a@kernel.org>
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

On Sun, Jul 12, 2026 at 11:42:26AM +0100, Lorenzo Stoakes wrote:
> x86 and arm64 invoke ptdump_walk_pgd() with non-init_mm mm whilst still
> walking kernel page table ranges.

The code looks good to me.

Same comment as on patch 1 about the commit message structure, only
more so: the race itself is never actually stated -- that these walks
hold only the walked mm's lock, while the freeing exclusion built by
patches 1 and 2 hangs off the init_mm lock. The fact that makes it
possible (x86 shares kernel pgd entries with every mm) is hidden in a
parenthesis. And the last three paragraphs read like v2 changelog
rather than commit message material.

> We take this after mmap write locking the non-init_mm mm. Nothing acquires
> the init_mm lock first before locking an arbitrary mm, so no deadlock is
> possible.

Do we want to document this locking order somewhere?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

