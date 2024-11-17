Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EC7D10F2B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 20:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6cxG/zZp641/q+hYZRRTrOQqG5Xgl13FSXhfP9tpHQ=; b=sPUXFjoostZkkmg2HPR6fLe0FH
	4p1S1GZvV8cGtfRVhbeXfrK7o4ZR0XUE7c4h5yp8+hMWMeFllw6LnEc746+wsLR4P4tbivmWKtEZL
	LOfhzJOl4qcRN9DsS5rJaW4sTzn/WdUjU9zRq8uRGCq4QQDB7yfMe7i/qytgJ7pBMBMxOaPHzsbmW
	8KoUXH2dxldWXrlF6JVlFjjM7WmQzAV83b6T35I+tAtHui5SZj48U8eKbBJMCnZx5Gs91IQAdckd/
	yUJWk0j3rhXZIeBr4tJv5uCZZKERg4UFSf+halLnZurFkRB0+Re93gzzujcsUjZoVHHN5RBQsSfMt
	XZYdAL9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tClYF-00000007m8v-1y5Y;
	Sun, 17 Nov 2024 20:07:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tClXK-00000007m0K-1q08
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Nov 2024 20:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=n6cxG/zZp641/q+hYZRRTrOQqG5Xgl13FSXhfP9tpHQ=; b=21
	U+wuwFd3743A0QeYMjX6G0RHUhP4f7dA4yY9oNdlOscDp7pYteUrJm4U8xQtm+GpapDJENGzXZE/W
	RfPmCRKX9/+gjOJm9IPDmStpa4eEKp+mM4zvBwtD07kB/kmfYz6+3TEy6Ts8zzFAM3f0Y6XXPldG8
	1zqJkI/wx2p/4m4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tClXD-00DbFs-Lt; Sun, 17 Nov 2024 21:06:15 +0100
Date: Sun, 17 Nov 2024 21:06:15 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc: dinguyen@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH] ARM: dts: socfpga: sodia: Fix mdio bus probe and PHY ID
Message-ID: <90978892-2086-4c70-9698-0957cc71abb8@lunn.ch>
References: <20241004061541.1666280-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <CABMQnVK_RUC84QQ5zb+ZpuMOZcFMNV6HzEYAfmX4bOrRm+rvTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABMQnVK_RUC84QQ5zb+ZpuMOZcFMNV6HzEYAfmX4bOrRm+rvTw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_120622_539002_220C71AA 
X-CRM114-Status: GOOD (  12.16  )
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

On Sun, Nov 17, 2024 at 05:53:51PM +0900, Nobuhiro Iwamatsu wrote:
> Hi Dinh,
> 
> Please check and apply this patch?
> 
> Thanks,
>   Nobuhiro
> 
> 2024年10月4日(金) 15:16 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>:
> >
> > From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> >
> > On SoCFPGA/Sodia board, mdio bus cannot be probed, so the PHY cannot be
> > found and the network device does not work.
> >
> > ```
> > stmmaceth ff702000.ethernet eth0: __stmmac_open: Cannot attach to PHY (error: -19)
> > ```
> >
> > To probe the mdio bus, add "snps,dwmac-mdio" as compatible string of the
> > mdio bus. Also the PHY ID connected to this board is 4. Therefore, change
> > to 4.

It is the address which is 4, not the ID.

	Andrew

