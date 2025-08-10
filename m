Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A36C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUPUnoEBAZfqIDY+8Nh2cj2EKAuWKbwsRCUV0UW5AoQ=; b=kgHukoNQm3FR7pQ6TOi2s8AgbD
	CwIp8kP9OuSjYSmIEOUAsTdguVPwFNRZqvlruSBXCNEeGLQWiWv3AoUde2BMMO4BUHX7kmlF7Wrxq
	pDd+EFPQkxcttrRfIAbrfkxw6v23TwETz44sApNNvAM0nfidg8tTQ3/GOK+4fFBJLHo0xMVF2W3+s
	IXjIIixkTwnX6Dz1CkXn2FslYgqkDRM4mqujTWd0T6z/45kC2IMVL9Avzo9O34kiT1MuqRG/nNcYv
	mBLPS7iWTBkSZiL60qAaej29MIJyIZc6QYflgIif/0sgESJy+bzb+Np+7RVsLL1dgGAbv/4nmIgjv
	ZL+imgFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul7oz-00000005k52-0EOi;
	Sun, 10 Aug 2025 15:18:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul7mR-00000005jt1-3Ykd;
	Sun, 10 Aug 2025 15:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EUPUnoEBAZfqIDY+8Nh2cj2EKAuWKbwsRCUV0UW5AoQ=; b=L4H2zlPio+LxDuUxZereeQXnZc
	B3QZXrgzoFR6bTsfCEYwckhqPmrMjg300hzGQ1dt3EkhCvNjJ9gkPQB0uEJPsgSBArk7SLOcw6ZX5
	7ZxsRaveVC/PBTTdiYsJXy6NH7nHMrfQwXZH+O4WQ3nPUYt7HGfePlvQ2YvmlgpX1qyk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ul7mB-004EAx-FO; Sun, 10 Aug 2025 17:15:59 +0200
Date: Sun, 10 Aug 2025 17:15:59 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: jonas@kwiboo.se, alsi@bang-olufsen.dk, conor+dt@kernel.org,
	davem@davemloft.net, devicetree@vger.kernel.org,
	edumazet@google.com, heiko@sntech.de, krzk+dt@kernel.org,
	kuba@kernel.org, linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
	olteanv@gmail.com, pabeni@redhat.com, robh@kernel.org,
	ziyao@disroot.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add RTL8367RB-VB switch to
 Radxa E24C
Message-ID: <1f2f8eda-3056-48bd-9c86-3fb699f043f3@lunn.ch>
References: <db1f42c3-c8bb-43ef-a605-12bfc8cd0d46@kwiboo.se>
 <20250810140115.661635-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810140115.661635-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_081615_887961_CD7E71D0 
X-CRM114-Status: GOOD (  19.19  )
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

On Sun, Aug 10, 2025 at 10:01:15PM +0800, Chukun Pan wrote:
> Hi,
> 
> > I had only tested on a next-20250722 based kernel and on a vendor 6.1
> > based kernel. And similar to your findings, on 6.1 based kernel there
> > was no issue only on the newer kernel.
> >
> > I will probably drop the use of "/delete-property/ snps,tso" and include
> > a note in commit message about the TSO and RX checksum issue for v2.
> 
> After my test, this problem is caused by commit 041cc86 ("net: stmmac: Enable TSO on VLANs")
> https://github.com/torvalds/linux/commit/041cc86b3653cbcdf6ab96c2f2ae34f3d0a99b0a
> 
> It seems that this commit just exposed the TSO problem (with VLANs).

I'm not sure that is correct. What this patch does is enable TSO for
VLANs by adding the VLAN header to the packet in software before
transmitting it, rather than asking the hardware to insert the VLAN
header as it transmits.

What i don't understand yet, is what has VLANs got to do with DSA?
Does the DSA tagger being used not actually insert a switch specific
header, but is using VLAN overlays? Why is the VLAN path in the stmmac
transmit function being used?

Just a guess, but maybe it is a DSA tagger bug? Maybe the user frame
is a VLAN frame. The tagger is placing the VLAN tag into the DSA
header, so in effect, the frame is no longer a VLAN frame. But it is
not calling __vlan_hwaccel_clear_tag() to indicate the skbuf no longer
needs VLAN processing?

	Andrew


