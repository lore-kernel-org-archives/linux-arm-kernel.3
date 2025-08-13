Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED291CA0EE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 18:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RmjA/0wiM4s7TkHx13AGbryUZlazMaMKFUlnrneZd8=; b=O0lz2wyZBLLnMh0JynN7yRIiiA
	aWRrVrhPF6m9BBvhVvazsbfkcT+sYYia9SoMi6GJCeMs4r+GmyKTwGWDzjo/jPM2mTERzbGW8/zUE
	f5JXtCbJWwJGgAcJw5lgep7jliWumGZtOIDrukLRF6RNqE9uc9JlEtjCYjqzpJY6Bh+tnvm5pMoMF
	8qxsyFQD4v25Pu+m/+eC0q4M9A2RxDEKJ4/N86C0KxmjbPFcxbSahzvGjnD1v6DHMuoMCb+spQfLh
	JgBBQBAYjj+b3PUEDxvINBfBPMKiCy/Ubj0M5jNnwl1TYNHuZPoggFV3sznqTO+d5sHXzUKHyTgs9
	oXXDLrUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFr8-0000000EeTm-2pR5;
	Wed, 13 Aug 2025 18:05:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEVc-0000000ERgU-1Ecf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 16:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0RmjA/0wiM4s7TkHx13AGbryUZlazMaMKFUlnrneZd8=; b=sLdiBpUQ6Yi+E7x3xU6hlF9M8i
	PnCofosIIGDvBfpg1eNpOM7+bfa0aFRmpvdr80QrtJ4ZAihQqJI/yt8SHMhnaL94kqYLIq/Vl7sZ0
	z3r12w8VXITbqpgNB981DFKF4qjjhw8HfynZBRCAj8z4okX0Ycn1Rz3UiGNTrvHkkME9mEPB7FNWZ
	BBgiPuymq90exhf6beW9yubxMbXDTN8qvjdqdrtcLR8kcITjAccHv0uuZQXY6Eitdn/sEdYKOe8Dn
	5ijge/Vtvg4pvrx9GIfPJI9NslD/y4GbqhV+tGVBGiBoVPEPbcCojGZJgv1lX+SULMrBi/WpbjN5e
	wE7F558w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34320)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1umEVL-00073q-0M;
	Wed, 13 Aug 2025 17:39:11 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1umEVF-0005uD-34;
	Wed, 13 Aug 2025 17:39:06 +0100
Date: Wed, 13 Aug 2025 17:39:05 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v2 06/10] arm64: dts: allwinner: a527:
 cubie-a5e: Add ethernet PHY reset setting
Message-ID: <aJy_qUbmqoOG-GBC@shell.armlinux.org.uk>
References: <20250813145540.2577789-1-wens@kernel.org>
 <20250813145540.2577789-7-wens@kernel.org>
 <aJyraGJ3JbvfGfEw@shell.armlinux.org.uk>
 <CAGb2v67cKrQygew2CVaq5GCGvzcpkSdU_12Gjq9KR7tFFBow0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v67cKrQygew2CVaq5GCGvzcpkSdU_12Gjq9KR7tFFBow0Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_093928_336020_B8655E2F 
X-CRM114-Status: GOOD (  23.93  )
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

On Wed, Aug 13, 2025 at 11:51:18PM +0800, Chen-Yu Tsai wrote:
> On Wed, Aug 13, 2025 at 11:12 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Wed, Aug 13, 2025 at 10:55:36PM +0800, Chen-Yu Tsai wrote:
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > > index 70d439bc845c..d4cee2222104 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > > @@ -94,6 +94,9 @@ &mdio0 {
> > >       ext_rgmii_phy: ethernet-phy@1 {
> > >               compatible = "ethernet-phy-ieee802.3-c22";
> > >               reg = <1>;
> > > +             reset-gpios = <&pio 7 8 GPIO_ACTIVE_LOW>; /* PH8 */
> > > +             reset-assert-us = <10000>;
> > > +             reset-deassert-us = <150000>;
> >
> > Please verify that kexec works with this, as if the calling kernel
> > places the PHY in reset and then kexec's, and the reset remains
> > asserted, the PHY will not be detected.
> 
> I found this to be a bit confusing to be honest.
> 
> If I put the reset description in the PHY (where I think it belongs),
> then it wouldn't work if the reset isn't by default deasserted (through
> some pull-up). This would be similar to the kexec scenario.

The reason for this is quite simple. While it's logical to put it in
there, the problem is that the PHY doesn't respond on the MDIO bus
while it's reset pin is asserted.

Consequently, when we probe the MDIO bus to detect PHYs and discover
the PHY IDs, we get no response, and thus we believe there isn't a
device at the address. That means we don't create a device, and thus
there's no mdio device for the address.

There is a work-around, which is to encode the PHY ID in the DT
compatible (check the ethernet-phy binding). However, note that we
will then not read the actual PHY ID (maybe we should?) which means
if the driver wants to know e.g. the revision, or during production
the PHY changes, it will require DT to change.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

