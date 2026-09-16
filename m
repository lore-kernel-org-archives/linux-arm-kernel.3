Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18477C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 16:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpbnWJEGL9NjihNHGwgBoO1lxp2f2aVoZ/arzsurXIo=; b=vbwe4HzYyZZ0/8QiInszvJHkeg
	jaNLc6UaBgBY3xM/GSJCC03sFSx9ti/g2nY1l7Wxu4kHDHNxMRqoVw6EAdAQoac4qhPgYDBYDjP3E
	0eaSYQ/Fbf+bifm+wAwtxEvFci7Lb+dzVq8xix5RlMhT5YPM7PLEQUbPYynv4IyViU38kxy5wBZ7H
	VOdU8II+tsTN+u246ZOXXTvI13BBPxzUCt4ZA+1qas7RqpfJk3MXCw6nX+stabwcfm2W8BkQ21R1i
	oOJ87+Kg52HMu5axPilYhqtYq28zznywvi3aTSOeAlbprFZnLZE9I/C4+kHaRJ/un3YOq0YKpDKrj
	jhCCLrkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sNA-00000009if3-3XOs;
	Wed, 16 Sep 2026 16:20:36 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sN7-00000009ieG-0PHI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 16:20:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6B8BD1A0909;
	Wed, 16 Sep 2026 16:20:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3936760337;
	Wed, 16 Sep 2026 16:20:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5F0D11C7B05C;
	Wed, 16 Sep 2026 18:20:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789575624; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=HpbnWJEGL9NjihNHGwgBoO1lxp2f2aVoZ/arzsurXIo=;
	b=U4LHQ7LSkICNCO7ToQ5xHrfiLdcHnz2/ttaah0BkmBXIG3MqosnQEOR5X/7NxellbJcRGW
	xAG4jSZy8VuMGs7IKTOtPPE4SyaZQJvbp8ju4uZj6C1Mid42WZB71TsfaYB9eReILV5xt9
	dEjapsyZsOTgw6i3141Ykl6ja0onsTjXrNdltqKrdpZBCPJT065I174ymwoX/oDyH0vpk9
	MnsZ1VaSWZuuCxP4TbPJu8s+enkrl0MToPUlPS0+ZOIDuz1v7j+i9itsMm1iuGXBTz1f/r
	oY8nmD0cUWLykxhWvfRaeCudRkhWYXUAt2RuEXeMhPVXNZ8MGIuhYXAPo7ILIg==
Message-ID: <9609a821-c971-491c-9436-9346c48d2ee5@bootlin.com>
Date: Wed, 16 Sep 2026 18:20:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v15 00/12] net: pcs: Introduce support for fwnode
 PCS
To: Christian Marangi <ansuelsmth@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_092033_277919_8E902D2C 
X-CRM114-Status: UNSURE (   6.46  )
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

Hi Christian,

On 9/1/26 10:29, Christian Marangi wrote:
> This series introduce a most awaited feature that is correctly
> provide PCS with fwnode without having to use specific export symbol
> and additional handling of PCS in phylink.

I tried to re-rerun the mvpp2 prototype conversion, but it looks like the
series doesn't apply cleanly on net-next anymore :(

Maxime


