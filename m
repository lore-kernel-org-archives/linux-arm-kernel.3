Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B2ECA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 23:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YeQG0aX9+npnHOTaEcmH5NapglKt88z5G6eNYrYY23s=; b=MbypIqTKr0mE2IUWLweNI+Z3E4
	cL8LEKwknVujMwPWC1XLV0lIuGolaVNzXy7pzbgV4LI5b+VUu9U6YDNAkVAHzxSwO6tCunynk8W2D
	F69UyBR9+mSamXeDlZey3KR4sFZhlSzQwuwoz4fMI1S5EiEzPCxeb99Ht0SEaOLUnPOeNpLEgprpq
	i/D9PSupxMznn52ddnJDzPqCd5KUS3vaDRZaM/pk1xlZ1L6KfUMmQaY6vKZ5inIUdhSYAV21DM48J
	uvEo6G7BXkojgk44Z7BrIIQdAu9cDEVfq1yu4cDHJJah64MSPXTOj7Fu9mQb8KKRG0r9xpFy0/otU
	vRRM9xWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD9Wm-0000000EBbo-05mA;
	Sat, 03 Oct 2026 23:52:28 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD9Wj-0000000EBb0-2ZBD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 23:52:27 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261003235223euoutp015f6ea317b7d01367963d56f0330b92c0~bKhRbuz8P1130611306euoutp01G;
	Sat,  3 Oct 2026 23:52:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261003235223euoutp015f6ea317b7d01367963d56f0330b92c0~bKhRbuz8P1130611306euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791071543;
	bh=YeQG0aX9+npnHOTaEcmH5NapglKt88z5G6eNYrYY23s=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=jDX+SDoPeqthUbyezzmLfesvArpjYDdQ4hJeBkfnkqoS34/xmNDT1vDXi0Aa4KDGp
	 B1WE786E3+ww5NxOcqsxNS41E3neVhoX3HlbfJiHz3MCsh2ZIeBpoGDHWMKEorIE1G
	 sTeUWeJvYHBG/84vAj6zcIQLBKS8ZZfwYDdcLoZY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261003235222eucas1p242b448a9a62dbc7c349b9311eb8f9076~bKhQnPtml0031100311eucas1p2q;
	Sat,  3 Oct 2026 23:52:22 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261003235220eusmtip1b9a9db4570335d897d7c2b7512376bca~bKhOxuwOT1826618266eusmtip18;
	Sat,  3 Oct 2026 23:52:20 +0000 (GMT)
Message-ID: <b0df8c61-0feb-40cb-8bb9-5d4874309944@samsung.com>
Date: Sun, 4 Oct 2026 01:52:20 +0200
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
In-Reply-To: <aryehUJml8fTy0o-@google.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261003235222eucas1p242b448a9a62dbc7c349b9311eb8f9076
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260925113452eucas1p170bfdb34dfbf670a14a6f8f0c2f5094a
X-EPHeader: CA
X-CMS-RootMailID: 20260925113452eucas1p170bfdb34dfbf670a14a6f8f0c2f5094a
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
	<CGME20260925113452eucas1p170bfdb34dfbf670a14a6f8f0c2f5094a@eucas1p1.samsung.com>
	<20260925-lz4-vendor-upstream-v1-1-1c7ffbe21c4b@samsung.com>
	<aryehUJml8fTy0o-@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_165225_918954_6CFF21E9 
X-CRM114-Status: GOOD (  18.28  )
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



On 9/30/26 08:07, Sergey Senozhatsky wrote:
> On (26/09/25 13:27), Michal Wilczynski wrote:
> [..]
> 
>> +void LZ4_resetStream_fast(LZ4_stream_t* ctx) {
>> +    LZ4_prepareTable(&(ctx->internal_donotuse), 0, byU32);
>> +}
> 
> [..]
> 
>> +void LZ4_attach_dictionary(LZ4_stream_t* workingStream, const LZ4_stream_t* dictionaryStream)
>> +{
>> +    const LZ4_stream_t_internal* dictCtx = (dictionaryStream == NULL) ? NULL :
>> +        &(dictionaryStream->internal_donotuse);
>> +
>> +    DEBUGLOG(4, "LZ4_attach_dictionary (%p, %p, size %u)",
>> +             workingStream, dictionaryStream,
>> +             dictCtx != NULL ? dictCtx->dictSize : 0);
>> +
>> +    if (dictCtx != NULL) {
>> +        /* If the current offset is zero, we will never look in the
>> +         * external dictionary context, since there is no value a table
>> +         * entry can take that indicate a miss. In that case, we need
>> +         * to bump the offset to something non-zero.
>> +         */
>> +        if (workingStream->internal_donotuse.currentOffset == 0) {
>> +            workingStream->internal_donotuse.currentOffset = 64 KB;
>> +        }
>> +
>> +        /* Don't actually attach an empty dictionary.
>> +         */
>> +        if (dictCtx->dictSize == 0) {
>> +            dictCtx = NULL;
>> +        }
>> +    }
>> +    workingStream->internal_donotuse.dictCtx = dictCtx;
>> +}
> 
> Just a side note,
> there is a bunch of new helpful API added in this release.  Currently,
> we do some memcpy hacks to avoid re-init of lz4 C/D-dict in zram, but
> once this series lands I'll be happy to send some trivial EXPORT_SYMBOL
> patches so that zram (and other lz4 users) can use standard lz4 dict
> API instead of hacks.
> 

Sounds great, thank you !

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

