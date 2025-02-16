Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5785CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 16:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ui7HEUJhEQf9Ds/ECcnB0minOtGYjZZ90SeYLQsSlUw=; b=1Xwd9zzBwja+V+4I3GWyrbZjil
	kAAPEseZE/bslXDPqnR8O4PP/P7YWxxTtNT/JynCIG2rt5Y8XeT/B6qP6fUyCLs/fE10lz4TQ1Vai
	poebyDvplOYE/E5hhOfdRjERNhBgpDFOp8cGIbxwcELYRZREG22WiNuGduNOrOtysSbrmsb9Lj8NW
	LUyL2yNlEuGYNifraaVTg0FffzGuqKQlM6Z95zLlRhsVSWPfurcbLuxWv9LbddK73RwaTps9eatQT
	M8aS+cL9KkMQrIbvHL3ztHJH7EEGGjWDh5x4GGdulK/UYvKwn/S/VAxoqKqbCX9joHaBAf7+Fp5sJ
	+T9RUB+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjhhx-000000029EV-0AXc;
	Sun, 16 Feb 2025 16:41:29 +0000
Received: from [156.67.10.101] (helo=vps0.lunn.ch)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjhgU-0000000292T-2w0X;
	Sun, 16 Feb 2025 16:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=Ui7HEUJhEQf9Ds/ECcnB0minOtGYjZZ90SeYLQsSlUw=; b=Tn
	qXdLS5oE5zr4X/BKFyfbTLBPyRQnjEEEE+6IOI4N4TUmlx4pmDBdKCfMTX8IkxB2Mphf5neeQPE1L
	QXoyTXni+ghDDX/hh6v0/8sem8mFgGzC/3unW6xWd4FdDVTcKU2nXaKuAJrIL3UaKEXthOnMBAixt
	A1o30917TYG4+qU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tjhgC-00Ehdh-2m; Sun, 16 Feb 2025 17:39:40 +0100
Date: Sun, 16 Feb 2025 17:39:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "daniel@makrotopia.org" <daniel@makrotopia.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>
Subject: Re: [PATCH net-next 1/3] net: phy: mediatek: Add token ring access
 helper functions in mtk-phy-lib
Message-ID: <1b4c3254-c596-486a-bde9-d4737dfc5a48@lunn.ch>
References: <20250116012159.3816135-1-SkyLake.Huang@mediatek.com>
 <20250116012159.3816135-2-SkyLake.Huang@mediatek.com>
 <5546788b-606e-489b-bb1a-2a965e8b2874@lunn.ch>
 <385ba7224bbcc5ad9549b1dfb60ace63e80f2691.camel@mediatek.com>
 <64b70b2d-b9b6-4925-b3f6-f570ddb70e95@lunn.ch>
 <Z633GUUhyxinwWiP@makrotopia.org>
 <81234e04-f37c-4b10-81e6-d8508c9fb487@lunn.ch>
 <ea348d0a4b30c4926ba16a6e79cb52196aebcf47.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea348d0a4b30c4926ba16a6e79cb52196aebcf47.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_083958_750268_97A09881 
X-CRM114-Status: GOOD (  21.74  )
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

On Fri, Feb 14, 2025 at 03:35:10AM +0000, SkyLake Huang (黃啟澤) wrote:
> On Thu, 2025-02-13 at 16:34 +0100, Andrew Lunn wrote:
> > 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > > > > Those registers with Mrvl* prefix were originally designed for
> > > > > connection with certain Marvell devices. It's our DSP
> > > > > parameters.
> > > > 
> > > > Will this code work with real Marvell devices? Is this PHY
> > > > actually
> > > > licensed from Marvell?
> > > 
> > > > From what I understood the tuning of those parameters is required
> > > to connect to a Marvell PHY link partner on the other end.
> > 
> > If so, the naming is bad. I assume you need the same settings for
> > Microchip, Atheros, Broadcom, etc. These settings just tune the
> > hardware to be standards conforming?
> > 
> >         Andrew
> > 
> This part is pretty old old old design. Some compatibility issues were
> firstly found on Marvell link partners, so the registers are named
> accordingly. And yes, now, those Kf/Kp settings will be used for
> connection with other link partners. However, if I change the register
> names, it violates our hardware register map application note. If this
> does bother, I can add some comments before these macros like:
> 
> /* Mrvl* prefix only means that in the very beginning we tune the
>  * parameters with Marvell link partners. These settings will be used
>  * for all link partners now.
>  */

A comment would be good. The current names lead the questions....

	Andrew

