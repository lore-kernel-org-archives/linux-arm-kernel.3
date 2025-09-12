Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE06CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 20:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYnTzN6gjk1V62nRFuBUob8dYdTb4gR1ZVzcqrzfX9g=; b=eiZ8K90rhO5wMl56iwRWAY2MQ/
	f02dmWLsDpBK/ZdAv8NkY7pDWkh7IcPj3UTVSZ+zKwvNIoZOWzLQJgeMzZHyhncMvbnJNbjO1YUhW
	9SvgIPkWIpqYR84BcfUIHFhtcmi0nOgjZjgQ7/d1JoGAsd/6IHFt9/Cla89rlwwi46/EaYzRpOyP3
	B2DdQIM0RCT0VpBiR1dhGMBSXPonCVQsZ06SgO3QXlOliwS1bbbm9dfmne2f5/cJKIz4MX4NifMkM
	xhstSmh42Hwo6V68JLKbiLnS7DLoKehXmtb57aDz9vUQCrQzvmqXno+j/n/nw9QVHQCnm2aYACMi7
	FBK87j4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxAhw-0000000BUyD-2LXB;
	Fri, 12 Sep 2025 20:49:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxAhu-0000000BUxt-29th
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 20:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QYnTzN6gjk1V62nRFuBUob8dYdTb4gR1ZVzcqrzfX9g=; b=QhU3K4iQeiZ9oPSOZ+eoh7CkKw
	Amrm0o0Ull3Hp9+SfF8McDK6Y0QT8xpCQHw64vu5pGuBELPk2k0ZPuLiraRJ1kJPTX0OtcOGdH9RF
	G1PmZ43Ta7MIN09WAjR/sL+6f8RMgXrwu+9mGtlQnP4a9UZrW3qzdNiniHgUuCDCiQCg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uxAhg-008FuC-C5; Fri, 12 Sep 2025 22:49:08 +0200
Date: Fri, 12 Sep 2025 22:49:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH net-next v5 4/6] arm64: dts: allwinner: a527: cubie-a5e:
 Enable second Ethernet port
Message-ID: <45ec4777-51c5-4ed4-a1a9-568c3c027482@lunn.ch>
References: <20250911174032.3147192-1-wens@kernel.org>
 <20250911174032.3147192-5-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911174032.3147192-5-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_134922_558019_DB836E20 
X-CRM114-Status: GOOD (  10.13  )
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

On Fri, Sep 12, 2025 at 01:40:30AM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> On the Radxa Cubie A5E board, the second Ethernet controller, aka the
> GMAC200, is connected to a second external Maxio MAE0621A PHY. The PHY
> uses an external 25MHz crystal, and has the SoC's PJ16 pin connected to
> its reset pin.
> 
> Enable the second Ethernet port. Also fix up the label for the existing
> external PHY connected to the first Ethernet port. An enable delay for the
> PHY supply regulator is added to make sure the PHY's internal regulators
> are fully powered and the PHY is operational.
> 
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

