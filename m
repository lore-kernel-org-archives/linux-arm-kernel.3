Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A8CC624DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvxzmwmAQY0Tv3mevNOknHbiI1QZip1if+quZm55a0Q=; b=g2AqO9gJSb3pbheObc0WsAdjUo
	WHrTM1RJJsSkOubZCOADJucFhC0IPIwy1cNokRUBiJp0uCo6/zK07IPQhw4hgbRLs24sCyMp7hVlh
	7/gLcOFlcuWA49Boz4XAcW7mn/I12MeLyLwBjNZ8+E+t0YO7cUgql3fiE3VS0oCQpdDQSbrlfLX3h
	nq/SS1FcKAS9UXUnzWeSKgF/b8saR6EsTK/xKZkeTrFCBoFLkd+ZmvGdU2aFB84lQXkdIH3i/VXtl
	mXB/0tZ5iW0X2LoEbkTfTaH4Sd0D1Um5R8oMrd1W3wlXCXK80PLwy12afNpPVFuqhWYupPeMqNpgB
	64TQLj2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2D5S-00000000TeX-23QR;
	Thu, 03 Sep 2026 19:27:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2D5R-00000000TeR-26LH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:27:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A0ED160219;
	Thu,  3 Sep 2026 19:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B22F1F000E9;
	Thu,  3 Sep 2026 19:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788463620;
	bh=OvxzmwmAQY0Tv3mevNOknHbiI1QZip1if+quZm55a0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iR+n84GJ2aCL6sHqe5gvYhazIQroLXGxeWI5qlY5mq+gXYKcaimflwMa1EMJzd718
	 CVk+c5qDFzZ6DoCiHVlp8/VLy9KcYecVKSIldSNBzv9uX3rngRvu2TBVuXuBiLgIZ8
	 mvcj4wrdqh4HqM/tFS4hLHs7XuhcEn3DSz/ICeUePlrhGmoRYcVFHxd2PB+4r8OKtA
	 W8g3RXTYo1pzhv3zSw4prgEQgtjWBndz/Mf8vk6KehojQGIaIdtWBah0h2HtUv/vo0
	 iCSXm0ajhs1oNDmT7/b5aLCeCH0CKlPO57TU5VWzQRFFDcIAfMlNCe1AV5sHwF3h0o
	 0IWVUxCqNokZw==
Date: Thu, 3 Sep 2026 14:26:57 -0500
From: Eric Biggers <ebiggers@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/crc: arm64: Fix const keyword in asm prototypes
Message-ID: <20260903192657.GA2344@quark>
References: <1073b77747354d8d46d8804970acd80245e4c318.1788436846.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1073b77747354d8d46d8804970acd80245e4c318.1788436846.git.geert+renesas@glider.be>
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

On Thu, Sep 03, 2026 at 02:03:50PM +0200, Geert Uytterhoeven wrote:
> Commit d36cebe03c3ae4ea ("lib/crc32: improve support for arch-specific
> overrides") corrected the position of the "const" keyword in the
> arch-specific funcions, and replaced "unsigned char" by "u8" for
> consistency.
> 
> Make the same change to the forward declarations for the asm
> implementations.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  lib/crc/arm64/crc32.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/crc/arm64/crc32.h b/lib/crc/arm64/crc32.h
> index 1939a5dee4772972..332d9092ba2f3875 100644
> --- a/lib/crc/arm64/crc32.h
> +++ b/lib/crc/arm64/crc32.h
> @@ -7,13 +7,13 @@
>  // The minimum input length to consider the 4-way interleaved code path
>  static const size_t min_len = 1024;
>  
> -asmlinkage u32 crc32_le_arm64(u32 crc, unsigned char const *p, size_t len);
> -asmlinkage u32 crc32c_le_arm64(u32 crc, unsigned char const *p, size_t len);
> -asmlinkage u32 crc32_be_arm64(u32 crc, unsigned char const *p, size_t len);
> +asmlinkage u32 crc32_le_arm64(u32 crc, const u8 *p, size_t len);
> +asmlinkage u32 crc32c_le_arm64(u32 crc, const u8 *p, size_t len);
> +asmlinkage u32 crc32_be_arm64(u32 crc, const u8 *p, size_t len);
>  
> -asmlinkage u32 crc32_le_arm64_4way(u32 crc, unsigned char const *p, size_t len);
> -asmlinkage u32 crc32c_le_arm64_4way(u32 crc, unsigned char const *p, size_t len);
> -asmlinkage u32 crc32_be_arm64_4way(u32 crc, unsigned char const *p, size_t len);
> +asmlinkage u32 crc32_le_arm64_4way(u32 crc, const u8 *p, size_t len);
> +asmlinkage u32 crc32c_le_arm64_4way(u32 crc, const u8 *p, size_t len);
> +asmlinkage u32 crc32_be_arm64_4way(u32 crc, const u8 *p, size_t len);

It's worth cleaning this up to use the usual convention, but we
shouldn't claim that this is a "fix".

- Eric

