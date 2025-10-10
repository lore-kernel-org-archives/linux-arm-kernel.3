Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E42CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 18:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpXjWKVKug4tzPYRQ+Eep5X9L3Q6WwjqX11S81MkIlI=; b=rT80GstvpyG0JeymSFf2uvNxvY
	B/UKeE9QkGhQcbKedM3IM4xrXSM9eSliFAKQxtw0MXoyWJRSH1HEBZ1vbHfWGgTjCi+k5tasASNQN
	yEoGMhLDB1UKuZFnGfXLmRJFvfaYdURiMI9p4Edk5BZzt/x6COaB0gafn//e7Qv/rf1+P1JYN0NF7
	fNvDV2EHs1uHMMLF4/TItrruiB1roE5tAIc3EqMLA1jlkOC5oMOvNdJtEmFBfMV+JymKN86pXSeVO
	31SU4xbHZWKxE4EVSLJPAH0VOnb70EiCSmYlYamTFoJScssygPcrdzm9oRjVXoJ/LJn59oY06KzpA
	w6nFIduQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ILB-00000009BeS-2Zcx;
	Fri, 10 Oct 2025 18:59:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7IL9-00000009Bdw-0U6I;
	Fri, 10 Oct 2025 18:59:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BF7F43B51;
	Fri, 10 Oct 2025 18:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4770C4CEF1;
	Fri, 10 Oct 2025 18:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760122782;
	bh=sYk5aMSZbgzMbwPbuCiskyPX36SDyxnlnzL93Z3Hx8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aAbBoqOLzWF5nIYGCF3jaULfN5Z8H0pbTLCv/IjTM6Gd299B8zQJpW7CXm5El1rXj
	 iuJfOS+1Cg6jIH6iHKnZmTeCbs2GSzx2yCtpp0gdXr6j1HMku/mDAarkQWmDow2Hsh
	 VKVV/HgenrEHtChtQrtuaTsSl7d5HJhCKWS2b8ptAdBFrf7mkgLeRvuPfEg5gpQ5EZ
	 8HkBjSHV16j42dmgpdXvLgKVi/5O71eSJApuuY3jbzm00UhyFEuX7lWTZILJYm0aTV
	 /nddl0q8EVqvLysUt0crqykn5+yg9kykhhYYhhL54kE3rwJa15drT+Fqk12R1rWV7J
	 tmfbN4l/HCLaw==
Date: Fri, 10 Oct 2025 13:59:40 -0500
From: Rob Herring <robh@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Conor Dooley <conor@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: Re: [PATCH v7 16/17] dt-bindings: spi: airoha: add compatible for
 EN7523
Message-ID: <20251010185940.GA715991-robh@kernel.org>
References: <20251010033136.1475673-1-mikhail.kshevetskiy@iopsys.eu>
 <20251010033136.1475673-17-mikhail.kshevetskiy@iopsys.eu>
 <20251010-landscape-cavity-88a963e45a6b@spud>
 <f709fe24-ca89-498a-a06d-677b703aecba@iopsys.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f709fe24-ca89-498a-a06d-677b703aecba@iopsys.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_115943_171973_480C4426 
X-CRM114-Status: GOOD (  12.10  )
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

On Fri, Oct 10, 2025 at 05:57:35PM +0300, Mikhail Kshevetskiy wrote:
> On 10.10.2025 17:24, Conor Dooley wrote:
> > On Fri, Oct 10, 2025 at 06:31:35AM +0300, Mikhail Kshevetskiy wrote:
> >> Add dt-bindings documentation of SPI NAND controller
> >> for Airoha EN7523 SoC platform.
> >>
> >> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> > Please explain in the commit message why these two devices are not
> > compatible.
> 
> 
> They are compatible (at least from the point of this driver), but
>  * en7523 is an old chip destined for 32-bit OS (ARCH=arm)
>  * en7581 is a much newer chip destined for 64-bit OS (ARCH=arm64)
> so using of 'en7581-snand' may leads to peoples confusion.

If they are confused, then that is their problem. That is how compatible 
works.

Rob

