Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F6FCA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 21:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btCphvORn7Yyjc6QJYh3aTW+dRLKuqQVoUZI59S7zOg=; b=0CKYrGSU1IRSQdCEl3mx6CMrpH
	p3pOpmVqYnTqye5i2G4GokSnuEAn8aLGnD/Zk1GI4uJFzMSlSy0tib4EjyTTMPEoIXwY40YzGwsdK
	KtlWG9I4Gf1TEn9CCs+x1gAhTI2DWELQt2Y0gIyW0Ps0Yi4gKp/ITI8CRo8sa+KmgeUuob15jsGtH
	RruwacS6SIYqQtcxFe628L3XyUdokzs36cwLHdF0Lc1+A7R6vX5MvWPxJLnNQOZMbH8fFMt94gzhJ
	2SbZH4ez7xy/XY8NLk2+679rEj3qBnC7UegzIXSWbueed7TtnAguhrNuWAUM2NrNvPjhhwZC1GN9c
	KoVwl0oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDThn-0000000FM1z-3Mwo;
	Sun, 04 Oct 2026 21:25:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDThm-0000000FM1b-003Z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 21:25:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=btCphvORn7Yyjc6QJYh3aTW+dRLKuqQVoUZI59S7zOg=; b=ZDqGbDM9Oax/oK7ECksMSNnfQo
	w1rQiT/npPF3JvokNixujHMAGG5uz73gPZ0A56TkwTW4WaBFmLROyOlwRh1uC1gRYH+iLU9nUYVwO
	9DRAjwl2Xrq1Hbzhkd5KvtT3f3uU8+shqIxBeLYm+lf6oEqVS8wzgePkt9z0jzFgTkNU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xDThe-008wa0-98; Sun, 04 Oct 2026 23:25:02 +0200
Date: Sun, 4 Oct 2026 23:25:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Pufan Jin <2254650260@qq.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: zynqmp: Add EBDEE EdgeBoard FZ3A development
 board
Message-ID: <fb944e1e-2386-4e5e-a2f8-8c0ccf66362f@lunn.ch>
References: <20261003194625.936288-1-2254650260@qq.com>
 <tencent_06FFBD8580099835137D0C541050057B4906@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_06FFBD8580099835137D0C541050057B4906@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_142510_043866_29CC4FF4 
X-CRM114-Status: UNSURE (   6.10  )
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

> +&gem3 {
> +	clocks = <&lpd_lsbus>, <&zynqmp_clk GEM3_REF>,
> +		 <&zynqmp_clk GEM3_TX>, <&zynqmp_clk GEM3_RX>,
> +		 <&zynqmp_clk GEM_TSU>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +};

No MDIO bus? No phy-handle?

   Andrew

