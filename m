Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3570CC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 22:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYmTyuFnsvf/PDZH49hxKDG2N4Q+xKDVO4XincLWpPI=; b=cJ/bhkAu7CDnO1hlKzst9LJJQk
	SHfZVVGSZCJWteBijmStk/6BKHJBywRzViMGqmXikzu0Ya82YQDsNbH3NENQ5yribh5N/eyfKIqup
	vxcLXcpDUyiy9TiCnbXpbMjvqyutEjPLAhOBZ7OChnNxKp5x/yloq2k+ohh2GzIv+yKws8cMEPtX7
	lfzhdvGx2HAlJMVeDvZhKLCdA+/d10kC9xZo0xpulRUeiO7lIpLw/1k1N4Tnc2A2n0rgvjmIK9dsn
	pV2/UjMg1Kk9tAjuO8M/xmdTzW/Rjqdx86bh5/9bRqZSBW3AFZ7WbXPY9bKENng3x6OjCOVxRD3vR
	cHzTrMaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2byb-00000003Mbh-3GLr;
	Fri, 04 Sep 2026 22:01:37 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bya-00000003MbT-273E;
	Fri, 04 Sep 2026 22:01:36 +0000
Message-ID: <b7b77956-591f-4282-aaad-04c9f7899413@infradead.org>
Date: Fri, 4 Sep 2026 15:01:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] Documentation/arch: fix typo "initalised" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org
References: <20260904105114.29474-1-hemanth.selam@gmail.com>
 <20260904105114.29474-2-hemanth.selam@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260904105114.29474-2-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 9/4/26 3:51 AM, Hemanth Selam wrote:
> Correct "initalised" to "initialized", reported by scripts/checkpatch.pl
> using the misspelling list in scripts/spelling.txt.  Only touches comments,
> no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Yes, it's misspelled here. But please be aware of this (from
Documentation/doc-guide/contributing.rst):

Please note that some things are *not* typos and should not be "fixed":

 - Both American and British English spellings are allowed within the
   kernel documentation.  There is no need to fix one by replacing it with
   the other.

 - The question of whether a period should be followed by one or two spaces
   is not to be debated in the context of kernel documentation.  Other
   areas of rational disagreement, such as the "Oxford comma", are also
   off-topic here.



> ---
>  Documentation/arch/arm64/booting.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
> index 13ef311dace8..0d5f8709a5f5 100644
> --- a/Documentation/arch/arm64/booting.rst
> +++ b/Documentation/arch/arm64/booting.rst
> @@ -588,7 +588,7 @@ following manner:
>  
>  - CPUs with a "spin-table" enable-method must have a 'cpu-release-addr'
>    property in their cpu node.  This property identifies a
> -  naturally-aligned 64-bit zero-initalised memory location.
> +  naturally-aligned 64-bit zero-initialized memory location.
>  
>    These CPUs should spin outside of the kernel in a reserved area of
>    memory (communicated to the kernel by a /memreserve/ region in the

thanks.
-- 
~Randy


