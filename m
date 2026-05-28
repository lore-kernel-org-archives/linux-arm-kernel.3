Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8640ECD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 01:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXsePR+h/9s6oQ0vf99Byt+KAKcUxCsDa2eRWuUa1dw=; b=RX/l7kE3zfbD2ZbxSA7IWHNQwW
	jmR7NCPRLmeARz/MutB1wdZWHskXD+oESliLyL9loF+dCqzSXo+hJm8pj9tZnivMr7IfCCjBYixM1
	Zi/NbDE19U663L7910zB2bLGLQzRK3eW0BG/7s6E4XcE2e7yNReQZ4lUkUFREE4mUsUu5PcOg0VEr
	BAwzpBjgXV87Vt/0pCnHsWVa2VUVgI6Kwln+CDZ82YvG2GUrBEjSu0FFJ9NG5bK+rhOvCNx7fDMHT
	j0TxxV0GbgOPyAW/B7P8XMQevOWhPQYy+7M7pnXPWNLxzB9XysafiQVK/OP128v5JhNkbtCnc0Q97
	Cv/+QzGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSPZ4-00000004wVJ-2S8K;
	Thu, 28 May 2026 01:29:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSPZ2-00000004wUG-1zio;
	Thu, 28 May 2026 01:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=FXsePR+h/9s6oQ0vf99Byt+KAKcUxCsDa2eRWuUa1dw=; b=c6HvHKpvDTNVqu8NLCMNHlPf6z
	/2UD71RSAH/TF8qZepSoEaQxkHa7BMa0kaFk4wvbBxGAPkLNbKdroOb8TQY8RiApWOe4rM+/spa+E
	0H+Cu2CVaFR0Qxrwoi/Ak82OmFgUaPMb0DY+R0KPNA8ZXWPSPH04VMYQrxosKYdijm3c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wSPYm-004pyX-9w; Thu, 28 May 2026 03:29:20 +0200
Date: Thu, 28 May 2026 03:29:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, kevin-kw.huang@airoha.com,
	macpaul.lin@mediatek.com, matthias.bgg@gmail.com,
	kernel@collabora.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 5/6] net: phy: Introduce Airoha AN8801R
 Gigabit Ethernet PHY driver
Message-ID: <28727381-e56e-4d42-9f54-e7905fb2dff0@lunn.ch>
References: <20260526-add-airoha-an8801-support-v5-0-01aea8dee69b@collabora.com>
 <20260526-add-airoha-an8801-support-v5-5-01aea8dee69b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-add-airoha-an8801-support-v5-5-01aea8dee69b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_182936_511994_F2E0EFDF 
X-CRM114-Status: UNSURE (   8.51  )
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

On Tue, May 26, 2026 at 04:58:10PM +0200, Louis-Alexis Eyraud wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Introduce a driver for the Airoha AN8801R Series Gigabit Ethernet
> PHY; this currently supports setting up PHY LEDs, 10/100M, 1000M
> speeds, and Wake on LAN and PHY interrupts.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

