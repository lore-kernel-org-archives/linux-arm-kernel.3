Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305C7D29DD7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 06:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24ANg8ZT7wYFPMeB3/AaOeucnD+hKTLwceUjJJzk91A=; b=KZvenp71zELNgJ/9ssufTxk5U0
	FUc+GopXVNCeuoZMYWGSEfem+ex5ODXC35LOLe3o7IBhrHP6wrpgxD0oAqoG2UCjzXGYK2sv4JHqJ
	9H67Spi8B4Zrt3kLW/+nfV66sYe4rk8vfrzVx3EgZ88yMfTFSpjLsZ2t+cMocdi3MtkV3SdW6BM8Q
	h2drG0uZZyGA6F5NGTEZwC5MgtmSOzV3e9oY855+mFXaHWV48+d6fK7I8erLaZOTQ8gEF5nXrumC9
	zvH5lXDcDNj1YcQhigYVoFaw1yI0NCW5rR+BTcACmHKCKNS9beu9LmucCW5KGYwADM/9owGLCutgV
	l1DIb/nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfY0F-00000006bQy-37bK;
	Tue, 13 Jan 2026 06:35:43 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfY0C-00000006bQ8-2SVA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 06:35:43 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 2E5EC1F995;
	Tue, 13 Jan 2026 07:35:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1768286135;
	bh=24ANg8ZT7wYFPMeB3/AaOeucnD+hKTLwceUjJJzk91A=; h=From:To:Subject;
	b=g6a3fX9g9PrX1Dwdkff/iJ9+HXZTJCCB65qo15lRmdzEcPm2DaW4bjNyNFop/+3Wd
	 eUEmQUqLqBnpu44WGMR2K1n1SkZ3wxbtJcmcpY5XfxecBTo/L7ZEjhtvDNiEUYK/CY
	 yz7KSgomjxkEETGhijtd+UWwIoNbiULGTE8vZCKQiLwNSDfzn9dim/Cjw39KjvlmcP
	 tUQj1h0q1uCUriM9bN7l7Dla6uz6ZxAjfxuhNXVRJE4wVlF04MzyZ5vz6WVPtEkgxY
	 xotnNB6hnKLcSng1o95CItBTPMuvgpSKGF4R+fzHUI07ROTXbv8aUS35diXKdMuKuY
	 x95M+k7Zuv66A==
Date: Tue, 13 Jan 2026 07:35:31 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Vitor Soares <ivitro@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: ti: k3-am69-aquila: fix SPI hardware
 CS issue
Message-ID: <20260113063531.GA4635@francesco-nb>
References: <20260112175350.79270-1-ivitro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112175350.79270-1-ivitro@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_223541_692792_44C290CB 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jan 12, 2026 at 05:53:45PM +0000, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> Hardware chip select does not work correctly on main_spi0 and main_spi2
> controllers on the Aquila AM69 module. Testing revealed main_spi2 loses
> CS state during runtime PM suspend, while main_spi0 cannot drive CS HIGH
> when bus is idle. This series switches both controllers to use GPIO-based
> chip select instead.

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


