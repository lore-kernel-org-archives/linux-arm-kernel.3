Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4C1C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 12:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIENhgfskwWlqPlQlpailGGkxQCRl0UULls5o77rIMQ=; b=f5EqL+/LeT7BTZFt0McRwhaKVz
	Q5INK1+5qrg5b+X5yuHv6089He0dbRMogh/9JinYoTL1tfifF2Zse/tN3JJBp/N/FWRTPWqySL17g
	o5APwdQQE3uzquDbsMcFTEsnzSd9EJKqwwU52dgj5ZlicG+lrE+jQZ9O0vrwtIKuY7hhFBLffbD16
	g35pJfGuQmf/JMp94RXZ+wTz7HHr85OhGwEz09I2bke7DXoivdg5XY/w+o3MVN83FWeTTKRsKvIHU
	QCbCXVss2zq0lGcpr7u8ydl1Tdj8BcmKThY7xtrcxvB+zZszUESDk6IOSAvR6gBvoMbsJNbUpFECV
	mygHyQ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tckP4-00000004qJF-2lii;
	Tue, 28 Jan 2025 12:09:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tckNg-00000004qDl-3YP2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 12:07:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84D7D497;
	Tue, 28 Jan 2025 04:08:12 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AD9A3F694;
	Tue, 28 Jan 2025 04:07:43 -0800 (PST)
Date: Tue, 28 Jan 2025 12:07:35 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Souvik Chakravarty <souvik.chakravarty@arm.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/3] clk: scmi: Support spread spectrum
Message-ID: <Z5jIh6cLEqRKRdCd@pluto>
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
 <20250124-clk-ssc-v1-3-2d39f6baf2af@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124-clk-ssc-v1-3-2d39f6baf2af@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_040748_977470_D57D6B16 
X-CRM114-Status: GOOD (  32.50  )
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

On Fri, Jan 24, 2025 at 10:25:19PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Support Spread Spectrum for i.MX95 with adding
> scmi_clk_set_spread_spectrum_imx
> 

[CC: Souvik from ATG]

