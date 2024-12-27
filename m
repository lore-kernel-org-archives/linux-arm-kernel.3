Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38BAE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 20:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTpmM+N9yTb8Q9bJONsWhH4t0UI7Y+ya/IYjpiMz6Cg=; b=UBwQz7LEU+wAO4hB1lLGNzYtzS
	cdM/Vd8iuPuYRYRcwt9iRfaANUN/JI2o0VQ11tg5Pg59NsY41X1sxTfQtOQcmS20BspaQbfCPlDEZ
	1cp/TMv8f2X+/2rQtcZCdquV99fVB6YLHwxbihbSBWmAaiE/SfQJ6O/zQ7eq466xzTyOjo2/sE6X2
	VXMxuCHVprZerE7peJcFUu0ZJZaVza+x8QBwKGOm9kCg/9kU9hmxDzj7nV5RzRPWlCcWriYHw92JN
	r8uflQDrTLcQEMqUJRBu+JhJzNQVaWXxTUgfQkpt5jiVuaI9jckOBJnleJv2+AW0f2QqzhF4AaZ7R
	sVIrmWOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRGf0-00000000t7N-1ORH;
	Fri, 27 Dec 2024 20:10:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRGdo-00000000szg-0R0i;
	Fri, 27 Dec 2024 20:09:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rTpmM+N9yTb8Q9bJONsWhH4t0UI7Y+ya/IYjpiMz6Cg=; b=j6E/9czHO7e5hBXHB6GqUWeYO2
	z7aTYMKv1Qgq4Dm3MKG/qG7+b4el3bPiBfDrVTm81uYq1sdKdwM5Wv3XXMFsgVpNC4Hcb/smYIBii
	syYK5lxbtVxSq+V81T0QLB8QH06P3gm2+FIqIjkD/bHBgS4mSziaJ5hU9tZa19D7LCBQAgFXK098Y
	BO96XvGk5zw9olS9eMGKRy0V6hodSgXwuaaJLDiX9R+MdsQPkpV1rxkAJBiF6Lh8sOh0Tl66a7E7p
	PmJpcwCoUaBOabFVDltoSJkH5sx6c1mtZZbbXOtSnmapGGyPSOGEUpcMUpCDjEkTsP6knM9PjK04Z
	0f75DO4w==;
Received: from i5e860d12.versanet.de ([94.134.13.18] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tRGdX-00037B-1A; Fri, 27 Dec 2024 21:08:43 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: cristian.ciocaltea@collabora.com, detlev.casanova@collabora.com,
 krzk+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
 sebastian.reichel@collabora.com, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] dt-bindings: phy: add rk3576 hdptx phy
Date: Fri, 27 Dec 2024 21:08:41 +0100
Message-ID: <3255768.PYKUYFuaPT@diego>
In-Reply-To: <hh3zowf257dwwp3uo7al5l5ql7hewy7j5rzjqdt3eqvd653mdj@4tgjm6zdsuyi>
References: <20241224091919.267698-1-andyshrk@163.com>
 <hh3zowf257dwwp3uo7al5l5ql7hewy7j5rzjqdt3eqvd653mdj@4tgjm6zdsuyi>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_120900_168602_AD6DFEF7 
X-CRM114-Status: GOOD (  19.41  )
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

Hi Krzysztof, Andy,

Am Freitag, 27. Dezember 2024, 09:55:59 CET schrieb Krzysztof Kozlowski:
> On Tue, Dec 24, 2024 at 05:19:13PM +0800, Andy Yan wrote:
> > From: Andy Yan <andy.yan@rock-chips.com>
> > 
> > The HDPTX PHY on rk3576 is compatible with it on
> > rk3588.
> > 
> > Add compatible for it.
> > 
> > Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> > ---
> > 
> >  .../devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> Also: where are any users of this binding?
> 
> We don't take bindings without *UPSTREAM* users.

Andy, can you do a (separate) DTS series that binds all the display stuff
together on one rk3576 board? (iommu, hdptxphy, vop, hdmi)

Depending on how the driver sides go, this may be need to be revised at
the end, but should hopefully satisfy that "show a user" thing.

I guess Kever's EVB-series [0] might be a good base to build upon, with it
being a Rockchip EVB?


For people reading along, that whole display chain consists of:
- iommu [1]
- core display-controller additions for the rk3576 [2]
- this hdptxphy binding
- additions for the dw-hdmi-qp glue [3]

Heiko


[0] https://lore.kernel.org/lkml/20241220101551.3505917-1-kever.yang@rock-chips.com/
[1] https://lore.kernel.org/lkml/20240920094947.7566-1-andyshrk@163.com/
[2] https://lore.kernel.org/lkml/20241214081831.3330714-1-andyshrk@163.com/
[3} https://lore.kernel.org/lkml/20241225103741.364597-1-andyshrk@163.com/




