Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AFCD13585
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 20:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfS2jUw2nERZwTWdYui2XADYriCG8pCbG/t3+1gI8JI=; b=tRn2kCxx210ckDBN4Ggoe3OLYZ
	TIRcuK80mr6hd9Vh+4NeGV0GfPZMDJHiFT/VA7qZjeh5yJHz60gq9ozILhEz18XIVfKeTlWZvsj6u
	PwOmQ7k3Kwfbj70uDNvx1vn4jEvIVsXt5oPfzGoaFC7tm07jaTJ+acqU3li5V+kdhkJXC/i1vs6WP
	/f4mJkYcXbrUla+kVMz5NQHeUjBp14FHIDhc8b8RP6Eh58+YEALmH2eo+w5Q3b5eVA4XdDxQrdAZg
	c1hWjp9qziN1WjMNICfY7LMgU47DBGCqvDjC47/LNXQwHqw/boMOYrZGxTyzXm7r+ece9nEPlOGyK
	fCKUhPHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5A36-00000008rCB-1jxW;
	Sun, 27 Oct 2024 20:39:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5A1U-00000008qv2-32Ud;
	Sun, 27 Oct 2024 20:38:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 02F9E5C5452;
	Sun, 27 Oct 2024 20:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2625AC4CEC3;
	Sun, 27 Oct 2024 20:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730061483;
	bh=XVAi1sk2jxjCgto2tP/Cdm3jLw9qfp50pYIUjyARnkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O08X3fuW1WWmGgVpPvq2rZy29QwVueFD7a87JA3OxX4D4cRxu9+xwVslSvAXnbiwE
	 dXJ8CBYNDujLFINfeo/3UlJyt6dBeu+qE70+vIVbnCdNRnA0WIn68vwwtSPDoZFUuj
	 kftqEQ6MaHWbfJhOF6El0+nmBUFJV7dVxmZz+wWfu4WzAj3GMhSxRshUir1PCEKH40
	 ps5GPx9F6fh2HpunAKbUVDJKrdW4Lids+mBUejeutozM4enLwwFp1NvskHkoIBVLQi
	 BESj+1NwAsaV4pEwXPcoK7y9+1im0zrI7VWe8yEdFozd4Z463W8rpuH67YLdBixZyK
	 zN/ArJWIPszeA==
Date: Sun, 27 Oct 2024 21:38:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/4] dt-bindings: net: Add support for Sophgo SG2044
 dwmac
Message-ID: <4avwff7m4puralnaoh6pat62nzpovre2usqkmp3q4r4bk5ujjf@j3jzr4p74v4a>
References: <20241025011000.244350-1-inochiama@gmail.com>
 <20241025011000.244350-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025011000.244350-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_133804_834603_8B6E049D 
X-CRM114-Status: GOOD (  11.85  )
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

On Fri, Oct 25, 2024 at 09:09:58AM +0800, Inochi Amaoto wrote:
> The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> with some extra clock.
> 
> Add necessary compatible string for this device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---

This should be squashed with a corrected previous patch (why do you need
to select snps,dwmac-5.30a?), so we clearly see which the fallback and
specific compatibles being added.

>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 124 ++++++++++++++++++
>  2 files changed, 125 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml

Best regards,
Krzysztof


