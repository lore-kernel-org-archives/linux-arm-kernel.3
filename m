Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CFFC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 17:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHNNIPLQoNO7IhBE1S2+bWd4n9+KcXQrEB8ySVE5EPM=; b=j+cfFxUbid2gfff1M2A8GS8b9R
	l9PExlzvdGz+Xy9TusXXuYsZ37T+O4pNM3O5UepKiiyl6HjnFXX0ZvS4GlVCqZeszpQc2/5VW6785
	6Ad72bUGo3ecHfdhaxaxzaQ4UpLe0r+NA58W9iL4iT5SljdscgCpjosRdtYmMxHL4ZlBdyzVYvnIz
	yL7sfDXSVR5xYST2vS1sM3jsH6a/GYXc29qd70mN9ky5mt/IekomJ5BVpazWUZujN7/szDTOXRqgU
	dCUNhVeaUDqCz1efOWbT8IgujFaiQdpd47l/Ap1eNi+3KgnOM+5w3+voFFzbHEN5yNiHh8uZEksGl
	TwaHgaNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY4E-0000000H6NI-0LY5;
	Mon, 24 Aug 2026 17:02:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY44-0000000H6J9-3PgO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 17:02:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4336F6020E;
	Mon, 24 Aug 2026 17:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F8E1F000E9;
	Mon, 24 Aug 2026 17:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787590948;
	bh=jHNNIPLQoNO7IhBE1S2+bWd4n9+KcXQrEB8ySVE5EPM=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=iUNCpKEx0Krsz1T+zlwFX9PCj9X/VmjsAwUeIQxSUgaTET4GJWoFMZWRCJnCLL7f+
	 DPBFTk6CbLrghm6f/4GsYKjvyZO/bBItjz/VfS6Sx5Vz9nwVmy3SzLT7VXO+f80gTK
	 uf0nairvLEYAJTBlNeSCnXCybWOqcKU7kDDPuitkg6ZvO+isQBFWnktOK3aHN8GQzv
	 mvlZajbpQHbWnFsSnE1P6o6pjCioF9yzEJepr2JPaNmCLqJZtpIB2NVCXU6r8zCaxf
	 45ZBwMPVBoIFs340wEIo3iIjEDlZtGXNUKp9wi0iKSYI9TVHhrf+GtwrStE7iwKHuy
	 33w9Ssflcm52g==
Content-Type: multipart/mixed; boundary="===============1703117813336268665=="
MIME-Version: 1.0
Message-Id: <828c12c509a1bd8805e32459146390e05510cc4e897ee83dcb6cd94ebbb06fb1@mail.kernel.org>
In-Reply-To: <20260824160523.3907021-5-usama.anjum@arm.com>
References: <20260824160523.3907021-5-usama.anjum@arm.com>
Subject: Re: [PATCH 4/7] maccess: Use a scoped guard for page faults
From: bot+bpf-ci@kernel.org
To: usama.anjum@arm.com,catalin.marinas@arm.com,will@kernel.org,mark.rutland@arm.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,ihor.solodrai@linux.dev,akpm@linux-foundation.org,david@kernel.org,ljs@kernel.org,liam@infradead.org,vbabka@kernel.org,rppt@kernel.org,surenb@google.com,mhocko@suse.com,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org,bpf@vger.kernel.org,linux-mm@kvack.org
Cc: usama.anjum@arm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Mon, 24 Aug 2026 17:02:27 +0000 (UTC)
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

--===============1703117813336268665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/mm/maccess.c b/mm/maccess.c
> index c59a0e092d24..f695ceefe6fc 100644
> --- a/mm/maccess.c
> +++ b/mm/maccess.c
> @@ -38,18 +38,17 @@ long copy_from_kernel_nofault(void *dst, const void *src, size_t size)
>  	if (!size)
>  		return 0;
>
> -	pagefault_disable();
> -	if (!(align & 7))
> -		copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
> -	if (!(align & 3))
> -		copy_from_kernel_nofault_loop(dst, src, size, u32, Efault);
> -	if (!(align & 1))
> -		copy_from_kernel_nofault_loop(dst, src, size, u16, Efault);
> -	copy_from_kernel_nofault_loop(dst, src, size, u8, Efault);
> -	pagefault_enable();
> +	scoped_guard(pagefault) {
> +		if (!(align & 7))
> +			copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
> +		if (!(align & 3))
> +			copy_from_kernel_nofault_loop(dst, src, size, u32, Efault);
> +		if (!(align & 1))
> +			copy_from_kernel_nofault_loop(dst, src, size, u16, Efault);
> +		copy_from_kernel_nofault_loop(dst, src, size, u8, Efault);
> +	}
>  	return 0;
>  Efault:
> -	pagefault_enable();
>  	return -EFAULT;
>  }

