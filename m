Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF33E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPozk7f2ck1lekTyYQRxycAO00Td6kCk3wOh3bU6cO4=; b=K+zgeMgLBNGqZD52mhJwJtCjPX
	ZK8smBQ7rBB5Z7Nj9JicxuW/advHDDVIm8hOnV4CiEIDuOm9ZmAFu2DESiOloJM49VoWsMj7eccli
	+3AnmXgD2JiDyHI3RKw9XKaXaaFLv+tNJU+3s590FKJ0J8zyjZ7dp4Od1CoKCushjdVD3li2WxCqM
	LluDi1+mWuqCK7beKbr2ZKVPHVdSz5BxrRsVhij3lm6jGN8R7uoQVYbaDc8esvrCmrh8YBprQ2N9Z
	KpQEi3RM/xYCMOx8T+HdYo6Zy1bVkbvHYxgtJArWeG8jdoROY7U1rWyEo1Ic1EVMzsMsph7F6vpz3
	ctctO6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9pS-000000052J2-3ks6;
	Tue, 07 Jan 2025 13:41:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9oC-0000000528a-3w34
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 13:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DPozk7f2ck1lekTyYQRxycAO00Td6kCk3wOh3bU6cO4=; b=M1ZAgJtndU1q5MC64JZ16ox9ak
	AZQZHJrhWTtBHgy930N2oaZiUwaukNGEmE+JgaqnSySdpI3hvC+mob32gUCqYws2w940neX/sy+zZ
	18mnFrmshJ0YZUJFUI7hG2yAGJJ1YmA/YRGrWv8n0HvSKgnkBSqZI4tObIfUXSHzZETc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tV9o9-002F7p-8S; Tue, 07 Jan 2025 14:39:45 +0100
Date: Tue, 7 Jan 2025 14:39:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v2] net: stmmac: Unexport stmmac_rx_offset()
 from stmmac.h
Message-ID: <0c190dac-dc97-404c-94e6-7a950dcfc8b7@lunn.ch>
References: <20250107075448.4039925-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107075448.4039925-1-0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_053950_059044_80445AC8 
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

On Tue, Jan 07, 2025 at 03:54:48PM +0800, Furong Xu wrote:
> stmmac_rx_offset() is referenced in stmmac_main.c only,
> let's move it to stmmac_main.c.
> 
> Drop the inline keyword by the way, it is better to let the compiler
> to decide.
> 
> Compile tested only.
> No functional change intended.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

