Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0364C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 23:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=redhC8e3Ct/pAC0BvBXsF4aO5Hn7CgQcom72ewwofu4=; b=kdAjR2WScf48Rf6OvPm00wC3kE
	ua2fXiHi1jQo9f7K/Ix4rMAsFyXX8j2eb4oHGt2sWd0dxdjb+hi8QDzU5uUw6r6xzsVO0tH2wQN9D
	mCJmQTDjtwOhV5Fj06q2jW6xCV0yTzwDuZbUH2JvKLzGsYWarjhqNCkbQKEYUcV+Jv2LY3M44rn0G
	fQm4jJOM48tBxBQTYsY49qkWFXoYe/u95MKee+qZHmI+TZtlkfJ4evxZyHq8qXXFZPIimrkR+YQlP
	VgfWHR6Y/JD7cujc5vdbJ8mLejCqj36I5bzUm4xGmWad5LE+W0tYe974o4P4BvVGX3SstMwFWX1o6
	SI+aTYPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww7ES-00000007009-2BBQ;
	Mon, 17 Aug 2026 23:59:08 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww7EM-00000006zxz-05s9;
	Mon, 17 Aug 2026 23:59:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1195411C2DE;
	Tue, 18 Aug 2026 01:58:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787011135;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=redhC8e3Ct/pAC0BvBXsF4aO5Hn7CgQcom72ewwofu4=;
	b=iUWyEkDqNZ52KhuW0otuot4A9Sly7Nn28oK1xMXtGmpA2mfI/nmrF8CEYye9FmAWgXPqcQ
	hWNNFPQeO21swuPdvl/g+91RvPWIqzS9gjp6sxsDn7eLIXvpQUoO0Bq7oibx1SfRRhZYDQ
	RvA79Kfduith0daRJu1jHWvKvs1O0QAgfUhIPxy7lhHHO91eeNYAoO9QcAfxrsNsgNwBgt
	xkJjEzSgcsoUMMG2P9CtOHHlg92QFjDuLQAJ6L0vmj5h6ErDq1YmrWmcUeMOCXIRfnsofu
	dFYMEfu3d68rkmwKioPRdkQFDpv3vyl2GzalWnCZPHr8TmcpgbEt0VjzlosXGg==
Message-ID: <f7b674b3-9490-453c-9eb9-96b19254d0a3@nabladev.com>
Date: Mon, 17 Aug 2026 21:43:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] phy: stm32: Add support for ST STM32MP25
 USB2-FEMTO PHY
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-usb@vger.kernel.org
Cc: Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260816213849.1044073-1-marex@nabladev.com>
 <20260816213849.1044073-3-marex@nabladev.com>
 <e415f8de-f8dc-460d-80a9-5e1b2b34f8a8@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <e415f8de-f8dc-460d-80a9-5e1b2b34f8a8@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_165902_353014_277127FC 
X-CRM114-Status: GOOD (  34.99  )
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

On 8/17/26 6:22 PM, Fabrice Gasnier wrote:

Hello Fabrice,

>> +++ b/drivers/phy/st/phy-stm32-usb2phy.c
>> @@ -0,0 +1,361 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * STMicroelectronics STM32 USB2 PHY Controller driver
>> + * Currently Only supported for STM32MP25
>> + *
>> + * Copyright (C) 2022 STMicroelectronics
> 
> Hi Marek,
> 
> Could update to 2026 ?

Fixed in V3.

[...]

