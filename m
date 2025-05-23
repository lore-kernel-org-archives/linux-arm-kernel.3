Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9C1C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 16:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5oFqlzs/QpinLejGwTKxPxImZNfhcVenhovwsDfQr4=; b=EC1w4wJte8FV1NL0rLozj+Df9M
	L/8sIE30vyK9jLs4DVaCV0g6QyCkrhdVRHmbXJQq8JBYVsajN7ZBgIXjZ1WdZBo2TTPNEfC4LYLwf
	jmrJXtnP7YYfHz0nPb7By7ocUXEl9i9LCTVtiKzk59slITOt0sJeu6DxJN0WU+TPIFmrebo33U7RC
	pMgN8fKdico+i8lBE6jkehdZv4vUnGzLjWS2zPNBjDH6UWwX8Vc3h/HmlR2Uj2GJYB/hhCVTZIe5+
	A/kWwoWj6GatKFKgEyiCtZVZzd5TM582ZTjdvgIeWpEfpl+avrzAVl6kXeCXPVmguO3itxpIeR5QP
	aZTDtRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVgl-00000004T0q-3Js2;
	Fri, 23 May 2025 16:56:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUp6-00000004KbN-0CgU;
	Fri, 23 May 2025 16:00:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=X5oFqlzs/QpinLejGwTKxPxImZNfhcVenhovwsDfQr4=; b=evgfjHYg5vEyBoYU/MsKfflkPg
	B9p5WL3Izmf4IWiXuzogkVXtrR9PujOOLw7AaPMkE/RrBmo0sXXUwyg/+1h6fTCpUyneywbnokvhY
	jIPNMVSamNS33mSNiw55ss4HGWWOehe4BCALr5Nk1ijavXY6BkdixlWQ5HgnGOcYsrNcA1qyNQLbH
	m3+k7uh1XJCZgmg22gKfcsVE+GKm5/jT45M9bH3PA6IrghRHErcZ0wHynip2SwsNe8xEfelGWsOT2
	gEuDflPkTg/stu9IVk4LvJBsrGoWjbkkE/lJADOdEpUJzEytnpd1bvMZE43H5pvMaCHQ40hSgTRQh
	Hs+lrong==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIUp3-00000001Lk0-0viN;
	Fri, 23 May 2025 16:00:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=X5oFqlzs/QpinLejGwTKxPxImZNfhcVenhovwsDfQr4=; b=DtjbRj+qIPPssXo1BXXM3fPYD/
	iiJ5YaEAjvPMnIpQEUP3zONOCwkQ9jjpD9I+EoY2xb/lgpWcFDOiBS8cpjcMITBkK5T16MTsNI4hN
	dAw97qN0sgmtzHWyFbE8J7Tm/jnXwayvwasRXz4vR1UyEfHMfyxoqyyuoONON2gecy5c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uIUom-00DcwT-OV; Fri, 23 May 2025 18:00:20 +0200
Date: Fri, 23 May 2025 18:00:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH 2/3] net: dsa: mt7530: Add AN7583 support
Message-ID: <a4366913-2368-4d59-b3c0-4c534c9b2c4d@lunn.ch>
References: <20250522165313.6411-1-ansuelsmth@gmail.com>
 <20250522165313.6411-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522165313.6411-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_170037_405788_37760BCE 
X-CRM114-Status: UNSURE (   8.43  )
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

On Thu, May 22, 2025 at 06:53:10PM +0200, Christian Marangi wrote:
> Add Airoha AN7583 Switch support. This is based on Airoha EN7581 that is
> based on Mediatek MT7988 Switch.
> 
> Airoha AN7583 require additional tweak to the GEPHY_CONN_CFG register to
> make the internal PHY work.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

