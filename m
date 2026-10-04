Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3D4CA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 00:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJZTrL5SQnYa6gvVNuN2LjMawlbBBC4EWuE7TxWcKx8=; b=xafBDHKcJ/7CZ80ZcIEG6bfbe2
	MYZ4EjIgd+IuSK4xTBR0NHG/fBMXuR36awG8wnUGIKF+kuvkzGR+jR9wTWORZA16k7UZIkZX6Y9E0
	IkSjeKFvRSp5YICf4RduVB1C/QiqcHyzagw5ji5IrE4RM3vx08wgWqNxmgV3pklhb/cfUj07BldIc
	rvam9SlzRCzkr6eqa9HaghRwOGbMy3UQwwdZ5CK3EJ0F/L1fhFvrxHwV3xRGVsQpNxC709CpvvBfG
	9JFnVO6qbzamn1VRWFx+LOgubvE5mUk86zosGwT5EdqvthLDBC9nNlXCHaNInR8+9FU8f/UwQ03ls
	hmgWEzKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD9jE-0000000EBw0-0cQZ;
	Sun, 04 Oct 2026 00:05:20 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD9j9-0000000EBvX-39yj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 00:05:18 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261004000510euoutp013ee4f267ec7b07e822726f0b5d88d0fa~bKsbKQ__B2163921639euoutp01V;
	Sun,  4 Oct 2026 00:05:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261004000510euoutp013ee4f267ec7b07e822726f0b5d88d0fa~bKsbKQ__B2163921639euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791072310;
	bh=ZJZTrL5SQnYa6gvVNuN2LjMawlbBBC4EWuE7TxWcKx8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=KFP5LNkza8OoBtj5HTuawzDRYYYBZ/WrfFMAfjXatZRd5ZwpmRtkrpGNteNnFAcFW
	 a+pvo77kefjxlg+J0Kbo3aGXfUJFkeO4mBIkzt4cVg0+G6B7j2sqT1cGqS4uI3Kd2H
	 +7VeWQwlvnZ97NOV2yx7DRYeXvD3SKk6JpL6yeyc=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261004000509eucas1p12b906a44a576ad1b1bf6f8099f081cdd~bKsaNgMf72285022850eucas1p1h;
	Sun,  4 Oct 2026 00:05:09 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261004000507eusmtip2934e51491ae1d0ccbd9db1e873d1df61~bKsYgse7o0742707427eusmtip2n;
	Sun,  4 Oct 2026 00:05:07 +0000 (GMT)
Message-ID: <ff30763b-d39b-450f-82ef-cba10d221ae6@samsung.com>
Date: Sun, 4 Oct 2026 02:05:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/9] lib/lz4: add the build environment for the
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
In-Reply-To: <arn9tK5MxxxfH7OW@google.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261004000509eucas1p12b906a44a576ad1b1bf6f8099f081cdd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260925113456eucas1p136c3cd1f08be7201ad6b3f7b0e8ff02d
X-EPHeader: CA
X-CMS-RootMailID: 20260925113456eucas1p136c3cd1f08be7201ad6b3f7b0e8ff02d
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
	<CGME20260925113456eucas1p136c3cd1f08be7201ad6b3f7b0e8ff02d@eucas1p1.samsung.com>
	<20260925-lz4-vendor-upstream-v1-3-1c7ffbe21c4b@samsung.com>
	<arn9tK5MxxxfH7OW@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_170516_396307_79216EA2 
X-CRM114-Status: GOOD (  12.66  )
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



On 9/28/26 07:48, Sergey Senozhatsky wrote:
> On (26/09/25 13:27), Michal Wilczynski wrote:
> [..]
>> +
>> +/* LZ4_decompress_fast() and LZ4_resetStream() are still kernel API. */
>> +#define LZ4_DISABLE_DEPRECATE_WARNINGS 1
> 
> Is this upstream code?  As far as I understand it, LZ4_decompress_fast*()
> deprecated upstream and are strongly discouraged.  Do we want to suppress
> deprecation warnings?
> 

It's ours lz4_deps.h but upstream's lz4.c sets the same switch for
itself lz4.c, since its own code calls deprecated functions. We
include lz4.h before lz4.c, so we have to set it first.

I agree on the direction. The only in-tree _fast() user is the pre boot
path of lib/decompress_unlz4.c, so as a follow-up I'd move it to
LZ4_decompress_safe_partial() and drop the three _fast exports.

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

