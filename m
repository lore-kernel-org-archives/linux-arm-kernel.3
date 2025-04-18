Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9643C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 03:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeLdxRY2vHoEKdWJ6sFRDUQGcMLf7d+q/0pRxlVp8JU=; b=MBywaZTaluN1On9m9M9vlOu3yl
	GUO7DSmQQappf5XTuydLYOmHVNrjff9q4pmDXAbuGOkBZ5WGr6piUYAT65+h8ONmzwr166iO1Yu+h
	SZvzoFgWSqKUyaE33Wvv6vJDkZld3bIiK94VGHiiftBd0WVR3hELMMXdY0Xgo/3rJpjscWxXNJT57
	f/fHDs++iQdk08DePH1LXtLYQTom+uox6uR6EPgtpZquGVFELOLKxjt2itROFduyTEdc0LB/CuoFX
	YlcTB8NTYbZVAIHHljTJZ7rMG40DB57C8yaSUJM5FWfV7IHpe50kSK9ApH6He3ROyrkQ4SHLJAds3
	jQVZCXYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5cg7-0000000F0xs-1AyW;
	Fri, 18 Apr 2025 03:46:11 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5cbV-0000000F09S-0N45;
	Fri, 18 Apr 2025 03:41:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=DeLdxRY2vHoEKdWJ6sFRDUQGcMLf7d+q/0pRxlVp8JU=; b=VXq5/xSOluY3RsxfcvuVGjWtZR
	7jvkDa6bj3M1EaAcxKxQY1WDgoWtxg/rm+6XAbBrtL/22i8+WyfgIn92PWApVLEpoDfegP0QpPOHV
	j49Y4XDyIw1sIIkoEwstoQy941i447cYR8qbCXF/sECr1WK62m3qCFnYJ70WAowk7ZhpqPurKZXYy
	QmRJZLHzlF1wf0IN5hkkxnn1hHHtG0hLnxes0shefNdMuya+B9FXC2X7iO7mGssssJqcNQsVxqf5u
	e6j7zakwSXnJ9DlD7H7sHRU6fBUhGHklvmSKWQIcNMVdPm4+5+iJiZ2Hqul+k2BQgzx4AOyJ+YYD8
	8L9xBumA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5cbR-00Gek0-2H;
	Fri, 18 Apr 2025 11:41:22 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Apr 2025 11:41:21 +0800
Date: Fri, 18 Apr 2025 11:41:21 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 8/9] crypto: x86/chacha - remove the skcipher algorithms
Message-ID: <aAHJ4X95vIujLPpu@gondor.apana.org.au>
References: <20250405182609.404216-9-ebiggers@kernel.org>
 <aAHF0X2I5ydEJK1p@gondor.apana.org.au>
 <20250418033829.GC38960@quark.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418033829.GC38960@quark.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_204125_124623_59FC259F 
X-CRM114-Status: GOOD (  10.75  )
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

On Thu, Apr 17, 2025 at 08:38:29PM -0700, Eric Biggers wrote:
>
> Well, I forgot that an empty module_exit needs to be kept around for the module
> to be removable.  I'll send a patch that adds these back in, though I'm doubtful
> that anyone ever removes these modules in practice.

I just tried to remove chacha_x86_64 in order to make sure that I
was actually using the arch-optimised version of chacha and that's
how I noticed.

I remove the algorithm modules all the time because it's much easier
to rebuild one module rather than the whole kernel.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

