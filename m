Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2885C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 13:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8HFfAjikHg///ljRi+LTR+AKhrdVRjDdpitnpTBu/M=; b=N/SLJZSOJ2aoB184yqJISkd+HP
	aBmR1FYrCSa87058BFvH+Iq5fY6cZbjUfWtDHHboUE0BdUNvmNnn+/5NX4aW0nN2uQx38PVoTYbSU
	6W0GeKfq2Vo6jKBsni2cMK3LzIWl67nZEyvX4a3f4ggT902BZoYahfBvjUURlHqqiovQ7CYhSnUkr
	5ZB2E8klQVU2xhF5el9kkdSOKCPJ8IFqxuX44RKcgeH3O9Ck2wXCOE7UA12BzdFJbHP1MYWzfv5JK
	fqx+4y63Hy12yB43XFEnP13Po8gKmrXq4UOVrTyw7bQhtRQvt/GS7FPEAyIFHLkKif8WAb9eSf6Hk
	EA/8hsQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OM0-00000006Qvp-3ICV;
	Mon, 28 Apr 2025 13:17:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Ns7-00000006FfF-1gB0;
	Mon, 28 Apr 2025 12:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=M8HFfAjikHg///ljRi+LTR+AKhrdVRjDdpitnpTBu/M=; b=rVu+aJxMy3TeYosH2Nev8ql1Ry
	76SzVzr+BlV+154A+GFXvAu87sxcC3PZ0IaLykHvK5rXFdMNP57p3yYBJhFtpa/55HmxKeVolCjwt
	wNc2ZGRYLV5UZRjqzIKAZjf4EOzyXDFV+U4S5TQCb5kCLuOkcqMXt6lpnjfbiQWzAB2g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u9Nrn-00ApwX-Uy; Mon, 28 Apr 2025 14:45:47 +0200
Date: Mon, 28 Apr 2025 14:45:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
Message-ID: <15ee1a6b-55ba-41e9-b8a0-6e0bf62cabf0@lunn.ch>
References: <20250427094211.246-1-kernel@airkyi.com>
 <20250427094211.246-3-kernel@airkyi.com>
 <6291f6b8-75d3-4243-9935-9b64450e2b7f@lunn.ch>
 <c583c59a-d5b7-4e20-9a1f-96f51bd7b4f3@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c583c59a-d5b7-4e20-9a1f-96f51bd7b4f3@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_054607_441936_E062EEAE 
X-CRM114-Status: GOOD (  12.76  )
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

On Mon, Apr 28, 2025 at 09:47:34AM +0800, Chaoyi Chen wrote:
> Hi Andrew,
> 
> On 2025/4/28 4:42, Andrew Lunn wrote:
> > > +&gmac {
> > > +	assigned-clocks = <&cru SCLK_RMII_SRC>;
> > > +	assigned-clock-parents = <&clkin_gmac>;
> > > +	pinctrl-names = "default";
> > > +	pinctrl-0 = <&rgmii_pins>;
> > > +	clock_in_out = "input";
> > > +	phy-supply = <&vcc_phy>;
> > > +	phy-mode = "rgmii";
> > Does the PCB have extra long clock lines to implement the RGMII 2ns
> > delay?
> The 2ns delay of RGMII is implemented inside the RK3399 chip instead of PCB
> lines, and there are also additional delayline configurations.

If the PCB does not implement the delay, rgmii is wrong.

If the MAC/PHY pair is implementing the delay, you need to use
rgmii-id. You can then use additional properties to fine tune the
delay the MAC/PHY is adding. And the Linux preference is that the PHY
adds the delay.

	Andrew

