Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA2DD65551
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 19:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snKroQwtkypY8SdAmHkbYrAAMz7CQLXGWztiA4anALU=; b=qjYuEwaMeLpufbVuVkT6WbCrc1
	DUk+dhvcLDF9kD5Vkq4qebaPU5K/fRuppUIuJ16LZVyVR0b6OpTezBSRcWEo5xgvc3Xo3B4Pwdyhj
	Kutj++lDm9f7OSJ2Ue1fQDahABbevJ7eWjqvVzEOsT97BdLXO8Ol6VioHnLFyDcHwh5mrjQnlp2M2
	zxU/lNn0oKuXQg84puYh7plo05mi77qrbUDkrTm5Qx3fvs9c4zeUmfUxbYRqLrnIf6y6KOq7oXe0p
	Pxz04F8+dbjA0ayvZCRQ6Ie5Bq/3l9ECefCO99QCg1z7GKA+LrE2msFxgrAMrSkqbkCA5/XQtxBoR
	8QSbeK/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG1Bk-0000000BXmP-1W4e;
	Tue, 26 Nov 2024 19:25:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG1Am-0000000BXh2-2msZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 19:24:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=snKroQwtkypY8SdAmHkbYrAAMz7CQLXGWztiA4anALU=; b=ut329A+tI3avnKTDT9v25tw0Y1
	W4SBgQOyGBdvNGrWiPgUmzHTCs5JL317/ClnLgZrzZsdv3UAUzdYf2LAjTrxzC5Wxh2WB0TbwQxVA
	K/RXS44a8gmeHWiZE983yZfQtj6xkcnR6TdmHqlqI3StK5XZ9MKiE44y+O54/PYlSN2k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tG1AV-00EYHb-Hf; Tue, 26 Nov 2024 20:24:15 +0100
Date: Tue, 26 Nov 2024 20:24:15 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jason Hsu <jasonhell19@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au, patrick@stwcx.xyz,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	yang.chen@quantatw.com, jerry.lin@quantatw.com,
	Jason Hsu <jason-hsu@quantatw.com>
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: ventura: add Meta Ventura BMC
Message-ID: <160008e2-f480-49c3-994e-a498e74eee23@lunn.ch>
References: <20241126111817.2331577-1-jason-hsu@quantatw.com>
 <20241126111817.2331577-3-jason-hsu@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126111817.2331577-3-jason-hsu@quantatw.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_112432_700184_65488FC4 
X-CRM114-Status: UNSURE (   9.81  )
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

> +    // 88E6393X CONFIG FRU
> +	eeprom@50 {
> +		compatible = "atmel,24c64";
> +		reg = <0x50>;
> +	};

I just noticed this and it seems odd. MV88E6393X is a Marvell Ethernet
switch. It can have an eeprom, and if so, the mv88e6xxx driver will
export it via ethtool. It is not normally visible to Linux as an I2C
device, because it hangs off the switches I2C Bus.

Do you have some multi master going on?

I also don't see the switch itself here. I would expect it to be
listed in the MDIO node.

	Andrew

