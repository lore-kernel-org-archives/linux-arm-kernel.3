Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C859E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiIlk/FEAmgdvplpgvduA7wwa6KAo49gIMe+ijciV2U=; b=K6G03l0i+FUYLVm4yTtQuzExJk
	/GP6H0feieN7kexC6OWdnrmiwI7OtiOXjgxyDi+KupCr7G8C5IP0veipsjTGwmreG85OC8RTmZSeC
	dWFB0LMx1qFi/NB3q7vhE6NSByHTgAh2Vm7vGyaQc/V/bC2uxJrvXGzP2f1NQBd3APzj24+O6FRS1
	5+vWqprvGwaI7QVAICnV9o7ePO2EjQmVo0wvnmxr7C23HLfvyB7s+q/nlfCrY2C1oPoRTUOmShDzC
	ALzx0XsO23JqlG9KPA3GitxENHUipsyLvgeUAUsjlUop1HxivVuw92UVSOyTnlDP6D196bxZRohnn
	+6iuTg2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrd4-0000000D3Bc-3sKW;
	Wed, 04 Dec 2024 15:49:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrc4-0000000D305-1jgJ;
	Wed, 04 Dec 2024 15:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=SiIlk/FEAmgdvplpgvduA7wwa6KAo49gIMe+ijciV2U=; b=wXP9JVK9S2ioX6EyNKlr+dmzS2
	mYdH7i78kdizKRgc569heQlzOBvygoPMqcAGtglYh2BU1jAyFbSoyTRiTNFOQZ+kgPXAYqFg3e5MQ
	jIBNm2/yl7xysLVtzrkB52We+Lvbpk+86HPRefEsEN+L+0h3RHD7qia5oyMpxDtoXLqk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIrbt-00FE2Z-5y; Wed, 04 Dec 2024 16:48:17 +0100
Date: Wed, 4 Dec 2024 16:48:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v8 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <af078f6a-08ba-4a68-ae54-2d49a59ce1bb@lunn.ch>
References: <20241204072427.17778-1-ansuelsmth@gmail.com>
 <20241204072427.17778-4-ansuelsmth@gmail.com>
 <20241204100922.0af25d7e@fedora.home>
 <67501d7b.050a0220.3390ac.353c@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67501d7b.050a0220.3390ac.353c@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_074828_455010_F4710D8F 
X-CRM114-Status: UNSURE (   9.05  )
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

> Added 5000 as this is present in documentation bits but CPU can only go
> up to 2.5. Should I drop it? Idea was to futureproof it since it really
> seems they added these bits with the intention of having a newer switch
> with more advanced ports.

The other way to future proof this is to have a dev_err() and
-EINVAL. Testing will then quickly find any missing places in the
code.

	Andrew

