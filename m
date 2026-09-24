Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2307C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdypyC2EEaeoSTkqpgQwsJ5aZ5bx5ISsf4WGyRg9+mQ=; b=a9qOgC4YTXzGhHNSP66dJjWPMJ
	rxdUZcwaWyda79tYCOv/eRrwAetT1sq+L1QK3Ht/eKfuoCoT6NPKcCJB2uVVULViAdf/ivFop8TBa
	+beP4U6aLNc0Gmby+W/UT8TN3dLNnKS21UEcC5VKUJAfzBgl28/+ToX4n+Du9o/xNNgHhkMcYs6OC
	jRQNPKpwzhLBjUE2B+mEIr72asiW5ku6TBv8QjgTGIpAB9TTSzXclRoyvbvL/A1hjFqww3sKHLSt9
	AZstiNoVVfk95SGCiP4uaX2R+sW8qUHbee/j52GO9BBWgFhuSiaRn5jvfs7o187i/lUkiZJAQpPKz
	CPwovqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lda-0000000BTEP-1lKo;
	Thu, 24 Sep 2026 15:45:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ldT-0000000BTCq-0nKs;
	Thu, 24 Sep 2026 15:45:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E95FA40402;
	Thu, 24 Sep 2026 15:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A041F000FF;
	Thu, 24 Sep 2026 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790264722;
	bh=kdypyC2EEaeoSTkqpgQwsJ5aZ5bx5ISsf4WGyRg9+mQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JdmuJUyFJfCQDSYoka49s/bPfPNeRd/+KyYjOoltcgZ/TG7cv0M1iWhMnHj5OzR8t
	 5Ez9OVkkMo/OfynzZdT4w9mu1477zd1w13qkPhDKqif4kM9zbqHRZjPoLrGWEf2TRd
	 bDOJ3BMvL8ucqJdNzk1iwIfN+fpLPwSLgQCuI1rBBaz8sNnS3MPT/Yxvy448/OVKjl
	 JK6ezdFQ3rGwis+4YU5ReIzsr/DRltjrQDTB+Z259nFZ24Jea4QXucL3emtraPYHEN
	 GDHh/kVPTKn8konttnYh/E4/4dG7kf5W5UjRlhR9qkeiUcRHN9Yj9gtuuAbWU8eHJH
	 a+rbrvPe+TOfg==
Date: Thu, 24 Sep 2026 10:45:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: chester.a.unal@arinc9.com, b.larsson@gmx.com, matthias.bgg@gmail.com,
	edumazet@google.com, Landen.Chao@mediatek.com,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	arinc.unal@arinc9.com, kuba@kernel.org, naseefkm@gmail.com,
	davem@davemloft.net, andrew@lunn.ch,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	angelogioacchino.delregno@collabora.com, olteanv@gmail.com,
	daniel@makrotopia.org, linux@armlinux.org.uk, conor+dt@kernel.org,
	sean.wang@mediatek.com, dqfext@gmail.com, pabeni@redhat.com
Subject: Re: [PATCH v2 net-next 2/7] dt-bindings: net: dsa: mediatek,mt7530:
 add passthrough mode
Message-ID: <179026472132.335875.13282217589562743925.robh@kernel.org>
References: <20260915174643.253660-1-cjd@cjdns.fr>
 <20260915174643.253660-3-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915174643.253660-3-cjd@cjdns.fr>
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


On Tue, 15 Sep 2026 17:46:38 +0000, Caleb James DeLisle wrote:
> MT7530 switches can be configured to blindly pass packets between their
> CPU/upstream port and a downstream DSA port, in particular, without
> altering the MediaTek DSA Tag on the packets. This mode is used in some
> integrations where an SoC integrated switch exists, but a more capable
> MCM switch is added to effectively replace it.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml       | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


