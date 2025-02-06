Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BA0C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 12:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CfJw+1dBkn575YP/OVBT5/h2reem2evYjbVkWTvC2E=; b=lSCAQo8uBWBbi7NeluzZZqZmtv
	3CEW5kz3T4vI7JrdrlFgW+ADP7WFsO5Gm9FwY7pTVVQGzvPMMAvQed4fx8yVlT+caQ0H93hA/fYUh
	VzmgLMtfIih7dKanTysBgXr9rAFLkFg7F1CMpt4e1rFgZFRBjOxox3izXvxbwVF+68/FIQHRGDt4K
	qLpMrgu4Jae0bVMMbftdmZPaBb4Pm8o2fzy3CpSQD3YCdLrJQeqixHCcPgVHBS249x/RiM/cUrHcn
	nWM2Hg2e/I6ZfUWt7l+Hz2C/FTrztzpU7Q2kSOdUZ5Ra3Yrupp+QyOshqoQXVAv0Dif1s64+ylX/y
	6U54hD1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0zD-00000006H54-20Fy;
	Thu, 06 Feb 2025 12:28:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0xq-00000006GrM-0PSE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 12:26:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FFE812FC;
	Thu,  6 Feb 2025 04:27:00 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FD453F63F;
	Thu,  6 Feb 2025 04:26:34 -0800 (PST)
Date: Thu, 6 Feb 2025 12:26:32 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Abel Vesa <abelvesa@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH NOT APPLY v2 4/4] clk: scmi: Support spread spectrum
Message-ID: <Z6SqeNsAqbZM8nr1@pluto>
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
 <20250205-clk-ssc-v2-4-fa73083caa92@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-clk-ssc-v2-4-fa73083caa92@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_042638_220209_CD16AC85 
X-CRM114-Status: GOOD (  22.66  )
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

On Wed, Feb 05, 2025 at 05:49:54PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Support Spread Spectrum with adding scmi_clk_set_spread_spectrum
> 

Hi,

I forwarded ATG with our latest exchange on the possibility of using a
standard OEM type instead of Vendor one if it is general enough....

...waiting for their feedback on this before reviewing further...BUT
just one comment down below

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/clk-scmi.c        | 47 +++++++++++++++++++++++++++++++++++++++++--
>  include/linux/scmi_protocol.h |  6 ++++++
>  2 files changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index 15510c2ff21c0335f5cb30677343bd4ef59c0738..56b9d0166b0170807c1a83fff391033fecee2159 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -23,6 +23,7 @@ enum scmi_clk_feats {
>  	SCMI_CLK_RATE_CTRL_SUPPORTED,
>  	SCMI_CLK_PARENT_CTRL_SUPPORTED,
>  	SCMI_CLK_DUTY_CYCLE_SUPPORTED,
> +	SCMI_CLK_SSC_SUPPORTED,
>  	SCMI_CLK_FEATS_COUNT
>  };
>  
> @@ -98,6 +99,36 @@ static int scmi_clk_set_parent(struct clk_hw *hw, u8 parent_index)
>  	return scmi_proto_clk_ops->parent_set(clk->ph, clk->id, parent_index);
>  }
>  
> +static int scmi_clk_set_spread_spectrum(struct clk_hw *hw,
> +					struct clk_spread_spectrum *clk_ss)
> +{
> +	struct scmi_clk *clk = to_scmi_clk(hw);
> +	int ret;
> +	u32 val;
> +
> +	/*
> +	 * extConfigValue[7:0]   - spread percentage (%)
> +	 * extConfigValue[23:8]  - Modulation Frequency (KHz)
> +	 * extConfigValue[24]    - Enable/Disable
> +	 * extConfigValue[31:25] - Modulation method
> +	 */
> +	val = FIELD_PREP(SCMI_CLOCK_EXT_SS_PERCENTAGE_MASK, clk_ss->spreaddepth);
> +	val |= FIELD_PREP(SCMI_CLOCK_EXT_SS_MOD_FREQ_MASK, clk_ss->modfreq);
> +	val |= FIELD_PREP(SCMI_CLOCK_EXT_SS_METHOD_MASK, clk_ss->method);
> +	if (clk_ss->enable)
> +		val |= SCMI_CLOCK_EXT_SS_ENABLE_MASK;
> +	ret = scmi_proto_clk_ops->config_oem_set(clk->ph, clk->id,
> +						 SCMI_CLOCK_CFG_SSC,
> +						 val, false);
> +	if (ret)
> +		dev_warn(clk->dev,
> +			 "Failed to set spread spectrum(%u,%u,%u) for clock ID %d\n",
> +			 clk_ss->modfreq, clk_ss->spreaddepth, clk_ss->method,
> +			 clk->id);
> +
> +	return ret;
> +}
> +
>  static u8 scmi_clk_get_parent(struct clk_hw *hw)
>  {
>  	struct scmi_clk *clk = to_scmi_clk(hw);
> @@ -316,9 +347,17 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
>  		ops->set_duty_cycle = scmi_clk_set_duty_cycle;
>  	}
>  
> +	if (feats_key & BIT(SCMI_CLK_SSC_SUPPORTED))
> +		ops->set_spread_spectrum = scmi_clk_set_spread_spectrum;
> +
>  	return ops;
>  }
>  
> +static const char * const scmi_clk_imxlist[] = {
> +	"fsl,imx95",
> +	NULL
> +};
> +
>  /**
>   * scmi_clk_ops_select() - Select a proper set of clock operations
>   * @sclk: A reference to an SCMI clock descriptor
> @@ -370,8 +409,12 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
>  	if (!ci->parent_ctrl_forbidden)
>  		feats_key |= BIT(SCMI_CLK_PARENT_CTRL_SUPPORTED);
>  
> -	if (ci->extended_config)
> -		feats_key |= BIT(SCMI_CLK_DUTY_CYCLE_SUPPORTED);
> +	if (ci->extended_config) {
> +		if (of_machine_compatible_match(scmi_clk_imxlist))

... please NOT this also here if we use a standard OEM type :D..if it
won't be a vendor thing anymore, you should query with CONFIG_GET, OR we
should think also about adding some way in the spec to query the support
for extended configs like we do for other clock features...

Thanks,
Cristian

