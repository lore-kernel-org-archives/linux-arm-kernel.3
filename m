Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C054AC54F5F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 06:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3RaLcbBsYZpw/Kku2JzT3wLKyDfDI2vlTE11UqWozw=; b=jhQGmXimztHp+rrZX9qwK8hrux
	TbOPqPUGfbCnwMTTbHN3atsEDp9VAlsxD5aqrk1n0VqmOpKroPiV8sge7+NjDFdX38xO3xKZKhQqJ
	xPKveWbVAggxG2mUZmiTuDqayeJolo8f6nvIMQSNNdYgsTijuxHTi+NGs45cW8f3PetKvDwfKsV4v
	GFla+H4NoCw1PfETNIvOJQ5ij4Id1lzCPIZP3uLwfNI25MDG3QDpw3n2+q2zHXA3p1mTuqVTYq8Ss
	rG1YfGUfZ0PKJ/9+pBtATwRSq2RfHuuPp03l/dDGhuFuNsq/kU9/79PxRGw/GyLC2tULHm0KC0ujg
	oWm7qz/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtKAm-0000000DK8B-23lX;
	Fri, 20 Feb 2026 06:39:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtKAj-0000000DK7n-0rmc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 06:39:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9D0244161;
	Fri, 20 Feb 2026 06:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FAD4C116D0;
	Fri, 20 Feb 2026 06:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771569565;
	bh=K03+flrCCAh9UJxfPcPWOWXMwX3CXYJoX3R9jdwQGFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qcs0dJCf/unZIOC7XlsbZbpv/C3tIqkn4RXaO2yct+95urWJ3BZpYnTjBV7E7LPvb
	 /oiLU02RTjq2nXKnfZcRsXEE8L2v9ByxldwTPXWHYu4XwlShjAvnpZDiEdG9eGgwNu
	 ekibDgwO8HH27G+w09+tWvmgeweaU4eTSHdlGE72nLsP2xIOiD29cze2T/Z1IhIU6d
	 dtva5h9AzPheTIcVbftt63L/q4DQJYT9tNNFTeIMjztulncLuySUkyiX3agryZimoj
	 UPO9uKXSzcD6A3RDODXBUHmJ6GgMeXEVvssmwJ1SkuD1LTIIw4WZikNP7yP9/Rrpjp
	 LWMrvN41V+UWw==
Date: Fri, 20 Feb 2026 14:20:54 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] arm64: remove HAVE_CMPXCHG_LOCAL
Message-ID: <aZf9RsIUh8ARg_RP@xhacker>
References: <20260215033944.16374-1-jszhang@kernel.org>
 <aZY30X9bpsV-nPsm@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aZY30X9bpsV-nPsm@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_223929_268305_E3325589 
X-CRM114-Status: GOOD (  12.03  )
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

On Wed, Feb 18, 2026 at 02:07:57PM -0800, Shakeel Butt wrote:
> On Sun, Feb 15, 2026 at 11:39:44AM +0800, Jisheng Zhang wrote:
> > It turns out the generic disable/enable irq this_cpu_cmpxchg
> > implementation is faster than LL/SC or lse implementation. Remove
> > HAVE_CMPXCHG_LOCAL for better performance on arm64.
> > 
> > Tested on Quad 1.9GHZ CA55 platform:
> > average mod_node_page_state() cost decreases from 167ns to 103ns
> > the spawn (30 duration) benchmark in unixbench is improved
> > from 147494 lps to 150561 lps, improved by 2.1%
> > 
> > Tested on Quad 2.1GHZ CA73 platform:
> > average mod_node_page_state() cost decreases from 113ns to 85ns
> > the spawn (30 duration) benchmark in unixbench is improved
> > from 209844 lps to 212581 lps, improved by 1.3%
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> Please note that mod_node_page_state() can be called in NMI context and
> generic disable/enable irq are not safe against NMIs (newer arm arch supports
> NMI).

hmm, interesting...

fgrep HAVE_NMI arch/*/Kconfig
then
fgrep HAVE_CMPXCHG_LOCAL arch/*/Kconfig

shows that only x86, arm64, s390 and loongarch are safe, while arm,
powerpc and mips enable HAVE_NMI but missing HAVE_CMPXCHG_LOCAL, so
they rely on generic generic disable/enable irq version, so you imply
that these three arch are not safe considering mod_node_page_state()
in NMI context.

