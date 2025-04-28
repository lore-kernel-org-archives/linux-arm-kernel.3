Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D1CC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 13:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cf+dCZLe858zBfX+hy6ffw/E7s3RPf/P4TBFOHT5idc=; b=SsRqj7cymw0gtbsF0CFPfDJ8mm
	BvQMLrQSR30bXa7v8/vjFKe/6BLukMcdWLE2Z1vpBDgQvbhL+V3ILh/DhUXX0qWkdOQuaG+bQ0FFI
	pE2rcJjYDKcgBMrK5PFcdPZPvwJ5aKCZKrXbk6st7AU157rhcjM+If5HStBxM3uWPGflhpfEMk+hE
	fEZKGSDvwxMeoUlFtNWjEQKpUJ44hbmr5Sd1lK8hTmCvJX6+8vwl1P3nzeB7cW2LVMqg6Ui3fl2cH
	zPLQdSdnG2r/V6/NW5yDW/ONDKN3TGNqiLZ07vaHGxV5y/mr3crAx/NHg2DMMgqLZ5oDM/IxCw+Qv
	kSevysLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Oba-00000006Uok-2hCp;
	Mon, 28 Apr 2025 13:33:06 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NUx-000000069zr-0fKo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:22:12 +0000
Received: from localhost (unknown [116.232.18.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A4D2134307B;
	Mon, 28 Apr 2025 12:22:07 +0000 (UTC)
Date: Mon, 28 Apr 2025 12:21:56 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
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
Subject: Re: [PATCH v2 1/5] dt-bindings: sram: sunxi-sram: Add A523 compatible
Message-ID: <20250428122156-GYA56330@gentoo>
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
 <20250424-01-sun55i-emac0-v2-1-833f04d23e1d@gentoo.org>
 <20250428-vegan-stoic-flamingo-1d1a2a@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-vegan-stoic-flamingo-1d1a2a@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_052211_224982_04A59FBB 
X-CRM114-Status: GOOD (  15.99  )
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

Hi Krzysztof,

On 09:21 Mon 28 Apr     , Krzysztof Kozlowski wrote:
> On Thu, Apr 24, 2025 at 06:08:39PM GMT, Yixun Lan wrote:
> > The Allwinner A523 family of SoCs have their "system control" registers
> > compatible to the A64 SoC, so add the new SoC specific compatible string.
> > 
> > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  .../devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml     | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
> > index a7236f7db4ec34d44c4e2268f76281ef8ed83189..e7f7cf72719ea884d48fff69620467ff2834913b 100644
> > --- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
> > +++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
> > @@ -50,6 +50,7 @@ properties:
> >            - enum:
> >                - allwinner,sun50i-a100-system-control
> >                - allwinner,sun50i-h6-system-control
> > +              - allwinner,sun55i-a523-system-control
> >            - const: allwinner,sun50i-a64-system-control
> 
> No update for the children (sram)?
> 
No, I don't think there is sub node for sram
From address map of A527, there is total 4KB size space of
this section which unlikely has sram available.

but I do see some BROM/SRAM space from 0x0000 0000 - 0x0006 3FFF ..
(which should not be relavant to this patch series..)

-- 
Yixun Lan (dlan)

