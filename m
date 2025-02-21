Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626EBC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 15:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rjn/XsdELQyVcH/LFgFRj5wTVV97SpqSwpexgK7vwaw=; b=2faTNKxZ+Wy0H7++xQZP+ai1Hq
	BGoeRyIPKExs/tB+gnNW551VswtpBgJYJgQ/MPTbSkJgKqk2JgSgW6m8pbayD1VfdBcdSmfVNqfYc
	v63AaZ065xCYQUrwCkrEuC8UM7g66kwDU3UARfTt5Keq7vvj9iL+aJJge089TNkvz1aSk+5QsI0nc
	Qg6fGUse1ms0WohT7Fm1917n8+JaPjkeheRbE+GcaizDSNCENQS9VqrsA0pf3izN/JFQS5JUOwnEV
	7f20QEB84xaZhxbs7GXJv0V9C+JO7OQobLpC90NyvFSAeDWfOWQB4CYuYhNutvfOa/awTSNFY8vyz
	6lat0Y5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlV58-0000000605t-0mkA;
	Fri, 21 Feb 2025 15:36:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlV3f-00000005zuI-3eqI
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Feb 2025 15:35:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Rjn/XsdELQyVcH/LFgFRj5wTVV97SpqSwpexgK7vwaw=; b=iKOv+cCyHfDk9C0NoFTdNUxxcX
	06fQQF+f3Deoo7Q9+V/0bShY5dPywOmk7tnyTX8i+itucqDWCZbgQqNPaZktNxPyMeqpikdA+fKtS
	ylGSjF4+4zF4pcFLjTKZvlF/o4zKUOLQ7LHXyxsYc0GwKp2yklE8gY9dm28L1/rFE+rg5HI/gN8mi
	wa7h/AXR7+wmnM2rln8z1rtnNGBGnuhOmgJNMeNJIhkyELpsYkT/OQ+qMAfCCx3JfFtp9vBsvkY0K
	xwH1IsPqdqRYvDKHd/khqM8JU5cF6Wa1lusYOS8iGzEAlGX7ne8A+sDQTKd5g0T2UL67u5TdwWk3A
	Y2/vu/lw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlV3c-00000002fXW-1qTO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 15:35:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 723CC5C6618;
	Fri, 21 Feb 2025 15:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23FBC4CEE2;
	Fri, 21 Feb 2025 15:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740152112;
	bh=HFbveIpxBrHCezKac0bPWSUzZSYqbqkw6nidRl1Irxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJgfNl3Sv/k0lydbFfAJYgv48UkwUsory7TtVR7CJC2KaUy1qnINNOVZQNyroUwIo
	 4gCbF80U7wG3xjOoA3a1x0W/aaCPasW6C15q+rv2vkLFXGQH0Jzc7R80BrLAkfil4g
	 bAlfxN3obgLbfIXOYbxTU31OZYYfTXK23XDduDlCRAlEDywHoSsO80l97q2axSx/5v
	 Gk9K9uj/rYb/+c2amOJzh9MoOnkEWIyXezml8hqnqxtzH6JYiyraS0sY9KukmdnohL
	 vq6LFXxcDtuPVqarCPx8m2IKzBaHcDfxVxJ1eloXdL/smXMkl4LII1kc0fSgYGSASY
	 5WeNkluJ8/1xA==
Date: Fri, 21 Feb 2025 15:35:02 +0000
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Fixes for hugetlb and vmalloc on arm64
Message-ID: <20250221153501.GD20567@willie-the-truck>
References: <20250217140419.1702389-1-ryan.roberts@arm.com>
 <Z7YsqO7ykGgcBFEI@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7YsqO7ykGgcBFEI@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_153516_951936_2BD52D26 
X-CRM114-Status: GOOD (  23.75  )
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

On Wed, Feb 19, 2025 at 07:10:32PM +0000, Catalin Marinas wrote:
> Will, Ryan,
> 
> On Mon, Feb 17, 2025 at 02:04:13PM +0000, Ryan Roberts wrote:
> > This series contains some fixes for hugetlb on arm64, and is split out from v1
> > of a wider series at [1]. While the last patch is technically targetting core-mm
> > and is not directly related to arm64, I'd like to to go via the arm64 tree so
> > that the wider performance improvement series (v2 to be posted shortly) that
> > depends on this series doesn't have to be robust to the fix not being present.
> > 
> > I've included maintainers/reviewers for all the arches that are (trivially)
> > touched due to the API changes, hoping for some ACKs.
> 
> These fixes look fine to me and I think we should get them in for 6.14.
> I think Andrew was ok with them going in via the arm64 tree:
> 
> https://lore.kernel.org/linux-arm-kernel/20250205235219.3c3a4b968087d1386d708b04@linux-foundation.org/

I think the diffstat looks worse than it really is, as the arch changes
are reasonably mechanical. I'd like to let it sit in next for a few days
though, so I'll pick this up once we've resolved my comment on patch #2.

Ryan -- did you find all of these issues by inspection, or are you aware
of anybody hitting them in practice?

Will