>> +static int stm32_usb2phy_enable(struct stm32_usb2phy *phy_dev)
>> +{
>> +	const struct stm32mp2_usb2phy_hw_data *phy_data = phy_dev->hw_data;
>> +	unsigned long rate;
>> +	int refsel, ret;
>> +
>> +	/* Check if a phy is already init or clk48 in use */
>> +	if (atomic_inc_return(&phy_dev->en_refcnt) > 1)
>> +		return 0;
>> +
>> +	rate = clk_get_rate(phy_dev->phyref);
>> +	if (rate == 19200000)
>> +		refsel = 0;
>> +	else if (rate == 20000000)
>> +		refsel = 1;
>> +	else if (rate == 24000000)
>> +		refsel = 2;
>> +	else
>> +		return -EINVAL;
>> +
>> +	ret = regmap_update_bits(phy_dev->regmap,
>> +				 phy_dev->cr_offset,
>> +				 phy_data->phyrefsel_mask,
>> +				 field_prep(phy_data->phyrefsel_mask, refsel));
>> +	if (ret)
>> +		return ret;
>> +
> 
> Hi Marek,
> 
> Below condition
> 
>> +	if (phy_data->is_usb2_host_only) {
>> +		/*
>> +		 * The clock should default to active after standby, as it is
>> +		 * needed when resuming OHCI to access its registers.
>> +		 * CMN is default reset to 1, so enforce it is cleared, when the
>> +		 * clock enable request from OHCI driver comes at resume time.
>> +		 */
>> +		ret = regmap_clear_bits(phy_dev->regmap, phy_dev->cr_offset,
>> +					SYSCFG_USB2PHY2CR_USB2PHY2CMN);
>> +		if (ret)
>> +			return ret;
>> +	}
> 
> up to here, is a specific part to manage OHCI controller clock during
> suspend modes (either bus suspend, or system-wide platform low power PM).
> 
> This should be moved to the clock provider api. E.g. to register a 2nd
> clock.
> 
> Point here is the bit is always cleared, even if OHCI is
> unused/disabled, but EHCI is. EHCI can be enabled w/o OHCI when there's
> an on-board USB HUB (in such case only High Speed traffic is expected).
> 
> EHCI don't require to clear CMN for suspend states.

Please see at the end of this email.

>> +
>> +	ret = regulator_enable(phy_dev->vdd33);
>> +	if (ret)
>> +		return ret;

[...]

>> +static int stm32_usb2phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
>> +{
>> +	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
>> +	const struct stm32mp2_usb2phy_hw_data *phy_data = phy_dev->hw_data;
>> +	u32 val, mask = SYSCFG_USB2PHY2CR_USB2PHY2CMN;
>> +	int ret;
> 
> Then could simplify here directly for host only PHY : there's no point
> in poking control register here.
> (As mentioned above, control SYSCFG_USB2PHY2CR_USB2PHY2CMN with clock
> provider API for host-only configuration.)
> 
> 	if (phy_data->is_usb2_host_only)
> 		return 0;

I think it would be even better at this point to register separate PHY 
ops for each PHY, one with and one without .set_mode .

[...]

>> +	ret = devm_clk_hw_register(phy_dev->dev, &phy_dev->clk48_hw);
>> +	if (ret)
>> +		return dev_err_probe(phy_dev->dev, ret, "Failed to register 48 MHz clock\n");
> 
> In v2, the #clock-cells has been updated to 1. This allow to manage
> separately the OHCI clock bit ("...CMN") as a child clock of the 48MHz
> clock.
> 
> Please register a 2nd clock, so the OHCI controller can take benefit of it.
> 
> As you mention the downstream driver, please see there a specific
> comment regarding the 2nd clock for OHCI:
> /*
> * USB2PHY provides several clocks used either by either USHB
> (EHCI/OHCI), OTG or USB3DR.
> * In case of OHCI, CMN bit must be cleared (clkohci_hw). This clock is
> required to access
> * the registers, to resume the controller from suspended state.
> * So declare two clocks, the PLL used in all case, and the OHCI clocks
> used by OHCI
> * controller.
> */
Is this what you have in mind ?

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi 
b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index e22bb53c9748b..2fa03b059c71b 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -883,7 +883,7 @@ usbh_ohci: usb@482e0000 {
  				compatible = "generic-ohci";
  				reg = <0x482e0000 0x1000>;
  				access-controllers = <&rifsc 63>;
-				clocks = <&usb2_phy1 0>, <&rcc CK_BUS_USB2OHCI>;
+				clocks = <&usb2_phy1 1>, <&rcc CK_BUS_USB2OHCI>;
  				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
  				phys = <&usb2_phy1>;
  				phy-names = "usb";
diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi 
b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index dbaac8a930fda..6e0f25e33f05f 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1765,7 +1765,7 @@ usbh_ohci: usb@482e0000 {
  				compatible = "generic-ohci";
  				reg = <0x482e0000 0x1000>;
  				access-controllers = <&rifsc 63>;
-				clocks = <&usb2_phy1 0>, <&rcc CK_BUS_USB2OHCI>;
+				clocks = <&usb2_phy1 1>, <&rcc CK_BUS_USB2OHCI>;
  				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
  				phys = <&usb2_phy1>;
  				phy-names = "usb";
diff --git a/drivers/phy/st/phy-stm32-usb2phy.c 
b/drivers/phy/st/phy-stm32-usb2phy.c
index 1daaf2f440d04..1c4b37094591c 100644
--- a/drivers/phy/st/phy-stm32-usb2phy.c
+++ b/drivers/phy/st/phy-stm32-usb2phy.c
@@ -27,6 +27,8 @@
  #define SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL		BIT(5)
  #define SYSCFG_USB2PHY2CR_VBUSVLDEXT		BIT(6)

+#define USBH_NUM_CLK				2
+
  struct stm32_usb2phy {
  	struct phy				*phy;
  	struct regmap				*regmap;
@@ -34,12 +36,15 @@ struct stm32_usb2phy {
  	struct reset_control			*rstc;
  	struct clk				*phyref;
  	struct regulator			*vdd33;
-	struct clk_hw				clk48_hw;
  	const struct stm32mp2_usb2phy_hw_data	*hw_data;
  	atomic_t				en_refcnt;
  	enum phy_mode				mode;
  	u32					cr_offset;
  	bool					is_init;
+	struct clk_hw				clk48_hw;
+	struct clk_hw				clkcmn_hw;
+	/* Must be last */
+	struct clk_hw_onecell_data		onecell;
  };

  struct stm32mp2_usb2phy_hw_data {
@@ -74,19 +79,6 @@ static int stm32_usb2phy_enable(struct stm32_usb2phy 
*phy_dev)
  	if (ret)
  		return ret;

-	if (phy_data->is_usb2_host_only) {
-		/*
-		 * The clock should default to active after standby, as it is
-		 * needed when resuming OHCI to access its registers.
-		 * CMN is default reset to 1, so enforce it is cleared, when the
-		 * clock enable request from OHCI driver comes at resume time.
-		 */
-		ret = regmap_clear_bits(phy_dev->regmap, phy_dev->cr_offset,
-					SYSCFG_USB2PHY2CR_USB2PHY2CMN);
-		if (ret)
-			return ret;
-	}
-
  	ret = regulator_enable(phy_dev->vdd33);
  	if (ret)
  		return ret;
@@ -233,9 +225,33 @@ static const struct clk_ops stm32_usb2phy_clk48_ops = {
  	.recalc_rate = stm32_usb2phy_clk48_recalc_rate,
  };

+static int stm32_usb2phy_clkcmn_prepare(struct clk_hw *hw)
+{
+	struct stm32_usb2phy *phy_dev = container_of(hw, struct stm32_usb2phy,
+						     clkcmn_hw);
+
+	return regmap_clear_bits(phy_dev->regmap, phy_dev->cr_offset,
+				 SYSCFG_USB2PHY2CR_USB2PHY2CMN);
+}
+
+static void stm32_usb2phy_clkcmn_unprepare(struct clk_hw *hw)
+{
+	struct stm32_usb2phy *phy_dev = container_of(hw, struct stm32_usb2phy,
+						     clkcmn_hw);
+
+	regmap_set_bits(phy_dev->regmap, phy_dev->cr_offset,
+			SYSCFG_USB2PHY2CR_USB2PHY2CMN);
+}
+
+static const struct clk_ops stm32_usb2phy_clkcmn_ops = {
+	.prepare = stm32_usb2phy_clkcmn_prepare,
+	.unprepare = stm32_usb2phy_clkcmn_unprepare,
+};
+
  static int stm32_usb2phy_probe(struct platform_device *pdev)
  {
-	struct clk_init_data init = { .ops =  &stm32_usb2phy_clk48_ops };
+	struct clk_init_data clk48init = { .ops =  &stm32_usb2phy_clk48_ops };
+	struct clk_init_data clkcmninit = { .ops =  &stm32_usb2phy_clkcmn_ops };
  	struct phy_provider *phy_provider;
  	struct device *dev = &pdev->dev;
  	struct stm32_usb2phy *phy_dev;
@@ -243,7 +259,7 @@ static int stm32_usb2phy_probe(struct 
platform_device *pdev)
  	struct phy *phy;
  	int ret;

-	phy_dev = devm_kzalloc(dev, sizeof(*phy_dev), GFP_KERNEL);
+	phy_dev = devm_kzalloc(dev, struct_size(phy_dev, onecell.hws, 
USBH_NUM_CLK), GFP_KERNEL);
  	if (!phy_dev)
  		return -ENOMEM;

@@ -285,20 +301,33 @@ static int stm32_usb2phy_probe(struct 
platform_device *pdev)
  	if (IS_ERR(phy_provider))
  		return PTR_ERR(phy_provider);

-	init.name = devm_kasprintf(dev, GFP_KERNEL, "clk_%s_48m",
+	clk48init.name = devm_kasprintf(dev, GFP_KERNEL, "clk_%s_48m",
  				   of_node_full_name(dev->of_node));
-	if (!init.name)
+	if (!clk48init.name)
  		return -ENOMEM;

-	phy_dev->clk48_hw.init = &init;
+	clkcmninit.name = devm_kasprintf(dev, GFP_KERNEL, "clk_%s_cmn",
+				   of_node_full_name(dev->of_node));
+	if (!clkcmninit.name)
+		return -ENOMEM;
+
+	phy_dev->onecell.num = USBH_NUM_CLK;
+	phy_dev->onecell.hws[0] = &phy_dev->clk48_hw;
+	phy_dev->onecell.hws[1] = &phy_dev->clkcmn_hw;

+	phy_dev->clk48_hw.init = &clk48init;
  	ret = devm_clk_hw_register(phy_dev->dev, &phy_dev->clk48_hw);
  	if (ret)
  		return dev_err_probe(phy_dev->dev, ret, "Failed to register 48 MHz 
clock\n");

-	ret = devm_of_clk_add_hw_provider(phy_dev->dev, of_clk_hw_simple_get, 
&phy_dev->clk48_hw);
+	phy_dev->clkcmn_hw.init = &clkcmninit;
+	ret = devm_clk_hw_register(phy_dev->dev, &phy_dev->clkcmn_hw);
+	if (ret)
+		return dev_err_probe(phy_dev->dev, ret, "Failed to register CMN 
clock\n");
+
+	ret = devm_of_clk_add_hw_provider(phy_dev->dev, of_clk_hw_onecell_get, 
&phy_dev->onecell);
  	if (ret)
-		return dev_err_probe(phy_dev->dev, ret, "Failed to add 48 MHz clock 
provider\n");
+		return dev_err_probe(phy_dev->dev, ret, "Failed to add clock 
provider\n");

  	return 0;
  }

