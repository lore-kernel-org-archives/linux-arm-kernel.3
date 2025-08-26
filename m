Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E52BCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 08:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jA8sOFGvh2/p8iE2G4NAwGkJrUNoYidwOKdr2bvzY+s=; b=fWdKJsNZDCWb5gYWzQW94tbuEa
	BEZOhxd8h2oDK4O5GoGEJzh4pbZcRXy+xChmarNSfrmN4oHOIIJ6zJjzCWE6aeExM4byIfG9zj0Pz
	MvcLhdJzUUBA/UIrdMiVz25JPUvRSNlK9D/Xa38RFdlqhn6s3dVU45eBJnaHDvhmSo8S1MrEvVGn1
	WC/uVY8fleIlrEmMe0uE6ZvHHSj9+zXFPao2zCn4SD+FQEE4PbfsgX+WroQrkrs/L/6/zLAYN+IA/
	R90Nb1FiH63rGvHJIl/D1OnyOHsSSRD/NXZv9eNNzX5Tlx1uj310a12NRSWApwaIuDhw8ktwvZkEY
	y60AWlYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpB4-0000000B2qB-245w;
	Tue, 26 Aug 2025 08:37:14 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqp5Q-0000000B1VV-0inU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 08:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1756197082;
 bh=jA8sOFGvh2/p8iE2G4NAwGkJrUNoYidwOKdr2bvzY+s=;
 b=MJCPM6y5U3KzIbkXhXI44C4jJVSFJlgEmwe02IUgwNyvb2a0gDGd1p7xP+5N4bInxXps6KJiE
 q2cjDHFAJy7NJWbz6FO/YWi5+Hl3wAYElka5f5Eg0KLxlLkTkpZ8eK83CiUZjX539Wv88MmrtkI
 /1Oxv/AvCymSRvGIerkIBDstWjobQwnuVem22EpqiUGcewSi1ub3Xo2BgP+i56Ofcxd1cVErZ3c
 tFdR5KYOIri3GhpwEBqtNk19Ijk+XpenNgXc7tyhDpewJhGh+ikkZ2H80KO5ZPY6TdiAbSl4Uen
 6mrG/ebNdElyVqOrBaSJ0wKE+lJzzwtddcvVvC9usx7g==
X-Forward-Email-ID: 68ad70d0b1fda674b9411dcb
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.9
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <6cf1cf2d-50cb-413d-93c6-79ecd6b0788e@kwiboo.se>
Date: Tue, 26 Aug 2025 10:31:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and
 NanoPi Zero2
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 Chukun Pan <amadeus@jmu.edu.cn>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250717103720.2853031-1-jonas@kwiboo.se>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250717103720.2853031-1-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_013124_673174_13FDD550 
X-CRM114-Status: GOOD (  17.12  )
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

Hi Heiko,

On 7/17/2025 12:37 PM, Jonas Karlman wrote:
> This series adds dt-bindings and initial device tree for the following
> Rockchip RK3528A boards:
> - Radxa ROCK 2A/2F
> - ArmSoM Sige1
> - FriendlyElec NanoPi Zero2
> 
> The bt/wifi_reg_on pins are described in the device tree using
> rfkill-gpio nodes.
> 
> Changes in v4:
> - Remove disable-wp prop from sdio0
> - Collect r-b and t-b tags
> 
> Changes in v3:
> - Rename led nodes to led-0/led-1
> - Remove pinctrl* props from sdio0
> - Collect a-b tags
> 
> Changes in v2:
> - Limit sdmmc max-frequency to 100 MHz on ROCK 2A/2F
> - Drop clock-output-names prop from rtc node on Sige1 and NanoPi Zero2
> - Drop regulator-boot-on from usb 2.0 host regulators on Sige1
> - Add bluetooth and wifi nodes on Sige1
> - Collect t-b tag for NanoPi Zero2
> 
> These boards can be booted from emmc or sd-card using the U-Boot 2025.07
> generic-rk3528 target or work-in-progress patches for these boards [1].
> 
> For working bluetooth on ArmSoM Sige1 the patch "arm64: dts: rockchip:
> Fix UART DMA support for RK3528" [2] is required.
> 
> [1] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528
> [2] https://lore.kernel.org/r/20250709210831.3170458-1-jonas@kwiboo.se
> 
> Jonas Karlman (6):
>   dt-bindings: arm: rockchip: Add Radxa ROCK 2A/2F
>   arm64: dts: rockchip: Add Radxa ROCK 2A/2F
>   dt-bindings: arm: rockchip: Add ArmSoM Sige1
>   arm64: dts: rockchip: Add ArmSoM Sige1
>   dt-bindings: arm: rockchip: Add FriendlyElec NanoPi Zero2
>   arm64: dts: rockchip: Add FriendlyElec NanoPi Zero2
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |  17 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   4 +
>  .../boot/dts/rockchip/rk3528-armsom-sige1.dts | 464 ++++++++++++++++++
>  .../boot/dts/rockchip/rk3528-nanopi-zero2.dts | 340 +++++++++++++
>  .../boot/dts/rockchip/rk3528-rock-2.dtsi      | 293 +++++++++++
>  .../boot/dts/rockchip/rk3528-rock-2a.dts      |  82 ++++
>  .../boot/dts/rockchip/rk3528-rock-2f.dts      |  10 +
>  7 files changed, 1210 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts

Any thoughts on this series? Rebased patches for a possible re-send v5
contained no changes compared to this v4.

I would like to send a v2 on the follow up "rockchip: Add USB 2.0
support for RK3528" [3] series and was unsure about the state of this
series before sending that.

[3] https://lore.kernel.org/r/20250723122323.2344916-1-jonas@kwiboo.se

Regards,
Jonas

