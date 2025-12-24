Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0F4E75453
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 13:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcZ9ud6MrIIt3E5p0vRM1dPZEBiHBks0OHn0td+hkMI=; b=TpV6HnBx35nIHtoe5mLudlvE5m
	+gnboXE5s1oDC4/hqncTehLdTHcQXmLbaSKEieO9G/jvEgSj0aGlECGC0KRC59w3O2f7osJ04j4Cl
	sOPyzqs/LLZk+9klIII6WcGWizil9av2uTrctO7LwOPPJlRwJpgVuKH4MK5rnnL6s57WMwFI2Upn7
	IavtWzBU5SWjSY1MBjZ2XqyDHvfRDRr9XB6fceRBQH5QzCxb7vm8xrmMRfbRIXgi0aUQ95RSGPpG0
	KSyIvYFfdOVx1k58GLSlLTMDIHpqNwgEcBHs2WiFrDl+0hMWDJBMCoh6p0oPsH3dz1+HEtjqmy8L8
	tj2k3tqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPGv-0000000Gv7H-1VSa;
	Wed, 24 Dec 2025 13:51:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPGs-0000000Gv5t-3plO;
	Wed, 24 Dec 2025 13:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=ZcZ9ud6MrIIt3E5p0vRM1dPZEBiHBks0OHn0td+hkMI=; b=Zb
	U3d3vtlqyDpe1L0fl3J7uYSGVrTcxGTwWZyWJjYAasK025G+XWWmsgTC/01EkPP1TThtZskrv+/CE
	c7VheYUc/Lg1IsCZ5Si+3l5Du+jUXmJoFrTmClnFjl+FegAJVTyXK8uT/ekBqYMgqbl+gqSmWj8t2
	R/38FW45C93M/EI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vYPGh-000QDv-2y; Wed, 24 Dec 2025 14:51:11 +0100
Date: Wed, 24 Dec 2025 14:51:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	Frank.Li@nxp.com, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <9870fd41-bafb-4ab0-91ff-8fcea53ca0a9@lunn.ch>
References: <20251224111716.2925597-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251224111716.2925597-1-xu.yang_2@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_055122_949438_58CD198E 
X-CRM114-Status: GOOD (  14.11  )
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

On Wed, Dec 24, 2025 at 07:17:16PM +0800, Xu Yang wrote:
> The CR port is a simple 16-bit data/address parallel port that is
> provided for on-chip access to the control registers inside the
> USB 3.0 femtoPHY. While access to these registers is not required
> for normal PHY operation, this interface enables you to access
> some of the PHY’s diagnostic features during normal operation or
> to override some basic PHY control signals.
> 
> 3 debugfs files are created to read and write control registers,
> all use hexadecimal format:
> ctrl_reg_base: the register offset to write, or the start offset
>                to read.
> ctrl_reg_count: how many continuous registers to be read.
> ctrl_reg_value: read to show the continuous registers value from
>                 the offset in ctrl_reg_base, to ctrl_reg_base
>                 + ctrl_reg_count - 1, one line for one register.
>                 when write, override the register at ctrl_reg_base,
>                 one time can only change one 16bits register.

Are the registers openly documented somewhere? Could you include a
link in the commit message.

     Andrew

