Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C7CC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 20:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqNcMlH8o98wb+BIZdRuGcY3aOxf7W0cZQypsyRwjdU=; b=MsjkB7ne0zUxVfe9Mzib8Cxw0o
	DQF667rnQ0MV/uFBa6W8JGOZitryeAmbedLXa+OPh18ndsegbn2fYSggBHr+VPzgICb7ijo7QMFEy
	Ub5nzD0QJOO9LEslOtuHGO7PVbRYlsV0a7xeW9i/wwtxxuogfHQcCKGhI3p+jJw/GdFrlPzH9WCi8
	5fnM7fGi7UmQODf0+F0pQywrvhhielPwpeXSp/EFRp93D5ILpGJwlGrSMCM+Gt6zVyTPgv3tY6hub
	UMVB2PkBue7sosyzaNA2m+ByTEGExUt8H6mAGsiW5BwoCRGKvYp1qUdn4a46ZTK2UI1WjaBK8YofS
	xmJHgqAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2acv-00000003H4i-4Bl8;
	Fri, 04 Sep 2026 20:35:10 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2act-00000003H33-18Zp;
	Fri, 04 Sep 2026 20:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rqNcMlH8o98wb+BIZdRuGcY3aOxf7W0cZQypsyRwjdU=; b=qEtAqQDE3F0xWrtVdVZTb9sYgM
	2oZobmJLx6AmyNu4af3S4ZMq+GvzGLqnVRKX8HyozkyUpJHCYzpO7HeBD8h6y3eFH0iBjW7XWXVRF
	MnzTELHNNGZ5eK+fLEylkTu3QGRK/oou7gOWvTV5yjDcddq+CP9LhPp4WGvrpMDCs0Yg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x2ac7-00350F-AW; Fri, 04 Sep 2026 22:34:19 +0200
Date: Fri, 4 Sep 2026 22:34:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
Cc: netdev@vger.kernel.org, daniel@makrotopia.org, dqfext@gmail.com,
	SkyLake.Huang@mediatek.com, hkallweit1@gmail.com,
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com,
	sean.wang@mediatek.com, olteanv@gmail.com, yangshiji66@outlook.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v3] net: phy: mediatek-ge: disable EEE on the MT7530
 PHY
Message-ID: <63a43d4c-f09f-4ca2-9003-7010ba045333@lunn.ch>
References: <20260904202800.3410838-1-vladislav.karmanov.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904202800.3410838-1-vladislav.karmanov.dev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_133507_309044_7B3A5E55 
X-CRM114-Status: GOOD (  17.79  )
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

On Fri, Sep 04, 2026 at 11:28:00PM +0300, Vladislav Karmanov wrote:
> The MT7530 internal GE PHY advertises EEE by hardware default, but its
> EEE support is defective: with EEE advertised, some link partners fail
> to establish a stable link. On a 2-pair (4-wire) cable where both ends
> advertise gigabit, 1000BASE-T training cannot succeed, and instead of
> falling back to 100 Mbps the port loops, so no link or DHCP lease is
> ever obtained. MediaTek confirms the hardware is the root cause (Landen
> Chao, 2021): "EEE of the 10-year-old MT7530 internal gephy has many IOT
> problems, so it is recommended to disable its EEE."
> 
> mtk_gephy_config_init() used to clear the EEE advertisement early, but
> commit af3b4b0e59de ("net: phy: mediatek-ge: do not disable EEE
> advertisement") removed that on the rationale that the DSA subdriver
> already performs an early disable. That holds for MT7531, whose
> mt7531_setup() clears MDIO_AN_EEE_ADV on each switch PHY, but not for
> the MT7530 PHY: neither the MT7621 integrated switch nor the dedicated
> MT7530 IC ever had such a loop, so removing it left those boards
> without any working early EEE disable and the link flapping came back.
> 
> Since the broken hardware is the PHY, fix it in the PHY driver so it
> covers all users of this PHY, integrated in a switch or standalone:
> 
>   - clear MDIO_AN_EEE_ADV in probe(), before anything can negotiate
>     EEE with the link partner;
>   - call phy_disable_eee() so phylib does not write the advertisement
>     back on later renegotiations and userspace cannot re-enable EEE.
> 
> Auto-negotiation then falls back to a stable 100 Mbps link instead of
> looping at gigabit. Tested on ASUS RT-AX53U (MT7621): with a 2-pair
> cable on the WAN port, a single clean 100 Mbps link comes up and a
> DHCP lease is obtained, where the unpatched driver loops.
> 
> Fixes: af3b4b0e59de ("net: phy: mediatek-ge: do not disable EEE advertisement")
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

