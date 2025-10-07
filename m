Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460E8CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 16:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sux+G8UYuTe6OpX0yXYNFv4IijM8dkNkYRTT0OHVyw0=; b=s+0slQY+ojm1zm2l6PpudPV+9O
	obSfxzz50OsMBykWvWvcJAs/foIamGcDFuuV97jgCKmdjXV9qinbK9LSm5im6ef5rjx2AjM/aq17A
	BheY7F3t/XPPIuFwY6+mnDqIswzy95O+z/ZwUZCLgXFzwTvFZp5gFwV4Rzly1NR20MEl+35eU9g8h
	+3C6o2efqODAgi9AjTGohDEHgRRzPbSdjXRwEa97DLKAHsUb865Zs3WJR/OAdpOhkNsNZhyyosEhV
	i9TdeD/J+FCqOjJATWzhv3odRlX9hxCmKcJOuVD4UsfotEQ19vm3q+dO93yoX0TBNOa7AAMYkl3Lp
	dkT85tbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6AVy-00000002OtC-3nU9;
	Tue, 07 Oct 2025 16:26:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6AVs-00000002Osf-35CN;
	Tue, 07 Oct 2025 16:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sux+G8UYuTe6OpX0yXYNFv4IijM8dkNkYRTT0OHVyw0=; b=Yt+zyzdaOOyvXP4CN8scOQIvB7
	hMr62mIPLsssoXyHhcgac7K4DzmccMDIDSjxxYEeR/8RneyHCtA0Inha4T4G6cc99kLkMBLuYp9mE
	GaJ+IVuQgqMWNgnetTmMcsMSASET8pF08TRHopxw9XugNyFZ1Bg8dmIT/Wn9yqx8sAZN8rKQCcetI
	+D46UgqmLdVqetuBPV745ZPMCeWNxSYEKrWmXD2vvkzCUD9a4doViK4QyD94QWfQHRpu45gB4SlcC
	APYp4cD7U9E/tg6+sYz0/8sUk4Q25qD4ZqDY0LLWdjvnzN3/Iyg65K8KMd+kTIzjy9hMxRlyAEngO
	Nj8ev45w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58244)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v6AVR-000000005LF-197N;
	Tue, 07 Oct 2025 17:25:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v6AVK-0000000032Z-2vLE;
	Tue, 07 Oct 2025 17:25:34 +0100
Date: Tue, 7 Oct 2025 17:25:34 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: jjm2473 <jjm2473@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, heiko@sntech.de, quentin.schulz@cherry.de,
	kever.yang@rock-chips.com, naoki@radxa.com, honyuenkwun@gmail.com,
	inindev@gmail.com, ivan8215145640@gmail.com,
	neil.armstrong@linaro.org, mani@kernel.org, dsimic@manjaro.org,
	pbrobinson@gmail.com, alchark@gmail.com, didi.debian@cknow.org,
	jbx6244@gmail.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: add LinkEase EasePi R1
Message-ID: <aOU-_tPOmkyuw_kx@shell.armlinux.org.uk>
References: <20250929065714.27741-1-jjm2473@gmail.com>
 <20250929065714.27741-4-jjm2473@gmail.com>
 <d8ad476c-d0c7-4e97-9e76-540a539ffb52@lunn.ch>
 <CAP_9mL4ofig-X-w9wx1A5D_eVXROo6AVFBSwp4mh=kj7webpPA@mail.gmail.com>
 <7e219aef-88a0-4184-9553-30dcbc8dbd79@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e219aef-88a0-4184-9553-30dcbc8dbd79@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_092609_045943_AFF8FEE9 
X-CRM114-Status: GOOD (  17.10  )
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

On Tue, Oct 07, 2025 at 04:57:32PM +0200, Andrew Lunn wrote:
> On Tue, Oct 07, 2025 at 10:32:26PM +0800, jjm2473 wrote:
> > Andrew Lunn <andrew@lunn.ch> 于2025年10月6日周一 23:51写道：
> > > Please change it to rgmii-id, and smaller tx/rx_delay values. Or show
> > > us the schematics which clearly show extra long clock lines.
> > 
> > In fact, the RTL8211F's RXDLY and TXDLY signals are both pulled low,
> > just like the Banana Pi BPI-R2 Pro, so the configuration is also referenced:
> > https://elixir.bootlin.com/linux/v6.15/source/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts#L237
> 
> Pull low makes no difference to the 2ns RGMII delays.

To be clear, while the RXDLY and TXDLY are hardware strapping controls
the hardware configuration of the 2ns RGMII clock delays, the realtek
driver can (and does) override this according to the phy-mode property.
Thus hardware strapping makes no difference to Linux.

So, what we get at the RTL8211F PHY is:

	phy-mode	receive clock delay	transmit clock delay
	"rgmii"		0ns			0ns
	"rgmii-rxid"	2ns			0ns
	"rgmii-txid"	0ns			2ns
	"rgmii-id"	2ns			2ns

irrespective of RXDLY / TXDLY hardware strapping.

> > The tx_delay and rx_delay values were obtained using Rockchip's
> > automatic scanning tool:
> > https://github.com/istoreos/istoreos/blob/54746dfdb5bd34d1f281cf41d1d1620d0c3ee686/target/linux/rockchip/files/drivers/net/ethernet/stmicro/stmmac/dwmac-rk-tool.c
> > https://gitlab.com/firefly-linux/docs/-/blob/rk356x/firefly/Common/GMAC/Rockchip_Developer_Guide_Linux_GMAC_RGMII_Delayline_EN.pdf
> > https://github.com/axlrose/rkdocs/blob/main/Common/GMAC/Rockchip_Developer_Guide_Linux_GMAC_RGMII_Delayline_EN.pdf
> 
> Vendors get things wrong, including this. 'rgmii' means the PCB adds
> the 2ns delay. Nearly every Rockchip board follows Rockchip broken
> vendor recommendations, and then i come along, point out how it is
> wrong, and ask for it to be fixed, before being merged to Mainline.

Can we at least get the "tx_delay" and "rx_delay" DT properties (which
are register values) properly documented in the DT binding document?
I know from the driver code that a value of 0 means "no delay". Other
values add an unspecified delay - it is not obvious what any non-zero
value means, or what the default means.

This would help us understand what values such as:

	tx_delay = 0x3c or 0x4f

and

	rx_delay = 0x2f or 0x26

actually mean in terms of the resulting delay at the MAC.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

