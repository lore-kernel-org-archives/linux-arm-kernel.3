Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B856C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 17:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhQ4l2+cyVz4qYYRQyEBluzLAA23BL1k/prf+814iEE=; b=fPirZtLno1HhBkz2MeCTGi8UPb
	aN1OLuFmTIhdcgGbHD1viiFs+8uneHLwlyDOy0gnnGuBpot5Z0bwP/mMdRWO+e2o+wQhlsyV0qRal
	8un1xK3kiiBpIw/nUC5i1husnHf8iXS2DVqLplSMPjsJMqhOO9sSLfotplqHuHCiOUp9uD4Qs8kxE
	kR2vApt6p/3Ft/sDbLlFpdZbt61CtUrxmAVkjIJklxqQGjJw+he9BCwkOkf6bPUL67iyOYCVLA6+B
	jOllg8wEaSD05vXLmxi0MeWdH1/Cxrc3TNWQ4qV12EsQTOUBYqrMppmOrdEuQnMmkNzqEu4TlPG7a
	5/MlLjVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEer-00000005PNX-00lo;
	Fri, 10 Jul 2026 17:05:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEeo-00000005PMd-3Xuw;
	Fri, 10 Jul 2026 17:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BhQ4l2+cyVz4qYYRQyEBluzLAA23BL1k/prf+814iEE=; b=XjAGBKExUwbsVqwG/f5+OGLGmH
	bQXANm3QV571r9HJmwRZsJI5e/cGP/ZBgmJgkxLJbz+Loe3NmwIbI3UOHody6LRdRLnC+rkTiJFLL
	ed7stZT8qmPyZP+YyFpTtZOA7dwS9Jqy95dR/O050PPp2wEelZb1f3jhZzNrWGV2tv5g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wiEeT-00Bfpf-9k; Fri, 10 Jul 2026 19:04:37 +0200
Date: Fri, 10 Jul 2026 19:04:37 +0200
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
Message-ID: <60bd1e79-3914-4814-976c-b8aa2b006a36@lunn.ch>
References: <cover.1783680864.git.naseefkm@gmail.com>
 <1865eaedef97e593ba608764c7390209cae85b30.1783680864.git.naseefkm@gmail.com>
 <f968d3fe-83dc-4b82-972b-0d4d477a1a52@lunn.ch>
 <alEktKWsrriHdR40@DESKTOP-TIT0J8O.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alEktKWsrriHdR40@DESKTOP-TIT0J8O.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_100458_881433_7E0A9D6F 
X-CRM114-Status: UNSURE (   8.11  )
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

> My plan for v2 is to not advertise lpi_capabilities for the EN7528, so
> mac_supports_eee stays false by design and phylink disables EEE on
> these PHYs via phy_disable_eee() and refuses to enable it from
> userspace. Does that sound like the right approach to you, or would
> you prefer it handled differently?

That sounds like the correct thing to do.

     Andrew