Hi Peng,

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/clk-scmi.c        | 37 +++++++++++++++++++++++++++++++++++++
>  include/linux/scmi_protocol.h |  5 +++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index 15510c2ff21c0335f5cb30677343bd4ef59c0738..e43902aea6bee3633f8328acddcf54eef907b640 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -98,6 +98,35 @@ static int scmi_clk_set_parent(struct clk_hw *hw, u8 parent_index)
>  	return scmi_proto_clk_ops->parent_set(clk->ph, clk->id, parent_index);
>  }
>  
> +static int scmi_clk_set_spread_spectrum_imx(struct clk_hw *hw,
> +					    struct clk_spread_spectrum *clk_ss)
> +{
> +	struct scmi_clk *clk = to_scmi_clk(hw);
> +	int ret;
> +	u32 val;
> +
> +	/* SCMI OEM Duty Cycle is expressed as a percentage */
> +	/*
> +	 * extConfigValue[7:0]   - spread percentage (%)
> +	 * extConfigValue[23:8]  - Modulation Frequency (KHz)
> +	 * extConfigValue[24]    - Enable/Disable
> +	 * extConfigValue[31:25] - Reserved
> +	 */
> +	val = FIELD_PREP(IMX_CLOCK_EXT_SS_PERCENTAGE_MASK, clk_ss->spreadpercent);
> +	val |= FIELD_PREP(IMX_CLOCK_EXT_SS_MOD_FREQ_MASK, clk_ss->modfreq);
> +	val |= IMX_CLOCK_EXT_SS_ENABLE_MASK;
> +	ret = scmi_proto_clk_ops->config_oem_set(clk->ph, clk->id,
> +						 SCMI_CLOCK_CFG_NXP_IMX_SSC,

If this is determined to be general enough (as per other mail in this
thread), since it effectively provides a new general clock framework
callback, I wonder if we should not try to make this straight away one
of the standard SCMI Clock Extended config types by adding it as a new
0x3 Extended config type value in the SCMI v3.2 Table 16 (with the above
extConfigValue synatx too)...

...that would mean having 0x3 reserved already for this in the upcoming
v3.3....but of course ATG has to agree on this so I copied Souvik.

In this way we could just get rid of the Vendor customization...if NOT I
would certainly base this Vendor OEM type extension on the SCMI FW-provided
vendor_info as you mentioned in the cover-letter, instead of compatibles.

Either way, it would also be wise to check if the specific Extended
config type is supported by the specific FW version (despite the version)
before registering a callback that could then always fail due to a missing
feature; currently, in fact, we do NOT take this precaution for for Duty
cycle callbacks and just assume that if SCMI Clocks extended configs are
suppported, all the standard ones are supported: this seems NOT right
BUT the only way to assure that an Extended config type is supported, as
of now, would be to query the current extended_config with CLOCK_CONFIG_GET
and see what the FW replies...this would allow us to avoid registering
unsupported features (like DutyCycle or SSC) with the core Clock framework
if NOT really supported by the running SCMI server...which in turn would
mean,potentially, 1 more SCMI message exchange per-clock at initialization
time, and I know this overhead is not always welcomed :D

> +						 val, false);
> +	if (ret)
> +		dev_warn(clk->dev,
> +			 "Failed to set spread spectrum(%u,%u,%u) for clock ID %d\n",
> +			 clk_ss->modfreq, clk_ss->spreadpercent, clk_ss->method,
> +			 clk->id);
> +
> +	return ret;
> +}
> +
>  static u8 scmi_clk_get_parent(struct clk_hw *hw)
>  {
>  	struct scmi_clk *clk = to_scmi_clk(hw);
> @@ -266,6 +295,11 @@ static int scmi_clk_ops_init(struct device *dev, struct scmi_clk *sclk,
>   * Return: A pointer to the allocated and configured clk_ops on success,
>   *	   or NULL on allocation failure.
>   */
> +static const char * const scmi_clk_ssc_allowlist[] = {
> +	"fsl,imx95",
> +	NULL
> +};

Fw vednor info would be better as you said, if we stick to a Vendor
implementation...

> +
>  static const struct clk_ops *
>  scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
>  {
> @@ -316,6 +350,9 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
>  		ops->set_duty_cycle = scmi_clk_set_duty_cycle;
>  	}
>  
> +	if (of_machine_compatible_match(scmi_clk_ssc_allowlist))
> +		ops->set_spread_spectrum = scmi_clk_set_spread_spectrum_imx;
> +
>  	return ops;
>  }
>  
> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 688466a0e816247d24704f7ba109667a14226b67..7012d5efef00eb7b52f17d0f3d8d69f3d0063557 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -80,9 +80,14 @@ enum scmi_clock_oem_config {
>  	SCMI_CLOCK_CFG_DUTY_CYCLE = 0x1,
>  	SCMI_CLOCK_CFG_PHASE,
>  	SCMI_CLOCK_CFG_OEM_START = 0x80,
> +	SCMI_CLOCK_CFG_NXP_IMX_SSC = 0x80,

If using a Vendor OEM type, I feel this should be somehow defined
per-vendor....you cannot just grab 0x80 Extended config type for NXP
because you arrived first :P

>  	SCMI_CLOCK_CFG_OEM_END = 0xFF,
>  };
>  
> +#define IMX_CLOCK_EXT_SS_PERCENTAGE_MASK	GENMASK(7, 0)
> +#define IMX_CLOCK_EXT_SS_MOD_FREQ_MASK		GENMASK(23, 8)
> +#define IMX_CLOCK_EXT_SS_ENABLE_MASK		BIT(24)
> +

Same...I feel the best would be to just add a standard 0x3 SSC Extended
type as said...lets see what Souvik says and if we can assume such 0x3
AND the above extConfigValue syntax to be reserved for this usage BEFORE
v3.3 is out...

Thans,
Cristian

