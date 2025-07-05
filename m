Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1773EC83030
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 15:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxRaCG1X7LiYWlk995M+Piqie6DvkdIvQz3SJFMxuqY=; b=cNi9Tho6uiOwA7W8iCkcq+xbM8
	wSc9ijlI4FILrQKXCIRoKs/WP/ITXC4IlOSiXu+WEpLOMhfC1CTlpRv6mUJ6bS6+WzSyCHYbMA2xI
	WBkI+jZGwOPmVQ+gPiYJcG7rXjxl9BSD7/BKuVHrYUmSkNIBoLKNM9Cev8kuHNO+TduoXjcKhaVi8
	9AE6HAMBJnxZNvQbdIhKXxQUT3nDwOyJf4T6MDo81NJ46gLzboZG+ANVXZ0GjLkaZYocMvlNVyAoB
	n3BEimf0A28vSE2C7IZLufs1C83XvoOcVAkZxlIe2rABxMe9sz+axjmG6CCiEwleFjZ0SbamFcFyi
	7vpMlF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY5D4-0000000GjWx-1DrY;
	Sat, 05 Jul 2025 15:53:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY5Al-0000000GjKO-0rqm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 15:51:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HxRaCG1X7LiYWlk995M+Piqie6DvkdIvQz3SJFMxuqY=; b=dMcCa3MurUM2DjZP9e8YTUhqVk
	x8x/Ywpva/nD7YwqLLH8grBJ4MrZl9FgceaDHKGns27SndyGlzN96TJgg8+8n+T6DMfND8cyWmu2F
	SVxAb7Wh7RuQDsx+6Oo4qy/RPoP0St+7CNhDsfnpMHbGK6j6dsE3HDOG3yD1UsOE/FCQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uY5AV-000QZ4-Is; Sat, 05 Jul 2025 17:51:11 +0200
Date: Sat, 5 Jul 2025 17:51:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: stmmac: add support for dwmac 5.20
Message-ID: <b4091f34-8901-4a30-937a-a9aac35310b7@lunn.ch>
References: <20250705090931.14358-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705090931.14358-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_085127_241171_422B0675 
X-CRM114-Status: UNSURE (   7.21  )
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

On Sat, Jul 05, 2025 at 05:09:30PM +0800, Jisheng Zhang wrote:
> The dwmac 5.20 IP can be found on some synaptics SoCs. Add a
> compatibility flag for it.

Is a compatible flag enough to make it actually work?

	Andrew

