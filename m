Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60349CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 11:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYy9ZPOUVut5R2+Ahn9onLfAABH9FQl5/jQQUgBaOdk=; b=SfMwXD/EXWEi5Kf6Xl/ZAr6wx+
	32eAgF4NE2zXJhDADPeuhXI+S1VlsLlihGds1+oQXV6vrXx/tUfqlZ15WPVDRmTwi2hHVNRI0r3WY
	0f0Dk39oOXJ8pzllEaMAyL5LAPNcR/wZKcopDZaQ5wWuNS9s8se1kkXF7eUqdd0UqqCrO+JVNCKP1
	MNDDAjqP0wsNhiC/K3Ue0OtvNubx+VGGDFFroR5vWW6Q8MU7dv/T1wJxp3RI0I6OaZiPbvLMXdqb8
	MROAmEprwlTWgm9qi8U8gOVsTL9S9eh82c0e1SdZxS2JqAnIncRXMez0DhScx4Su5oRQF5ePRC4Gt
	fDXeAKsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2xz-00000000aYu-3Zey;
	Tue, 06 Oct 2026 11:04:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2xz-00000000aYh-26d4;
	Tue, 06 Oct 2026 11:04:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 977496022C;
	Tue,  6 Oct 2026 11:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F80E1F000FF;
	Tue,  6 Oct 2026 11:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791284654;
	bh=zYy9ZPOUVut5R2+Ahn9onLfAABH9FQl5/jQQUgBaOdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FcaAaiAl8o0WdMF/V8wU5VWBeKFzqq78IeqqjynbS+yLRWzXtHTS9kf7IpltWo2me
	 6h2ln8qbZaZSchbiD9vf6KipxW7kT5wqW6Qf/4bG7KuFoOm+TK8aFqz1Jp7kQgeyvx
	 o5cpRha72vATiwEq6G5pKG8/BKA60Mou2OBuWe7Rex3YuhjVeQCz1R7QVSqhc3msoq
	 gkQWCQ8jd/Vi3e7ZjWezuygk1/kC8fj0FlD0FySnxCwjeyin08ErpqOeNIE+Jb86Q9
	 +7aLu4mHvTIAwe8V6I5e/1YNDeXIl6LX14C3QnGIOnFhNtkVXAlsbjGtxWa3pSJuUI
	 I/WDSUnhSbh4Q==
Date: Tue, 6 Oct 2026 13:04:10 +0200
From: Vinod Koul <vkoul@kernel.org>
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 0/3] airoha: an7581: USB support
Message-ID: <asTVqsqOLb29LY08@parshuram>
References: <20261006102937.10972-1-ansuelsmth@gmail.com>
 <asTRQ6d0-NYOeHqX@parshuram>
 <CA+_ehUw8fQHGef_L7YPQEf-wwuzP9km=G64Ty3+AkvM=fkNJ4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_ehUw8fQHGef_L7YPQEf-wwuzP9km=G64Ty3+AkvM=fkNJ4Q@mail.gmail.com>
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

On 06-10-26, 12:47, Christian Marangi (Ansuel) wrote:
> Il giorno mar 6 ott 2026 alle ore 12:45 Vinod Koul <vkoul@kernel.org>
> ha scritto:
> >
> > On 06-10-26, 12:29, Christian Marangi wrote:
> > > This is a major rework of the old v2 series.
> > >
> > > The SoC always support USB 2.0 but for USB 3.0 it needs additional
> > > configuration for the Serdes port. Such port can be either configured
> > > for USB usage or for PCIe lines or HSGMII and these are configured
> > > in the SCU space.
> > >
> > > The previous implementation of a dedicated SSR driver was too
> > > complex and fragile for the simple task of configuring a register
> > > hence it was dropped and the handling is entirely in the PHY driver.
> > >
> > > Everything was reducted to the dt-bindings to describe the Serdes line.
> > >
> > > Also the property for the PHY are renamed to a more suitable name and
> > > everything is now mandatory to simplify the implementation.
> > > (the PHY are always present and active on the SoC)
> >
> > I get build failure:
> >
> > drivers/phy/airoha/phy-an7581-usb.c:7:10: fatal error: dt-bindings/soc/airoha,scu-ssr.h: No such file or directory
> >     7 | #include <dt-bindings/soc/airoha,scu-ssr.h>
> >       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> 
> This header is present in linux-next
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/soc/airoha,scu-ssr.h
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/include/dt-bindings/soc/airoha,scu-ssr.h?id=11952173d8a180ac05641775f80bd6946327478f
> 
> Introduced by a clk series.

Okay so we have a cross tree dependency. I would like my tree to be
buildable and not depend on next.

I can
a) get a signed tag for this from clk tree with the required patch,
merge and then apply this series
b) postpone to rc1

Either works for me

Thanks
-- 
~Vinod

