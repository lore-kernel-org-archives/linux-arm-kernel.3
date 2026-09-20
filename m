Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0554C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 15:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvRcN97+jbxD6uQgpvhSo80k6y8QmG3eSAaiOeHxkVA=; b=t9AoSDFm5jKx9awaKYvT9OeJuB
	NnoJeYNdh11GAgnGlTf2wEfYZV4xtKRMrWhPQCc+QBc+v62vupmKFhOMLOz4NzDgC1ZMyB3s9DMh+
	cElQrvVNbJMk06Girl+CI3D+JJQignpkh12I59dXBfB6IYsmu7ybE5Nwoeu+tWaeILu39SYErJKMM
	VzUs35c32KZcGXhLj9Qwucq7cHdWT6zDS22zK4gxnTOr+JhxO2WdW2wbk9mKzAJMcrj233Srxh2+u
	YFKexQNqB8J45HMkAbHIRs7wZENqQUF4Cq4Qo2eiqz5Nz+RXfx9Eyz14QGd4wLrVsVcur60TVLui0
	jdTRyBIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JFr-000000002xo-3vbi;
	Sun, 20 Sep 2026 15:14:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8JFp-000000002xG-3mtO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 15:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=SvRcN97+jbxD6uQgpvhSo80k6y8QmG3eSAaiOeHxkVA=; b=ql
	ppejBnN0PZNUqLKTHWkJM+HmHsYVsli3gyQekHvcOEfLfLGMguGBHbBszTS+Vu7Yazf+jxA4OgLsr
	oG/1Q7/Gf/S4+7daMuDriuVEcZ258h6VrpCW4/UYBhPRWoV1Vad/rKZQaaW83DLJ1zHy5tdmu2gyF
	5tl4p1EI6bOVmuU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x8JFk-006Ady-8f; Sun, 20 Sep 2026 17:14:52 +0200
Date: Sun, 20 Sep 2026 17:14:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?iso-8859-1?Q?Nicol=F2_Giuliani_-_nicolo=2Egiuliani6=40studio=2Eunibo?=
	=?iso-8859-1?B?Lml0?= <nicolo.giuliani6@studio.unibo.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: R: [PATCH 3/3] arm64: dts: marvell: Add Sophos XGS 107w NPU board
Message-ID: <feea5596-f4ef-42af-b9f7-6bf170620532@lunn.ch>
References: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
 <20260919-send-dt-v1-3-365615a74ef3@studio.unibo.it>
 <6b935e31-169a-4cd1-b385-62dc659c1256@lunn.ch>
 <DU4PR01MB12163AE447B65B21A7D585A0D80852@DU4PR01MB12163.eurprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DU4PR01MB12163AE447B65B21A7D585A0D80852@DU4PR01MB12163.eurprd01.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_081457_939216_6474B7B4 
X-CRM114-Status: GOOD (  19.49  )
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

On Sun, Sep 20, 2026 at 08:48:20AM +0000, Nicolò Giuliani - nicolo.giuliani6@studio.unibo.it wrote:
> Hi Andrew,
> 
> Thanks for the review.
> 
> > The reset line of the switch (CP GPIO2 pin 17) is deliberately not given
> > to the mv88e6xxx driver as reset-gpios. The 88E6193X needs about two
> > seconds after a reset before it can be used, much longer than the driver
> > waits, so the probe would time out.
> >
> > The obvious question is, why is your 88E6193X special?
> 
> I don't think it is.

So please fix the driver to accept that the 88E6193X is much slower
than any other Marvell device.


I saw the probe time out when I started the kernel with kexec from the vendor Linux, so nothing had reset the switch before the driver did. When the boot loader resets the switch first, which is how the board normally boots, probing with reset-gpios works on this board (Linux 6.18). I have not been able to test a driver-only reset yet, because the boot loader always resets the switch first, so I cannot say what made the difference. I have not checked whether an EEPROM is attached. v2 describes reset-gpios and drops the comment.
> 
> > +&cp0_i2c0 {
> > [...]
> > +     gpio@20 {
> >
> > Which port?
> 
> It is the LED expander of the eight RJ45 ports (two pins per port). Nothing uses it yet, so I dropped the node from v2. It can come back together with the LED nodes.

Doesn't the 88E6193X have LED controllers of its own? Why do you need
additional LEDs?

	Andrew

