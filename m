Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B32AE6F084
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 19:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KhqvafFnF6uFiPzj5dFGZLm7k6DFUEUeS8xiqEUEx0=; b=kueg7/2oiD3xzId0O7elt/e01Z
	SUdlvs4uHA8oOV+nKOejui9fz0tw2A9fhHW7uI0sBihKEq3emE7Zv60mDmgCI740wiz9cmGlwVjED
	Yezoyrzd0p/blRKzMUB46O0xtWr+ZxeHQ5qlWdhdQ3LBIv6bKxAvZzUoLKK76PEIa5Blp1QNibjJ0
	OrdrlUdvsuI+ti39EiNbTgjuv8OVzOYI7Xr8Sx2hPo3IGZOBbxkmu4ymSConKhlcs3q+RK3brnfyA
	G3C/LyCrVuQgZPqtvbFY/NtGBUKxcaMlf8ylNAzZg1PtLWN42E5SARMC3cp4L2VRnAC/xkXBwUYEF
	XdYKHlow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xWj-00000008AGR-0e0I;
	Fri, 01 Nov 2024 19:41:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xV2-00000008A3n-1WYb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 19:40:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25F09A44BF7;
	Fri,  1 Nov 2024 19:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDB8C4CECD;
	Fri,  1 Nov 2024 19:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730489999;
	bh=5+9HDlpS67+JWi5nzbq2AXQUu22Nar07vzHHwqy/OSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MnoVXOdrZPUOnM9cGquOLHBhymk3J6J9E8gDaTfNxb8EMhp3KqiAQBnzmd8ST8TaG
	 Toe2zs350GKtznaD5wDnnP5vwr4DtYvhhJrRjeuj7Ut55Ja9mazExS+GEPqJYPObPJ
	 oB9hMGv0KaZb7y+L+Fi93tNkIArjiw1nVPBXHnTXURh23XUORgJdWLxVIpzOxwLupR
	 X4h9lNOljpW0wvnZmG+5XrJZ+LhGQqVXjgPECgcBmkLmP+/ghYX/yOle7RPvBPGb+a
	 onT9WxXzi5bprjZ7clmNfkc2+8ftThDsPOujGbPR4DQ7bsIkKFoH9euTwfjx8XdKkN
	 S/Ym04e01/mhw==
Date: Fri, 1 Nov 2024 14:39:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, krzk+dt@kernel.org,
	edumazet@google.com, a.fatoum@pengutronix.de, davem@davemloft.net,
	pabeni@redhat.com, dinguyen@kernel.org, marex@denx.de,
	kuba@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, s.trumtrar@pengutronix.de,
	joabreu@synopsys.com, linux-kernel@vger.kernel.org,
	mcoquelin.stm32@gmail.com, conor+dt@kernel.org,
	alexandre.torgue@foss.st.com
Subject: Re: [PATCH v4 12/23] dt-bindings: net: snps,dwmac: add support for
 Arria10
Message-ID: <173048999498.4080241.4644127959389900220.robh@kernel.org>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
 <20241029202349.69442-13-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029202349.69442-13-l.rubusch@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_124000_490964_0AB1DA7D 
X-CRM114-Status: GOOD (  11.57  )
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


On Tue, 29 Oct 2024 20:23:38 +0000, Lothar Rubusch wrote:
> The hard processor system (HPS) on the Intel/Altera Arria10 provides
> three Ethernet Media Access Controller (EMAC) peripherals. Each EMAC
> can be used to transmit and receive data at 10/100/1000 Mbps over
> ethernet connections in compliance with the IEEE 802.3 specification.
> The EMACs on the Arria10 are instances of the Synopsis DesignWare
> Universal 10/100/1000 Ethernet MAC, version 3.72a.
> 
> Support the Synopsis DesignWare version 3.72a, which is used in Intel's
> Arria10 SoC, since it was missing.
> 
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


