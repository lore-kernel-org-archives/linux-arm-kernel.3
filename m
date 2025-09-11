Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0221CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 08:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Por4LrDQ28WLSuJY7ljewFwdyxszrAx7AiT1c8XdT7I=; b=dKwsFA3fm2aTovvqIreecF8e1S
	KMvOW9zFTyKhJU2k7pdCiOulw/zT/nxEdSQjegmjJGuYthRby3dOmyurVjPKTYn7fzHnZG2xjXZov
	Wu2q76fcvypv6bO07hjtw7RrWuRyzFu0puQWDEdi6qrWVtvbMjBWg5Ohu7OX9MkJl6yAFkLaDxguZ
	UP4TU9WQmyhN/iQOSNTsLDvy2rvKN9EKXXJHBvcwvzlJmnROWOrWn/q7RWA6WrLCtkLtk3fMD5hLM
	Nxbk2u1pmvuSmhfwc+/bXYPnch1c/uy5Zzlw/aq8qsVVWjb3A93at/efNzJT0BQ4+Fjv5t7rc03FE
	VeX8NdfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcOO-00000001jxP-2Vv4;
	Thu, 11 Sep 2025 08:10:56 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcOL-00000001jv1-3ZcC;
	Thu, 11 Sep 2025 08:10:55 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 51E5C22E3E;
	Thu, 11 Sep 2025 10:10:52 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEID8B6EKtIt; Thu, 11 Sep 2025 10:10:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1757578251; bh=ZbLh3w9qgdKNzwXJqgp2abe1gQ9CIj5mTrQV0DwHZoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eLLw0LoRhdiW6rBw7ZButYxIty7OAQjCZnW82Ezd46anyExxpeN+SJMO01aeYBDJP
	 enjvSwjZGuATAM6nFZtd846Hr4WFfs1HG26px4Fr1a6fiAjVbD3KmMF8ikf1sppeaj
	 aVN99nSXPl4gTUNCgfmHIWk+b2nwhxBjZ4ly3RgvOaCVo+ZYYe1cIpAlwjxLC82U5b
	 /pd4D9V1ekwXrS1/AH1EfsVHtUhxn9QJUYhPHYmhpLf8q91Mj33x/a/Q73uu0mzue6
	 DWy7d5Zr5hy3Zt8CrE+xjnMOqY++2u0udyrvZf9SVslDNEFuGaVxyBhEB1PgyXkywU
	 0qzbHeAiVk22w==
Date: Thu, 11 Sep 2025 08:10:36 +0000
From: Yao Zi <ziyao@disroot.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: bhelgaas@google.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	heiko@sntech.de, jonas@kwiboo.se, krzk+dt@kernel.org,
	kwilczynski@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org, lpieralisi@kernel.org,
	mani@kernel.org, robh@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Enable PCIe controller on
 Radxa E20C
Message-ID: <aMKD_LhjdFNNu62B@pie>
References: <20250906135246.19398-4-ziyao@disroot.org>
 <20250909130009.2555706-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909130009.2555706-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_011054_020917_20776F13 
X-CRM114-Status: GOOD (  10.49  )
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

On Tue, Sep 09, 2025 at 09:00:09PM +0800, Chukun Pan wrote:
> Hi,
> 
> > +&pcie {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pciem1_pins>, <&pcie_reset_g>;
> 
> The pciem1_pins contains PCIE20_PERSTn_M1 (GPIO1_A2)
> This will cause conflicts, "pinctrl-0 = <&pciem1_pins>" is enough.
> 
> [    0.115608] rockchip-pinctrl pinctrl: not freeing pin 34 (gpio1-2) as part of deactivating group pciem1-pins - it is already used for some other setting
> [    0.191042] rockchip-pinctrl pinctrl: pin gpio1-2 already requeste by pll_gpll; cannot claim for 140000000.pcie
> [    0.191949] rockchip-pinctrl pinctrl: error -EINVAL: pin-34 (140000000.pcie)
> [    0.192570] rockchip-pinctrl pinctrl: error -EINVAL: could not request pin 34 (gpio1-2) from group pciem1-pins on device rockchip-pinctrl
> 
> > +	reset-gpios = <&gpio1 RK_PA2 GPIO_ACTIVE_HIGH>;
> 
> Missing supply: "vpcie3v3-supply = <&vcc_3v3>;"
> 
> > +	status = "okay";
> > +};
> > +

Will fix them in v2, thanks.

> Thanks,
> Chukun

Best regards,
Yao Zi

