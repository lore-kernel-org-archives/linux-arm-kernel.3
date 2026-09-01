Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C1FC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 19:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFSn5y97kTX/b/0AllW5HM4Du+nhAFNzf81IK1DwiQU=; b=IFcdZ6Z9mpNI6oNLkPvlnGc3ni
	OBSDmj2Mt6PUW1WaXo4GFoiJTGk+fznUVpj+cwY0zkm07DpzHeyP/raCAKJUGAzGXn95xzw4i+v3+
	qOakIwRq/prf1rEkN1LBjje+BW9//4sPeysmnGHq9RgfKkoHd2XOGo2vuuGmWxWnhIYKk5AikXkkZ
	Z9yCL2MyzhIOsL20YlWdu+CjSk/kfQgnlsE1jC4laBCtvQG9p17jKd4HuauOYiRoEk4aXxPY/o3mU
	vgwOqKyAhBWzQl7kx10f+or/lDLGCg8+x/fZu5VufIjlQOjlzYxbAF+/vhGdpylR58e4mOCQ4HEO8
	5eLTvaAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1UJD-0000000DE6W-1N3S;
	Tue, 01 Sep 2026 19:38:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1UJA-0000000DE4k-3em0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 19:38:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=pFSn5y97kTX/b/0AllW5HM4Du+nhAFNzf81IK1DwiQU=; b=KR
	Z1dRP+WRbIQE6mxH/+dB6wN5fP2b8FNBmDevgpYG0KzIQpX3N9GuR2tbiZ/JCbJVLGeqRrtSimpi2
	RrZ2w67pSVaVOWfhKKIphVjejWbnu8imIhby6FMX+MiA13d5mZrD/4HVgxg74MorWPPvFVWHE7qCV
	gcA5oNcBSYWxOts=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x1UJ1-002Ptj-6I; Tue, 01 Sep 2026 21:38:03 +0200
Date: Tue, 1 Sep 2026 21:38:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: helios4: add Wake-on-LAN gpio key
Message-ID: <3143f0d2-8990-4a75-b7c4-27edfc90ae54@lunn.ch>
References: <20260901025311.955936-1-rosenp@gmail.com>
 <e1087196-fcfa-4c1f-96da-ef76a3e03a11@lunn.ch>
 <CAKxU2N_qR-KKvq=qv0eu4PMYMf8zHnpYnZ8jMvpBNKVitB3Vuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N_qR-KKvq=qv0eu4PMYMf8zHnpYnZ8jMvpBNKVitB3Vuw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_123812_913843_6608C6D6 
X-CRM114-Status: GOOD (  16.53  )
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

On Tue, Sep 01, 2026 at 11:37:03AM -0700, Rosen Penev wrote:
> On Mon, Aug 31, 2026 at 8:08 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Mon, Aug 31, 2026 at 07:53:11PM -0700, Rosen Penev wrote:
> > > Add a gpio-keys node exposing Wake-On-LAN on its gpio0 18 input,
> > > allowing the board to be woken from suspend.
> >
> > Could you explain this some more. Why a GPIO key? The MAC needs to
> > know if the PHY can wake the system, in order to offload the WoL to
> > the PHY.
> This was an out of tree solution to get WOL working on this board.
> 
> After some back and forth with an LLM, the conclusion reached was that
> this is the simplest way to get it working, not upstream ready. And as
> sashiko points out, it has problems. I'll respin.

Please do look at the work Russell King did for phylink and WoL.

What MAC and PHY are involved?

     Andrew

