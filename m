Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9100FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=er7LoNN+emga7DudkyUrA4LpLsbgHboDB19tynVoRUI=; b=pamekvUk9VD4asiU/dL9XpTvme
	r3JrNo15kGi2i3xItRjRtgY2gcP4Y+cAlnQf1wAVtd9yWoaetADmK8vMqOX1uWMnd1YK4Azw2mWzn
	57uw+eUTNs1PNYmHojBIXSoQ+zLayIJJdMmwjdD/M1MqLFxVvrA8tyrqtehWwPnQjSzOyialwmmUB
	iKzy5fcG+hWo9aqAUk8fqn7dt+X5XYQPlsLKgDQuoFy1otRAiw9ku9NELP+8a3iwLfrzg+AIdChbW
	XwhAfQOk2OYo2pGe0ew3Jj19e7+VV9j7W3Wy5tSfoL41vXXM8LihP6hIQswLhnmG6Ty1NX38a6Vfp
	+LfEJj1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9Uv-0000000EMhm-1jpy;
	Mon, 29 Jun 2026 10:45:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9Ut-0000000EMh1-0OMZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:45:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D2071A00;
	Mon, 29 Jun 2026 03:45:43 -0700 (PDT)
Received: from [10.1.36.193] (e121487-lin.cambridge.arm.com [10.1.36.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EACD63F836;
	Mon, 29 Jun 2026 03:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782729947; bh=uX4j+xfZpBFC+x937A72Gq+CfgKKBY1FxADnDSRx2Ug=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ptglBkdmuBFUT2TS0QAktHWeKPIB5DAKQTbSMef6iwFfmDsR9E04rUNOEmuaj9dpD
	 vf+4Ja80YdjmnvdNiGo39XI+lN6Aq+y/0aK9aLpSD7SC8G1ehTrXJtT/rPr7KkcI6J
	 XxLF59lFn9CMNn49WoscuOUJ3oW/fzkYKRtGc0M4=
Message-ID: <381fb71c-0a2c-4dec-98a3-56ad88e190c6@arm.com>
Date: Mon, 29 Jun 2026 11:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] arm64: errata: NVIDIA Olympus device store/load
 ordering
To: Shanker Donthineni <sdonthineni@nvidia.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
 Jason Sequeira <jsequeira@nvidia.com>
References: <20260625182425.3194066-1-sdonthineni@nvidia.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260625182425.3194066-1-sdonthineni@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_034551_214979_B3F83D4C 
X-CRM114-Status: GOOD (  18.93  )
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

Hi,

On 6/25/26 19:24, Shanker Donthineni wrote:
> This series works around the NVIDIA Olympus device store/load ordering
> erratum (T410-OLY-1027): a Device-nGnR* load can be observed by a
> peripheral before an older, non-overlapping Device-nGnR* store to the
> same peripheral, breaking the program order that drivers rely on for
> MMIO and potentially leaving a device in an incorrect state.
> 
> Patch 1 adds the workaround. It promotes the raw MMIO store helpers
> (__raw_writeb/w/l/q, and therefore writel()/writel_relaxed()) to
> store-release on affected CPUs, and promotes the trailing DGH of the
> write-combining __iowrite{32,64}_copy() helpers to dmb osh. Everything is
> gated on a new ARM64_WORKAROUND_DEVICE_STORE_RELEASE cpucap and patched
> in only on affected parts, so it is a no-op elsewhere.
> 
> Patch 2 provides arm64 memset_io()/memcpy_toio(). The generic versions
> are built on __raw_write*(), so patch 1 would promote every store in a
> block to a store-release; as each STLR drains the write-combining buffer,
> block MMIO becomes O(n) store-releases. The arm64 versions emit plain
> STR in the loop and order the whole block with a single trailing dmb osh,
> keeping block MMIO at one-barrier cost.
> 
> Performance: NVIDIA Olympus, write-combining MMIO to a device BAR, single
> PE pinned; per-call cost in ns. Consecutive writes ping-pong between two
> buffers so repeated stores are not coalesced. iowrite64/iowrite32 =
> __iowrite{64,32}_copy().
> 
> Table 1 - workaround off (CONFIG_NVIDIA_OLYMPUS_1027_ERRATUM=n)
> +-------+-----------+-----------+-----------+-------------+
> |  size | iowrite64 | iowrite32 | memset_io | memcpy_toio |
> +-------+-----------+-----------+-----------+-------------+
> |    8B |   67.9 ns |   67.8 ns |    3.6 ns |    3.6 ns   |
> |   16B |   67.9 ns |   67.8 ns |    4.0 ns |    4.0 ns   |
> |   32B |   67.9 ns |   67.9 ns |    4.6 ns |    4.6 ns   |
> |   64B |   69.1 ns |   69.1 ns |   69.1 ns |   69.0 ns   |
> |  128B |  138.3 ns |  138.3 ns |  138.4 ns |  138.3 ns   |
> |  256B |  276.6 ns |  276.6 ns |  276.6 ns |  276.7 ns   |
> |  512B |  276.6 ns |  276.5 ns |  276.6 ns |  276.6 ns   |
> |   1KB |  276.6 ns |  278.4 ns |  276.6 ns |  276.6 ns   |
> |   2KB |  278.4 ns |  278.4 ns |  275.9 ns |  276.6 ns   |
> |   4KB |  365.7 ns |  365.7 ns |  365.7 ns |  365.7 ns   |
> +-------+-----------+-----------+-----------+-------------+
> relaxed/no-flush: memset_io()/memcpy_toio() issue plain stores with no
> trailing dgh() or barrier, unlike __iowrite*_copy() which ends with dgh().
> 
> Table 2 - workaround on, arm64 memset_io/memcpy_toio (this series)
> +-------+-----------+-----------+-----------+-------------+
> |  size | iowrite64 | iowrite32 | memset_io | memcpy_toio |
> +-------+-----------+-----------+-----------+-------------+
> |    8B |  231.6 ns |  231.6 ns |  232.4 ns |  232.4 ns   |
> |   16B |  231.7 ns |  231.9 ns |  232.7 ns |  232.6 ns   |
> |   32B |  231.9 ns |  232.7 ns |  232.9 ns |  232.9 ns   |
> |   64B |  232.7 ns |  235.0 ns |  233.7 ns |  233.6 ns   |
> |  128B |  233.6 ns |  235.8 ns |  234.4 ns |  234.3 ns   |
> |  256B |  237.7 ns |  276.8 ns |  264.0 ns |  276.7 ns   |
> |  512B |  237.7 ns |  277.1 ns |  238.1 ns |  277.6 ns   |
> |   1KB |  253.7 ns |  279.3 ns |  276.1 ns |  294.1 ns   |
> |   2KB |  295.0 ns |  318.7 ns |  288.5 ns |  308.3 ns   |
> |   4KB |  365.9 ns |  381.4 ns |  365.7 ns |  381.3 ns   |
> +-------+-----------+-----------+-----------+-------------+
> all four helpers end with a single trailing barrier (dmb osh).
> 
> Table 3 - workaround on, generic per-store memset_io/memcpy_toio
> +-------+-----------+-----------+-------------+--------------+
> |  size | iowrite64 | iowrite32 |   memset_io |  memcpy_toio |
> +-------+-----------+-----------+-------------+--------------+
> |    8B |  231.6 ns |  231.6 ns |    229.0 ns |    229.0 ns  |
> |   16B |  231.7 ns |  231.9 ns |    458.4 ns |    458.5 ns  |
> |   32B |  231.9 ns |  232.7 ns |    917.4 ns |    917.5 ns  |
> |   64B |  232.7 ns |  234.8 ns |   1835.4 ns |   1835.5 ns  |
> |  128B |  233.6 ns |  235.8 ns |   3670.9 ns |   3670.8 ns  |
> |  256B |  237.7 ns |  276.7 ns |   7341.6 ns |   7341.6 ns  |
> |  512B |  237.7 ns |  279.4 ns |  14001.4 ns |  14001.3 ns  |
> |   1KB |  253.7 ns |  279.1 ns |  28631.5 ns |  28631.8 ns  |
> |   2KB |  279.4 ns |  317.9 ns |  57276.3 ns |  57275.2 ns  |
> |   4KB |  365.7 ns |  381.5 ns | 114564.4 ns | 114563.6 ns  |
> +-------+-----------+-----------+-------------+--------------+
> the generic memset_io()/memcpy_toio() build on __raw_write*(), which the
> workaround promotes to store-release, so every store is individually
> ordered - hence O(n) in the store count.
> 
> Tables 2 and 3 show why patch 2 is needed: the generic per-store block
> writers collapse to O(n) under the workaround (4KB ~314x slower, ~115 us
> vs ~366 ns), while the arm64 versions stay flat at one-barrier cost.

That's interesting. With the way the patch set is structured, it
now looks like:

1. Fix the erratum, but cause a performance regression.
2. Restore the performance regression and (re)apply the erratum
   workaround.

Would it make sense to avoid introducing the performance
regression in the first place by structuring the patch set
slightly differently?

1. (Re)introduce arm64 memset_io()/memcpy_toio().
2. Fix the erratum once for all

What do you reckon?

Cheers
Vladimir


