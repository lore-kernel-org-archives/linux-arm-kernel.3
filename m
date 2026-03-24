Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EA0F54AD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zf0/9XCuKjKNRx7wtM4tESz8aRDpD2HLpkH9lTB+IIA=; b=lr4L8GtzCqUdcywRhUgyy/M+4B
	vj6J6U9X56/LHH25f2Q4eFkkF/FKm0aXAwErspTB9ZCAfHfGjuK6uHD6dIbq1HGOe3urf/BUOqQZj
	kw4nptpYEJCYYYfpsb/RvC2a1TF7WAFSIgYiEPwRfnw8naEOHanmoUWYSvf9qQftlpZexbI9a11WH
	Id02wkDxfZgdaYlC4LSTdh7c94bVDKvyBKIP7ciBELgDPzVdJEDJ6dUcf4tfjsqNxUL1wmvzKtvqq
	V16CyGPDD8H/PHJJCo/g8twLchoo+lb7Vp+C7F0Xl07ySlHd20qjEbOvCZOa613tnJXhC41OkUUvR
	YK0I+CMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54At-00000001ngU-06Za;
	Tue, 24 Mar 2026 16:00:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54Ap-00000001ncR-0ULd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:00:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zf0/9XCuKjKNRx7wtM4tESz8aRDpD2HLpkH9lTB+IIA=; b=lgFhXA8REvNp111NhY4I0709M1
	NK3B3KQHkcib7fhl1e7BukTgkeUJM5aQJKcxW5RnafIlp5nQgaxa2NfEQGzcu+zoyc0vI+vJx/4IW
	lA6ZIBfVFrYaE0pOulcKZJaKgJw1O82umOBC9QLWI7o4voEMSUA/8Ea0sj6WJ4OaLR7sGofJF+I/N
	9Ockuh5cyEAHxptwBdx5Bb0GDXY778sXNtfyqlxKCp5izHivWUgTm62a+DoF7PrbOshI1SnkhkGc8
	treb6nUxPH2r/oCuV1HGFr5vO36v8s1u9PMcGwIA77cbE2IhyrAI5abfOMnAAmoQS55Vmcohd7WFK
	SLMWJ+Ww==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59014)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w54Ab-000000002Hk-2C8t;
	Tue, 24 Mar 2026 15:59:53 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w54AY-000000005BX-2SMV;
	Tue, 24 Mar 2026 15:59:50 +0000
Date: Tue, 24 Mar 2026 15:59:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: Paolo Abeni <pabeni@redhat.com>,
	Michal Piekos <michal.piekos@mmpsystems.pl>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] net: stmmac: skip VLAN restore when VLAN hash ops are
 missing
Message-ID: <acK09pJynbhPnKDN@shell.armlinux.org.uk>
References: <20260321-vlan-restore-error-v2-1-45cf56a5223d@mmpsystems.pl>
 <5e5706bb-0f04-4bb1-94f4-45083a3c76fd@redhat.com>
 <acKL4RoM-zdwj1Ib@shell.armlinux.org.uk>
 <TY7P301MB1984855F48CACF4FE1B502A4D348A@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY7P301MB1984855F48CACF4FE1B502A4D348A@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_090007_783394_2733F00F 
X-CRM114-Status: GOOD (  15.35  )
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

On Tue, Mar 24, 2026 at 03:37:24PM +0000, Ovidiu Panait wrote:
> Hi,
> 
> My understanding is that the code in stmmac_vlan_update() that checks for
> !priv->dma_cap.vlhash is dead code, this condition cannot be true inside
> the ndo_vlan_rx_add_vid and ndo_vlan_rx_kill_vid callbacks because the
> callbacks are only called when priv->dma_cap.vlhash is true.
> 
> This seems to be a long-standing issue in the VLAN code.

If you're certain that there's dead code here, please consider
submitting patches to clean it up thereby making the code easier
to understand.

> I only have access to a board that uses the DWMAC4 IP, but I'll have
> a look in the documentation I have to check how to improve VLAN
> features handling. 

Definitely please do! Having more effort to clean up parts of stmmac
would be very welcome (but please bear in mind that I have had quite
a large patch set, but that's reducing now.)

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

