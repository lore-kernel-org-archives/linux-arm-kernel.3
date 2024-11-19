Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94627D60D09
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 01:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKexsWnSH++iKlU+BchMFxWV0f36/dz0tcdVIEQsvg4=; b=f3kbOGpiiluBQ5I1SoFjkZyAVK
	8KigqFCptgSmoFfHsfhhzZdkjxk8KgyrmklfXTnKNydCqh7bT+/1oVfb/swVced8Yd4tMQYri7T8m
	OLDGRE7SaloGklS0Wg1FWJtyHzTRwhUStpVaEA0NuFmOxbInzRpAg3u/i5kUk/qbK7XK3NNsKskUb
	BKEisItjK9J2JsvfcgmBmQ/yu2Vd6VfAKM9MVTSDzV3qIxZiSnhA/2sKIW1yV26Nqn/3iXByoQShz
	boEnhvH1eSRXjdGt+hdB5CWUUzWosanHu5B7vhgostOSyNjIGHtz89LVeB7nEAOkJyI/08syCeJ27
	VcKuCGmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDDQN-0000000B7Xn-1jrV;
	Tue, 19 Nov 2024 01:53:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDDNi-0000000B764-2TMo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 01:50:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AKexsWnSH++iKlU+BchMFxWV0f36/dz0tcdVIEQsvg4=; b=FoRpVWRN0AyTJEZev+FVhNBVHj
	5/xsNYxf4HOCeqSHtbzissQs1dxF411e5l+8PmCZin9veDYrjVRHpTAHlnbb2yTXqtaCAZrb07tHN
	DaFy4wtE3ClyJFgWz4xOZW8DtXC86fzJ6s9IohxQH/wzHMOurDr29anPNX8D8R1b2NP4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tDDNQ-00DjXv-Tj; Tue, 19 Nov 2024 02:50:00 +0100
Date: Tue, 19 Nov 2024 02:50:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, hkallweit1@gmail.com,
	linux@armlinux.org.uk, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next 0/3] Add Aspeed G7 MDIO support
Message-ID: <7368c77e-08fe-4130-9b62-f1008cb5a0dc@lunn.ch>
References: <20241118104735.3741749-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118104735.3741749-1-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_175018_629200_4664A9B1 
X-CRM114-Status: UNSURE (   7.36  )
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

On Mon, Nov 18, 2024 at 06:47:32PM +0800, Jacky Chou wrote:
> The Aspeed 7th generation SoC features three MDIO controllers.
> The design of AST2700 MDIO controller is the same as AST2600.

If they are identical, why do you need a new compatible?

	Andrew

