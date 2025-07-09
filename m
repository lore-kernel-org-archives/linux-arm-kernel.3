Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF35C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 04:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMqdXQYPH7R0rLOgNG95+m6qioNSgp89n0jbG2AEzM8=; b=huo7IGy4ODjlRkaHO+4ZhoEloG
	aC7B9YiOglM9OFVxJaNMoysiMV9DYpw7pm344CVBkidpspNTnLKjmCIA7+ywRwDAmuv+TMKNB8V1g
	eFw+Qk3uzuUx7t7sWI4hUSymFdQCoYggPA5jw0aO/6NXku83cUjcALV+KJBe71rrBvAo+k0s8DF5L
	xG2bRMYbggQkEVVbygB286pHyA+nrgYhpn+mEAutyl19FahNd6CXE7KewENhgKhEfPktbpkUDfqHD
	mBMs3VXM+zjNsR70FZJEsjZrLcspsnxkq/g+1kDt+2BA0iOQ6nfT0NailRwxHWtbwhvdLgR/bc3Tv
	54FeJy2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZMW2-00000007Olo-0LFR;
	Wed, 09 Jul 2025 04:34:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZMOj-00000007OCN-10uR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 04:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GMqdXQYPH7R0rLOgNG95+m6qioNSgp89n0jbG2AEzM8=; b=WzL0vmwbdhe2FrulM825lSq4Q2
	HPWAhGcz/WgC5SqZrrfkt2WPJq7W1JgEHp20VOgRQRDFD4SFWjuukNlIi0Uo5fGH26QyPUOJQfHSH
	CL8q1rrHcuQNaV06/FpHWVCSESgmlgLph1k1GbGC4n8crJjrg4+oYFycKuJYMFW8iSEMY7qTzL1zy
	uvQGLdrcIMbOBkyweFYukWqQI35GUpoFpZA7n4rfqlczgUx6139PkZRKxY1J7jOrv41ByT3Qvgfag
	+px1+9TgevMKpRmFkgMbzAk6v5mh6xLX06XbFIi9awwLHP7Y6T5iCrN3a5FlBgFdZNKLDSwX5dXKY
	WnsieUQA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38326)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uZMOY-0007QR-2d;
	Wed, 09 Jul 2025 05:26:58 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uZMOV-0002Ds-28;
	Wed, 09 Jul 2025 05:26:55 +0100
Date: Wed, 9 Jul 2025 05:26:55 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: lizhe <sensor1010@163.com>
Cc: Andrew Lunn <andrew@lunn.ch>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, vladimir.oltean@nxp.com,
	maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] net: stmmac: Support gpio high-level reset for
 devices requiring it
Message-ID: <aG3vj1WYn3TjcBZe@shell.armlinux.org.uk>
References: <20250708165044.3923-1-sensor1010@163.com>
 <52b71fe7-d10a-4680-9549-ca55fd2e2864@lunn.ch>
 <5c7adfef.1876.197ece74c25.Coremail.sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c7adfef.1876.197ece74c25.Coremail.sensor1010@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_212709_284283_77EFCABE 
X-CRM114-Status: UNSURE (   7.43  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jul 09, 2025 at 09:57:50AM +0800, lizhe wrote:
> + gpio_state = gpiod_get_value_can_sleep(reset_gpio);

Use gpiod_get_raw_value_cansleep(). The normal get/set return the
active/inactive state, whereas the _raw get/set return the physical
state.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

