Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A0FC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdfg7obfW7JkQiBKarLyFeZzGv6IWCWDHOBGhZOM7dQ=; b=jo+OUtiutVWZQKufSi1qbA3qne
	tOFKW6Ya/AuowG5A5RFZT2CuIcNeNflqbkMPmAk+yl8tcN8S6J7EHk7cAOr13Xv42dAIw08PokbtN
	V5zZDZ7To8saLHUN45PW5qPQ+Q3WOWTDn0savv/+u1RAl9wL4uv2DFZYwTL7I3JbvCm4lurBSIj1X
	swC2+cw+WhqT9SvubHogIUwF4QtQQzy9RX7K1KdD0g+65nJ28Cz8pJSYbHKSLD0b0iIBeRzaCccVs
	FkUrLz2F10qFfgnqaeFUTjO5t+3w2+FX/a69QuwWtO+lAVx9i9ve3Hri6txc6bvyYZmU3CfEc9lcb
	glGMGoFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d13-00000007TOP-0Yrm;
	Mon, 07 Sep 2026 17:20:21 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d10-00000007TKJ-1lZZ;
	Mon, 07 Sep 2026 17:20:18 +0000
Message-ID: <cc61467a-761c-4f50-8355-f78360f9d1e8@infradead.org>
Date: Mon, 7 Sep 2026 10:20:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: arm64: Fix typo "initalised" in booting.rst
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Weijie Yuan <wy@wyuan.org>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260907114146.39715-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260907114146.39715-1-hemanth.selam@gmail.com>
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



On 9/7/26 4:41 AM, Hemanth Selam wrote:
> Add the missing "i" to "initalised" in the description of the
> spin-table cpu-release-addr property.
> 
> The British spelling is deliberate.  doc-guide/contributing.rst asks
> that both American and British spellings be left alone, so only the typo
> is corrected, not the dialect.  checkpatch.pl suggests "initialized"
> here because scripts/spelling.txt maps this entry to the American form;
> that is addressed separately.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
> 
> Notes:
>     Changes since v2:
>      - the guidance lives in doc-guide/contributing.rst, not
>        doc-guide/checkpatch.rst as v2 claimed (Weijie Yuan)
>      - drop the v1 narrative and the redundant "only the documentation text
>        changes" line
>     
>     Changes since v1:
>      - keep "initialised" rather than switching the file to "initialized",
>        so the British spelling is preserved (Randy Dunlap)
> 
>  Documentation/arch/arm64/booting.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
> index 13ef311dace8..891fd22f7229 100644
> --- a/Documentation/arch/arm64/booting.rst
> +++ b/Documentation/arch/arm64/booting.rst
> @@ -588,7 +588,7 @@ following manner:
>  
>  - CPUs with a "spin-table" enable-method must have a 'cpu-release-addr'
>    property in their cpu node.  This property identifies a
> -  naturally-aligned 64-bit zero-initalised memory location.
> +  naturally-aligned 64-bit zero-initialised memory location.
>  
>    These CPUs should spin outside of the kernel in a reserved area of
>    memory (communicated to the kernel by a /memreserve/ region in the

-- 
~Randy

