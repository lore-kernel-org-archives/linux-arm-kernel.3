Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98194CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 20:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kH6vi6cHCWBh7OiQMEb22ODMlZHnmLXM4CBIK65MuII=; b=zYHqtiEjKF8BIMtc9PS2zwPnUx
	kisNZXk91kDXWCUIf9r5yAV+DyP+YOxNhZQGXWJTYQVLzYr2JhGCtuMkdXlHgc/zEgFqx1JNuYVIF
	u/q6zivkIONF8PemTG4FQ6gaA+FazD7wX3Tx2oerP8d9wL/YIWeMDibfC7qMR/gxqfcFOaphDrfqr
	qRodZI/v4ivk97J/0qdByLsdmjPvQtvRbaHSNDlVorNnuzly5vVDwEch9U2SuACBWPbvEjX4H8wne
	n804JNUc2aASbE7dNsMHiHI6PPJ2GPsT3Jx3je/MMDtawxzA9uyCHtLrJriI3vflQmXyWCK3VXdjA
	TTgNXQzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLnvX-00000009aM8-2DJ9;
	Sat, 09 May 2026 20:05:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLnvV-00000009aLY-1rFX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 20:05:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 241AB419DB;
	Sat,  9 May 2026 20:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6A4C2BCC4;
	Sat,  9 May 2026 20:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778357128;
	bh=gvCfoipjvFSyuB+Z6RDe06egz90snb/tb6jiKwmbmKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dL+hgRhySxvqBvd+CeLOETC9BXBE66RyuUS1bGENnBgeC4+xBbGhzL0VAy5fkUXKs
	 wkWg3HHJlGUUXAegTxBYQTJpmhlIEs796fBoARee4ClWIx61D2SegbFrL7eD9mfFsV
	 Cr6CmpBZ++mgxVGSco7m+zemEbpOPw4QzL/9fnRfYSv66sbI2Urx+pAXp6aDTIFPUE
	 C017ypxymB8L9MxDL/b6rHRtgIU20gJHDG1Jd3VKu7PHa+0j4glxGz/SPDS18CgYiP
	 sEw3VAzmGfA9UPVoYMMgl8Uvpbgp5e5ir3Wdp2biSQOQfrNgTOVNMQgW4ZjB3tvHWe
	 bTX7P0/myIb5g==
Date: Sat, 9 May 2026 13:05:03 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-raid@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 8/8] ARM: Remove hacked-up asm/types.h header
Message-ID: <20260509200503.GC11883@quark>
References: <20260422171655.3437334-10-ardb+git@google.com>
 <20260422171655.3437334-18-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422171655.3437334-18-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_130529_507120_738F9ACF 
X-CRM114-Status: GOOD (  15.12  )
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

On Wed, Apr 22, 2026 at 07:17:04PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> ARM has a special version of asm/types.h which contains overrides for
> certain #define's related to the C types used to back C99 types such as
> uint32_t and uintptr_t.
> 
> This is only needed when pulling in system headers such as stdint.h
> during the build, and this only happens when using NEON intrinsics,
> for which there is now a dedicated header file.
> 
> So drop this header entirely, and revert to the asm-generic one.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm/include/uapi/asm/types.h | 41 --------------------
>  1 file changed, 41 deletions(-)
> 

This is actually a UAPI header.  I guess it got put there accidentally
and isn't actually needed there?

- Eric

