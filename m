Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A3CC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqWfPHowzypNS3fC5xvMrVulrkg/53CBTJvxev8Nx5k=; b=0BoPE1KDTTQwX3bI+yuTnJ7sBE
	p2K0sv8bZzsklgMNtUMAk7N3qXIb9hLEfRKXrTum5BTFSd4Pya7f70IhL2cByXNlKnSvDqKaswO1i
	iLUoSmGnR8NdACu5k5cKcenAXZlIn+DJkNupCXIQ13QKxETC+Gih7J7eqykLPgkHl715RxDqCgbox
	zLEcqfs2zfZ1zZPA9RUrBc4o4pOJMRjJ9LTmYO6yBHVcBfU5v1f70teaAXp+/Ifk3vAtq8yeXxbcF
	Wxz3Dee1jLKwG4SQ0yNiApTiku8gfMd2N8cAHbR4IRJqh6KsFjVjQ5b/HCxtnQh7Z2NB347JF5BZO
	zF1/aRDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpM7s-00000009riM-3V04;
	Thu, 30 Jul 2026 08:28:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpM7m-00000009rh2-2r4x;
	Thu, 30 Jul 2026 08:28:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E82F3600BC;
	Thu, 30 Jul 2026 08:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F251F000E9;
	Thu, 30 Jul 2026 08:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785400096;
	bh=IqWfPHowzypNS3fC5xvMrVulrkg/53CBTJvxev8Nx5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Dxi1cOyszRtlP/OETbzH9DzS1JrcmsxerAuE1GIeA4eMSLgfQxwXEVtPcz45v6Jk+
	 rA2Bks3auZ1nx2bGDNs1LFcWAjBoxlIVoYdQQAbVUCPNEMbFFwA/99atlIdEc/e0FK
	 Q4q0EhvQbJsdKHIH+4Wh/EEPMOKTtz5h12QXlKgLsdMVsDhzfiGJI1a7uPWNkTkhlL
	 6oBTm9s571O/TBpR2hhYdjXIeRJ20qGx+dTOlKb4oElWzDStMNGNlCLHpNAHVCS9BO
	 naVZLLc713RhicSXOhVRgNOpzqzdebsGnG8DLHLn90BHePFJ4XNGVKTTBQCYKHaSd/
	 9WrV7yUewA71w==
Date: Thu, 30 Jul 2026 10:28:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gavin Gao <attinagaoxu@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, richardcochran@gmail.com, nicolas.frattaroli@collabora.com, 
	sebastian.reichel@collabora.com, sashal@kernel.org, alchark@gmail.com, chaoyi.chen@rock-chips.com, 
	amadeus@jmu.edu.cn, rmk+kernel@armlinux.org.uk, horms@kernel.org, 
	alok.a.tiwari@oracle.com, david.wu@rock-chips.com, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 2/3] arm64: dts: rockchip: Add RK3576 GMAC 25M
 refout clocks
Message-ID: <20260730-complex-funky-angelfish-dc9aad@quoll>
References: <20260727021048.3375444-1-attinagaoxu@gmail.com>
 <20260727021048.3375444-3-attinagaoxu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727021048.3375444-3-attinagaoxu@gmail.com>
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

On Mon, Jul 27, 2026 at 10:10:46AM +0800, Gavin Gao wrote:
> RK3576 provides REFCLKO25M_GMAC0_OUT and REFCLKO25M_GMAC1_OUT clocks
> for the two GMAC instances.
> 
> Describe these clocks with the clk_mac_25m_refout clock name so boards
> using RGMII output clock mode can let the MAC driver manage the 25 MHz
> reference output.
> 
> Signed-off-by: Gavin Gao <attinagaoxu@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> index 70e67d4dccb8..f1125c2f88ab 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1692,10 +1692,10 @@ gmac0: ethernet@2a220000 {
>  			reg = <0x0 0x2a220000 0x0 0x10000>;
>  			clocks = <&cru CLK_GMAC0_125M_SRC>, <&cru CLK_GMAC0_RMII_CRU>,
>  				 <&cru PCLK_GMAC0>, <&cru ACLK_GMAC0>,
> -				 <&cru CLK_GMAC0_PTP_REF>;
> +				 <&cru CLK_GMAC0_PTP_REF>, <&cru REFCLKO25M_GMAC0_OUT>;
>  			clock-names = "stmmaceth", "clk_mac_ref",
>  				      "pclk_mac", "aclk_mac",
> -				      "ptp_ref";
> +				      "ptp_ref", "clk_mac_25m_refout";

Where is clk_mac_refout? Why do you claim this is a different input
(important: INPUT)?

Best regards,
Krzysztof


