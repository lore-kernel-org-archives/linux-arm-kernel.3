Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC83EC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 23:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Un0+1ftM5WRDevFf0RglkkUzK/GEGJ7mZMlQpvr5d4=; b=oB0UqrCXqkS0SxsKvniH5lu5Ln
	I9YwSUsLCwPjdEkVtnucuMBZAQanigm+6FQKJc6v0X5/ki6iEh2fOcJqImoIeZk27i5pPaiwwq6Zm
	noZmdo3OxmNUt2IUjVbU/iigcOqJxIuIxjA9mSoNbGxhdONUy1DaQUHI2ksEfvkbQlNWM4AdSXXXy
	Nqj3BOw+omqobp0yDh5ufzeWwSnPTxKMHrFqgvLD/YJss8pFKqyqZFm/kvUX02BiuBSnx2cUpwqkk
	YUOqyHUPQJH6/fE+dN4W8VkjcomUaNumaTzefMSCfL6B38uLp4lR0g4xwSpdtWc8v1A3m3p2/s1jU
	GsUJzgag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJPb-00000005ppZ-3deO;
	Mon, 16 Jun 2025 23:38:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJLv-00000005pQD-2Uy5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 23:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3Un0+1ftM5WRDevFf0RglkkUzK/GEGJ7mZMlQpvr5d4=; b=shsnZ0gblK/6NNim4BRE3Qat8l
	S+foVhF9x2p5hrnudDOu3/47ZX/MyR8FIwM6uUA+Pp6IMvxWcBrDRHH3u0FpBAms1i7z/6hqv/PuZ
	DP/cFv2nC13B3z4ZyexETRX8zFLwZDmdeQ0Qnt6C0g09DHZrdYGxqPldFkXtNE0+425I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uRJLq-00G6Ta-7Y; Tue, 17 Jun 2025 01:34:54 +0200
Date: Tue, 17 Jun 2025 01:34:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 3/4] net: stmmac: visconti: clean up code
 formatting
Message-ID: <eb9cf1c9-e03e-4fe0-886f-08fcb349b003@lunn.ch>
References: <aFCHJWXSLbUoogi6@shell.armlinux.org.uk>
 <E1uRH2B-004UyS-Ch@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uRH2B-004UyS-Ch@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_163459_630570_D3BD2744 
X-CRM114-Status: UNSURE (   6.41  )
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

On Mon, Jun 16, 2025 at 10:06:27PM +0100, Russell King (Oracle) wrote:
> Ensure that code is wrapped prior to column 80, and shorten the
> needlessly long "clk_sel_val" to just "clk_sel".
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

