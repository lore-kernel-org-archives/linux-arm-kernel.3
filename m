Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D544ACA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 23:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCSSTKMktb+HuS50/2vCoVXjx6kQyokLqg66BRCB0B4=; b=WQrFBYT8lY3LcykpeHCWLOAiZY
	H2KwA0jVeqgCAvpTHkLntBWimOH3aewC9htG/AETMYj1uGizWSSYINEtGvk18qE7IwByS72tWdM5e
	Hq4JsXe/Odvmyq11v72lGPYp0cgqv/AYG8TDqrtlak0K0brjTUNh0JcZmUt74pe33wmUmySdooSsS
	n2AEt613zI7N2Ss2rVRZPegmB3MX/wws1jn9aatmFUuO79b7X4K2zJP0J5VonELeh+Kf31Uxn0gUt
	T46EeaTQMi+wkuyjucM3Glul6EI3OjKFT644UoGhA0/DfFAMYUh5wdQ+Vm6dASHcmnzATfgaWrV2m
	xt49Tbuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD9JV-0000000EBBU-1B5m;
	Sat, 03 Oct 2026 23:38:45 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD9JS-0000000EBB1-2Sme
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 23:38:44 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261003233839euoutp019b93e0a38d74f7844d866dcf976a036b~bKVRYyCTw2859728597euoutp01F;
	Sat,  3 Oct 2026 23:38:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261003233839euoutp019b93e0a38d74f7844d866dcf976a036b~bKVRYyCTw2859728597euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791070719;
	bh=DCSSTKMktb+HuS50/2vCoVXjx6kQyokLqg66BRCB0B4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=JHm5783mcsClVTOaAWZXZGUM5Mak3g4ei3h3Phsta5hYe2YrnBr40qBI7wEY0xmvN
	 UMD5Hqg1kFQ/WCC4EuAuxIXk8MsORKJXSu+n5fnbc6nyJUT/p+4BAj2I/JULzrOMYS
	 TIDbvU8ViajQeQ9onvYQmblwNgBjnxB65Btm5B/c=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261003233838eucas1p237c405e495deb98ca1ab7bffb909923a~bKVQa7ruV0031900319eucas1p2V;
	Sat,  3 Oct 2026 23:38:38 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261003233836eusmtip19df22b79e12bcb1dd0f2058e4a99ebb4~bKVO0uuxI2102321023eusmtip1C;
	Sat,  3 Oct 2026 23:38:36 +0000 (GMT)
Message-ID: <d60a30e1-7e9d-4061-a61f-d50909665c19@samsung.com>
Date: Sun, 4 Oct 2026 01:38:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 7/9] lib/lz4: switch the decompressor to the
 vendored sources
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
In-Reply-To: <arnpj53cgDErAQEz@google.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261003233838eucas1p237c405e495deb98ca1ab7bffb909923a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260925113504eucas1p25e50de59c02681fc1385220be8acd184
X-EPHeader: CA
X-CMS-RootMailID: 20260925113504eucas1p25e50de59c02681fc1385220be8acd184
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
	<CGME20260925113504eucas1p25e50de59c02681fc1385220be8acd184@eucas1p2.samsung.com>
	<20260925-lz4-vendor-upstream-v1-7-1c7ffbe21c4b@samsung.com>
	<arnpj53cgDErAQEz@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_163842_889900_6A17BB45 
X-CRM114-Status: GOOD (  12.23  )
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



On 9/28/26 06:16, Sergey Senozhatsky wrote:
> On (26/09/25 13:27), Michal Wilczynski wrote:
> [..]
>> -static FORCE_INLINE int LZ4_decompress_generic(
> [..]
>> -			/* Necessarily EOF when !partialDecoding.
>> -			 * When partialDecoding, it is EOF if we've either
>> -			 * filled the output buffer or
>> -			 * can't proceed with reading an offset for following match.
>> -			 */
>> -			if (!partialDecoding || (cpy == oend) || (ip >= (iend - 2)))
>> -				break;
> 
> Worth noting, these lines are downstream commit eafc0a02391b
> (lz4: fix LZ4_decompress_safe_partial read out of bound).
> 
> Is this intended or are we "loosing" some of the downstream fixes?
> 

Yeah it's intended, eafc0a02391b was itself a backport of upstream
c5d6f8a8be39  which is in v1.9.3 and later; its own commit message links
it. The same check is at lib/lz4/upstream/lz4.c in this series.

And upstream's version also clamps a literal run that would read past
the end of the input, which the backport didn't take.

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

