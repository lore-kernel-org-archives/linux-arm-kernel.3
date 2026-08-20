Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0DAC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 15:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AATNyuls1pQBI+wKSq0N+cr0ua5n2OPZB6XVUocDLlE=; b=IKAkY4LmWcfUeSkgwyEYvx12Ov
	wG6+SOfR1NZPZVwTlc3ZdXZXEaPt9n40jeMaEWX+Lg9IyPuqftJkIhW61YGT0aLOgLDgr3rzyS2iU
	5YAa1poFWqtDWylmnQyHEAceB0bXcGAnIOVVkWNZ/UjyqaLXkfUFhSaheUL+bpAEvkAp4rgtg3l3j
	CjXhy1KDFth4PZQfGb6zH0lZn7UEF4czQvhSqaCTSBe0fFRt/xL75UFI9B4KakZh5kTPN9CrMsH4S
	/R4nm8N0S6jQlxZWi3Tn8AetuhTquDgyqmo1G+0ZBDFb4SC3B/tzSrVwgOz/oB2szV+KRCNsbe2u5
	NPshQgaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4YG-0000000BnJF-0OUQ;
	Thu, 20 Aug 2026 15:19:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4YE-0000000BnJ6-3jea
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 15:19:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E11741414;
	Thu, 20 Aug 2026 15:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07EFC1F00A3D;
	Thu, 20 Aug 2026 15:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787239170;
	bh=AATNyuls1pQBI+wKSq0N+cr0ua5n2OPZB6XVUocDLlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LiRPiLy5PCK7SNAWJaISWaSqA49XKWwBoH6Vcau61yJg0hC1467AuJFKCuVRmppTs
	 pmlHhZIb2lzSxD3uW77kAEPra6GvENxgtW1QlA52g3XsXYGqj7K0xBX5MtNHOCScgS
	 PJJ606trJdhzxxa9xsdBQfuK6F0iXPLp7yLRfyPMuMgElgoZNAam2h/m25AsYgRqGo
	 T5KqNJ9s0P+VlUgGGQlYBlCjwLqdkVxQxbyPR0Jjyewge2sg/WOPlJpP0pJsBAFdMC
	 eF3vexAcPnz6zrCky//Cwq/j4fV+O1yPNNJ7Mep5D4MbZE/Ay88QM+Lsaj0cOGsfus
	 YU4cI2GgukFyQ==
Date: Thu, 20 Aug 2026 16:19:25 +0100
From: Will Deacon <will@kernel.org>
To: Anthony Iliopoulos <ailiop@suse.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: remove unused profile.h includes
Message-ID: <aoca_drkoWQhDkvI@willie-the-truck>
References: <20260820131418.14388-1-ailiop@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820131418.14388-1-ailiop@suse.com>
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

On Thu, Aug 20, 2026 at 03:14:15PM +0200, Anthony Iliopoulos wrote:
> None of the code in these files uses declarations provided by profile.h.
> Remove the unnecessary header includes across the various files to clean
> up dependencies and reduce include bloat.
> 
> Signed-off-by: Anthony Iliopoulos <ailiop@suse.com>
> ---
>  arch/arm/kernel/smp.c    | 1 -
>  arch/arm/kernel/time.c   | 1 -
>  arch/arm64/kernel/smp.c  | 1 -
>  arch/arm64/kernel/time.c | 1 -
>  4 files changed, 4 deletions(-)

arch/arm/ and arch/arm64 have different maintainers. Please can you
split this into two patches so they can be picked up separately?

Will

