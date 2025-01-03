Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5F1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 22:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nC4xRGziK9g9aVt6fSkQ1/i2c6tieWGRAMPkl5BbmQQ=; b=eXDq4HdGEdyC/zSVLk2YFa18Zk
	stdESO7cLe5LqxZHFHoQGuPzq1Z8S5Lgb4QpK0uVfmLybqEXWS217B7XpatfNsid4ho09Ha2evTVb
	TscLxv1JZHmYjVpFRp62XlZiMjOBSz3BXqNwT7nwIeJoGy3GBwpIZYcOs/7s+VHuC5lr0xKAexqvx
	wYEBItBjutycQrfrC1kwfqV4E/G2G92eWYVO8RGCCRInyS7TdA0vqpScva9Uy8YZh6okzMIhswcD8
	znzLIw4E4tZgsf3K0LHQtrFDN/ahnfXBNRdWCYL+nsfhFa0FZ9c6+t0kXChrOallVaPqqGxx+Oo4o
	2IgjWZzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTqRh-0000000E8s9-1jDy;
	Fri, 03 Jan 2025 22:47:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTqQ0-0000000E8hj-2bFc;
	Fri, 03 Jan 2025 22:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nC4xRGziK9g9aVt6fSkQ1/i2c6tieWGRAMPkl5BbmQQ=; b=0iXk5yj/N9X5BChmvUoExXBHij
	7nlr0oqp4aoFuCc+m92c6aDBPqBR+DgPwhvjnQ1puqPVQEKkXm4wSVtk1dCvzFbqzruEPpdAq8KWS
	+qjTPN9RIeiX8PG/phNYYSfA2HV+zWM5PiBQR5Z56DNS63bGI5dxUTERm9+Bj48OW+MQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tTqPn-001ACo-P8; Fri, 03 Jan 2025 23:45:11 +0100
Date: Fri, 3 Jan 2025 23:45:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 6/6] net: pcs: xpcs: make xpcs_get_interfaces()
 static
Message-ID: <7da95b85-f16e-4082-ae6b-12da27875750@lunn.ch>
References: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk>
 <E1tTffk-007Roi-JM@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tTffk-007Roi-JM@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_144524_659525_8A9AF897 
X-CRM114-Status: UNSURE (   7.14  )
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

On Fri, Jan 03, 2025 at 11:16:56AM +0000, Russell King (Oracle) wrote:
> xpcs_get_interfaces() should no longer be used outside of the XPCS
> code, so make it static.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

