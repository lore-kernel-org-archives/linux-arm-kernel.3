Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F67CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 17:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5F5crbl5PXGRN0zWCBy1QeKvlywUYTj3rLQO8PeMZ4=; b=nKJmML8J5OdLqaYE0GjFhvM94h
	R5TY9mBLU21ePemDEVX+0S/vXT1Sc6MiliaDHOwnTvO1wRIx/GnjfUCGP6txhso8PjQzoiyeqykHP
	NIiLlU16Xyzrz9F+wvvOYwTFipb4V9kFThS6b6+Y42U1BzQ0Pv60jyptuW7Gce9HS3dAMNIjv06u8
	jARJsUBUuiRLNklIGZ6WaKZGhkEjO6lINOuRru9+QdhK73z2BYmbi0UshL9Wu8ytLfpS6WrjkMOgE
	oIumVBAiut5DGNbc6D1JcOQQg2UdhJtHPjBGKHLxL2a8NbQASrTh5CSGqude5+S30QS+XqPeSSE5p
	fdnjIPOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHn5V-00000003LSB-2r5L;
	Sat, 08 Nov 2025 17:50:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHn5T-00000003LRn-2lG7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 17:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=w5F5crbl5PXGRN0zWCBy1QeKvlywUYTj3rLQO8PeMZ4=; b=E/8+gc3yS2jjfM0yGN//wqd4Vo
	PzfTOGt41E1l80JdPzTOxWi1zLCYFAlGK7oyy6ly4WlhemKdvNxLhDEu2u78id1YVT4ZesuIEtbKn
	dmxlFxLBSyEpDaoXePzGt3nj1QFcF7nOSpU/VxmU1ZSCcmb6Sh0zaK3Ln+Nvj1y1nDtY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vHn5H-00DOZW-2W; Sat, 08 Nov 2025 18:50:43 +0100
Date: Sat, 8 Nov 2025 18:50:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marc Olberding <molberding@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dts: aspeed: Add a dts for the nvidia msx4 hpm
Message-ID: <21b57a52-040b-4376-8ac0-6abdbc8d43c6@lunn.ch>
References: <20251107-msx1_devicetree-v2-0-6e36eb878db2@nvidia.com>
 <20251107-msx1_devicetree-v2-2-6e36eb878db2@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-msx1_devicetree-v2-2-6e36eb878db2@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_095055_699860_FEBB9FB2 
X-CRM114-Status: GOOD (  12.35  )
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

> +&mac0 {
> +	// bootloader takes care of proper mac delays for now.
> +	// set the phy mode to rgmii, and if/when the driver is
> +	// fixed, we can make the switchover to rgmii-id
> +	// and have the phy handle the delays.
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy3>;
> +	status = "okay";
> +};

There is some progress being made on this at the moment. So please
just drop this node for the moment. You can add the correct node once
the MAC driver is fixed.

	Andrew