A subsystem pattern flags this as potentially concerning: include/linux/
cleanup.h states "the expectation is that usage of 'goto' and cleanup
helpers is never mixed in the same function. I.e. for a given routine,
convert all resources that need a 'goto' cleanup to scope-based cleanup,
or convert none of them."

After this change, copy_from_kernel_nofault() declares scoped_guard(
pagefault) while still using the goto-based Efault: label. Each
copy_from_kernel_nofault_loop() expands to __get_kernel_nofault(...,
Efault), which does 'goto Efault' from inside the guard scope to a label
outside it.

The concern is whether jumping out of the guard scope with goto is the
pattern cleanup.h discourages. Is this mixing safe in practice, or should
the function be fully converted to scope-based cleanup without the goto
label?

> @@ -73,18 +72,17 @@ long copy_to_kernel_nofault(void *dst, const void *src, size_t size)
>  	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
>  		align = (unsigned long)dst | (unsigned long)src;
>
> -	pagefault_disable();
> -	if (!(align & 7))
> -		copy_to_kernel_nofault_loop(dst, src, size, u64, Efault);
> -	if (!(align & 3))
> -		copy_to_kernel_nofault_loop(dst, src, size, u32, Efault);
> -	if (!(align & 1))
> -		copy_to_kernel_nofault_loop(dst, src, size, u16, Efault);
> -	copy_to_kernel_nofault_loop(dst, src, size, u8, Efault);
> -	pagefault_enable();
> +	scoped_guard(pagefault) {
> +		if (!(align & 7))
> +			copy_to_kernel_nofault_loop(dst, src, size, u64, Efault);
> +		if (!(align & 3))
> +			copy_to_kernel_nofault_loop(dst, src, size, u32, Efault);
> +		if (!(align & 1))
> +			copy_to_kernel_nofault_loop(dst, src, size, u16, Efault);
> +		copy_to_kernel_nofault_loop(dst, src, size, u8, Efault);
> +	}
>  	return 0;
>  Efault:
> -	pagefault_enable();
>  	return -EFAULT;
>  }

Same pattern here: copy_to_kernel_nofault() now has scoped_guard(pagefault)
with copy_to_kernel_nofault_loop() calls that 'goto Efault' out of the
guard scope.

> @@ -97,18 +95,17 @@ long strncpy_from_kernel_nofault(char *dst, const void *unsafe_addr, long count)
>  	if (!copy_from_kernel_nofault_allowed(unsafe_addr, count))
>  		return -ERANGE;
>
> -	pagefault_disable();
> -	do {
> -		__get_kernel_nofault(dst, src, u8, Efault);
> -		dst++;
> -		src++;
> -	} while (dst[-1] && src - unsafe_addr < count);
> -	pagefault_enable();
> +	scoped_guard(pagefault) {
> +		do {
> +			__get_kernel_nofault(dst, src, u8, Efault);
> +			dst++;
> +			src++;
> +		} while (dst[-1] && src - unsafe_addr < count);
> +	}
>
>  	dst[-1] = '\0';
>  	return src - unsafe_addr;
>  Efault:
> -	pagefault_enable();
>  	dst[0] = '\0';
>  	return -EFAULT;
>  }

And again in strncpy_from_kernel_nofault(): scoped_guard(pagefault) with
__get_kernel_nofault(dst, src, u8, Efault) jumping out of the guard scope.

Does this refactoring align with the guidance in cleanup.h about not mixing
goto and cleanup helpers, or is there precedent for this pattern in uaccess
code?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/32751368606
--===============1703117813336268665==--

