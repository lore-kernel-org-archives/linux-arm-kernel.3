Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9D8D68BF5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 17:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NNLLCEIx8IzwDwZu7yHwyqQ+HCj7SmlfLX0ltjHK1c=; b=sixKUGRHfAFVu2V026AHfk5wUb
	ue9fIygATTwLRMVBWdQacyAXCkdZVm1MtJfqUlSWxvh52x5Y7RAGZzwwfZBwYXs2HvWxkfhqQ1MdS
	o4/vzxF4aYN40G+JI3zOjRNuyq/eCP9b7wmuIL54b5c01KUDmPehom1ZJp4Xb8cvnto5lnBHTTzqP
	U9yt8nZOBz512SslnD49isbrmcsPvBlzwjN2LfKdiP1hgR7I0ALeQjgGtEYzWtgdUR2+o0Otw1R4/
	8UPReCL1SdLZ5kHsNFYVcFWJ50tTWZjyaCUio/Dc9bfFelIjAPaOvGe/1omNqmZJ/2uZoTJip8NTF
	HrGRleBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCMrU-00000005z57-4BAM;
	Sat, 16 Nov 2024 17:45:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCMqa-00000005yz5-0pZy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Nov 2024 17:44:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8NNLLCEIx8IzwDwZu7yHwyqQ+HCj7SmlfLX0ltjHK1c=; b=c96XA77v161R7ji8ERnY0/Rb2T
	wNwGYefMTcknNBHUksYVjNHb2WnHftgV4lBTnCw42KiRfW5m5qoUI5CjCzeHvfvDME7qS2tNUPKTo
	90frI/JCUTUqUqqc7EvBPXYJQecn3dWm4FU4bZMARsCq/3sJ8shawi1d9mYbeVHvgw4h3N6vjXwY7
	K2iUqJguIZThrjMPNWdCa8EcMpK9FvkPzxjukmDb9QV1rEFT34ESldAZ7RYq5O0HlKJBGp4kaBPWy
	Oompd0zu5LWojhwPGb9lhG2+S3DO9lBFi27OX2OvAkJMwX5dxeu238KS7OBdJqdqGuNKvTEmnXVk8
	bLdNhxAA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41742)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tCMqK-0007TN-31;
	Sat, 16 Nov 2024 17:44:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tCMqG-0003IR-1h;
	Sat, 16 Nov 2024 17:44:16 +0000
Date: Sat, 16 Nov 2024 17:44:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v2 0/2] Fix 'ethtool --show-eee' during initial stage
Message-ID: <ZzjZ8EcwpU-YnZrz@shell.armlinux.org.uk>
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
 <403be2f6-bab1-4a63-bad4-c7eac1e572ee@gmail.com>
 <ZzdW2iB2OkbZxTgS@shell.armlinux.org.uk>
 <170a8d59-e954-4316-9b83-9b799cb60481@gmail.com>
 <Zzi7dqqZLCCVvlHq@shell.armlinux.org.uk>
 <3915908d-d70b-4fbe-b80b-990d02211965@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3915908d-d70b-4fbe-b80b-990d02211965@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_094436_239697_B4775EB5 
X-CRM114-Status: GOOD (  12.36  )
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

On Sat, Nov 16, 2024 at 06:41:13PM +0100, Heiner Kallweit wrote:
> On 16.11.2024 16:34, Russell King (Oracle) wrote:
> > Hmm, don't we want to do this under phydev->lock, because network
> > drivers and phylib may be reading from phydev->eee_cfg? If we
> > update it outside the lock, and then revert, there's a chance that
> > the phylib state machine / network driver may see the changes
> > which then get reverted on failure, potentially leading to
> > inconsistent state.
> 
> Good point, then the patch would look like this.
> BTW: Saw that Jakub applied your patch already.

Yes indeed, so I hope Jakub will apply your follow-up patch soon!
This LGTM.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

