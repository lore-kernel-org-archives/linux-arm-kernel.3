Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99028FCE095
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4joCzfpZzNX8f8e2+8FF8LdAQIeH2TdAahs6EG0yWxs=; b=abx34HqDY3kAudYur0nG5h6BFu
	IMU2ZKZSWio8ifbxz3x83LP//mAB1MM6aNEvOQXdzodSju6KrZqFYZr8yGqytsnHqpkzdlO3vFFmk
	niySiUdq5hQLsFDUF7JZf9kTqhIFKAJM58cKZmL8Mi3iV4jJ8lBkPNQCkW3bN3djHlzuTxqqSXiF2
	C5KUqJfnhKjeh8DnwCCraRR4XppINeLRIb72FXWWFOCqVUEtsI/X75ALopgYzWuXaj9HQplM4pXKB
	wmEMulcXK1KjBGyIU5yXYx+qcctyJO9fvvPuaFKBvMXogMQZEzuIHja70A0fi0H/6CVQgvhse6vH5
	5xN6rEtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcPd-00000006Lmp-3Ero;
	Thu, 26 Feb 2026 14:32:21 +0000
Received: from [2a01:4f9:c011:1c83::1] (helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcPa-00000006Llx-0X7H;
	Thu, 26 Feb 2026 14:32:20 +0000
Received: from [192.168.1.34] (71.227.91.92.rev.sfr.net [92.91.227.71])
	by courrier.aliel.fr (Postfix) with ESMTPSA id 5BD2F4A575;
	Thu, 26 Feb 2026 14:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1772116321;
	bh=uYy7dVPPAn+CvhWewPeOnD73sxjqMb48rW9uwL1HoUU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=OSiYFWt9TACRtXn4rjkXM5h7tOIa+/M7c3szoUPG39vs/suOhh8CrnAlvlql5BEXj
	 y7ELnuW149U1jWc0n8Zp2eOTuDncwAcm5LpeGzs7NDmkTRpsNCJVFEMKjAag0I/MXg
	 /IBXmSYUxAwCSl+KaqMH/4Y26nyJHYN9Fzas6wS8=
Message-ID: <941c5dac-afcc-4d93-926e-9acb3cf1a930@aliel.fr>
Date: Thu, 26 Feb 2026 15:30:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 1/7] drivers: clk: meson: Add Amlogic T7 fix pll support
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
 <1j4ine6i6a.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
In-Reply-To: <1j4ine6i6a.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_063218_798951_D6726D9C 
X-CRM114-Status: GOOD (  21.45  )
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

On 2/18/26 7:05 PM, Jerome Brunet wrote:
> On mer. 18 févr. 2026 at 11:17, Ronald Claveau <linux-kernel-dev@aliel.fr> wrote:
> 
>> Add PLL for the clock controller of the Amlogic T7 SoC family.
>>
> 
> As Krzysztof pointed out, a series like this needs a cover letter to explain
> what you are trying to acheive overall, and proper threading.
> 
> The description above is too vague.
> 

Indeed, I will do that for the next one.

>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>  drivers/clk/meson/t7-pll.c | 257 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 257 insertions(+)
>>
>> diff --git a/drivers/clk/meson/t7-pll.c b/drivers/clk/meson/t7-pll.c
>> index 0a622f45fa36..3dd3aca50b7c 100644
>> --- a/drivers/clk/meson/t7-pll.c
>> +++ b/drivers/clk/meson/t7-pll.c
>> @@ -71,6 +71,15 @@
>>  #define MCLK_PLL_CNTL4		0x10
>>  #define MCLK_PLL_STS		0x14
>>  
>> +#define FPLL_CTRL0		0x00
>> +#define FPLL_CTRL1		0x04
>> +#define FPLL_CTRL2		0x08
>> +#define FPLL_CTRL3		0x0c
>> +#define FPLL_CTRL4		0x10
>> +#define FPLL_CTRL5		0x14
>> +#define FPLL_CTRL6		0x18
>> +#define FPLL_STS		0x1c
> 
> The PLL you are adding is described in the datasheet as the MPLL. FPLL
> is nowhere to be found. Prefer using names that relate to the
> documentation.
> 
> If you must make a name up, you need to have a very good reason and to
> explain it.
> 
> Still from the public documentation, this PLL belong in the same device as
> MPLL0, MPLL1, etc ... BUT, I remember correctly the T7 initial
> submission, the fixed PLL and fdivs are supposed to be provided through
> SCMI clocks. Have you checked that ?
> 

Yes, I read the initial submission, and I tried first with scmi-smc and
scmi-mailbox, but with no success.
I will try it again and ask khadas team for more information related to
this.

