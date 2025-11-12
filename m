Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFC0CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 12:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LLQDTLZhEwI383p4au9J4JBzW8WMvm+21axEr2g03UE=; b=FLAPat6t7k8Wc+a2y3Ccj5Uq4F
	Ok8sf1GkNRlqazs1ijhkEFy9miI+Wp92Hs2Oetql0NplacSNtgy0kXuQeZ+GtvXlG7FwMrLe6PXij
	XuvyvV5AQW/CoH6fFOSi2uYkWIb3IQu2Z5a3oPgDeueNOL5dxCZloc3lWZ7Juu6UH9HwWOUol36Mx
	zPOLeel1Luq2xNY3s2X7RUAGM6FjPd0qAlGwSzFv8IRkprXtwZoC9ziDTo96aXuKYd41TA7ndJy68
	iQh70RPWobPWBBCl53Kx66I1Wn9caCp+mO3cunpDiRym+ma2ENu9mHjzNA0xq/7ErMJ4/wurVNX1V
	bE5dXt0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAAh-00000008n2c-2dn5;
	Wed, 12 Nov 2025 12:41:59 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAAe-00000008n2G-1G0l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 12:41:58 +0000
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF75CE77;
	Wed, 12 Nov 2025 13:39:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762951193;
	bh=LLQDTLZhEwI383p4au9J4JBzW8WMvm+21axEr2g03UE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rleANA/UnZt2L8Q2lRInyqmF+bbyFtlm+o2pO4RCNJJ1SF8U5/+i1RPGtuyFSq8M2
	 aFthXDSlJec4F1EAfuMfti3DJGll/kTTj/VkNaRg5Qa9ETOuATx2Ji8mM0uJWtaNSG
	 Qzt6fvd5pP2QQnt3iLmjmY59GRgf75vrUnPlqdgU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aRR-6Nl3ELB2v8gV@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com> <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch> <aP83bMDWCre7-Sjw@pengutronix.de> <aRR-6Nl3ELB2v8gV@shell.armlinux.org.uk>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Daniel Scally <dan.scally@ideasonboard.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>, Russell King (Oracle) <linux@armlinux.org.uk>
Date: Wed, 12 Nov 2025 12:41:50 +0000
Message-ID: <176295131007.567526.3395425614344577792@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_044156_481890_FFACAB0C 
X-CRM114-Status: GOOD (  29.23  )
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

Quoting Russell King (Oracle) (2025-11-12 12:34:48)
> On Mon, Oct 27, 2025 at 10:12:12AM +0100, Oleksij Rempel wrote:
> > Please note, RTL8211E PHY do use undocumented SmartEEE mode by default.
>=20
> Same as RTL8211F I believe (as used on the Jetson Xavier NX platform I
> have.) I submitted commit bfc17c165835 ("net: phy: realtek: disable
> PHY-mode EEE") to get EEE working on this platform.
>=20
> > It ignores RGMII LPI opcodes and doing own thing. It can be confirmed by
> > monitoring RGMII TX and MDI lines with oscilloscope and changing
> > tx-timer configurations. I also confirmed this information from other
> > source. To disable SmartEEE and use plain MAC based mode, NDA documenta=
tion
> > is needed.
>=20
> What I saw there was similar to what you describe (although I have no
> way to monitor these signals.) No interrupt storms, but while the
> stmmac TX path would enter LPI mode (whether that provoked anything
> in the PHY, I do not know), the RX path never entered LPI mode because
> the PHY never forwarded that status.
>=20
> So, I don't think having SmartEEE enabled on the RTL8211E would cause
> this interrupt storm that Laurent is reporting.

Perhaps further complicating matters.

I have a Debix Model A as well ... I'm in a different office to Laurent
- and I believe EEE is enabled on my board/network switch.

I do not get an interrupt storm.

I'm not sure how this helps yet, - I don't know what to debug as I can't
reproduce the issue!

I can provide remote access to the board with ssh if that helps anyone
who wants to look at something specific about my setup or run anything
if anyone has ideas of what to check my side.

Perhaps we can find some subtle difference between a working case and a
non-working case...

--
Kieran




> In Emanuele's case, things are different. The TI PHY reports that EEE
> is supported, implements the autoneg registers for EEE, but *doesn't*
> implement the necessary hardware for detecting/entering/exiting LPI
> mode. So, if EEE is negotiated, the remote end thinks it can enter
> LPI mode... which likely causes the link to drop as the TI PHY can't
> cope with that, and I suspect that's the cause of Emanuele's problem.
>=20
> I'm wondering why "arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait""
> impacts this - could it be that entering the idle state does more than
> just affecting the CPU domain, but interferes with the EQOS domain in
> some way. Given that the entry/exit to this state is all buried in
> PSCI stuff, without digging through the ATF implementation for this
> platform and then cross-referencing the iMX8M documentation, I don't
> know what effect this has on the system. Is it possible that PSCI is
> messing with the EQOS?
>=20
> What about the clock tree? Is it possible that the stmmac and/or RGMII
> clocks could be lost when cpu-pd-wait state is entered on all CPUs?
>=20
> Has anyone checked whether there's anything in the errata
> documentation?
>=20
> --=20
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

