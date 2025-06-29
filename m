Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D97C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 14:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDYIQ9lxwYybHCC9iPb9gi4mCl7dg/YIwxya4w3k148=; b=LhqYgp6X6PeAbM/79E4RfA5dcE
	3cuM8IqgNV5oE0FeSv9xiePY5m06/POgrNunHncdpHSAQ6ADR38f/56aJczXiP48ATHxIfxbr7jIZ
	A699ms9Xn7tvNu/tWNftM06efOd4LnQMUnBOyoiQzvRWDyR19yMLp67vAglbYMz8y8ZuwwBLCVvHj
	ro493XeIFCnoBWRqCobXI+RoBqIADaoRX0Kwl4o66XA83E880EWalnoY7/hc+1CrA38h1frUGzvDL
	s92xOfuT+hTjxa0xRrMqb6g6kuxSPLUF3xYh8q86EIjIUykQd6G9KxATaKsS98+t+h0KP+dUTtIDz
	iGorflrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVtLc-00000000NSj-3Mul;
	Sun, 29 Jun 2025 14:49:36 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVtJJ-00000000NHF-3EpT;
	Sun, 29 Jun 2025 14:47:14 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uVtJ6-000000001Bw-12Mh;
	Sun, 29 Jun 2025 14:47:00 +0000
Date: Sun, 29 Jun 2025 15:46:56 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Johnson Wang <johnson.wang@mediatek.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v7 07/14] arm64: dts: mediatek: mt7988: add basic
 ethernet-nodes
Message-ID: <aGFR4PJv0pdKdD94@makrotopia.org>
References: <20250628165451.85884-1-linux@fw-web.de>
 <20250628165451.85884-8-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628165451.85884-8-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_074713_812641_21CC116F 
X-CRM114-Status: GOOD (  23.63  )
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

On Sat, Jun 28, 2025 at 06:54:42PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add basic ethernet related nodes.
> 
> Mac1+2 needs pcs (sgmii+usxgmii) to work correctly which will be linked
> later when driver is merged.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v6:
> - fix whitespace-errors for pdma irqs (spaces vs. tabs)
> - move sram from eth reg to own sram node (needs CONFIG_SRAM)
> 
> v5:
> - add reserved irqs and change names to fe0..fe3
> - change rx-ringX to pdmaX to be closer to documentation
> 
> v4:
> - comment for fixed-link on gmac0
> - update 2g5 phy node
>   - unit-name dec instead of hex to match reg property
>   - move compatible before reg
>   - drop phy-mode
> - add interrupts for RSS
> - add interrupt-names and drop reserved irqs for ethernet
> - some reordering
> - eth-reg and clock whitespace-fix based on angelos review
> ---
>  arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 137 +++++++++++++++++++++-
>  1 file changed, 134 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index 560ec86dbec0..cf765a6b1fa8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> @@ -680,7 +680,28 @@ xphyu3port0: usb-phy@11e13000 {
>  			};
>  		};
>  
> -		clock-controller@11f40000 {
> +		xfi_tphy0: phy@11f20000 {
> +			compatible = "mediatek,mt7988-xfi-tphy";
> +			reg = <0 0x11f20000 0 0x10000>;
> +			clocks = <&xfi_pll CLK_XFIPLL_PLL_EN>,
> +				 <&topckgen CLK_TOP_XFI_PHY_0_XTAL_SEL>;
> +			clock-names = "xfipll", "topxtal";
> +			resets = <&watchdog 14>;
> +			mediatek,usxgmii-performance-errata;
> +			#phy-cells = <0>;
> +		};
> +
> +		xfi_tphy1: phy@11f30000 {
> +			compatible = "mediatek,mt7988-xfi-tphy";
> +			reg = <0 0x11f30000 0 0x10000>;
> +			clocks = <&xfi_pll CLK_XFIPLL_PLL_EN>,
> +				 <&topckgen CLK_TOP_XFI_PHY_1_XTAL_SEL>;
> +			clock-names = "xfipll", "topxtal";
> +			resets = <&watchdog 15>;
> +			#phy-cells = <0>;
> +		};
> +
> +		xfi_pll: clock-controller@11f40000 {
>  			compatible = "mediatek,mt7988-xfi-pll";
>  			reg = <0 0x11f40000 0 0x1000>;
>  			resets = <&watchdog 16>;
> @@ -714,19 +735,129 @@ phy_calibration_p3: calib@97c {
>  			};
>  		};
>  
> -		clock-controller@15000000 {
> +		ethsys: clock-controller@15000000 {
>  			compatible = "mediatek,mt7988-ethsys", "syscon";
>  			reg = <0 0x15000000 0 0x1000>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  		};
>  
> -		clock-controller@15031000 {
> +		ethwarp: clock-controller@15031000 {
>  			compatible = "mediatek,mt7988-ethwarp";
>  			reg = <0 0x15031000 0 0x1000>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  		};
> +
> +		eth: ethernet@15100000 {
> +			compatible = "mediatek,mt7988-eth";
> +			reg = <0 0x15100000 0 0x80000>;

I think this should be

reg = <0 0x15100000 0 0x40000>;

as the range from 15140000 ~ 1517ffff is used as SRAM on MT7981/MT7986 and
doesn't seem to be used at all on MT7988.

root@OpenWrt:~# devmem 0x15140000 32
0xDEADBEEF
...
root@OpenWrt:~# devmem 0x1517fffc 32
0xDEADBEEF
(with 0xDEADBEEF all that range)

