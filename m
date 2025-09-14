Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F86CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 13:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3XuAyG0R3H+3LQFQk1AODhxNQ122XGCYmRDMRRxkhg=; b=p6R58pV0LASz4+7izCi9Lkab9+
	QLVZsAqazPeNgKFRDTAQKzH5T9n08RY98s7ItU/N0HtPoluhoIMAqX1yUqsej5TXkEhnjGaiR3zs1
	YLHdRNhvuxC+uTKvzvs3BNSPGFiQOahne7nDJEA8TABGgOghiV1eJW14IFnwI7itlVwVIGBWpjBso
	xD+sAL1HMdCKCdUVrD6fGKi4QjKU7ie0ydcG5HfAq+kG9jr7uXDn1srIhlnHCHkuaBtGM5zsTiUhf
	th5H2QaCl0KFhmpzgP/mpwlo5TeHRo8L3VlldCihBixYDY+0PPWBpaM6g2gWXEjKIbVH58qB5/WdE
	CMsjL4HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmUY-00000001HVI-1VlU;
	Sun, 14 Sep 2025 13:10:06 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmUU-00000001HSu-3ZtS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 13:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=O3XuAyG0R3H+3LQFQk1AODhxNQ122XGCYmRDMRRxkhg=;
	b=ZzSGU+PG9JJSOq53wQhRwkhBjD2u7LpmqXpm0i3B9J25GMdb7YdvJwTdnimVqi
	1TdXunU1QRcHQYHMdbycJz844Uq7g2bgzQV2P+TdiUKAl7EXhhniZrL4MFO+CZsW
	8krXjNzUSBB0W2EzNxFiIy83409FqZiItke5wMoXiKaf0=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAHxW6PvsZoh8JvBA--.65403S3;
	Sun, 14 Sep 2025 21:09:37 +0800 (CST)
Date: Sun, 14 Sep 2025 21:09:34 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] arm64: dts: add description for solidrun imx8mp
 hummingboard variants
Message-ID: <aMa-jgcY3KMyQeYO@dragon>
References: <20250911-imx8mp-sr-som-v4-0-1b1fae6135e0@solid-run.com>
 <20250911-imx8mp-sr-som-v4-2-1b1fae6135e0@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-imx8mp-sr-som-v4-2-1b1fae6135e0@solid-run.com>
X-CM-TRANSID: M88vCgAHxW6PvsZoh8JvBA--.65403S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFWfury8Cry5Zw4UXw13Jwb_yoWfCrg_Z3
	Z5WF1DX3yxtryfJw4rAw4Y9a4I9w1qgr18Gr1rtrW8X3yS9wnIvrZ2q3sa9F45Z3y7JFn2
	gw13KFy0kryxujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbhvtJUUUUU==
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNRGfBWjGvpECXAAA3h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_061003_423679_4C17C000 
X-CRM114-Status: UNSURE (   8.20  )
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

On Thu, Sep 11, 2025 at 12:20:04PM +0300, Josua Mayer wrote:
> Add descriptions for the SolidRun i.MX8M Plus System on Module based
> HummingBoard product-line. They share a common designed based on the
> "Pulse" version, defined by various assembly options.
> 
> The HummingBoard Pulse features:
> - 2x RJ45 Ethernet
> - 2x USB-3.0 Type A
> - HDMI connector
> - mini-HDMI connector
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0/3.0 interfaces
> - M.2 connector with SIM slot supporting USB-2.0/3.0 interfaces
> - MIPI-CSI Camera Connector (not described without specific camera)
> - 3.5mm Analog Stereo Out / Microphone In Headphone Jack
> - RTC with backup battery
> 
> The variants Mate and Ripple are reduced versions of Pulse.
> 
> The HummingBoard Pro extends Pulse with PCI-E on M.2 connector.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Applied, thanks!


