Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E238DCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 21:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAktbBFWSSQ3i5oAt07HETFA92KJ7TQG9se5OeSJvuA=; b=4Sj6SIrKD+I/t1K2yBjWoRWpG6
	0+6v56CDgrSeEgGzbaf2QXaqabiUZdFGZNS3cZV+e+xmhs+ecMWUGpa989TthxEigjT2tKfbVgDLm
	Zn+0EBxpSyts5U1mLxjvNHqA4HkfpRrNy66mwYUjnimtSSh8pE4sem+g3vZxhfb42whvH8bVECg66
	g5qxeq3k1Xvbzrw0B3ih4k+FqI0TfHUZYH64OW47UeFAbGOiDj+nuhhlf4YuXIyFaCU4kkxauQJ53
	Ut/JVCKLs3ndZXyacSpUpOZ68dLNdIahwtI7ElZziM/E+9cimYHW3/htxh5avLicYctQIkOUD0SoD
	Nvkb3wQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usT8l-00000008S0L-2m4g;
	Sat, 30 Aug 2025 21:29:39 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usT5y-00000008Ru8-2iN3;
	Sat, 30 Aug 2025 21:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xAktbBFWSSQ3i5oAt07HETFA92KJ7TQG9se5OeSJvuA=; b=mw3VnBnEZXK79ZGzO0tjDhPFuj
	XhFxacZ2s/74ZWp8MikERNp8BEaAPwE2j1Jpvnu/JZTn1szlEsDrPg5YRbkIe311WHYvU8SdJMsTa
	i823A8W32+PxER2Lc1L97+bmcjJnfRnDJcJVKY2y5Y4GB2b+LMAiSpgUP5lVcXL/PU3o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1usT5n-006c4m-Nh; Sat, 30 Aug 2025 23:26:35 +0200
Date: Sat, 30 Aug 2025 23:26:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Erik Beck <xunil@tahomasoft.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Chukun Pan <amadeus@jmu.edu.cn>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] arm64: dts: rockchip: Add HINLINK H66K/H68K
Message-ID: <2803b3d8-332e-4ada-a28f-eeba8285b7ec@lunn.ch>
References: <20250818100009.170202-1-amadeus@jmu.edu.cn>
 <175603280227.3445205.12980590537074643035.b4-ty@sntech.de>
 <20250830171101.410bd954.xunil@tahomasoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830171101.410bd954.xunil@tahomasoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_142646_687886_5D784EC6 
X-CRM114-Status: UNSURE (   8.67  )
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

> As I worked on my dts, I discovered that the 1Gb ethernet ports, using an
> RTL8211, don't support rgmii-id mode; only rgmii.
> (https://www.realtek.com/Product/Index?id=3976&cate_id=786). 

Which exact RTL8211 does the board use? You link to information for
the RTL8211FD(I)-CG, which i assume is supported in Linux as RTL8211F.

https://elixir.bootlin.com/linux/v6.16.3/source/drivers/net/phy/realtek/realtek_main.c#L519

This indicates it supports all four RGMII modes. And in general, all
PHY drivers in Linux for RGMII PHYs support all four RGMII modes.

> Changing this makes a huge difference in the ethernet throughput speed. With
> rgmii-id mode specified, throughput is about 6.5 Mbs. Changing this to rgmii
> mode increases throughput to about 960 Mbs. 

Here is some more information about that the four RGMII modes mean,
and how you should use them in Linux:

https://elixir.bootlin.com/linux/v6.16.3/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L264

	Andrew

