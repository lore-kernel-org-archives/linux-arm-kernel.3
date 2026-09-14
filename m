Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C72AC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mewteUdeB+vh/ROowqyMXpJPpjRCsZe73lQbBQU5dyg=; b=I+RYK3G0ZD/NT1RY7jMiOBvhQJ
	0N6cuXou8OFs+QM7ngi0qVEMqV3YSFy5vpF4ol63p+Y3r0CqqKq5SXu9MCyEZNNStr12gN2IVdamq
	iCaakdUPsQGWiHYUTtPkJ2pEgD02Cgnp0rGZ88oqZsuIe2Gy+Qpv9yM9IEfBBB1Ra49BCMA9T/YKV
	c2sq40aZkTSnNHRgE2U6gsWfGyfA/sPEEFmI4gb4uXcKYJYNo1WzCF/JRfCkdgSE6OUuGK6PA+BL6
	hnBDRAG13TkaJoUTc2aP3VcvJsldZNe6RIOnTXHSbhd0sTQU3ME83VIM5dIVR84192mwa8h193Nc0
	ZEOGQfJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62zP-00000002xcV-0IOY;
	Mon, 14 Sep 2026 09:28:39 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62zL-00000002xaU-2UQO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1789378114;
 bh=mewteUdeB+vh/ROowqyMXpJPpjRCsZe73lQbBQU5dyg=;
 b=HJMLhKX07C6IT50Otk4kGSNG+oLY86Y7ofu2hwMWDWBPSgLprFHKM2bjQyvHWlO4yUuTSb47K
 YJ/wQs6AAG6qW/KMbikKm0YWpW5Jv97ht2lgfFRODePfdsBP/r3nu9+NvkgAG2OesxBGhUmU6x5
 LBWwQV+jm9iJ9TMQkg0Vr0EWIblcaddFY+U/XpkqztJi/annASuOXmeLfTcrnyyL7CylSY2uC93
 8y2gEXUAlOcO9qZ37ORsuugW1Lu+eP0qvA2uMFoO+UIIh0rCPaqD3vL09MuRkYQ8j4FM5wK/nN8
 Sg22Y91b1kpQMeXA9Hfv/vid5uKVMsoQ7duLPQkCMYyQ==
X-Forward-Email-ID: 6aa7be39469f56687e0fbce3
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <1074c834-1d64-4bda-b6d5-599755324dcd@kwiboo.se>
Date: Mon, 14 Sep 2026 11:28:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] arm64: dts: rockchip: Split out the common NanoPi
 RK3528 parts
To: HystericalDragons@proton.me
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chukun Pan <amadeus@jmu.edu.cn>, jensen <jensenhuang@friendlyarm.com>,
 Andrey Korshunov <razor1702@gmail.com>,
 Diederik de Haas <diederik@cknow-tech.com>
References: <20260914-r28s-upstream-v5-0-7409c498e8dc@proton.me>
 <20260914-r28s-upstream-v5-2-7409c498e8dc@proton.me>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260914-r28s-upstream-v5-2-7409c498e8dc@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_022836_541202_99EC0B59 
X-CRM114-Status: GOOD (  15.26  )
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

Hi,

On 9/14/2026 10:24 AM, 安容 via B4 Relay wrote:
> From: 安容 <HystericalDragons@proton.me>
> 
> The FriendlyElec NanoPi Zero2 and the NanoPi R28S share their power
> tree, storage, RGMII Ethernet, RTC, SYS LED and debug console. Move
> those parts into rk3528-nanopi.dtsi so the NanoPi R28S can reuse them,
> and leave only the board specific nodes in the NanoPi Zero2 devicetree.
> 
> Suggested-by: Chukun Pan <amadeus@jmu.edu.cn>
> Signed-off-by: 安容 <HystericalDragons@proton.me>
> ---
>  .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      | 307 +--------------------
>  arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi    | 304 ++++++++++++++++++++
>  2 files changed, 313 insertions(+), 298 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
> index 97d85124d2..a8d99f983f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts

[snip]

> -
>  &usb_host0_ehci {
>  	status = "okay";
>  };
> @@ -347,23 +74,7 @@ &usb_host0_ohci {
>  	status = "okay";
>  };
>  
> -&usb_host0_xhci {
> -	extcon = <&usb2phy>;
> -	maximum-speed = "high-speed";
> -	phys = <&usb2phy_otg>;
> -	phy-names = "usb2-phy";
> -	status = "okay";
> -};

I suggest you keep all USB nodes in the device board files, NEO3 Plus
have USB 3.0 support and uses different configuration. So it will be
easier to get an overview if USB nodes are kept in the board DT.

Else most of this split matches what I played around with for U-Boot at
[1] a few weeks ago. I plan to send out the NEO3 Plus DT based on this
series later.

[1] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/commit/40382468ba7ce9aa2e7dcde0e59003fd0d220b43

Regards,
Jonas

> -
> -&usb2phy {
> -	status = "okay";
> -};
> -
>  &usb2phy_host {
>  	phy-supply = <&usb2_host_5v>;
>  	status = "okay";
>  };
> -
> -&usb2phy_otg {
> -	status = "okay";
> -};

[snip]


