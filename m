Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DB6D0EE3D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 21:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+cBTRRQGE2v1BWrrSCYxS5xPces5KE3phitGCPEZc4=; b=IlqDv4UU8eddc98dCe/2QilwAh
	nwOUOWpcaXnZELUbks6oeBAeLrQQ+o3TO5p0kB0OKimOO2N1ONE2CIk6ZVmF8EhYP9O3cpQJLy/Qt
	Pen1t+NH9jMGHRnKCp2zZritI6FFWODZe8Vq+58LY/7C83D3kn5aDd8v2xCLOXS2tteX3jyQ7num5
	U/B/c3CwEwXthmeXEJUqKFwbuYaQOfgd0kE6Qmyi10oIssRptIVyu7LwUQmJI2jYV6uj+JYv+NOa2
	eCydJjTp3zAoiEBWNB0R9hX+7zqp/VJdqNz/IRTMVArrfYEIvg6KNZrj6dVgXbIJ8netpWtmVuNO4
	kC3VwoFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO0RW-0000000Dwzx-0cog;
	Tue, 25 Nov 2025 21:19:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO0RT-0000000Dwyx-3GAK;
	Tue, 25 Nov 2025 21:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=L+cBTRRQGE2v1BWrrSCYxS5xPces5KE3phitGCPEZc4=; b=Q/mIFDJAMg6Y7+Z5dFQdj64tcG
	ltB53b2q6U6LjaY/7cpwYah+1fOAlZ4o9o14KIlE8S00xYsIrfX3ZwiS2auSkYR+wlVc1UGyiJDTf
	UfaR9FTk/tzT12sqd7srC1aHe9B8pekZnE4oakLmwY3pNRKws7GOyWrqevIDLVwJj/7E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vO0RL-00F3Ks-GA; Tue, 25 Nov 2025 22:19:11 +0100
Date: Tue, 25 Nov 2025 22:19:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Subject: Re: [PATCH net-next 1/9] dt-bindings: phy: rename
 transmit-amplitude.yaml to phy-common-props.yaml
Message-ID: <0faccdb7-0934-4543-9b7f-a655a632fa86@lunn.ch>
References: <20251122193341.332324-1-vladimir.oltean@nxp.com>
 <20251122193341.332324-2-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122193341.332324-2-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_131919_839170_3CEA6DA0 
X-CRM114-Status: GOOD (  10.14  )
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

On Sat, Nov 22, 2025 at 09:33:33PM +0200, Vladimir Oltean wrote:
> I would like to add more properties similar to tx-p2p-microvolt, and I
> don't think it makes sense to create one schema for each such property
> (transmit-amplitude.yaml, lane-polarity.yaml, transmit-equalization.yaml
> etc).
> 
> Instead, let's rename to phy-common-props.yaml, which makes it a more
> adequate host schema for all the above properties.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  .../{transmit-amplitude.yaml => phy-common-props.yaml}    | 8 ++++----

So there is nothing currently referencing this file?

	Andrew

