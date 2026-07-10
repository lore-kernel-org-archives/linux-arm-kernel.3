Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BC4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 23:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qy6HHWYfsX3ILpTu5/JKatJn9FSxJBA142HGAJToDwE=; b=oXVOaweBZSUi4D/K3gHEOR52P/
	zitGJ1X896YjK+lONJ082RCBlNVjPRidNpyBTd1NpXQ5v9Qv7q+ivN4hJr3FncXUOU9CaEtwC0Ohl
	U9jd0lCVfGC/C0b0Bc1Mt3WYXoxnv5oDb/QWAX1uSgrroh8IjBAxT1FpT8abEiDlU9nySfRYs4+or
	Xd4gEtnodaMDztOrQWw37Xu2WVnSI17BmuR1I0rumzkmCbgbjtlWTFTGw/Df4nS241KBAUlZZTEed
	lPipUWPaPvI+KlukMabcz4JvjSc20OLhn+QVpSYfJ8/Mv0yb7ZpW9VPUv6MJWPdGvlFM25hlTwKQL
	CO6qKRyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiKle-000000060yu-0Px1;
	Fri, 10 Jul 2026 23:36:26 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiKlb-000000060yC-1Ma3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 23:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1783726581;
 bh=qy6HHWYfsX3ILpTu5/JKatJn9FSxJBA142HGAJToDwE=;
 b=OunZyqMa+OVFcmsPci4sTyOENnYp7GzHwofED7FXSS7TxD51lDpjiFhxCwtXGD+IPIFJ2/HAH
 HfQRB0vPB3e5eID9v53y8OocfOl+GFaWlTXMToamoMl3htlWqS0dORqp7YFPBNzBdJKQn3m7V3u
 j4X9lJDYTg+ZSDGOkWcE5SOILJf4LEOCO8hASnR6ztH6rcO4j0UyjpgoB/ho6dO4Tza3E927qBJ
 cH8rkpxw9UvEMfFmOpl4GTA4Eib2Y3k2CZhR/pjrb+sulQ1dgAbWhENU0sUDvesoUzv1xaw8Axr
 Ejkygyi0mHHX3fRTknL1NQS2pKPTSUzcYeftN8x2rU+w==
X-Forward-Email-ID: 6a5181f476cf32b2f5f845e8
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <ce54c773-22cf-43d2-b831-1ea5355359ca@kwiboo.se>
Date: Sat, 11 Jul 2026 01:36:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] arm64: dts: rockchip: Add NanoPi M6 board
To: joachim.eastwood@gmail.com, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 diederik@cknow-tech.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_163623_791473_20711394 
X-CRM114-Status: GOOD (  25.70  )
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

Hi Joachim,

On 7/11/2026 12:11 AM, Joachim Eastwood via B4 Relay wrote:
> This patch series add support for the NanoPi M6. This board is very
> similar to the NanoPi R6C and R6S boards which are already supported.
> 
> Main differences:
> * M.2 M-key slot with PCIe (Also present on R6C)
> * M.2 E-key slot with PCIe and USB (from hub)
> * 1 additional USB 2.0 port from an on-board USB hub
> * RT5616 audio CODEC
> 
> Patch 2 and 3 moves a bit code around. Please let me know if those two
> should be squashed together.
> Next few patches adds some missing bits the common nanopi dtsi file.
> While the final patch adds support for NanoPi M6. Support for M6 has
> been split into two files one dtsi and one dts file. This is to make
> it easier to add support to the new M6V2 board at a later stage.

In my personal opinion I think it would make more sense to sort
patches in following order:
- adding/fixing missing bits to the common nanopi-r6 dtsi
- extract M6/R6 common parts from nanopi-r6 dtsi to nanopi dtsi,
  nanopi-r6 dtsi includes the nanopi dtsi and no changes to dts files
- final parts that adds the M6 board

Should probably make it a little bit easier to cherry-pick and bisect.

Regards,
Jonas

> 
> All changes have been verified using the schematics for M6, R6C and R6S.
> Only M6 have been boot and runtime tested. Tester for R6x are welcome.
> 
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
> Changes in v2:
> - Organize DT such that adding support to NanoPi M6V2 later is easier
> - Use correct clk id for I2C mclk out as suggested by Diederik.
> - Add a couple of acks from Krzysztof Kozlowski.
> - Link to v1: https://patch.msgid.link/20260703-nanopi-m6-v1-0-8344a1559519@gmail.com
> 
> ---
> Joachim Eastwood (12):
>       dt-bindings: arm: rockchip: add FriendlyElec NanoPi M6
>       arm64: dts: rockchip: refactor rk3588s-nanopi* to support M6
>       arm64: dts: rockchip: move NanoPi R6 code into common dtsi
>       arm64: dts: rockchip: rk3588s-nanopi: add missing sdmmc cd pinctrl
>       arm64: dts: rockchip: rk3588s-nanopi: remove pull up on rtc int pin
>       arm64: dts: rockchip: rk3588s-nanopi: add missing pcie rst pinctrl
>       arm64: dts: rockchip: rk3588s-nanopi: pcie2x1l2: add clkreq
>       arm64: dts: rockchip: rk3588s-nanopi: remove always-on from vdd_npu_s0 reg
>       arm64: dts: rockchip: rk3588s-nanopi: remove useless vcc_3v3_pcie20
>       arm64: dts: rockchip: rk3588s-nanopi: add gmac1 add phy-supply
>       arm64: dts: rockchip: rk3588s-nanopi: remove bogus vcc5v0_usb regulator
>       arm64: dts: rockchip: add support for NanoPi M6 board
> 
>  .../devicetree/bindings/arm/rockchip.yaml          |   3 +-
>  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>  .../arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 142 ++++
>  .../boot/dts/rockchip/rk3588s-nanopi-m6v1.dts      |  67 ++
>  .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 792 --------------------
>  .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts |   1 +
>  .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts |   1 +
>  arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi   | 800 +++++++++++++++++++++
>  8 files changed, 1014 insertions(+), 793 deletions(-)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260701-nanopi-m6-ffeef7252fd7
> 
> Best regards,
> --  
> Joachim Eastwood <joachim.eastwood@gmail.com>
> 
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


