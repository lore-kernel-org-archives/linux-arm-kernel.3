Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B21AC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pGhfX/4H3scf/HydnEYjfq1z6zKounijmYTLMLhC5E=; b=Sd2jXluaEqxEKEkWw/IQQno4Xu
	XCRDcY9oYR9eVOMMjzplRE07KcNSRi7f1RrTiXZoSvMh9OaRwNQAOwnxRYCpUvMa2M142PY7Sxas4
	GXVaR4XEHBSS99HnlN00mfGX+CxjQX6ZewRo/1N0brhN/Tmc2erUHi6sjNA3Qq5EObmhT0D+zjiGw
	cT8SkBuJGWJcTqf4TO3hDHW4myZaRZe5lBg07qjWp/I0cLCW4ZchD6WU5G8a5PSRDJaLrYii17udm
	XCBbjNUvrtX3wLY+yrOi9nHZZ3RpvkH3DusHnAmEY0KKqSdDAXQz8aXgSQxVm37DrbfYsujMcaIDF
	VRUlk1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eBS-0000000BPMZ-3CKJ;
	Wed, 23 Apr 2025 17:46:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7dRC-0000000BCa1-3vhX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 16:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+pGhfX/4H3scf/HydnEYjfq1z6zKounijmYTLMLhC5E=; b=n989T3S3GDIXGm1qZvGBeYMZus
	FFbkrtH8uTUC5JEGWWDg1gzaXJKpIm6WJL4xNXmsGG607YJy9Sp2XJvWYbYSJ+eTA6KLJDm+L9UsP
	YP9DGWt/OIbhPtQv9sfilbwMU7bSjlKGpijJY28Qhe1jNNoKo/3GIi2LLSDCk7AQOo0M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u7dQj-00AMSb-42; Wed, 23 Apr 2025 18:58:37 +0200
Date: Wed, 23 Apr 2025 18:58:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
Message-ID: <aa38baed-f528-4650-9e06-e7a76c25ec89@lunn.ch>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
 <20250423-01-sun55i-emac0-v1-4-46ee4c855e0a@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-01-sun55i-emac0-v1-4-46ee4c855e0a@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_095906_973952_AB1D4498 
X-CRM114-Status: UNSURE (   7.42  )
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

> +&emac0 {
> +	phy-mode = "rgmii";

Does the PCB have extra long clock lines in order to provide the
needed 2ns delay? I guess not, so this should be rgmii-id.

> +	phy-handle = <&ext_rgmii_phy>;
> +
> +	allwinner,tx-delay-ps = <300>;
> +	allwinner,rx-delay-ps = <400>;

These are rather low delays, since the standard requires 2ns. Anyway,
once you change phy-mode, you probably don't need these.

     Andrew

