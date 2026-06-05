Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E5DCD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 16:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8VbWPhTuC20viLwsnteWZWpqNUIF1WOp0iFWzHYFfs=; b=SFPe4hG4lU6hedHfg5rMcCzz3X
	ohnKfFTsAEBcO3Z4it7jK4+lPVJF6xYkGmQLk5MaEmMblJbsyW3VMkRd5ApLVrja0+aqgndxaV6mu
	XtUgFhZbK554+oTGHeeJG/lnPiPcGofeKhl1NL5Eb3+DsneUu7jXv+GsHS0VFQ7ajQh2j6BrGiZK9
	vYgLEBwO6ULj2eSi87Tysz8WZvboMOSfm5at260/kfkC1F16xLhpwEvhBTMP1vi8pE9VtSnlqIpGX
	jHNab/ZpBx2lYSn0y4JBC/wH/sjXC1EJ4HV93IzlVXy42DE52Ma/AxbQDCMQppLp8Paq3a0PHIvqB
	UnQ5Dy7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXda-00000000vIs-10ee;
	Fri, 05 Jun 2026 16:43:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXdY-00000000vID-48W1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 16:43:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C9FD601E3;
	Fri,  5 Jun 2026 16:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BAB91F00893;
	Fri,  5 Jun 2026 16:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780677792;
	bh=X8VbWPhTuC20viLwsnteWZWpqNUIF1WOp0iFWzHYFfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LyD8D3VpY5qB8VFGRKknfJ05yppizL8k5Fq5UiMe3uBE7G+Ole500RMzCM4MvWfIm
	 WhFJ4HE8As1C/O3VKy2eLCRFqEjk7Y85TFhRf6XtHLFoi0vWkGqq3C0yJMO8NWOiSK
	 D4yb710jjPlPlSUco8GHZMa2a87QSYaes8s/NZ44Om47YaZ6ev8qB6/74FLHP34PCj
	 bzX+vfkC0x7saWV+xZw7wK/MX9Re1VYD/vo0hsgt72QcGmUmW3DvtbQt4E0FGoJYHt
	 r7yfPVy49AC+dnB8mwHZ994ib84G7HOprQlA+w5rHCGdYDAAQE3GzpJDwqvMv0dnhf
	 u5ROj8RBbDGBA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] arm64/mm: Rename ptdesc_t
Date: Fri,  5 Jun 2026 17:43:02 +0100
Message-ID: <178065627722.2113653.5493772948773143201.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520063417.2363417-1-anshuman.khandual@arm.com>
References: <20260520063417.2363417-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 20 May 2026 07:34:17 +0100, Anshuman Khandual wrote:
> ptdesc_t sounds very similar to the core MM struct ptdesc which is actually
> the memory descriptor for page table allocations. Hence rename this typedef
> element as ptval_t instead for better clarity and separation.
> 
> 

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64/mm: Rename ptdesc_t
      https://git.kernel.org/arm64/c/c34d4d48c4a1

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

