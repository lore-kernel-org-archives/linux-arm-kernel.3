Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAE3CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 04:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTnmdAUvE/DVsBxLqP0djy/2Dolj5ax2p26Q/UU4kXM=; b=vME3mtTm7aOGiBwIEEh3Hcl8+B
	ej4beESNAybmW6rr6XFndYfmfRKRqzWTtczt5Ae4I1b/cfSq3Vly55ARZQRPMyMoomnqDutg54UV8
	RpqRYr6f6H6yWzJzmUbjKGmt7ORZzq8QJJ73L/WeVPFk4XuyyJ1mcGjGkYMSEPnnpeGMrIpEyeLNw
	eK3Mg8UKZz99od3xPlAeIzk6bZIYzk9d+5chx512lBDbQA/vg3g39jCa/prOyHI9Rv/8+OX9twSJU
	cB88JMSeXSTRZGDjpYPDX94aaU73TdsR5sTnmuLRxBl1huONuiqew9PYAJsPMBxFq+07I0+OM+2PD
	5mpec9LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usCmg-00000007Ox7-0lYH;
	Sat, 30 Aug 2025 04:01:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usCjv-00000007OkP-0eVo;
	Sat, 30 Aug 2025 03:58:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9155F60191;
	Sat, 30 Aug 2025 03:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF6EC4CEEB;
	Sat, 30 Aug 2025 03:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756526334;
	bh=VABUD4jO9Kymnm8cj7uMAQ8AvocLC42Iebzpv/8ohiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=knb/vVYf4lzqy+199q3lrWFfPdLUs3K4k2ZKF73nP9OEKi7V13ySggZQiv2/QnjKn
	 YATGK0Lmv/VQ9OpWMJLweUDUxXJrNz7qFfJMXHaKkNSVCB8SA5cbykG9MhYfHd4KBA
	 MjjMQ0SfPFwcJoz4Kpx7ZcO5ma6EzP76t1UHW37Fq+w/aeq9ValcipbntIFij7dNE5
	 K76xpi0EB9sVHWIiNteFgj6o55LbRmLuON7mGnck+00x2/Qp9qvuDEIY8mwPEk7jJR
	 ww4rvZWGxCeyCpaiJvC17/LAn0NToem0XETjxU3QuukDR03GcyUTjOTgZJOD6CjU02
	 wGM3SiHbl2QLw==
Date: Sat, 30 Aug 2025 09:28:44 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, jingoohan1@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de, 
	m.szyprowski@samsung.com, jh80.chung@samsung.com, pankaj.dubey@samsung.com
Subject: Re: [PATCH v3 12/12] arm64: dts: fsd: Add PCIe support for Tesla FSD
 SoC
Message-ID: <dsa7u5pz7qmjaunzrqgpjkyv4xh427bbnpkdzvkpz3w6v6xf6v@5kxhihh4hw2j>
References: <20250811154638.95732-1-shradha.t@samsung.com>
 <CGME20250811154746epcas5p261ba0c811f9dd8748f8f241b76be6525@epcas5p2.samsung.com>
 <20250811154638.95732-13-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811154638.95732-13-shradha.t@samsung.com>
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

On Mon, Aug 11, 2025 at 09:16:38PM GMT, Shradha Todi wrote:
> Add the support for PCIe controller driver and phy driver for Tesla FSD.
> It includes support for both RC and EP.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd-evb.dts      |  34 +++++
>  arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi |  65 +++++++++
>  arch/arm64/boot/dts/tesla/fsd.dtsi         | 147 +++++++++++++++++++++
>  3 files changed, 246 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> index 9ff22e1c8723..1b63c5d72d19 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> @@ -130,3 +130,37 @@ &serial_0 {
>  &ufs {
>  	status = "okay";
>  };
> +
> +&pcierc2 {

It'd be good to use underscore to differentiate RC and EP modes:

	pcie_rc1
	pcie_ep1

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie1_clkreq>, <&pcie1_wake>, <&pcie1_preset>,
> +			<&pcie0_slot1>;

Could you please explain what these 'preset' and 'slot' pins are?

> +};
> +
> +&pcieep2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie1_clkreq>, <&pcie1_wake>, <&pcie1_preset>,
> +			<&pcie0_slot1>;
> +};
> +
> +&pcierc0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie0_clkreq>, <&pcie0_wake0>, <&pcie0_preset0>,
> +			 <&pcie0_slot0>;
> +};
> +
> +&pcieep0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie0_clkreq>, <&pcie0_wake0>, <&pcie0_preset0>,
> +			 <&pcie0_slot0>;
> +};
> +
> +&pcierc1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie0_clkreq>, <&pcie0_wake1>, <&pcie0_preset0>;
> +};
> +
> +&pcieep1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie0_clkreq>, <&pcie0_wake1>, <&pcie0_preset0>;
> +};

[...]

> +		pcieep2: pcie-ep@15400000 {
> +			compatible = "tesla,fsd-pcie-ep";
> +			reg = <0x0 0x15090000 0x0 0x1000>,
> +			      <0x0 0x15400000 0x0 0x2000>,
> +			      <0x0 0x15402000 0x0 0x80>,
> +			      <0x0 0x15800000 0x0 0xff0000>;
> +			reg-names = "elbi", "dbi", "dbi2", "addr_space";
> +			clocks = <&clock_fsys0 PCIE_SUBCTRL_INST0_AUX_CLK_SOC>,
> +				 <&clock_fsys0 PCIE_SUBCTRL_INST0_DBI_ACLK_SOC>,
> +				 <&clock_fsys0 PCIE_SUBCTRL_INST0_MSTR_ACLK_SOC>,
> +				 <&clock_fsys0 PCIE_SUBCTRL_INST0_SLV_ACLK_SOC>;
> +			clock-names = "aux", "dbi", "mstr", "slv";
> +			num-lanes = <4>;
> +			phys = <&pciephy0>;
> +			samsung,syscon-pcie = <&sysreg_fsys0 0x434>;
> +			status = "disabled";

So only host mode DMA is cache coherent and not endpoint? Weird.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

