Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36247C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 13:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKWNcIAQGuJxJqjktfh3JBfLdnAx0v5jAErj9hzJok0=; b=xW5lqTqW+OLTt3qu+z+7FVhLFw
	B4NB9Gs7om0XrR47WUR7FiSrNdMjzbWeMT0ux+lyN33O1Q3G8bm91irYLeT8ODlZD9DUoNEQM+BzL
	OQzYDkxT3fcTvolYcuODy7QwivCir/E6JWkknF9qJpLoBwgvlLXeN4CrimuM6GGQH+95nfixfbWc2
	Tcmil8fc7a7kp6b1RwsRHHuuTl7Cp+uJqRhWL6cTqjVMELb97lsI9yg5caSf3eeM3Nw1zcMKauIaZ
	VKEuOKmjGNVBtKlcOGOEEu4B9lQhFrxLZydkB66foDxUykR+mYOg/PTtJZicT50UQ9g9FjtyPQcyM
	dsxEQSVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBLm-0000000518w-10fc;
	Fri, 10 Jul 2026 13:33:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBLj-0000000517S-0xSI;
	Fri, 10 Jul 2026 13:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jKWNcIAQGuJxJqjktfh3JBfLdnAx0v5jAErj9hzJok0=; b=pviEuWzMz/soHvvFsu7OpxGL8K
	biUVZMutQp9mZ+SyP0VgJxgHbMQSaPTrzMiMRHjjQyxSBAtabLHqgb3P9HfoVmgcfQbFL7eqtudEp
	LXBTUeuKJsF9QJk+4IFD5ip/TNPftP41EssGgjean6lw3kyEycN3pC6ELGQGv0uQO3/8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wiBLE-00Be7o-Bh; Fri, 10 Jul 2026 15:32:32 +0200
Date: Fri, 10 Jul 2026 15:32:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: netdev@vger.kernel.org,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	"David S. Miller" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Vladimir Oltean <olteanv@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 2/2] net: dsa: mt7530: add EN7528 support
Message-ID: <f968d3fe-83dc-4b82-972b-0d4d477a1a52@lunn.ch>
References: <cover.1783680864.git.naseefkm@gmail.com>
 <1865eaedef97e593ba608764c7390209cae85b30.1783680864.git.naseefkm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1865eaedef97e593ba608764c7390209cae85b30.1783680864.git.naseefkm@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_063303_266220_AFA419B0 
X-CRM114-Status: UNSURE (   9.12  )
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

> +	/* The EN7528 LAN GPHYs advertise EEE by default, but negotiating EEE
> +	 * with common link partners (e.g. Realtek GbE NICs) results in an
> +	 * unstable link with dropped frames. Disable EEE advertisement on
> +	 * them.
> +	 */
> +	if (priv->id == ID_EN7528)
> +		for (i = EN7528_GPHY_BASE;
> +		     i < EN7528_GPHY_BASE + EN7528_NUM_GPHYS; i++)
> +			mt7531_ind_c45_phy_write(priv, i, MDIO_MMD_AN,
> +						 MDIO_AN_EEE_ADV, 0);
> +

The problem with this is, you can still use ethtool to enable EEE.

Please look at phylink_bringup_phy(), where it calls
phy_disable_eee().

    Andrew

---
pw-bot: cr

