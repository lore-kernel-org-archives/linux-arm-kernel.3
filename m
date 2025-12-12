Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3446BD49226
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 13:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWjUVnv5CTcr+GDjfb0bwkJFd0vRqz5/wKl7xHkr6Es=; b=zVLqAVIMDTwh1wm9DP5vh/7xpg
	+NCyiyAHH2uT8v+FESwTPQOLs1dbltfEi0qqljYniO6BEohKlP6V0iBYNPGlQ02ppMM8GGVzuvWIL
	O3yC0GPVwoiAuSFny79oBTkPhzMiXwsJgQtVlcA2yqksrBYQxqLWuhdAnhyTJivJ7BdpKyMDWEUAh
	ZkWkXw8CH8BQjQJ2Y+w6qxmhvI9zzH3y6Ib4LxnU132Sk1HvIyn3L5HrfaI0skObbWEkCZu9WIu+5
	qgjhbYzx5owU7qr8tzEfg6jjwP/Ae/Xtm2Xx9ltfRjdaKBPDsjP4iA2HxMnHHCj/llYLZXUWMe+wJ
	8YI0T/QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU3Gp-00000000ZBB-18cZ;
	Fri, 12 Dec 2025 13:33:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU3Gm-00000000ZAZ-2Iz2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 13:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YWjUVnv5CTcr+GDjfb0bwkJFd0vRqz5/wKl7xHkr6Es=; b=4m6yDxHoMU2gAPCnoz6Xchn4U8
	KHPhsZe/KvJls05qtq0Tfi6OJ+xBFeIG7OmYVQ5Srq0fKdB6+IzfbicCgVtZR7fHZb462uNM4ZzGg
	hpVA1B+8C/GHe8td/FPRqvsGy95sT+D8mqTRl5pdpzcOLEPS7wms4s6ku/jAIMFBj6HE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vU3GV-00Gksn-Fh; Fri, 12 Dec 2025 14:32:59 +0100
Date: Fri, 12 Dec 2025 14:32:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>
Cc: Joseph Guo <qijian.guo@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Justin Jiang <justin.jiang@nxp.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Tom Zheng <haidong.zheng@nxp.com>,
	Steven Yang <steven.yang@nxp.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: Add FRDM-IMX91 basic
 support
Message-ID: <8334a902-fd56-4860-82c5-402e1d982fa9@lunn.ch>
References: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com>
 <20251212-imx91_frdm-v2-2-4dd6d289e81d@nxp.com>
 <55fa5159-768c-4785-b0ba-5553193932ab@lunn.ch>
 <15608952-e974-4b9f-9832-e6a23860fc62@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15608952-e974-4b9f-9832-e6a23860fc62@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_053316_595462_4057D6F6 
X-CRM114-Status: GOOD (  11.12  )
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

On Fri, Dec 12, 2025 at 02:03:03PM +0800, Joseph Guo (OSS) wrote:
> 
> 
> On 12/12/2025 11:39 AM, Andrew Lunn wrote:
> > [You don't often get email from andrew@lunn.ch. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > > +&fec {
> > > +     phy-handle = <&ethphy2>;
> > > +     phy-mode = "rgmii-id";
> > > +     pinctrl-0 = <&pinctrl_fec>;
> > > +     pinctrl-1 = <&pinctrl_fec_sleep>;
> > > +     pinctrl-names = "default", "sleep";
> > > +     fsl,magic-packet;
> > 
> > Have you tested WoL?
> > 
> >          Andrew
> 
> Hi Andrew,
> 
> Yes, already tested.

Great. There is a tendency to just copy/paste this propriety without
understanding what it implies, so i just wanted to check...

For the Ethernet & PHY nodes only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

