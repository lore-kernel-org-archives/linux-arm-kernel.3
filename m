Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D71C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 01:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+P9AFmJLuCcrDWr80X+E8AP0t/nxQRMEiXVqhr9T2/Q=; b=aRwPFJzmvQo0XXo69N2BIzgqyi
	VIbcDqtKaugGhpeOjnOIerlFkNcEmSKm9WC4OWpg90LVoJS6cowvEk+tiMSjxGdT5OXy1oc3C78Iu
	1yf9LlSOOmdNkW8RUB7HDd2rhSpGREEyqR86lQ0QSjkEN7QY/DMosaLLwby3l4RwDzJNr9C6z/Bo6
	Re8n3zlMr2Qqe1CxwkXT6SFPNlr95XISS+F3BpV/rrJ8LgSbWv9pT7rYSWR6NcI6TYKI6CWh4DDmJ
	jhY0K82pn7re6W6rs2ZizwVgvGK2/usKl5FJU7GZycXqFjfvqVFGfCnu+cLZo0TcSYnuOYJL6dU6g
	tbgw2uKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtxrV-0000000FD6z-0c3D;
	Wed, 12 Aug 2026 01:34:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtxrU-0000000FD6f-2GMn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 01:34:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DEFA601E0;
	Wed, 12 Aug 2026 01:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEBB31F00A3A;
	Wed, 12 Aug 2026 01:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786498470;
	bh=+P9AFmJLuCcrDWr80X+E8AP0t/nxQRMEiXVqhr9T2/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ebKQc6hjvXbhBmahLlzlcEHg9vv34qd4YB3GFoTTr0N6n5re0e3xlukXoaTOvYgzx
	 +rZ3lgRgWi9e40ypYh0WWz5mV2p84GKpsGBUznOrPP/T0eMnL8bB6zVCopnR6qyjs1
	 GQTOM66M6oI9mxjlN6hS84zv5aisWp5KJQkqAsAw9qQydd8y57zM+S5vT8AGfKd+39
	 c3AmOdGppQRzSZBxpiELisDZ1qt646RXwln0eSfC14XCK1NEP9giChWGFMnxX5hbR6
	 LMfJwlJl19NdGUTFhvY2CjlxtXRjL3E9dgJHtWFglif0EXpz8wY5YrBCRaGnEAhLWE
	 kDOz4ohiLxX7g==
Date: Tue, 11 Aug 2026 20:34:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>, linux-sunxi@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Liu Changjie <liucj1228@outlook.com>,
	Eric Dumazet <edumazet@google.com>, Chen-Yu Tsai <wens@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: net: Maxio PHY: add PHY-ID for -Q2C
 variant
Message-ID: <178649846890.469780.9151201106387845136.robh@kernel.org>
References: <20260803101452.2993721-1-andre.przywara@arm.com>
 <20260803101452.2993721-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803101452.2993721-4-andre.przywara@arm.com>
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


On Mon, 03 Aug 2026 12:14:49 +0200, Andre Przywara wrote:
> The Maxio MAE0621A PHY is out there in at least two variants: the
> MAE0621A-Q3C chip, with the PHY-ID 0x7b744412, and the -Q2C variant,
> identifying as 0x7b744411.
> 
> Allow both IDs to be used as the PHY compatible string, to potentially
> avoid probing, which might fail due to unavailable resources (clock).
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/net/maxio,mae0621a.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


