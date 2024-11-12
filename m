Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F50D42B8E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 15:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5U7EE1N72jYpLIg8Fj0M/UmGtlM1TOXxGedfthEm/LU=; b=R0JkKWp2d2utprb6AdTWWv0Mvy
	+KUE/7/nAiZj3uKgWUwA6/4fvkTjpXHo+OpowFnJeRFeDI7uHLGUSoT+XFW9imAdY8SLOQmqVhH0W
	8/+OhAAVx4F9Tm78y4GAYBBOQ3i3oWZzHtvHNxOaadHlnYNTAI7+wGPJHULoC36aUGb4cutPmewsp
	XdZ7+rqPHu9ieJ1K1kkRBcgczRVO9g2edht6J6JVvIj7m0K58Fe7vt4Ki4c9BK2KRN+Pv5jzLqBWV
	LoAlKAiASbWLVe+DM8Q1xMRnFY0Kk38eh7SaV9DPCwQEnR8rm+ypAsUJSyQMFL/UVXUT6BqhtWLBN
	YRJZB+ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsO5-00000003ri0-1rRq;
	Tue, 12 Nov 2024 15:01:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsJI-00000003qOg-3szJ;
	Tue, 12 Nov 2024 14:56:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B913FA41CEA;
	Tue, 12 Nov 2024 14:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C12EC4CED0;
	Tue, 12 Nov 2024 14:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731423363;
	bh=sjtOX4U8btZ+pX6YU8B2jICTN2PT+V0pityV9K3OEgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KG/3GkRi+PzBfH0bPRDfobz/mT6+gCk2ZgvEyfYWyaNYDoNZb+9U60lRz9cdNT+e6
	 nHGX3+wQnkZ+H8qTc+YFS+CzEHgCK/Ls29Bxb4S+iXjJ5ssiJ2XixMHOqrZGSuzbFe
	 Ksy8hqJ0fytWVXguZLHlZemeCQbrhv7ePNflyzZrpBk3+waNIp9vWKDHeB3jp1P0c9
	 Yyz3tVLv5kDfVS8jksqk5yiJq3atGT/9huj2YjQf/vvqbshjBQCYyRH4TPOIqQ2Rdn
	 BKicNTOAMNcj0XpM6nr1j7nDm5T1LJKWb+A5/nEHUysh9o5K6NjtbkonT1Ps8dFfGc
	 GSUBBhWMM8Jrg==
Date: Tue, 12 Nov 2024 08:56:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, upstream@airoha.com,
	"David S. Miller" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>, devicetree@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [net-next PATCH v4 1/3] dt-bindings: net: dsa: Add Airoha AN8855
 Gigabit Switch documentation
Message-ID: <173142336068.894176.10211231485154959915.robh@kernel.org>
References: <20241108132511.18801-1-ansuelsmth@gmail.com>
 <20241108132511.18801-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108132511.18801-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_065605_052500_03A3ECC5 
X-CRM114-Status: GOOD (  12.08  )
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


On Fri, 08 Nov 2024 14:24:14 +0100, Christian Marangi wrote:
> Add Airoha AN8855 5 port Gigabit Switch documentation.
> 
> The switch node requires an additional mdio node to describe each internal
> PHY absolute address on the bus.
> 
> Calibration values might be stored in switch EFUSE and internal PHY
> might need to be calibrated, in such case, airoha,ext-surge needs to be
> enabled and relative NVMEM cells needs to be defined in nvmem-layout
> node.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/net/dsa/airoha,an8855.yaml       | 242 ++++++++++++++++++
>  1 file changed, 242 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


