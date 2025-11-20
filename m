Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAA7CFA446
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 21:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLNn+Gyc5C3OZKvaFYo3KE/TTEmvILUsFyWiJmAnGHk=; b=atT/so3gErnie6980wcviCAN5h
	LPb7bfwZdpj6JgHlWmcEkyKrj4law7SjIg6XZNZThlWRfZUx6iywQhiLwqKbOIDTFfi14Qw4A7QYy
	o2Y1SCRD4ncsgjSZwKm0eRhKX8UEUPfaZWPao480cRUvWCd5NT7UcBoc+5pNygg7ZdN4M9//TQGNy
	kbsjQ5okG81qBakQHla3wk8lJ/VTBGBNSWd8zJmjCon5AXplenZ5iA0m20Sj0FESGQ1oA3PZBuvEW
	XKj83MW23NaUVC+DFE7Qghx6pVmVAaq9UnVFnc3rA7uK+kxFQ0zklNn0p7EDN/hQ8KQ5w01gYwfg0
	LNYykZWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCOC-00000007U3V-2Ga8;
	Thu, 20 Nov 2025 21:40:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCOA-00000007U2f-05Km
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 21:40:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C48F339;
	Thu, 20 Nov 2025 13:40:17 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7A103F63F;
	Thu, 20 Nov 2025 13:40:23 -0800 (PST)
Date: Thu, 20 Nov 2025 21:40:21 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Conor Dooley <conor@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1] arm64, lib: make ARM64 select
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION not GENERIC_CPU_CACHE_MAINTENANCE
Message-ID: <aR-KxRIDvGNlW2jy@arm.com>
References: <20251119-zippy-distinct-1e2a7da7b69b@spud>
 <aR9QRuUigBsxxelm@arm.com>
 <20251120-ruined-liability-9ecbf53affd1@spud>
 <669d4bbb-4011-493c-b056-34e682a1ac26@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <669d4bbb-4011-493c-b056-34e682a1ac26@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_134026_097330_0C0EEC3C 
X-CRM114-Status: GOOD (  19.38  )
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

On Thu, Nov 20, 2025 at 12:13:10PM -0800, Randy Dunlap wrote:
> On 11/20/25 11:29 AM, Conor Dooley wrote:
> > On Thu, Nov 20, 2025 at 05:30:46PM +0000, Catalin Marinas wrote:
> >> On Wed, Nov 19, 2025 at 07:08:27PM +0000, Conor Dooley wrote:
> >>> index 09aec4a1e13f..ac223e627bc5 100644
> >>> --- a/lib/Kconfig
> >>> +++ b/lib/Kconfig
> >>> @@ -544,8 +544,9 @@ config ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
> >>>  	bool
> >>>  
> >>>  config GENERIC_CPU_CACHE_MAINTENANCE
> >>> -	bool
> >>> -	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
> >>> +	def_bool y
> >>> +	depends on ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
> >>> +	depends on ARM64
> >>
> >> That's what we do if GENERIC_CPU_CACHE_MAINTENANCE depends on some arch
> >> code but that's not the case here. GENERIC_CPU_CACHE_MAINTENANCE is an
> >> alternative implementation that an arch can select if it does not
> >> provide its own. I find the current code without the above patch better.
> > 
> > Right, I am going to leave it as-is for now then. That's both you and I
> > (and presumably Jonathan) finding the current form more natural. Sorry
> > Randy!
> 
> Thanks. I tried.
> 
> I still say that it makes no sense for something generic
> (GENERIC_CPU_CACHE_MAINTENANCE in lib/Kconfig) to inform the
> config system that the config has something $ARCH-specific
> (ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION).

Yes, that's not great either but the solution with the GENERIC depending
on ARCH does work since there's no actual dependency between them.

As an alternative, I'm happy for arm64 to select both the ARCH and
GENERIC options if you think that works better.

-- 
Catalin

