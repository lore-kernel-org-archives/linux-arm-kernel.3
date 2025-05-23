Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD10C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 16:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdvIcKQd1IkP3xa1CEkOeOoIL3VkDPilYeAIguAX1X8=; b=xgQuYTaqZeesYafzrDS6F66/1C
	QlqSCOigbIoELCfdF70XwfusikTYWDlrF/5iye3iqdX0DhJJW5fIHhcNpL97UAl11FOKEvpY64LMr
	fB9jvokrDYaMRc/BPrE0AupF+JPzO7/5Z/piVPXcz8s9upJB5+V6y16WAzWPY3gj8RAzj0AL1EsXN
	Pf/N7kScgaj4s1dB8/lP9Z0KUaATAWtMatBmMBmwcKQe8mqh7klUuujk24FzPP9MZq0tcoTQSRuUU
	aMXOwioBPjW6VD3W/XeuWxJf9i09VV5mhq+mgwm+p+Ajm2Gn3MMGMdY13jzGO+YUf40ARdcrndv8q
	CSxBGyaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVek-00000004SpF-0Wvn;
	Fri, 23 May 2025 16:54:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUnL-00000004KHK-22xJ;
	Fri, 23 May 2025 15:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XdvIcKQd1IkP3xa1CEkOeOoIL3VkDPilYeAIguAX1X8=; b=FulBu/7BCJKhsMSeyJiPBPCtoH
	QWJAmqIxZ+MAVd5nzwH7ZN0fveBi7V0f5p8eAEVKwATY+sWmrgSPuzbWqV1AcuM3bv5TVNIwL30Az
	IyAYaWcge5QNvdMkXvJJoWHTycyPFZyg00ZuV+5tdqDDZq2lk0r/ZbFslq/u0jY2expo417BMBG32
	uRLvfy3CMNi75xS2WLc+IuSzLGYDAmM0yRmjgqMxOO+Zq6FcGypqMH+4QtiIi7KMBAv8VEWSbcfj5
	jhi4ekxj25z75rNbQQosNODP0/iRKDhYuCERsPgeCxhcNfkGhTnbPRBGniTTSfCwEp8f28i1lH7un
	E8WBaX5A==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIUnI-00000001LgV-2D0i;
	Fri, 23 May 2025 15:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XdvIcKQd1IkP3xa1CEkOeOoIL3VkDPilYeAIguAX1X8=; b=nvI4EXjGQKq4lgJBmY2tuKCEHS
	3p6ciK9IEqxQR3P/xPsz07KsZbvrwvvi1bqTdr+4ACGm9+0QhgS4dm0BJe7V+Q7xiMmXo8VwyVmkv
	I/BM0Y/Hz+m0ykysHCe/yN36972WYJp+ierJttO2XNn2I03SirZoYHZtftRx9xvhmA3s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uIUmq-00DcuR-2y; Fri, 23 May 2025 17:58:20 +0200
Date: Fri, 23 May 2025 17:58:20 +0200
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
Subject: Re: [net-next PATCH 3/3] net: phy: mediatek: Add Airoha AN7583 PHY
 support
Message-ID: <879d0fed-37e7-43b0-9dab-4a20b65c6d75@lunn.ch>
References: <20250522165313.6411-1-ansuelsmth@gmail.com>
 <20250522165313.6411-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522165313.6411-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_165848_663962_21FAA546 
X-CRM114-Status: UNSURE (   8.17  )
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

On Thu, May 22, 2025 at 06:53:11PM +0200, Christian Marangi wrote:
> Add Airoha AN7583 PHY support based on Airoha AN7581 with the small
> difference that BMCR_PDOWN is enabled by default and needs to be cleared
> to make the internal PHY correctly work.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

