Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C63BD7831C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGnhMjxwy68rVKO6J04lhMLXXs2FbVXcKOF5hqHPWs0=; b=Facjsua7/c/fsyVtB0G9idba3e
	aUAhSErsl4H6hPgTHklzpHrxadqctXrndCLUq3oglZXdcVtEGBMImprS/2veNYZYIZU79KbJfmFSD
	SiTwVNFEKGu8FsAUwOWuHdEz+pNQ5KvxaUz3kvwwfdZtPDV7EQCBUNCRKfoqNKg4rPKOz4shrIfO3
	YjXVnc8oAThtU31FLn8AsHUalltcAZLtLT9cqcsRpFts8nW0Gk5LJSgcgkhZHjgE0qMm8iyS6GoAB
	14iGwR4+/uGpJ15ulIONGzFXw/nGtcxSJY1LpwqmHfOlv2Lf4m237EDSkndkxD7JocXCDHbRyK5QM
	5n/9Srgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAce-000000075Ko-3M3J;
	Mon, 02 Dec 2024 17:54:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAbe-000000075Dy-10BM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:53:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCDD81007;
	Mon,  2 Dec 2024 09:53:37 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6C073F5A1;
	Mon,  2 Dec 2024 09:53:07 -0800 (PST)
Date: Mon, 2 Dec 2024 17:53:05 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Vitaly Chikunov <vt@altlinux.org>, Will Deacon <will@kernel.org>,
	james.morse@arm.com, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, oliver.upton@linux.dev
Subject: Re: v6.13-rc1: Internal error: Oops - Undefined instruction:
 0000000002000000 [#1] SMP
Message-ID: <Z030AVd1_uURWsgL@J2N7QTR9R3>
References: <20241202045830.e4yy3nkvxtzaybxk@altlinux.org>
 <20241202153618.GA6834@willie-the-truck>
 <86ttbmt71k.wl-maz@kernel.org>
 <20241202155940.p267a3tz5ypj4sog@altlinux.org>
 <86ser6t6fs.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ser6t6fs.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_095310_320968_A1BC2F39 
X-CRM114-Status: GOOD (  15.10  )
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

On Mon, Dec 02, 2024 at 04:07:03PM +0000, Marc Zyngier wrote:
> On Mon, 02 Dec 2024 15:59:40 +0000,
> Vitaly Chikunov <vt@altlinux.org> wrote:
> > 
> > Marc,
> > 
> > On Mon, Dec 02, 2024 at 03:53:59PM +0000, Marc Zyngier wrote:
> > >
> > > What the log doesn't say is what the host is. Is it 6.13-rc1 as well?
> > 
> > No, host is 6.6.60.
> 
> Right. I wouldn't be surprised if:
> 
> - this v6.6 kernel doesn't hide the MPAM feature as it should (and
>   that's proably something we should backport)

Looks like v6.6.60 is missing:

  6685f5d572c22e10 ("KVM: arm64: Disable MPAM visibility by default and ignore VMM writes")

... which is a fix for:

  011e5f5bf529f8ec (" arm64/cpufeature: Add remaining feature bits in ID_AA64PFR0 register")

... which unintentionally exposed ID_AA64PFR0.MPAM to guests, and *is*
in v6.6.60.

Mark.

> - you get a nastygram in the host log telling you that the guest has
>   executed something it shouldn't (you'll get the encoding of the
>   instruction)
> 
> Can you confirm these two things?
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

