Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF023CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 21:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFYadDrg3AdUKlaN7Unac9OnhO0ynkQQCr0sE1JM+bo=; b=syB6cSiB2Jiz5nHyXSITeUA2Ex
	Azkbuo+W1K7i5gEV1f5Mstpo85TP8XrGdKKRBPAfXQBXJW9jQdIYO4NhKXKq0mAemjhgRuzDPAOOE
	M79sqpl+rbvhjxOKSA6auepKFMyUDSVxLw755i8QIjjWEgjnYnE/fF+mTvtcLAi02uuVBYD+Hb8Ui
	bh5kC1fE5vqIK9+jYTOnjUP1t/q+1yOCguO6tuWuwqb+pWWVtmM1M0KbugeigNI7i22thLioINe/H
	B53O/l23exQYGraGrRom5S3MqVKS4PYKqlgl98fw5qlwJ278ByqSp7EQSzfSA2bH7kMfs9p9EbahH
	gQaEsOiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvn5-00000007ikU-0k0n;
	Fri, 01 May 2026 21:52:55 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvn4-00000007ikD-2S7B;
	Fri, 01 May 2026 21:52:54 +0000
Message-ID: <daad5323-e088-409e-b516-0529e5d7ab13@infradead.org>
Date: Fri, 1 May 2026 14:52:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: errata: Reformat table for IDs
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org,
 catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
References: <0d4c8f3968e5c5c0a6f3dc295c3e9f696b9006f4.1777657487.git.robin.murphy@arm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <0d4c8f3968e5c5c0a6f3dc295c3e9f696b9006f4.1777657487.git.robin.murphy@arm.com>
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



On 5/1/26 10:52 AM, Robin Murphy wrote:
> We have some inconsistency where multiple errata for the same component
> share the same Kconfig workaround; some are one ID per line, some are
> smooshed together, and some are entirely separate entries. Standardise
> on the single entry, one ID per line format so that things render nice
> and consistently in the HTML docs, and it's simple and clear to add new
> IDs to existing workarounds without churning the table too much.
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

LGTM. Thanks.
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> 
> v2: Rebase for 7.0-rc1 
> 
> One last tilt at this windmill - at least I did remember! :)
> 
>  Documentation/arch/arm64/silicon-errata.rst | 47 +++++++++++----------
>  1 file changed, 25 insertions(+), 22 deletions(-)
-- 
~Randy

