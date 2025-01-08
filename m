Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A17E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sPGfagDidXP/4IuaDVk6pqaRnMLSKzev0rZln60Z1I=; b=0rFdzAhARsshLr47q8/DtYCf1g
	KTB2QU5TXmTOEs+p00bhfqgoMO6esW12XhnjjqYmHfmTK5mn8Pva64sYijh+zI1ZeygvH76X1KlCq
	ibIoelw6voRm+jmtxfYeIOhV5RH3mf8TmzuAnGfUmhrucKHDEyUKlH3aBh9f7yZpx/DBakVbceNer
	9XSiJRYCJlWUBHxfVqhYdsQG/3RVl+1NvoLXbSzTRybDb01lD6G2zn+vfo39SCc75fH0hT07CAvEx
	lkqufjGVeJjotEwoowR7OMt3KECSSgFPul4wKBnMdoJ3MLxH9UezSWxb8/ZNktqWsO2c+I8OK6Pm5
	itC7qTKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVuN-00000008ZQm-0sis;
	Wed, 08 Jan 2025 13:15:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVVc-00000008UQG-1ISq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 12:50:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB3EA5C4A3F;
	Wed,  8 Jan 2025 12:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E134C4CEDD;
	Wed,  8 Jan 2025 12:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736340603;
	bh=Agh85AcU34sO5Z/y1T57IDqim/xqjFjzZrX9iq/AWhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hx2hSaH8HClaYe8b0UKDF7yhn/t4kh2V2ZgANmR/EvoSSuGq4m2xLp0FrXDqC8U1W
	 gQjHw8fAfndfAdL4jxlWTgMvkDSnU3taWa1jeHHv++wOjKMnGI6/VojxaVBw0UnLEl
	 TbGy5/gLlgbYvhEjajj35fyYWMf8cOQ8YctAePKMwVjm0SSK1Oaxm5RKj2Ab5oQNz4
	 UGen/QjuIMVfB3Su/8vGNC0uw3gn4vwHr50C+Kxhr3K/4YWjDnfdZRyz2uQWolwXXI
	 CruYELhEwl/F2L7QrKsxAAZrxIsA2+NMOzFty4bKKO3cw7o8VY7TE/cGCjOvaITZfs
	 aqJN7GxmeHtdQ==
Date: Wed, 8 Jan 2025 12:49:58 +0000
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Dave Martin <Dave.Martin@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 0/6] arm64/sme: Collected SME fixes
Message-ID: <20250108124957.GA9312@willie-the-truck>
References: <20241204-arm64-sme-reenable-v2-0-bae87728251d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-arm64-sme-reenable-v2-0-bae87728251d@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_045004_393177_6B26FFE3 
X-CRM114-Status: GOOD (  13.23  )
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

On Wed, Dec 04, 2024 at 03:20:48PM +0000, Mark Brown wrote:
> This series collects the various SME related fixes that were previously
> posted separately.  These should address all the issues I am aware of so
> a patch which reenables the SME configuration option is also included.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> Changes in v2:
> - Pull simplification of the signal restore code after the SME
>   reenablement, it's not a fix but there's some code overlap.
> - Comment updates.
> - Link to v1: https://lore.kernel.org/r/20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org

Mark (R), are you happy with this? I know you were digging into some
other issues in this area but I'm not sure whether they invalidate the
fixes here or not.

Cheers,

Will

