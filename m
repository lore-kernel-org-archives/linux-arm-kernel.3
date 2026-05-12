Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32CFCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 18:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WDbnRCHLFMZ6i6H4Zt/0Gy4jkd8hmSy2ikld2vqGyw=; b=lSrIGMBHwWmarcd/QBFIeLYejV
	NTVYuySz00cIDFiuugLy/7S4UWd7Xr8E1hUwYQK9SuDw4Z/pADXaCMpgKszpE2JlqqWQzvtxwr1oH
	DePyHeWQPXqE3oTu+i5XxqAG+KiENO/4PmGbe+xPxvhweVPcJO1Fs3CZiI+PUWipUExtOmgl6HCtO
	/8X9CeAnY/G6sb6epKxUlN/7RwOmSlRV1UNoW/SnHNBJ0l8he6QvMWqbO54D0KOYLWGkTpjk/RKR5
	sSiDLNlkVKODOR/aGGnR4j0NFBXp1Szco2uVNeLHi2T1r0YFWdhjP1UMygO8teoVGk/IFU+X6JA6C
	O+9qWJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMrxa-000000006oM-3Jj6;
	Tue, 12 May 2026 18:36:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMrxY-000000006nM-1YFD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 18:36:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+WDbnRCHLFMZ6i6H4Zt/0Gy4jkd8hmSy2ikld2vqGyw=; b=nV2d+QLp3RrNtrhdA34wuJcAwM
	gs/9x/bxhYD/Wg/yRraDtqj4Q+4emUAjwDF9PmAkBgW0dy9W90F5SfnyYxnp8fSnPZUmOSszRwCt9
	LDbLbt8dm7uT/NAyVbD0hQ5zBA0aH/dWcwSyDM6kc8EMWb5JSx0ukeFDsQ/1YARecg64=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wMrxA-002bMi-Po; Tue, 12 May 2026 20:35:36 +0200
Date: Tue, 12 May 2026 20:35:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Message-ID: <5427ff70-4676-412d-8294-da5743c736a7@lunn.ch>
References: <20260512175019.47548-1-prasanth.padarthi10@gmail.com>
 <20260512175019.47548-3-prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512175019.47548-3-prasanth.padarthi10@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_113600_413948_07E6ADEF 
X-CRM114-Status: UNSURE (   6.58  )
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

> +/* Dedicated Management LAN */
> +&mac0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;

What does this connect to? A PHY? NCSI?

     Andrew

