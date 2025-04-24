Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED62C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 20:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgHAVRSAtGS2mucHqdulufmpGRpZTS9/L7tc07qePPc=; b=tYBRmB98ZxP3JhTHnh3S0EzZSX
	isoWOEbyQph43Px5WXSmp2iVaQRp8+MgTx6/jW9aGN5Ysh4G5+i7BRctAoxSJwr+0zBgOk3/3ygQq
	CMbiwJ4TwcbrzHDNXMelHMi60hfcOeXRREOBOhsV7ealNAvthi5UKn1RFc3pH9rxfXobTk9zyR1pI
	NjE9P3Psr61FtNkNUbPFzP+yOxiSXpAZZ3sL1MNFRmdYe3PxZqtjo96W3YGwODgAR49neiwvZ+1U5
	YiLrzHEsUBB3qqamyBjE5uC7LNxnX7gU0jgcgsllEqjqrKGBP6++G3Ntem5QrN+7QDNAF6uGbXrwE
	3T6+40JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u82pF-0000000FHew-3g5J;
	Thu, 24 Apr 2025 20:05:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81qt-0000000F74Q-3KpY
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 19:03:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bgHAVRSAtGS2mucHqdulufmpGRpZTS9/L7tc07qePPc=; b=LIjTeiO6Wz1aNcklIar7RDOCUL
	22UGKwhIK1Aay8TBLrTOxKLx7BzwUPfXO6GS5K25ORWQw8szigh+KGj8JCTPtWgKzDdDxlKFZiywE
	3ja8GxTa78s5swt1uGyp8GH7oDA70rUF3OYK6dpKzo2O+cUJDmohtDGLT2Q9MEy24CaZPPkNTrWrE
	wW+AQfU430fnqz5A1Ye1xzar1fmgrm67hJbb8svzdozt/4SPKnvdrxR25IoyGR0gMgZ6t4XPEiHG3
	Zpm/rgghDqRAlTosUCYDuqIaKc8cJQ/puSXU38EYYEnst7Niyl/auciwMc7RkH49awbRfnKxJ6FSC
	ixXtBeFQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u81qq-0000000BuLi-37GQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 19:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bgHAVRSAtGS2mucHqdulufmpGRpZTS9/L7tc07qePPc=; b=2RCrh/zN/3ZFHAA0cZnrwsSn/r
	7jiQ2NoKx+p2nXFoiPH81MDw/eOCr9IxIj/VbzE6U//36F+XhAZo2M3AA3n8txwu2IjAKfNnFXAo5
	XFmmzS08oyl2Uq7rB9EUQ807RpD/QVRoh5HoTIqNZQfycVkGUke3QQAhjqS/vWYgHA0M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u81qF-00AVAd-F9; Thu, 24 Apr 2025 21:02:35 +0200
Date: Thu, 24 Apr 2025 21:02:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Yixun Lan <dlan@gentoo.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, clabbe.montjoie@gmail.com
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
Message-ID: <7fcedce7-5cfe-48a4-9769-e6e7e82dc786@lunn.ch>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
 <4ba3e7b8-e680-40fa-b159-5146a16a9415@lunn.ch>
 <20250424150037.0f09a867@donnerap.manchester.arm.com>
 <4643958.LvFx2qVVIh@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4643958.LvFx2qVVIh@jernej-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_200312_937733_63C2EECF 
X-CRM114-Status: GOOD (  11.28  )
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

> In my experience, vendor DT has proper delays specified, just 7 instead of
> 700, for example. What they get wrong, or better said, don't care, is phy
> mode. It's always set to rgmii because phy driver most of the time ignores
> this value and phy IC just uses mode set using resistors. Proper way here
> would be to check schematic and set phy mode according to that. This method
> always works, except for one board, which had resistors set wrong and
> phy mode configured over phy driver was actually fix for it.

What PHY driver is this? If it is ignoring the mode, it is broken.

We have had problems in the past in this respect. A PHY driver which
ignored the RGMII modes, and strapping was used. That 'worked' until
somebody built a board with broken strapping and added code to respect
the RGMII mode, overriding the strapping. It made that board work, but
broke lots of others which had the wrong RGMII mode....

If we have this again, i would like to know so we can try to get in
front of the problem, before we have lots of broken boards...

	Andrew

