Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A048C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 22:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlJwXZDre2Kk+1vsO1dzJECs6/pSAhWywGn7XDuB3qI=; b=LvE+vNwQ/9K15+xcbvoD9NtBm+
	DXh+oGC4ktKEfRxzZoZ0pwpqprW0tO6gPR+15d0fuXqvNSwL1UgDv78gUJoJ+f5TKBwGJ0Tc6fU9f
	TyZRV3L+X+zft4AwdYKHlOsrRjGkAdgvPaWfV8scNqG5zuQml0vv2jzLZIfawhLjMvrm+5ckMMWnY
	e4zKgumixe5q83NgdtJm7FTXC4dffYl3RvcM8kXhrf+9T6MGavHoOKJZlXO6Pnv7v/p11tNgl4+NW
	8U1W5IcFoHUB5s/KX/jRIwKYx+ASg6P7GHCWt2EwwRgvhX5g0iFlcfi+eLdMixEruA/5bYkbC5ESU
	UiNn2cWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqK3j-0000000CPm7-3CAJ;
	Thu, 06 Mar 2025 22:51:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqK26-0000000CPX0-3KSv;
	Thu, 06 Mar 2025 22:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OlJwXZDre2Kk+1vsO1dzJECs6/pSAhWywGn7XDuB3qI=; b=MFV5wupbvsv2saMwMnL+TF0RaJ
	3zPOwkn3qrNh4ewM/HT73s+A3JR+37/OHu1gYcvKzRbq9dFWH/prFLhoE9fTkl39O/1CIgFBXg6J7
	cDtI49/YakBfG6xH8kaqe1HD5+rfnJhTyJzWSoPmsCVikZYOI/gF0XPPo6hsnzmWXIS8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tqK1z-002wWm-DS; Thu, 06 Mar 2025 23:49:31 +0100
Date: Thu, 6 Mar 2025 23:49:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: Enable Ethernet controller on
 Radxa E20C
Message-ID: <e0e8fa5e-07a2-4f4f-80b9-ddb2332c27ea@lunn.ch>
References: <20250306221402.1704196-1-jonas@kwiboo.se>
 <20250306221402.1704196-5-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306221402.1704196-5-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_144938_831864_A05127AB 
X-CRM114-Status: UNSURE (   6.08  )
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

> +&mdio1 {
> +	rgmii_phy: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";

The compatible is not needed. That is the default.

	Andrew

