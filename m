Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36205C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 07:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5en0Kaj+kw2e4lzOEeWUYL1+XRABVcsrt5UjiXRZbPk=; b=nlvWcNn7YMXJWuxL99zPzShUM6
	OQGWVt3xPz0KYuhqjEna2fSrYIyoTtzPC5YJzqh6fUha+cG1T1Q60/7VMwv9TqWYf9CgM97cqHW5g
	MVlTZn1DuZ3dUwabm4a2m5BbCqKUIKROj7irxL5pjyLSw89G4+AC5dguOfxCKHAWyniA3oAZo9HIH
	ToUZqzvKNuRkhp2hx1atHoBZQXQTrCQRSN6Mw/RQKQHpIEOf1ILZop5htz1F/Tgpfk01FnqLAEVJJ
	/FfNBRV++kAZWLYMj0D8KEOx+++7NiLE1RbkE/I2Gm+xBbJ6IhWmB2reY1ncifuVPZQ9eXaFLA+jg
	56aN77vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVQKB-0000000GWxi-0crb;
	Sat, 28 Jun 2025 07:50:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVQFq-0000000GWh1-2AG4;
	Sat, 28 Jun 2025 07:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5en0Kaj+kw2e4lzOEeWUYL1+XRABVcsrt5UjiXRZbPk=; b=uiBx9dcysLAijZ6nr9fHen0bEE
	zfOltBKotGihTWnKUTVBerCU1Sz99PVIEky+erLecvYEPiPSd/mCQu9pixz+7kdXU3VTChLRDdf9o
	iw8NR2TPfI1O8x0IbKiBA4Ljjmq60EpxRN/5bQpY9LCOK3R2NWb5Ypc0DGcFDUe88Oxo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uVQFc-00HDno-FP; Sat, 28 Jun 2025 09:45:28 +0200
Date: Sat, 28 Jun 2025 09:45:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>,
	Frank Wunderlich <frank-w@public-files.de>,
	Eric Woudstra <ericwouds@gmail.com>, Elad Yifee <eladwf@gmail.com>,
	Bo-Cun Chen <bc-bocun.chen@mediatek.com>,
	Sky Huang <skylake.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net/next 2/3] net: ethernet: mtk_eth_soc: fix kernel-doc
 comment
Message-ID: <bf7f8685-f51b-4b92-916d-96c1fa16fce7@lunn.ch>
References: <cover.1751072868.git.daniel@makrotopia.org>
 <00249671d424622e780f0dcafe6924f634b632ce.1751072868.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00249671d424622e780f0dcafe6924f634b632ce.1751072868.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_004542_550981_920D6BD0 
X-CRM114-Status: UNSURE (   8.28  )
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

On Sat, Jun 28, 2025 at 02:30:31AM +0100, Daniel Golle wrote:
> Fix and add some missing field descriptions to kernel-doc comment of
> struct mtk_eth.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

