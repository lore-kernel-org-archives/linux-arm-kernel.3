Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D49E81A36
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 15:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sn+NWsU72Dx5bt+EtkrKsh2ybFE9CoBjQ3YdvsVA54=; b=qEf38uN3MPZ7lEwJmUKUf01Jcj
	k1hnEx0yThQHCF4VHDGQGfY8VO3t+vDw9VB8KJJCBIb9f+toF1yC/A5E1jHQQOA72Tsz7oxADVWBP
	5s/PYWK8UNyOauEGC+6lRfK6f+WDSmh23CWQL09wFjH8oRN52s0rCaGAUaL3boX8wEcYpMqx1oQCt
	+qSAjJM0bfYKW50rWDCGdNjwzyU9Pm2E6+hB4QpCm1Pm3//4vj08AcNjpiCllI+60N5j5B/hjMDO6
	bG3p7/FaACcpat71wCSrf+WFnjzXEwy63NFLtSZdJyyLewGNIehqomWBI9SIuZuIlZCPlzCrFPlM3
	w0EEPkGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0QU-00000006sfS-2C9Y;
	Mon, 16 Feb 2026 15:22:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0QR-00000006sex-3rVk;
	Mon, 16 Feb 2026 15:22:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 19E4043815;
	Mon, 16 Feb 2026 15:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B5FC116C6;
	Mon, 16 Feb 2026 15:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771255335;
	bh=+AXEKgqENXU9fJ8gY4Qy3D4BbMROQCeB1cT+WULKFsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bVke98TKQHCmPp7aYCSq+FzJJwd1N7cDuLhGNulVsi3kDISO5a7AJFBm3a7kNw1Zs
	 5Iw5iKyil96Yjb2kaa996XtcP99USdiZnGFwboQyf93SxLti2oOp6RGusQa6tt0bF4
	 0vFtMznN3MpwWhSDzdS8LxrL4xOzXYaj2wJ8GWUrAJQmsxB/Oz7vODRYewD2J5wMOt
	 n/r6PbRevelbv2CgDMGB0hBJqf0/kttTTaqCaKmPDvRwbv46S7eNobKjhJZnoznYuD
	 xBCbX73IzTj1XGCShRVaUjJ2yNu4RTgdTUiUhws1iLJYbGP9PhfuNu3gDI2EgmCiUz
	 8W3J0k0Pz4V9A==
Date: Mon, 16 Feb 2026 20:51:51 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Pratyush Anand <pratyush.anand@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] PCI: API changes for multi-port controller support
Message-ID: <qoz2odrfe5w47ibjskg2fa3bkgtqd3ctkqqeua446sfjrc2e2m@tg4vynyonu3r>
References: <20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com>
 <20260105-dt-parser-v1-1-b11c63cb5e2c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260105-dt-parser-v1-1-b11c63cb5e2c@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_072215_995208_D4D71168 
X-CRM114-Status: GOOD (  19.00  )
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

On Mon, Jan 05, 2026 at 05:57:54PM +0530, Sumit Kumar wrote:
> For multi-port controllers, equalization preset properties should be
> specified in individual root port nodes rather than the controller node,

s/root port/Root Port

- Mani

> allowing each port to have its own configuration.
> 
> Change of_pci_get_equalization_presets() to accept a device_node pointer.
> This allows parsing equalization presets from any device tree node,
> which is needed for multi-port PCIe controllers.
> 
> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
>  drivers/pci/of.c  | 6 ++++--
>  drivers/pci/pci.h | 2 ++
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index 3579265f119845637e163d9051437c89662762f8..d09eff40b523c920c9ca3eaa64f784765b3c5bf8 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -971,6 +971,7 @@ EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
>   * of_pci_get_equalization_presets - Parses the "eq-presets-Ngts" property.
>   *
>   * @dev: Device containing the properties.
> + * @node: Device tree node containing the properties.
>   * @presets: Pointer to store the parsed data.
>   * @num_lanes: Maximum number of lanes supported.
>   *
> @@ -981,6 +982,7 @@ EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
>   * errno otherwise.
>   */
>  int of_pci_get_equalization_presets(struct device *dev,
> +				    struct device_node *node,
>  				    struct pci_eq_presets *presets,
>  				    int num_lanes)
>  {
> @@ -988,7 +990,7 @@ int of_pci_get_equalization_presets(struct device *dev,
>  	int ret;
>  
>  	presets->eq_presets_8gts[0] = PCI_EQ_RESV;
> -	ret = of_property_read_u16_array(dev->of_node, "eq-presets-8gts",
> +	ret = of_property_read_u16_array(node, "eq-presets-8gts",
>  					 presets->eq_presets_8gts, num_lanes);
>  	if (ret && ret != -EINVAL) {
>  		dev_err(dev, "Error reading eq-presets-8gts: %d\n", ret);
> @@ -998,7 +1000,7 @@ int of_pci_get_equalization_presets(struct device *dev,
>  	for (int i = 0; i < EQ_PRESET_TYPE_MAX - 1; i++) {
>  		presets->eq_presets_Ngts[i][0] = PCI_EQ_RESV;
>  		snprintf(name, sizeof(name), "eq-presets-%dgts", 8 << (i + 1));
> -		ret = of_property_read_u8_array(dev->of_node, name,
> +		ret = of_property_read_u8_array(node, name,
>  						presets->eq_presets_Ngts[i],
>  						num_lanes);
>  		if (ret && ret != -EINVAL) {
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 34f65d69662e9f61f0c489ec58de2ce17d21c0c6..72fa6db95b8a75f6e69b8019d1eb2262b6a46c13 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -965,6 +965,7 @@ void pci_release_bus_of_node(struct pci_bus *bus);
>  int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
>  bool of_pci_supply_present(struct device_node *np);
>  int of_pci_get_equalization_presets(struct device *dev,
> +				    struct device_node *node,
>  				    struct pci_eq_presets *presets,
>  				    int num_lanes);
>  #else
> @@ -1013,6 +1014,7 @@ static inline bool of_pci_supply_present(struct device_node *np)
>  }
>  
>  static inline int of_pci_get_equalization_presets(struct device *dev,
> +						  struct device_node *node,
>  						  struct pci_eq_presets *presets,
>  						  int num_lanes)
>  {
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

