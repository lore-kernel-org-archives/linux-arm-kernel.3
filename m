Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663DDCCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 18:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rA2LYAqEb92Q4g4Yq5hfL5BuClXd15oA216rjXGuuxw=; b=kYKeyJMBZhm5xVv7myZzkXtXX1
	OXAmh6QDyNB9hpRlIOjf+nJedycnUm63mO/0DX7LzMQSb2fvwX0l6jrOy4OaKOd7M+jMp20HS5X7C
	vT/g4t/ZN3AcF09RvMrMvbHmkyRT2W/JIddxboPpynMy6EvnPg1VLWkOcrOIzqlti8ARNSP0/tCB5
	mMitUSCNgUnZGp8/YODXk1EGjQsSwQWw4KvTgvuYab0oEkvqoQ0R4c8J4Bsb5TZsG1a9UDKZ9IYRX
	BP19qrBoosB3UQuaWhPJ4u6zQbrgun6biGZeXxwHVuh0NyYr86MUSmNCc4p2CO9EBSZmt2/irMIdP
	z+TziJEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdIu-00000003wTp-3yVY;
	Wed, 22 Oct 2025 18:11:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdIs-00000003wTL-1KTt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 18:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rA2LYAqEb92Q4g4Yq5hfL5BuClXd15oA216rjXGuuxw=; b=oUDa7GAInMplqxvZSxR7xdnKfh
	gnH6WvqRq/oIBsMGn5B4Ks5GnfWDskOvVYABlOA8tn8Phd8Dp7vZrjhCud8Fzmqj/iaKFdMEuCxnY
	kZvFEFV0mmL5eZU2ZxkV8WAEFsf2UL0JcrMjG7K/4TbXTaabn8auv8wRmqRN4miJ74OHF2XkN71iw
	RGfxe6FO+nXNyGucn/kr9fZQW6Fr+rd9AbX3hTGL4ag4Y+E6rLalGw44eGLv/adpU0DlyaCbVSoTN
	E1fcCouudt62ivDHgkNWQpp8exExqQYx1XBEDtlg4ILJUHnKvov2uOrXITsn5NXJgdUAhPKZAyyla
	2VkdLFkw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57282)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vBdIf-000000005HL-3eJg;
	Wed, 22 Oct 2025 19:11:05 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vBdIb-000000000uh-3ctw;
	Wed, 22 Oct 2025 19:11:01 +0100
Date: Wed, 22 Oct 2025 19:11:01 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 4/6] net: phylink: add phylink managed
 wake-on-lan PHY speed control
Message-ID: <aPkeNRyRtHOMs5h5@shell.armlinux.org.uk>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCZ-0000000B2PP-2cuM@rmk-PC.armlinux.org.uk>
 <eb0d1b55-307b-4b51-953f-fdcc1a8fbe27@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb0d1b55-307b-4b51-953f-fdcc1a8fbe27@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_111118_657127_FD8403AD 
X-CRM114-Status: GOOD (  11.77  )
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

On Wed, Oct 22, 2025 at 04:28:19PM +0200, Maxime Chevallier wrote:
> Hi Russell,
> 
> > +
> > +	if (phylink_phy_pm_speed_ctrl(pl))
> > +		phy_speed_down(pl->phydev, false);
> 
> Should this rather be phylink_speed_down, to take into account the fact
>  that the PHY might be on SFP ? either here or directly in
> phylink_phy_pm_speed_ctrl() above ?

I think using phylink_speed_*() makes more sense than merging the test
into phylink_phy_pm_speed_ctrl(). If something changes in what we do
with speed_up/down() then we want everyone to be affected (not that I
forsee any change there.) Logically though...

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

