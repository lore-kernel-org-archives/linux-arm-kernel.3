Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE9BCA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 23:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06jrm1eJOKkEfVYjfM8urZVFEtTHJTgdf4MXi9Zr75I=; b=38g3UoxA4lP9UxGC23/S6dQWlO
	cDLNhvnPo85tnkoynorU4zHNFEx595OyEDUXHhPWSi5wnxJuW2QMkNhgtzZuLDk7bVoZu9/pmT2Bb
	MTtGIQQcMLZHs6qnf3trzOBBKfi0J8QcDVPEjqiOb7IkBF80iv7FsLl+40yQtaO1PYRH9UpqG3JMV
	ejTkkKUAx88V7hrCp3PzuOF9H/eURYmDwkHFPP5hVbLgx6zSas9cx8CCQyGVXTql9IgizLmSBginU
	5Ku6n00XQQcIwUpfjyCQdkRTSHWhJvgKwEXHfcATPv5ULPBcX83O8kAgGMnijt8K3H2Pmgfopzrrc
	cXgX4Clw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD9Fp-0000000EAvT-3NaZ;
	Sat, 03 Oct 2026 23:34:57 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD9Fl-0000000EAuj-45e6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 23:34:56 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261003233450euoutp02c1894a969f4aa7dcdc13711324b510bc~bKR8fdgbC2968329683euoutp02C;
	Sat,  3 Oct 2026 23:34:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261003233450euoutp02c1894a969f4aa7dcdc13711324b510bc~bKR8fdgbC2968329683euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791070490;
	bh=06jrm1eJOKkEfVYjfM8urZVFEtTHJTgdf4MXi9Zr75I=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=QA/UIMngsEzopfyR2oMgeAvIpsxY8XFVWR6aszTu2KASkTE9HgfdfrEoibwj1+Ish
	 q+q0jX7mWyllAGunxNTWrLk9JIZLUZdZDUhz/mwcYRQDpGduTJEE52K7M5/4/L7CfC
	 t/2nqVLqsIrV+xGRicpyEUeoh56qvM0ZzTVHWVaE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261003233448eucas1p1a273f9ebf3e825f88405f45e28ff1fc6~bKR66LqvF0047100471eucas1p1Z;
	Sat,  3 Oct 2026 23:34:48 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261003233446eusmtip1e9b417cfe901275fcda452a3fc458927~bKR5M2kGA1826618266eusmtip1H;
	Sat,  3 Oct 2026 23:34:46 +0000 (GMT)
Message-ID: <34143c5f-5b1c-4ae2-90e7-d999d10b73cf@samsung.com>
Date: Sun, 4 Oct 2026 01:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/9] lib/lz4: import upstream LZ4 sources verbatim
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
	<justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
	<James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Heiko
	Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
	Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
	Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Minchan Kim <minchan@kernel.org>, Jens
	Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>, Nick
	Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, Chao Yu
	<chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>, Herbert Xu
	<herbert@gondor.apana.org.au>, Phillip Lougher <phillip@squashfs.org.uk>,
	Sungguk <sungguk.na@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-erofs@lists.ozlabs.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <arnosKlQYVIdmTR7@google.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261003233448eucas1p1a273f9ebf3e825f88405f45e28ff1fc6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260925113452eucas1p170bfdb34dfbf670a14a6f8f0c2f5094a
X-EPHeader: CA
X-CMS-RootMailID: 20260925113452eucas1p170bfdb34dfbf670a14a6f8f0c2f5094a
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
	<CGME20260925113452eucas1p170bfdb34dfbf670a14a6f8f0c2f5094a@eucas1p1.samsung.com>
	<20260925-lz4-vendor-upstream-v1-1-1c7ffbe21c4b@samsung.com>
	<arnosKlQYVIdmTR7@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_163455_263979_452307B6 
X-CRM114-Status: GOOD (  12.36  )
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



On 9/28/26 06:12, Sergey Senozhatsky wrote:
> On (26/09/25 13:27), Michal Wilczynski wrote:
> [..]
>> +#ifndef LZ4_FAST_DEC_LOOP
>> +#  if defined __i386__ || defined _M_IX86 || defined __x86_64__ || defined _M_X64
>> +#    define LZ4_FAST_DEC_LOOP 1
>> +#  elif defined(__aarch64__) && defined(__APPLE__)
>> +#    define LZ4_FAST_DEC_LOOP 1
>> +#  elif defined(__aarch64__) && !defined(__clang__)
>> +     /* On non-Apple aarch64, we disable this optimization for clang because
>> +      * on certain mobile chipsets, performance is reduced with clang. For
>> +      * more information refer to https://protect2.fireeye.com/v1/url?k=e59d343e-8402d40e-e59cbf71-000babe403ab-24cad800d51083a3&q=1&e=1265adcb-d286-42f9-9d57-b9b998ba2ed0&u=https%3A%2F%2Fgithub.com%2Flz4%2Flz4%2Fpull%2F707 */
>> +#    define LZ4_FAST_DEC_LOOP 1
>> +#  else
>> +#    define LZ4_FAST_DEC_LOOP 0
>> +#  endif
>> +#endif
> 
> I just checked https://protect2.fireeye.com/v1/url?k=f36de8be-92f2088e-f36c63f1-000babe403ab-1972efa3caab0762&q=1&e=1265adcb-d286-42f9-9d57-b9b998ba2ed0&u=https%3A%2F%2Fgithub.com%2Flz4%2Flz4%2Fpull%2F707 and it seems that
> LZ4_FAST_DEC_LOOP is enabled on aarch64 now, but we still disable it.
> Am I missing something?
> 

You're right for clang builds. v1.10.0 enables the fast loop on aarch64
only with GCC clang has been excluded since PR you mentioned. Upstream
has since changed that neither of those commits is released yet:

0aa33884faf5 ("[LZ4] Limit disabling LZ4_FAST_DEC_LOOP to
aarch64+clang+android")

ed86bc1ed802 ("AArch64: Enable LZ4_FAST_DEC_LOOP for Android")


The first is already enough for the kernel.

For v2 I'll backport both commits into the vendored lz4.c the same
way patch 2 backports 5ef1f16929b5. They apply cleanly in order and
give exactly upstream's current condition, and they go away at the next
resync.

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

