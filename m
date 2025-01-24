Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD79C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 14:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5kjHkJnOHEQs5ufwKsC59GIKFl8SpG5yJzGjmGDr5w=; b=JQQIapzCunkKViXUUPG2cteBiv
	fdyqI0obMghFieNbyozmGRQCI5DaapK1gFSn0Nrjp1USOFRKVk7K6Lj5uADEqhoaSFqFBMOUAviXC
	CrzYIbKRNhiembv7TsiGDkqYQKHpYKUJa7xr6wggNdf/llNpDDTcODNjXe1/3ohbhSj1mm0SIy/gy
	uOAUuaOJTvD7SdpwXl1DvvZhVLMDzsKt/xrbreJPxl/8ANoJFzd6IaQF1x8MUUZqCRtSxI4WecRi5
	LLSe6bYdctCKAygJ89Q5v1lMyLBwJ9GIU6tmXu51vB7IyyJfpcuXomF/cv91dBBmFaCZM18rIiBx1
	1GCsGg7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbL8C-0000000Etwc-3ykO;
	Fri, 24 Jan 2025 14:58:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbL6t-0000000Etng-0829
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 14:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=J5kjHkJnOHEQs5ufwKsC59GIKFl8SpG5yJzGjmGDr5w=; b=4gfHYnQetFNudQQ+w0vRAFchfg
	Y4EJjpeJ/W5BT2yO0YcIuG4oKRxO0hO6s3EWVekqKFoQ89SXc6yD20w6pJZxVGHBhEjdVLJLt3/cv
	Fi/9fQU0C5QsxoPygdVzEqlZx+xOAqg9qkI9e8HomDOlVKUbQkCBD0bGSdx/h+8x1k3Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tbL6Y-007cTY-5X; Fri, 24 Jan 2025 15:56:18 +0100
Date: Fri, 24 Jan 2025 15:56:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Willie Thai <wthai@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au, kees@kernel.org,
	tony.luck@intel.com, gpiccoli@igalia.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, openbmc@lists.ozlabs.org,
	leohu@nvidia.com, tingkaic@nvidia.com, dkodihalli@nvidia.com,
	wthai <wthai@willie-obmc-builder.nvidia.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Nvidia's GB200NVL
 BMC
Message-ID: <7b47725f-fb57-454c-82f6-859202060243@lunn.ch>
References: <20250124051819.7714-1-wthai@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124051819.7714-1-wthai@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_065639_069041_A2364018 
X-CRM114-Status: GOOD (  11.70  )
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

On Fri, Jan 24, 2025 at 05:18:19AM +0000, Willie Thai wrote:
> From: wthai <wthai@willie-obmc-builder.nvidia.com>
> 
> The GB200NVL BMC is an Aspeed Ast2600 based BMC
> for Nvidia Blackwell GB200NVL platform.
> 
> Signed-off-by: wthai <wthai@nvidia.com>

I'm not sure that is a valid name for a Signed-off-by. I would expect
something like:

Signed-off-by: Willie Thai <wthai@nvidia.com>

> +&mac0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	phy-mode = "rgmii-rxid";
> +	max-speed = <1000>;
> +	phy-handle = <&ethphy3>;
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +};

This phy-mode is wrong. There is a long discussion about this, started
from a BMC submitted by IBM. Please wait until Aspeed fix the MAC
driver before adding support for RGMII based ethernet. You are
probably innocent here, apart from failing to sanity check vendor
advise, which happens to be wrong.

https://lore.kernel.org/netdev/20250107162350.1281165-10-ninad@linux.ibm.com/T/
https://lore.kernel.org/linux-arm-kernel/bebbba7b-f86e-4dc4-8253-65d34cb84804@linux.ibm.com/T/

The max-speed parameter should also be unneeded. Unless you have a
real need for it. Does this MAC/PHY combination support higher speeds,
but they are broken for some reason, so you need to avoid them?

	Andrew

