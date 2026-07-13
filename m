Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F55C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 17:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZOphvSkd23b/TrtduYCguYGvr5EK1HZzl/qohcfY7U=; b=kboIwgg4w6iSJW/E0nQycGmIsL
	2WR2+oAYTqSJXvjnqyK9zOX5uyh3d69Vwafmpyo4+pgmMyd0LuFfAgwXMwgf3DCpz4erQSdfwsTBq
	ZYROalTY36DGU/T2BvJWIR2Jxn7KsOjMjtkmWCIWDjYRkDdc3Z8redUwJl9sYc7vs8Pvwk/ULHqdm
	VDPh0xeMnAiBrlkloXWV1m6aPoVZ/cNNlvknse/ove8fvKz3PMM650d1GIS7KBdOCaCuYiVSnYbGi
	0ozWW55FHRhg32OwAKMUDeQ5Rk3UyYqLbS6nNk+tb4yNeSRZN68aw6Z23M9Lt1fxY0PZ6GwhS3lOm
	fq9SnO3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKLo-0000000A6ic-1X2f;
	Mon, 13 Jul 2026 17:21:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKLm-0000000A6iE-1mmN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 17:21:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CEDAA40F32;
	Mon, 13 Jul 2026 17:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9451F00A3A;
	Mon, 13 Jul 2026 17:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783963309;
	bh=BZOphvSkd23b/TrtduYCguYGvr5EK1HZzl/qohcfY7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RbA1rChvxuFHpvQpDnMIbOC1D3+A+tbEwrNL6FcFMyHTv2MI7ERRrcjFRMIC41MMV
	 zEL6U0d7MDA65bCG2d3MXuGmAtBm57rcO1TmCOHrnU3cehgaHcdDSc79gsx63By+PK
	 UlSJhNlEFH2DfZ9kWrnUBoQwtzYZHb6ZXfqqNrRNq7qzhKRG/YSt/BfSKLJSBl9AFF
	 r0DF7trd+SNJRGpmtTwlsDn3a33tCGIxvmWxMGLraW+c12l9akDzYp1h4QVH95WRAN
	 YISJI8elk1Sn0+Kk5cubL6WxzT9XcyLW1zHetzzYJZeA1u4BkD5g5bgad9qZauwwQW
	 RS8GWg+1RL2dg==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 598A2F40264;
	Mon, 13 Jul 2026 13:21:48 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 13 Jul 2026 13:21:48 -0400
X-ME-Sender: <xms:rB5VapuBuKvmIc8h0A0ZvoIBDABQaLm8a1-zwkAo_KS2Vst9rHqLkw>
    <xme:rB5ValtpRpThec3oyqDt1PihMsX3d7FvYGfhdfyax0gJncXqGyrzniaXTIbNNodOS
    y4LrnM542IJs8Z425sE0fD6mT7AqVuiL646qs6YryElQ8P6EmWI7ygg>
X-ME-Received: <xmr:rB5VakR6qfI90gNefqHgPJZUDIMGIF5b9qmTxw7rokqcgWzfUByGk8D3DawaSw>
X-ME-Proxy-Cause: dmFkZTE8vFJ9v3UZX0gql0WylFpu+0srIJpxxoXkBc60QmD6KjWRUGese9oi8JR+h7CtdO
    c5j/pE8W9f0Ds7zY0ofw7mKJEkPXT93kMsaRFp1A73bzp3g4oRGNfknkoKqHDrUJpcUDKe
    4S1qNW0VgsVyeO808aKfKoIkUyhtSmuQaEGoQPTZyPI8Ueh+5TQu7172ohN3cwuOIrThbI
    00w/uyeFrYmAMXYbrVagav1Avz5eB+onspWC2LgrR4amVPrKdwPc0R/NG0aeJmzmGACiYs
    gp/aKmPli6E5v6qzU3vrmb/NihRmn+O4LeV8cB1+umyMkp4jsNMhljH+KgvsWWBCjrVNq9
    mbUSM8sQzHH9TOl8eFIHcOozSUAnDSSXN9bgrjX/5U/l1UwIp73uXZdKre2K5WQxgSUL8L
    RIC+leW0C/NHDT678RvEBLQ/dHcGbwIW55LUhvhKfzX+lRH1V+W21jLvAAJjih/0wmho/K
    FoOIbOPf2E1zSRxbVeR/O0cj5otNJWDxiH7Z4Jz+1nFZRBP7l5mpUHDlUd6ejXuxPJ2OQu
    s6hzlmgL2u3nG/hQeXmAKQfMEuq//TVwdJV2NVbK+3IlDFIPmiOpeLmfn6Jl+7jfOwIvV5
    cSiQqtt28gaqgkV2dN5grNPpHxLfTueZELQCBJkzu9mxD3FKd3T7INWTKcCg
X-ME-Proxy: <xmx:rB5Vat05x0a8gVWVxI6YmJys8iMmvwxFhNIuTgjV1Py0XSlAzS0ozg>
    <xmx:rB5VarM3KUwYdO_HA_sYP81gL3qE-4wI9IRw9ypAEsdzSAxG6Wn85w>
    <xmx:rB5VagNgM8xVjeceZnL-PNUJU1zvieklfuMzjnaQQcDNBuSusEZNfg>
    <xmx:rB5Vajk2KNAct6hG-Xe9MnFUrFkQBrNby_FhWp_imlHtgd-0i_CAsw>
    <xmx:rB5VajA6XRsGOWHYpPY90PInCzmigjdjhLhmL_0cF77v4O-W8LriS9tJ>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jul 2026 13:21:47 -0400 (EDT)
Date: Mon, 13 Jul 2026 18:21:46 +0100
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
Subject: Re: [PATCH mm-hotfixes v2 4/4] arm64: remove redundant concurrent
 ptdump UAF mitigation
Message-ID: <alUeafMBZtSp8XTd@thinkstation>
References: <20260712-series-vmap-race-fix-v2-0-ad134cc3a12a@kernel.org>
 <20260712-series-vmap-race-fix-v2-4-ad134cc3a12a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-series-vmap-race-fix-v2-4-ad134cc3a12a@kernel.org>
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

On Sun, Jul 12, 2026 at 11:42:27AM +0100, Lorenzo Stoakes wrote:
> This partially reverts commit fa93b45fd397 ("arm64: Enable vmalloc-huge
> with ptdump"), retaining vmalloc-huge support but eliminating the now
> redundant mitigation against a race between huge vmap page table freeing
> and ptdump, as this issue has now been fixed at core.
> 
> We also simultaneously remove the arm64 if-deffery when acquiring the mmap
> read lock upon vmap huge page table promotion as it is no longer required.
> 
> Note that this patch relies on the preceding vmalloc patch, and should not
> be backported alone.
> 
> Fixes: fa93b45fd397 ("arm64: Enable vmalloc-huge with ptdump")
> Cc: stable@vger.kernel.org
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

