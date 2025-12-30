Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18DEEE49BC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 20:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VSjZH9YRcwoArFWQ3nrQhzF6SeGlXpAy9wzH4sePkU=; b=otLZS+ObI7XPoLzoRexFkkMgpV
	Btp0RwbROWxnpRKyju6ssbCaCevOjstaDK/cZ1nWJ/g1q607wL65vZvxqvCuDVjGSnk9cynEOcnv8
	uXa7RaDFTRVINC/zNouE9NUJO/1gWeoxblsQQ1NYjm/ZVywmK6vqhBWHXH8C4YRCKTdXPyVeoNnDd
	CiMXi6lKAAbYiWA+FLS8ULBvqUhIjO4+TPLbx2RWVWsW7gSGmCMw17feses8S64KsfbBtgfDUT9iE
	UwS/rqaERxVHAedRaf+Rk6uPcu2GF6Z3hishpsf7LTVLHkOl27YoLGI/DAyFMZekR50VFgOJX6oCf
	TGKPoIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vagFH-00000005HFN-3gIj;
	Tue, 30 Dec 2025 20:23:07 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vagFE-00000005HEa-1THC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 20:23:05 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8D7D140E0200;
	Tue, 30 Dec 2025 20:22:39 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6019D1TzHUu6; Tue, 30 Dec 2025 20:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1767126154; bh=7VSjZH9YRcwoArFWQ3nrQhzF6SeGlXpAy9wzH4sePkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CZftLkiSaYSuny9JPh+I4cMr86G5HGZynbGE4hsn0NvabteM/KIFQEcmu/mgFfNAF
	 W0fPnfjlWbMn40x8ByvMddii07FftBkdzlm043PDJfB5gn8g09h5uE/8BW3uwqbQxk
	 V7KSZzQbmQJSpLdtime8xn+e2LkbvVseaDdaDWbwcuq/y6Ky9KHLn6OQ1vzYxNfJgv
	 vpIhzEVPQhjyBn5Qw18DpFm9sJl8mtntp6p8LFFhjU4hpDzod7pNu1diLwQYIIKwUD
	 /mz/U/lh1yIepLjd/ROiwCXP5xOKWOWSpDXi9q5zhKkRYceNx6VTT3JyCD8M9eJkt7
	 4lxfun7vIHgZRNA60bbHYm54gA8TfkB8WLR2vQ4PlvhYO2JJnc0GsVST/XTCnQ14WP
	 Ac10ffwKginHPD1X3jCm5nnuXEs+qK4HQSlGFIgfVjaEeJYUSMAZ58UXxZMqzatTKq
	 3ejWocyb2In7vzdfgOCro3hfc6zCOLQ8k8ik2rY6pRPuqQG/QRA9smEFMoTYBar3Ss
	 A7ftcSCNrU34hZkNhbeafgpanayQ25kZ5u9wKlTWigAWfsFJPFsjmngoCmaOl4Kgwr
	 9N5am9o9/se1jMAv0vtCq2k7exXFume5D168LibYKvOYkytYe8J01SSrNKmeV1fRRK
	 c7VbaMk9SRHs/d1fF1EDJ0hg=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 9F49D40E01A9;
	Tue, 30 Dec 2025 20:22:18 +0000 (UTC)
Date: Tue, 30 Dec 2025 21:22:11 +0100
From: Borislav Petkov <bp@alien8.de>
To: Ruidong Tian <tianruidong@linux.alibaba.com>
Cc: catalin.marinas@arm.com, will@kernel.org, lpieralisi@kernel.org,
	guohanjun@huawei.com, sudeep.holla@arm.com,
	xueshuai@linux.alibaba.com, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org, lenb@kernel.org, tony.luck@intel.com,
	yazen.ghannam@amd.com, misono.tomohiro@fujitsu.com,
	fengwei_yin@linux.alibaba.com
Subject: Re: [PATCH v5 00/17] ARM Error Source Table V2 Support
Message-ID: <20251230202211.GAaVQ0cx8o-CqzGU2O@fat_crate.local>
References: <20251230090945.43969-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251230090945.43969-1-tianruidong@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_122304_547789_23EA0B8F 
X-CRM114-Status: GOOD (  19.99  )
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

Some high-level notes first:

On Tue, Dec 30, 2025 at 05:09:28PM +0800, Ruidong Tian wrote:
> This series introduces support for the ARM Error Source Table (AEST), aligning
> with version 2.0 of ACPI for Armv8 RAS Extensions [0].

I'd like to hear from ARM folks what the strategy for this thing is...

> AEST provides a critical mechanism for hardware to directly notify the
> operating system kernel about RAS errors via interrupts, a concept known as
> Kernel-first error handling. Compared to firmware-first error handling
> (e.g., GHES), AEST offers a more lightweight approach. This efficiency allows
> the OS to potentially report every Corrected Error (CE), enabling upper-layer
> applications to leverage CE information for error prediction[1][2].
> 
> This series is based on Tyler Baicar's preliminary patches [3], which have not
> yet been sent to the mailing list as v2.

I guess I'll wait for those first.

> AEST Driver Architecture
> ========================
> 
> The AEST driver is structured into three primary components:
>   - AEST device: Responsible for handling interrupts, managing the lifecycle
>                  of AEST nodes, and processing error records.
>   - AEST node: Corresponds directly to a RAS node in the hardware

What is a "RAS node"?

>   - AEST record: Represents a set of RAS registers associated with a specific
>                  error source.

...

> Address Translation
> ===================
> 
> As described in section 2.2 [0], error addresses reported by AEST records
> may be "node-specific Logical Addresses" rather than the "System Physical
> Addresses" (SPA) used by the kernel. Therefore, the driver needs to translate
> these Logical Addresses (LA) to SPA. This translation mechanism is conceptually
> similar to AMD's Address Translation Logic (ATL) [4], leading patch 0014 to
> introduce a common translation function for both AMD and ARM architectures.

Say what now? 

The ATL is very AMD-specific. What does "conceptually similar" mean exactly?
What happens if we have to change the ATL and break your use case in the
process?

What exact functionality from the ATL do you really need here?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

