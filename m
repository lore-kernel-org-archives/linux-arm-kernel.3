Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAED91098782
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 14:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OThQKp893LphSr3Eh3o12D7pythV7l0TMffC5k3P0g8=; b=bVshHrHcEYDGDVjdG7X4u8uXra
	+DMuogthVzVs2J2X92X66HUUyvQ1jIBohIN2V9NyYKBi5FVackC5oN9TVfvfoGqJLG4Q9wspaa9s4
	46M/LwVW1WoJu84yb4ZHra1H01zRT/bx2Cvp1bL1LKlWW1Rj4TfKCYxsJOpQ7OTEgD5+48+u6kuol
	HHikqMizC4Hm3rgApdMFQWhm2RVZISW44RB3KPPz3jjSu8ca+HmuMr40VSzVxWoE4DSoDlqMufYho
	BjAIi4CjZKDhBlc0c51zYeooZD82WZBbocq/1wZ0j2nDrJe5gIsSvGZ1CUd1VBKZAnJDZRO52+mlv
	qAMTXmbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3aoT-0000000CwEZ-0VI7;
	Fri, 20 Mar 2026 14:26:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3aoR-0000000CwEE-3n4n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 14:26:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA20161863;
	Fri, 20 Mar 2026 14:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52EACC4CEF7;
	Fri, 20 Mar 2026 14:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774016814;
	bh=0A3E8OFKs0O9ILXNdXWvmGC5H7JP8qHQNC5ofyYrUPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pvKHz0yvaHt7yXjkgycz+Mh6vQI/FtlyH5zkdPe9fX8OLgpxBlJQ+5g688D+xo4EB
	 boPXgnXBIjx2PLKFFLWfBG6a5n9Ns9bNfoevs8tWypTGgAd3KAoHwG83XxmbWlaPe8
	 bJ6QZ/1X68mtWRbF15uCLRJEvTgQyBFMN6GbJ2pBi24hV4MSwKhP9ahYm+o/adWidK
	 PYiWp4ea9WFVfanPvEiTHxIbXvqOB+0m/1mSkVGAbCUEA1s/2X1H2YmvMKZWxmQyYO
	 BsPLYHdkfsFYIbYp84qoTr0XMh1fv3ZInf9WC/ZUvCultXNbBT9Gc0CFSa1sRYBJd/
	 Ix8mMA137gMTA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3ED2FF40068;
	Fri, 20 Mar 2026 10:26:52 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 20 Mar 2026 10:26:52 -0400
X-ME-Sender: <xms:LFm9aeSBuUCrHINfbPMjDM5NOuwsec15zikcAYsd_e1YaxhM5GSKdg>
    <xme:LFm9afc4eZo5eHohZD66T-vSSuX-HZ3oMZf64h09IN15YVDqSmzUpbAwr8xmufPZy
    m9xB9-AseZUQRroFN4BU8VtHYnUlMWxjWrbe7T-cDTYDk72t7X1_pfN>
X-ME-Received: <xmr:LFm9aXcQ62hYHa5fAZpD3wct0dWtIrMStLzszKWngoHcqbAciXOgrBpktvbA_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefuddtudegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepjedvpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehushgrmhgrrdgrrhhifheslhhinhhugidruggvvhdprhgtphhtthhopegrkhhpmh
    eslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepuggrvhhiuges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopehrhigrnhdrrhhosggvrhhtshesrghrmhdrtghomhdprhgtphht
    thhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtphhtthhopehrsehhvghvrd
    gttgdprhgtphhtthhopehjrggtkhesshhushgvrdgtiidprhgtphhtthhopegrjhgusehl
    ihhnuhigrdhisghmrdgtohhm
X-ME-Proxy: <xmx:LFm9aWJL-Ss4VdQh9OttEJlT8Zf4nVQblfCHB4NkuN0R0ulAXU5f5Q>
    <xmx:LFm9ad2S784Cw2CLErVJ-CsAKIS3XDTHQ04Fl2vvan8jvQZHTc5XSA>
    <xmx:LFm9acrITVLMbY1A7gbnjs8AZ8JtpLketSqNd9lSaUs7Gf9fzI0muw>
    <xmx:LFm9aVq2Y2vgmS6pQU4GVPJtd_34daD2fwzbHPhe5kJTjNutWkIeWA>
    <xmx:LFm9aTzlGZD1DjptI-AgFUkbuM-4axTLedVlLdmnC_tWJRhkBKwYAZUf>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Mar 2026 10:26:49 -0400 (EDT)
Date: Fri, 20 Mar 2026 14:26:43 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, 
	willy@infradead.org, ryan.roberts@arm.com, linux-mm@kvack.org, r@hev.cc, jack@suse.cz, 
	ajd@linux.ibm.com, apopple@nvidia.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, brauner@kernel.org, catalin.marinas@arm.com, dev.jain@arm.com, 
	kees@kernel.org, kevin.brodsky@arm.com, lance.yang@linux.dev, 
	Liam.Howlett@oracle.com, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	mhocko@suse.com, npache@redhat.com, pasha.tatashin@soleen.com, 
	rmclure@linux.ibm.com, rppt@kernel.org, surenb@google.com, vbabka@kernel.org, 
	Al Viro <viro@zeniv.linux.org.uk>, wilts@infradead.org, ziy@nvidia.com, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v2 1/4] mm: bypass mmap_miss heuristic for VM_EXEC
 readahead
Message-ID: <ab1Y5fLNJ466kK-7@thinkstation>
References: <20260320140315.979307-1-usama.arif@linux.dev>
 <20260320140315.979307-2-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320140315.979307-2-usama.arif@linux.dev>
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

On Fri, Mar 20, 2026 at 06:58:51AM -0700, Usama Arif wrote:
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 6cd7974d4adab..7d89c6b384cc4 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3331,7 +3331,7 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
>  		}
>  	}
>  
> -	if (!(vm_flags & VM_SEQ_READ)) {
> +	if (!(vm_flags & (VM_SEQ_READ | VM_EXEC))) {

Strictly speaking the fact that the file mapped as executable doesn't
mean we are serving instruction fetch page fault.

FAULT_FLAG_INSTRUCTION would be the signal, but it is only provided by
handful of architectures.

VM_EXEC is good enough proxy.

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

