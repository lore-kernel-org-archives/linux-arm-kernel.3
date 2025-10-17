Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A46CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 17:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+DvO660ZwJxBzaga+eoVQtVoFpj9YhvDl66CxZHmrc=; b=0w05HS5JMGF0XNib+rwiXpFNGD
	5xaOoLWLDA1xqOot/SOUPQBGwa9ZlCzlLncJI1+MugGNXaQTF+zjYnrJTyGKgQy4YGgrFGo/bLsZY
	oFT6T9uiVGp0dvus89Z9Q0QhALUrMMwAb6EX/x5AZu0AgNi5oQorTMuBLUBSHherVCmo4F/uwF+Xe
	h1wIVcv/E9kvGW4pVy/c8V8YU+3sliUMbo20KaA5nBTyApLwVST3F2vEE9qPZjE6EkOwXoltydzOY
	JYLDLFypkxofBWSdyeUWYkYJHLZlf3U80L+GBpKreq/2oYpDt+KgtB7F1tJXtuHsCBl2c+hSRZ3p8
	1lEYRV0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nud-00000008Y5B-13HN;
	Fri, 17 Oct 2025 17:06:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nua-00000008Y3z-327l
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 17:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=q+DvO660ZwJxBzaga+eoVQtVoFpj9YhvDl66CxZHmrc=; b=rQEFbR5zxMNpATiayTkV5GiKpX
	65X0bC8I7/inBsMarXA7dGtd+WiewsLLABZXNEK+gtIXWKz2yv+mKylht72pFGFZMbi7swPqcA7OE
	0ifz4jFbMOHphKJNIlkelabLAymIMXuRoMNF8k9icHV5DTEDihDY0iuI7Ad3Hb8Mz5ECwgFv8CR2o
	3plfII3/eCA4arsJc99gQle68r0RZ8g9tBSKHVcu/anhruiC09+SQJ77qXKj8CdGTL3uXQ+agg9dD
	pssdwFe2T2gEX0PA0mUo0mPIsAGcCKTz87UO3w4Wh239c5Bbx5XWjzIWDwMVTqy0/lSi5y2ozDs7x
	B9l076IA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nuQ-00000007nwH-1vDy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 17:06:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1F0449D25;
	Fri, 17 Oct 2025 17:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A065AC113D0;
	Fri, 17 Oct 2025 17:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760720788;
	bh=IxOsuJ9eV4kD5BLNCDQgKv6gJY2/5S9nBRSu63LVZec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QFsttR0jKWDN5HM8+UFu04Ft7wUGOnEPfMuLI7PgPya5yajETIqZ69yBUfZ07PPc7
	 Rpr07abkBlET43gaZWkGMQmgdAqVrW1gmXJ6vIo8BVLhuTqYMHK/UqLFo3UW6jt9CM
	 FtTxjyKPHyms30CfyBGxpQzgefBAtNITTRtxyycfmS+qzLj5Vqu04/ac8q85dbvhmF
	 UoE2H3FEfj4o9Gt6QX4CILfR6RuWFKtrrdUajj+k0MPrUsMv+nUQM+m4Jwx3Ahe/CD
	 E6Vj+mQsT8Q2vnJ1PzN69CUeyEKsZqjE89vbSg2BOgx3fiHEw717+woJXokI+b5EW5
	 H4l4q41O2cX+w==
Date: Fri, 17 Oct 2025 10:04:56 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 03/21] crypto/arm64: sm4-ce-gcm - Avoid pointless
 yield of the NEON unit
Message-ID: <20251017170456.GD1566@sol>
References: <20251008154533.3089255-23-ardb+git@google.com>
 <20251008154533.3089255-26-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008154533.3089255-26-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_180635_194676_2FE2F688 
X-CRM114-Status: GOOD (  14.05  )
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

On Wed, Oct 08, 2025 at 05:45:37PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Kernel mode NEON sections are now preemptible on arm64, and so there is
> no need to yield it when calling APIs that may sleep.
> 
> Also, move the calls to kernel_neon_end() to the same scope as
> kernel_neon_begin(). This is needed for a subsequent change where a
> stack buffer is allocated transparently and passed to
> kernel_neon_begin().
> 
> While at it, simplify the logic.
> 
> Acked-by: Eric Biggers <ebiggers@kernel.org>
> [ardb: Simplify convoluted logic]
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/crypto/sm4-ce-gcm-glue.c | 25 +++++---------------
>  1 file changed, 6 insertions(+), 19 deletions(-)

Reviewed-by: Eric Biggers <ebiggers@kernel.org>

- Eric

