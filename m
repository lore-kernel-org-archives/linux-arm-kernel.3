Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F860D5D68A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 19:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Og9wlVgM0BRB/j4S7Y/C7oTbSr+qBDG27Kjm/ghy3Ok=; b=QOo5yi5i5Pq4QPEw/CTb13RAcg
	Y5wgy8FfDtxG2njXoiBkktUOSSt4z1dzqzQ7CO17JB4ZhuruFbXf/Y5d4o0GGNNRyFg61Og1rwWif
	80gUpRVjOK36/C8avV3lyXWVYLMQ1wu565/Nnci5TC5bojyr5I6d3mDEYtneBrTj4xnU18grASeCd
	JKS7D7z1CTJh4V4hPJ6FOFGptkEtBaG7D7TtMx3ypU7Lg7xL8vkX8RHUf6RkjY3i1WQGtmzqNaUZ4
	dCgk+VJTUHFhgiUsOe9WazWjO7ADW7KtrS9+aPYqbOIBuXRPmQ1GHNy4w8cverCXUxaJdjxBPLlJA
	HBFHfouA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t98c2-00000008A5p-0M4H;
	Thu, 07 Nov 2024 19:56:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t98JE-00000008691-0Iul;
	Thu, 07 Nov 2024 19:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Og9wlVgM0BRB/j4S7Y/C7oTbSr+qBDG27Kjm/ghy3Ok=; b=LQU8o3dXx5z9lZiPBXtlL/1gzl
	yemHNPGMs6a+zViyFH+wxslUR8myQcH8aI0ArJ9yXMfMxtm39gQpQrmj1pDqErBqTrlvwnuyBnGCh
	BZOBNb5stNeRXrEHkJGLcp++t1sGOcf8uta7/5YZ+tObpjrfGQxZtvjpOF5/R7mcNhrk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t98J1-00CV5w-6i; Thu, 07 Nov 2024 20:36:35 +0100
Date: Thu, 7 Nov 2024 20:36:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
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
	"AngeloGioacchino Del Regno," <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v3 2/3] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <75495b79-65fb-4a70-a937-36f969280ce6@lunn.ch>
References: <20241106122254.13228-1-ansuelsmth@gmail.com>
 <20241106122254.13228-3-ansuelsmth@gmail.com>
 <4318897e-0f1a-42c7-8f20-065dc690a112@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4318897e-0f1a-42c7-8f20-065dc690a112@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_113648_145250_863A419D 
X-CRM114-Status: UNSURE (   8.08  )
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

> > +enum an8855_stp_state {
> > +	AN8855_STP_DISABLED = 0,
> > +	AN8855_STP_BLOCKING = 1,
> > +	AN8855_STP_LISTENING = 1,
> 
> Just wondering if this 0, 1, *1*, 2, 3 was intentional?

There are some devices which don't differentiate between blocking and
listening.  If this is true, then maybe:

+enum an8855_stp_state {
+	AN8855_STP_DISABLED = 0,
+	AN8855_STP_BLOCKING = 1,
+	AN8855_STP_LISTENING = AN8855_STP_BLOCKING,

Which saves a comment.

	Andrew

