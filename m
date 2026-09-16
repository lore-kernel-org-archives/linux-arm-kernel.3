Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494DCC982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 14:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGQP+UWUC6IA+x0OfkhU76QWikjYeprvqcMNeO6W3jM=; b=tx9c+aKA/wpGfjrzuOhj9nI/N2
	OsWRr/Ei0pgsgHP2Yq8ugBqTDamcbMvhrjLsXnAya/qtXd7jzx+/IAInPR/qIY5GqNfaDph3dyK9x
	dkwASmubYpLAKFsN18aZxVmecyUBuzRscb/cHoXydJV1tCb/cfW21LjQpID6EO3pa8H6q8OnGvnJX
	UQMjZ/nZcGzWUw5q5NZjZ2bzY4Dr7kvSjpEgko2YbcWs9g36/8jd74GtGvnf+eILsZaFKwM3k6+jT
	kAKmOQF4TtYHB4BVICQqqv7TYSiqkCw//hBMa4sXqvSZ4iCFt5DUmlstOjv/REtOYhACGGtJEgQSY
	5SnBkYPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qxq-00000009TJb-3rx0;
	Wed, 16 Sep 2026 14:50:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qxm-00000009THp-258D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 14:50:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lGQP+UWUC6IA+x0OfkhU76QWikjYeprvqcMNeO6W3jM=; b=2iqH+ziL6DOHx27n8oKGzt+bMN
	E3EvR7lKy/+6Bl/eI6pBGWSL5sVW1hmN6pKtXWiuP7C44euWLzIZZa/ow7qoDSdLAeySKEVpORbZ+
	En1TlJV7qo5Wnrck/0zJISOQ4eg7VB+Atq6WCeZ0pIswCobSGx/aKOIccymUC5i7RPyE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x6qxR-005UoK-NO; Wed, 16 Sep 2026 16:49:57 +0200
Date: Wed, 16 Sep 2026 16:49:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: phy: Add Allwinner AC300
 EPHY binding
Message-ID: <dbf2768d-1c83-4524-98c4-156ce4d16bb2@lunn.ch>
References: <20260916044119.475666-1-alastair@d-silva.org>
 <20260916044119.475666-2-alastair@d-silva.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916044119.475666-2-alastair@d-silva.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_075018_557682_6E0D5BE0 
X-CRM114-Status: UNSURE (   6.03  )
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

> +properties:
> +  compatible:
> +    items:
> +      - const: ethernet-phy-id0044.1400
> +      - const: allwinner,sun50i-h618-ac300-ephy

PHYs don't have compatibles which are vendor strings, only IDs or
c22/c45. PHYs get probed by ID, not these strings.

    Andrew

---
pw-bot: cr