>> +
>>  static const struct pll_mult_range t7_media_pll_mult_range = {
>>  	.min = 125,
>>  	.max = 250,
>> @@ -1047,6 +1056,253 @@ static const struct meson_clkc_data t7_mclk_data = {
>>  	},
>>  };
>>  
>> +static struct clk_regmap t7_fpll_dco = {
>> +	.data = &(struct meson_clk_pll_data){
>> +		.en = {
>> +			.reg_off = FPLL_CTRL0,
>> +			.shift   = 28,
>> +			.width   = 1,
>> +		},
>> +		.m = {
>> +			.reg_off = FPLL_CTRL0,
>> +			.shift   = 0,
>> +			.width   = 8,
>> +		},
>> +		.n = {
>> +			.reg_off = FPLL_CTRL0,
>> +			.shift   = 10,
>> +			.width   = 5,
>> +		},
>> +		.frac = {
>> +			.reg_off = FPLL_CTRL1,
>> +			.shift   = 0,
>> +			.width   = 17,
>> +		},
>> +		.l = {
>> +			.reg_off = FPLL_CTRL0,
>> +			.shift   = 31,
>> +			.width   = 1,
>> +		},
>> +		.rst = {
>> +			.reg_off = FPLL_CTRL0,
>> +			.shift   = 29,
>> +			.width   = 1,
>> +		},
>> +	},
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "fpll_dco",
>> +		.ops = &meson_clk_pll_ro_ops,
>> +		.parent_data = &(const struct clk_parent_data) {
>> +			.fw_name = "xtal",
>> +		},
>> +		.num_parents = 1,
>> +	},
>> +};
>> +
>> +static struct clk_regmap t7_fpll = {
>> +	.data = &(struct clk_regmap_div_data){
>> +		.offset = FPLL_CTRL0,
>> +		.shift = 16,
>> +		.width = 2,
>> +		.flags = CLK_DIVIDER_POWER_OF_TWO,
>> +	},
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "fpll",
>> +		.ops = &clk_regmap_divider_ro_ops,
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +			&t7_fpll_dco.hw
>> +		},
>> +		.num_parents = 1,
>> +	},
>> +};
>> +
>> +static struct clk_fixed_factor t7_fdiv2_div = {
>> +	.mult = 1,
>> +	.div = 2,
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "fdiv2_div",
>> +		.ops = &clk_fixed_factor_ops,
>> +		.parent_hws = (const struct clk_hw *[]) { &t7_fpll.hw },
>> +		.num_parents = 1,
>> +	},
>> +};
>> +
>> +static struct clk_regmap t7_fdiv2 = {
>> +	.data = &(struct clk_regmap_gate_data){
>> +		.offset = FPLL_CTRL1,
>> +		.bit_idx = 24,
>> +	},
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "fdiv2",
>> +		.ops = &clk_regmap_gate_ops,
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +			&t7_fdiv2_div.hw
>> +		},
>> +		.num_parents = 1,
>> +		.flags = CLK_IS_CRITICAL,
>> +	},
>> +};
>> +
>> +static struct clk_fixed_factor t7_fdiv2p5_div = {
>> +	.mult = 2,
>> +	.div = 5,
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "fdiv2p5_div",
>> +		.ops = &clk_fixed_factor_ops,
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +			&t7_fpll.hw
>> +		},
>> +		.num_parents = 1,
>> +	},
>> +};
>> +
>> +static struct clk_regmap t7_fdiv2p5 = {
>> +	.data = &(struct clk_regmap_gate_data){
>> +		.offset = FPLL_CTRL1,
>> +		.bit_idx = 25,
>> +	},
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "fdiv2p5",
>> +		.ops = &clk_regmap_gate_ops,
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +			&t7_fdiv2p5_div.hw
>> +		},
>> +		.num_parents = 1,
>> +	},
>> +};
>> +
>> +static struct clk_fixed_factor t7_fdiv3_div = {
>> +	.mult = 1,
>> +	.div = 3,
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "fdiv3_div",
>> +		.ops = &clk_fixed_factor_ops,
>> +		.parent_hws = (const struct clk_hw *[]) { &t7_fpll.hw },
>> +		.num_parents = 1,
>> +	},
>> +};
>> +
>> +static struct clk_regmap t7_fdiv3 = {
>> +	.data = &(struct clk_regmap_gate_data){
>> +		.offset = FPLL_CTRL1,
>> +		.bit_idx = 20,
>> +	},
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "fdiv3",
>> +		.ops = &clk_regmap_gate_ops,
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +			&t7_fdiv3_div.hw
>> +		},
>> +		.num_parents = 1,
>> +		.flags = CLK_IS_CRITICAL,
>> +	},
>> +};
>> +
>> +static struct clk_fixed_factor t7_fdiv4_div = {
>> +	.mult = 1,
>> +	.div = 4,
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "fdiv4_div",
>> +		.ops = &clk_fixed_factor_ops,
>> +		.parent_hws = (const struct clk_hw *[]) { &t7_fpll.hw },
>> +		.num_parents = 1,
>> +	},
>> +};
>> +
>> +static struct clk_regmap t7_fdiv4 = {
>> +	.data = &(struct clk_regmap_gate_data){
>> +		.offset = FPLL_CTRL1,
>> +		.bit_idx = 21,
>> +	},
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "fdiv4",
>> +		.ops = &clk_regmap_gate_ops,
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +			&t7_fdiv4_div.hw
>> +		},
>> +		.num_parents = 1,
>> +		.flags = CLK_IS_CRITICAL,
>> +	},
>> +};
>> +
>> +static struct clk_fixed_factor t7_fdiv5_div = {
>> +	.mult = 1,
>> +	.div = 5,
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "fdiv5_div",
>> +		.ops = &clk_fixed_factor_ops,
>> +		.parent_hws = (const struct clk_hw *[]) { &t7_fpll.hw },
>> +		.num_parents = 1,
>> +	},
>> +};
>> +
>> +static struct clk_regmap t7_fdiv5 = {
>> +	.data = &(struct clk_regmap_gate_data){
>> +		.offset = FPLL_CTRL1,
>> +		.bit_idx = 22,
>> +	},
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "fdiv5",
>> +		.ops = &clk_regmap_gate_ops,
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +			&t7_fdiv5_div.hw
>> +		},
>> +		.num_parents = 1,
>> +		.flags = CLK_IS_CRITICAL,
>> +	},
>> +};
>> +
>> +static struct clk_fixed_factor t7_fdiv7_div = {
>> +	.mult = 1,
>> +	.div = 7,
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "fdiv7_div",
>> +		.ops = &clk_fixed_factor_ops,
>> +		.parent_hws = (const struct clk_hw *[]) { &t7_fpll.hw },
>> +		.num_parents = 1,
>> +	},
>> +};
>> +
>> +static struct clk_regmap t7_fdiv7 = {
>> +	.data = &(struct clk_regmap_gate_data){
>> +		.offset = FPLL_CTRL1,
>> +		.bit_idx = 23,
>> +	},
>> +	.hw.init = &(struct clk_init_data){
>> +		.name = "fdiv7",
>> +		.ops = &clk_regmap_gate_ops,
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +			&t7_fdiv7_div.hw
>> +		},
>> +		.num_parents = 1,
>> +		.flags = CLK_IS_CRITICAL,
>> +	},
>> +};
>> +
>> +static struct clk_hw *t7_fpll_hw_clks[] = {
>> +	[CLKID_FPLL_DCO]	= &t7_fpll_dco.hw,
>> +	[CLKID_FPLL]		= &t7_fpll.hw,
>> +	[CLKID_FDIV2_DIV]	= &t7_fdiv2_div.hw,
>> +	[CLKID_FDIV2]		= &t7_fdiv2.hw,
>> +	[CLKID_FDIV2P5_DIV]	= &t7_fdiv2p5_div.hw,
>> +	[CLKID_FDIV2P5]		= &t7_fdiv2p5.hw,
>> +	[CLKID_FDIV3_DIV]	= &t7_fdiv3_div.hw,
>> +	[CLKID_FDIV3]		= &t7_fdiv3.hw,
>> +	[CLKID_FDIV4_DIV]	= &t7_fdiv4_div.hw,
>> +	[CLKID_FDIV4]		= &t7_fdiv4.hw,
>> +	[CLKID_FDIV5_DIV]	= &t7_fdiv5_div.hw,
>> +	[CLKID_FDIV5]		= &t7_fdiv5.hw,
>> +	[CLKID_FDIV7_DIV]	= &t7_fdiv7_div.hw,
>> +	[CLKID_FDIV7]		= &t7_fdiv7.hw,
>> +};
>> +
>> +static const struct meson_clkc_data t7_fpll_data = {
>> +	.hw_clks = {
>> +		.hws = t7_fpll_hw_clks,
>> +		.num = ARRAY_SIZE(t7_fpll_hw_clks),
>> +	},
>> +};
>> +
>>  static const struct of_device_id t7_pll_clkc_match_table[] = {
>>  	{ .compatible = "amlogic,t7-gp0-pll",	.data = &t7_gp0_data, },
>>  	{ .compatible = "amlogic,t7-gp1-pll",	.data = &t7_gp1_data, },
>> @@ -1055,6 +1311,7 @@ static const struct of_device_id t7_pll_clkc_match_table[] = {
>>  	{ .compatible = "amlogic,t7-mpll",	.data = &t7_mpll_data, },
>>  	{ .compatible = "amlogic,t7-hdmi-pll",	.data = &t7_hdmi_data, },
>>  	{ .compatible = "amlogic,t7-mclk-pll",	.data = &t7_mclk_data, },
>> +	{ .compatible = "amlogic,t7-fpll",	.data = &t7_fpll_data, },
>>  	{}
>>  };
>>  MODULE_DEVICE_TABLE(of, t7_pll_clkc_match_table);
> 


-- 
Best regards,
Ronald

