Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6309C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 14:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pl+KPkumGyZZwr+tofCIGd83ptHYkXoo+19YHgOdFUo=; b=EmaV8Z6OPXurp3NT44ci9uUpDa
	SEy9IAuUI4t1EVNIBPK8bFlGZM0pyMkAHAOBwaUYJtuytcpYACh7c/M+jVuOb+1Q2+v6YDLPuffTw
	sL9qpXbmrd6+nt8O/YFVAohEHVokW/Cpx1VkppPgHjlUowRWdAg07uQQlGj1pLHnVZ0yHt5BSZxza
	Nj1wTBcwieE/3e3dQOdaD3At/5Hg/xWgYmTaNcyBpd4u0PPe7KTGaZpZeANIN0j1G86ZTS9QijiMo
	7UjU6FyB7vz3eY8guq+eex8uahRtBhZKC0gIWtUXw+OlU2ivtU8plAPvCDSmil1zskIkYuHB5L/2/
	RtKCF6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PkA-00000006fuZ-2uQw;
	Mon, 28 Apr 2025 14:46:02 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Ne1-00000006CJH-0nHr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:31:34 +0000
Received: from localhost (unknown [116.232.18.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id DB59234306D;
	Mon, 28 Apr 2025 12:31:31 +0000 (UTC)
Date: Mon, 28 Apr 2025 12:31:27 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: sunxi: Add A523 EMAC0 compatible
Message-ID: <20250428123127-GYB56330@gentoo>
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
 <20250424-01-sun55i-emac0-v2-2-833f04d23e1d@gentoo.org>
 <CAGb2v64vy9Zx-mJgT7dLMMcx4nbAeQ3n8pbvwT6QkuMTL6kQTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v64vy9Zx-mJgT7dLMMcx4nbAeQ3n8pbvwT6QkuMTL6kQTg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_053133_252038_6085EA6F 
X-CRM114-Status: GOOD (  16.72  )
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

Hi All,

On 13:43 Sun 27 Apr     , Chen-Yu Tsai wrote:
> On Thu, Apr 24, 2025 at 6:09 PM Yixun Lan <dlan@gentoo.org> wrote:
> >
> > Allwinner A523 SoC variant (A527/T527) contains an "EMAC0" Ethernet
> > MAC compatible to the A64 version.
> 
> The patch subject prefix should be "dt-bindings: net: sun8i-emac: ".
> 
Ok, I can update in next version

> And this needs an Ack from the DT binding maintainers.
> 
I'd assume Krzysztof Kozlowski also fine to have his ack kept in next version
with above subject updated, since I saw he already gave an ack to this patch.

Thanks

Yixun Lan

> ChenYu
> 
> 
> > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> > index 7fe0352dff0f8d74a08f3f6aac5450ad685e6a08..7b6a2fde8175353621367c8d8f7a956e4aac7177 100644
> > --- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> > +++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> > @@ -23,6 +23,7 @@ properties:
> >                - allwinner,sun20i-d1-emac
> >                - allwinner,sun50i-h6-emac
> >                - allwinner,sun50i-h616-emac0
> > +              - allwinner,sun55i-a523-emac0
> >            - const: allwinner,sun50i-a64-emac
> >
> >    reg:
> >
> > --
> > 2.49.0
> >
> >

