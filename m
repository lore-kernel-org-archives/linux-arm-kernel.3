Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E939CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbUH+ytp/I7r/qS0bTCYNaSJzrM2N4H+oZ5XzytcBc8=; b=iKcxE6atxSLywLwivasmMk2o5K
	gL3f7dlRjhuIfQNnWGbYxjjBzKWiAkHFQ7/GUYW11LmdkOn8XtrYsyb1NL//wPOTFdQ2OyTDePsr7
	HVVEPbP7bC5BBIsKCPOrTnet9PjHTAjE0+guhwscCM/fGsZWG1BNsSBvKkN5Wfv30YcZKs22ngzhu
	dQDHxe44zPbXXlHh8BRob6Pj9vZt62VN8MNFkM6cELY6lJVrwlFShrw2BWDjsr+l3hnNYygqmTHH/
	JSEzpJsRwIj2Ywo1p9ZmHlHrSwfray0KrEYQj3NAfbHjubpeoee2c6WSR4U7EmPmOOqxgIqwGxxLm
	OrECtBNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytpg-0000000CaC6-2Oyt;
	Wed, 17 Sep 2025 15:12:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytpb-0000000Ca1l-0W6q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:12:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=SbUH+ytp/I7r/qS0bTCYNaSJzrM2N4H+oZ5XzytcBc8=; b=GI2hr8NUA/wBoWosZZr4g/4/8R
	lh/GHsVJEfQBe1JCCzTQcDmOYfx8xG4Lb9qNRvwPqQmVv8MP8Qgy7rc/DDVgKctW/899gLrFqCP/t
	VLGWtcNnnByIsFzV8Ahz0ux9ZpaNZ8sCdyE1SgnOcJj3s0pCJLVe4JZoNmBVJKweRSrM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uytpK-008hZD-5s; Wed, 17 Sep 2025 17:12:10 +0200
Date: Wed, 17 Sep 2025 17:12:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v1 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
Message-ID: <9bb9929a-8130-48da-983e-2901a7c3da36@lunn.ch>
References: <20250917074812.4042797-1-kevin.tung.openbmc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917074812.4042797-1-kevin.tung.openbmc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_081227_172965_FD889C5F 
X-CRM114-Status: GOOD (  10.33  )
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

On Wed, Sep 17, 2025 at 03:48:08PM +0800, Kevin Tung wrote:
> Summary:
> Add device tree for the Meta (Facebook) Yosemite5 compute node,
> based on the AST2600 BMC.
> 
> The Yosemite5 platform provides monitoring of voltages, power,
> temperatures, and other critical parameters across the motherboard,
> CXL board, E1.S expansion board, and NIC components. The BMC also
> logs relevant events and performs appropriate system actions in
> response to abnormal conditions.
> 
> Kevin Tung (2):
>   dt-bindings: arm: aspeed: add Meta Yosemite5 board
>   ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC

The threading between your patches are broken? How did you send them?
git send-email? b4 send?

	Andrew

