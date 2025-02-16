Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E900C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 16:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9iGUSJ3ng3saazA3eH7xbtGqjW36iAkpX0N9GsxsH0=; b=y4Ft3uG+LLq3FaYZDvSVn5kxXX
	qpuO5sK9S1bVS6uflw8jaVCYHTfZAFUNR7oyuplVC0AEpY9dYh/SyGvI25N0Crd1oH5oW2+bZyuy4
	AqoPKnGOfqTp7ObBMzZFRva/eAblMQYf+UBK/7ANoyXC9iol/QxoTE7Pmc7kKXb/AZkAG/RQOGMv1
	ZB/Sb54F0SZbhcKaYi3tgV+GY4pUgVmxmWF7MSGF9dWCQgcT8yd4XNf9BE2ZMDofZljJIXC7bv1Xp
	oVtjfpqBiv/4WH1+ILjJJsJ94Nm6IU35iQVzsE/p8fUBUW/VNK9HyV7Y395ZvB85JdGw/910V2Knt
	/XXc0jew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjhr3-00000002AWa-3psD;
	Sun, 16 Feb 2025 16:50:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjhol-00000002A63-0XOG;
	Sun, 16 Feb 2025 16:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=W9iGUSJ3ng3saazA3eH7xbtGqjW36iAkpX0N9GsxsH0=; b=CjAX5t/wn7I13nrR/DJozEaX5J
	9uVUbiR7NCiIGFM/nonWXHf/BgmCoFNfe5JqFZ6Z/hDyezEpfmDNI6xtawyahWElwCI+NcC6W3qYn
	mrfYv00xUNz0RPkpvlvQogLKe2bla3FuKUaC43VAgU6i94iFUiNvj/8k0BH2+OKZ/JI8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tjhoZ-00Ehkc-T4; Sun, 16 Feb 2025 17:48:19 +0100
Date: Sun, 16 Feb 2025 17:48:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v2 1/5] net: phy: mediatek: Change to more
 meaningful macros
Message-ID: <f3d4758c-fc84-4ffd-a48c-7ad5a5a07849@lunn.ch>
References: <20250213080553.921434-1-SkyLake.Huang@mediatek.com>
 <20250213080553.921434-2-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213080553.921434-2-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_084831_182103_645E79F8 
X-CRM114-Status: UNSURE (   6.93  )
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

On Thu, Feb 13, 2025 at 04:05:49PM +0800, Sky Huang wrote:
> From: Sky Huang <skylake.huang@mediatek.com>
> 
> Replace magic number with more meaningful macros in mtk-ge.c.
> Also, move some common macros into mtk-phy-lib.c.
> 
> Signed-off-by: Sky Huang <skylake.huang@mediatek.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

