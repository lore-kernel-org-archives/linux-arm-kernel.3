Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC08CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gk/jkLabIKqrTeRTh6B8YkFY1Qzh0AGlpE1MH2mDe24=; b=n9lXF1BcdX0Qy0pIYkzy91ZY07
	NeqQRe9uCA6efHqNNEky3g5Q7IncRgCfrBTYXDRMoYGgxtighPJGZi0CcIfwjzR+tX74CeOd9x8di
	PW8iBrthHuQWotOZJhZZ7Z9lGxtPfa4EtqP/jkMtmeSnJ05J+/scP0rRyg3cKcAuK5lUy4n/OybUF
	JCIFmwkz52Vw7YrFNvRi8yj5sdLaT4me/bqVPYBlEv3/93zCInLG4S2d3aUPCZLVT75BAyXH2lSnP
	Zhd330SwBW3TcWnELy4thEHeE6eafiVq2q8YW/SvJojh1pgIDYskJ6+CRPraSdyi6St7dbM72G2gW
	3GUeCIzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wab2k-00000002dHY-1Otf;
	Fri, 19 Jun 2026 15:22:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wab2i-00000002dHE-0Zoy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 15:22:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DECB32880;
	Fri, 19 Jun 2026 08:21:57 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30DF83F763;
	Fri, 19 Jun 2026 08:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781882522; bh=700rRzW++BkEpbjiGVizQi/Qihc27GT0Bohwey/9ZG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qlN6snVb8P7eI0UXTPA2dYPCbudUBmBu1zgwbkqd95YdDE4WiI2QCdEr95WOj0RQx
	 2s54s/KD0gww3eDm5ZG0G4YFiCnQ+/7KtoFGELmV/fQT2XwT0Llvw/qNLZu3GiGE1h
	 YZbP35uRHFcIwPxMizIje74j5dCtHkSufNKkfq7M=
Date: Fri, 19 Jun 2026 16:21:53 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: arm64: Document that text_offset is always 0
Message-ID: <ajVekauNroapwbtm@J2N7QTR9R3.cambridge.arm.com>
References: <20260604140839.1930847-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604140839.1930847-1-linux@rasmusvillemoes.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_082204_259195_F86C108A 
X-CRM114-Status: GOOD (  39.10  )
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

On Thu, Jun 04, 2026 at 04:08:39PM +0200, Rasmus Villemoes wrote:
> When trying to figure out where to place and call an arm64 Image in
> memory, reading booting.rst should provide the answer. However, it
> requires quite some digging to figure out that text_offset is set via
> ".quad 0" in head.S and is thus actually always 0 since v5.10.

What is the actual problem?

The documentation in booting.rst is accurate; I don't see why it's
necessary to read the source code to look at text_offset. Immediately
above the text in your diff, the documentation has:

| 4. Call the kernel image
| ------------------------
| 
| Requirement: MANDATORY
| 
| The decompressed kernel image contains a 64-byte header as follows::
| 
|   u32 code0;                    /* Executable code */
|   u32 code1;                    /* Executable code */
|   u64 text_offset;              /* Image load offset, little endian */
|   u64 image_size;               /* Effective Image size, little endian */
|   u64 flags;                    /* kernel flags, little endian */
|   u64 res2      = 0;            /* reserved */
|   u64 res3      = 0;            /* reserved */
|   u64 res4      = 0;            /* reserved */
|   u32 magic     = 0x644d5241;   /* Magic number, little endian, "ARM\x64" */
|   u32 res5;                     /* reserved (used for PE COFF offset) */

Can you explain the problem you're facing? e.g.

* Is the documentation unclear, in a way that could be better?

* Is there some aspect of the boot protocol that is hard for a
  bootloader to follow?

* Is there some problem with *testing* that bootloaders respect the
  text_offset requirements?

* Something else?

> Update the documentation and make that explicit. Reword the 2MB
> requirement accordingly, and remove the paragraphs that only apply to
> the ancient versions where text_offset could be non-zero, as they only
> confuse a current reader.
> 
> Fixes: 120dc60d0bdb ("arm64: get rid of TEXT_OFFSET")
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
> I've included a Fixes tag since I spent way too much time tracking
> down where that text_offset might be defined. The mentioned commit did
> get rid of all references to TEXT_OFFSET-the-macro, but not
> text_offset-the-concept.

Keeping text_offset as a concept was deliberate. That allows us to keep
the documentation accruate for older kernel versions, and allows for the
possiblity that a non-zero offset is introduced in future (though I
admit that might be a tough sell).

>  Documentation/arch/arm64/booting.rst | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
> index 13ef311dace8..f4cc25b1fd56 100644
> --- a/Documentation/arch/arm64/booting.rst
> +++ b/Documentation/arch/arm64/booting.rst
> @@ -55,9 +55,6 @@ not exceed 2 megabytes in size. Since the dtb will be mapped cacheable
>  using blocks of up to 2 megabytes in size, it must not be placed within
>  any 2M region which must be mapped with any specific attributes.
>  
> -NOTE: versions prior to v4.2 also require that the DTB be placed within
> -the 512 MB region starting at text_offset bytes below the kernel Image.
> -
>  3. Decompress the kernel image
>  ------------------------------
>  
> @@ -93,6 +90,8 @@ Header notes:
>  
>  - As of v3.17, all fields are little endian unless stated otherwise.
>  
> +- As of v5.10, text_offset is always 0.
> +
>  - code0/code1 are responsible for branching to stext.
>  
>  - when booting through EFI, code0/code1 are initially skipped.
> @@ -100,12 +99,6 @@ Header notes:
>    entry point (efi_stub_entry).  When the stub has done its work, it
>    jumps to code0 to resume the normal boot process.
>  
> -- Prior to v3.17, the endianness of text_offset was not specified.  In
> -  these cases image_size is zero and text_offset is 0x80000 in the
> -  endianness of the kernel.  Where image_size is non-zero image_size is
> -  little-endian and must be respected.  Where image_size is zero,
> -  text_offset can be assumed to be 0x80000.
> -

So far we've tried to ensure that the documentation covers current *and*
older kernel versions. If we're going to drop text covering older
versions we'd need an explciit statemnt as to which kernel versions the
document is accurate for.

I would prefer that we retained documentation regarding the text_offset
field in the header, even if it happens to be zero today.

Mark.

>  - The flags field (introduced in v3.17) is a little-endian 64-bit field
>    composed as follows:
>  
> @@ -135,12 +128,9 @@ Header notes:
>    end of the kernel image. The amount of space required will vary
>    depending on selected features, and is effectively unbound.
>  
> -The Image must be placed text_offset bytes from a 2MB aligned base
> -address anywhere in usable system RAM and called there. The region
> -between the 2 MB aligned base address and the start of the image has no
> -special significance to the kernel, and may be used for other purposes.
> -At least image_size bytes from the start of the image must be free for
> -use by the kernel.
> +The Image must be placed at a 2MB aligned base address anywhere in
> +usable system RAM and called there.  At least image_size bytes from
> +the start of the image must be free for use by the kernel.
>  NOTE: versions prior to v4.6 cannot make use of memory below the
>  physical offset of the Image so it is recommended that the Image be
>  placed as close as possible to the start of system RAM.
> -- 
> 2.54.0
> 

