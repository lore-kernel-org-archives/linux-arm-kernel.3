Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A965EC369CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 18:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSErsB4OWqx/9+Tbzvj7ylkAv0Sp5+vAreUi9Ph9D64=; b=ZhK5EnI7A1NH99WvPBp7iNAc70
	cI7MCi9kcNZkFlPfo0w9mUDe8zaO3jwsFRke4gdBNrPhSRzzsW19GkZgie0Gb0YSy1t/QvvuOxz64
	9MguEU6vA4qi1avJQyOPsMlRyFmM8tihMXQV6JpSkF4pPlKmUYLVwbGH3Dnqw31loT0rF9gpPoxNJ
	Xq0gZHcTv0q1pLZd/tLDJDrXsa6I6gRIdoSVxdoysld5jmQccGYNgBWKtQFdUPgRompGmukpEsueA
	uL4EMYmlILuxOoPyLDdOacJ24QIRGIBDDCzaEPZ9DAZLU7SI7haCoKFP9ZEKgpMI3xOwhzHmEdvMY
	l1nt9vRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Ts1-0000000E0Kf-3qZL;
	Thu, 17 Apr 2025 18:21:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TYh-0000000DxD3-1Q1c
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Apr 2025 18:01:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bSErsB4OWqx/9+Tbzvj7ylkAv0Sp5+vAreUi9Ph9D64=; b=QBpeIVb5CnzI15FJbl8ZFBvkxb
	CCXOeIV8fOBwbDmVcLi7btX8tbZXLB+W3Tw17umj5ThdxGAQIIXz8c0VV4uAo2fitxAiUh2PLEyeo
	J1OjNAi5R+zHMPHXRyIvT+W7bTvSDcFJZxAU5kAgH5BlNQKM3nwiITy8fsjRww1EA3ZFlrSxN/psg
	nHI9w5Dnr+FFnQKhaTsscqFbEc+RgAu0ORy+AjPpOdlyAMHiitqPFFshktzV/Bbcb8tHvXaa39Rv2
	P7Pg/zDVKpuUqz4lOhmOE2QQY70rv/Rftyx2qAG9YaVKSyhzyCLwZmCaJwDqOMqRDgZTmFuusWvY2
	O/e/hG7g==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5TYd-0000000ALun-2RoM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 18:01:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bSErsB4OWqx/9+Tbzvj7ylkAv0Sp5+vAreUi9Ph9D64=; b=Wt5nIaRktXy2a/MQ+85J/HIyW5
	EBP4qm+0aHoDbUlDNPLw3qicQpVxQQqPDXJ82tQgayBWNfDMyAkjcAyWA+Osiy0TCZjn/qbgYituG
	rtuO/JCsC7MU2JYeHIjUzJ5HHqO4nk5HklujYTixlTqSZstHXceCvpnZwf9uncmWZgKg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u5TYE-009oZl-Ss; Thu, 17 Apr 2025 20:01:26 +0200
Date: Thu, 17 Apr 2025 20:01:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v8 4/4] MAINTAINERS: Add entry for Renesas
 RZ/V2H(P) DWMAC GBETH glue layer driver
Message-ID: <d53d4cc9-c1db-432c-8ab3-3c4c71e1b9ac@lunn.ch>
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250417084015.74154-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417084015.74154-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_190151_884340_1B8B2B3C 
X-CRM114-Status: UNSURE (   7.44  )
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

On Thu, Apr 17, 2025 at 09:40:15AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add a new MAINTAINERS entry for the Renesas RZ/V2H(P) DWMAC GBETH
> glue layer driver.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

