Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6545DC55182
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 02:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IsQlcnApQ5yTWyBgwu7AHLGT/eRyiK29Qhu3u+8huV4=; b=MhWeQFrG+0bPwTTOblKvnJTqgT
	HUCldHBeDr4uLTVUOa8ELhlymj8xvex9Vv3y3gxu6KmkCl3rlgcJl8MKoUV8FfafiZCJ3ZcQB2SCe
	bN/tNtBJ/N4tN6Bw9DbZhsqk2R3E+QjLY5cSnUwobIlPzjEpyUe7LRffVcRzQBHFIJz+mhxQTuYX1
	U8t2iphGT94HO4xKhM3NcGzpRAJ57MB9KmgFxU8w8ZWRMup7WPLp1w2UonEyLLWuzpHQbco/aIDCb
	zvQFrte1a1SjRBBBs4XSivkggSXaqX/Mh1Bq1Sf2V5DaC0oiwox1KcLzTGeijqHbU6V2Y4FASIiGS
	C3RAeftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5Ht-00000000sZO-1aPT;
	Tue, 04 Aug 2026 02:53:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5Hr-00000000sYp-21DN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 02:53:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IsQlcnApQ5yTWyBgwu7AHLGT/eRyiK29Qhu3u+8huV4=; b=lFwn2scVNrt3frs61Y32q/dVdQ
	/Ay4Nl2OSJFbIYdlwGBFlnZUFGT6DhGTu3i0EIZVxMmk8oBJFrzoMLox/mXYrwl+l8PRQ8Ab5bxp2
	IAdHGSUeXArMVxHWQaPLiWeF4zNCi+iK9tm84N2Vo04Wn4xjFbcLFI7PZrczeXsy61QY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wr5Hd-00Fto4-KL; Tue, 04 Aug 2026 04:53:37 +0200
Date: Tue, 4 Aug 2026 04:53:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Liu Changjie <liucj1228@outlook.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/6] arm64: dts: allwinner: a523: x96qpro+: enable
 Ethernet support
Message-ID: <ad2e46d5-53db-49b2-a128-7c54883e18eb@lunn.ch>
References: <20260803101452.2993721-1-andre.przywara@arm.com>
 <20260803101452.2993721-7-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803101452.2993721-7-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_195351_520320_F0C17F48 
X-CRM114-Status: UNSURE (   7.82  )
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

> +&gmac1 {
> +	clocks = <&ccu CLK_BUS_EMAC1>, <&ccu CLK_MBUS_EMAC1>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&rgmii1_pins>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ext_rgmii_phy>;
> +	phy-supply = <&reg_cldo3>;
> +
> +	tx-internal-delay-ps = <200>;
> +	rx-internal-delay-ps = <500>;

500ns is quite big. How did you come to this value? Do you have the
schematic & gerber files? Does the lines look unbalanced?

	Andrew

