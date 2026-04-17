Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3ABF8E4B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 07:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bAnNbDSyQm2tbM9RfAjxsUZhyF08bOCjXCLhVyYxIo=; b=OfrLySN2MhabhEGZr72bpnilb8
	Q9CVL1ucbzrqG6PiAOBOHqYVCfCQT0gfmbzZfrAVvenAEJXxhGGXB/7yFSZfE5rwv+06mOL3mcTB+
	V+QjAREzYYg15b2LYHjFc4D5DxIdAKn6y2CBq3YSBSSqrigq062NhvF736tEw7MZueFjoEtiQgaFT
	FQaQyEPCCKDx0u8UmzmNHBkN3iXSLHh86ObrveBundzP7JqhYh+IrSPjeElHTc/bwhLtYTMPtHmpJ
	pU/9NZ7ghmZb+kvMFHg8UjToELJE4QeAAA95wvPQBRkRiZeiyLL2UKz++DVtWSiFzTGztiWxfmjCP
	hkVqERtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdqy-00000003c6W-2kFa;
	Fri, 17 Apr 2026 07:43:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdqx-00000003c6J-0v3b;
	Fri, 17 Apr 2026 07:43:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7bAnNbDSyQm2tbM9RfAjxsUZhyF08bOCjXCLhVyYxIo=; b=bdnbBGAEnaaLtREL6chu2/VmyJ
	Nyh+ywkpSitak/Wq01FCXj2NiZHgwOj+MO2E6tkJTOD7QJRiFaNUyBRn2bhuKn0ldxMvjNiHW9ugH
	N2tsGlT5KwejKaHhg4ACEiBC4Hb69s5acXCAXPmzhQj7eimjRgcIrpHdDzpspKgDCTe+AOEc5zFAC
	EBVnEj1+WIiAh5k71bwn4/SfRPfe7Izy1LXkOy9GJ+AvVz2uTNB0f8+P2GDvP98jZkXdIuIlFPPTR
	kB0RIl+FHAbXWum2X67+3PI7uKxFFNNALSIixfXZAsI2uH0WU+37GqjH5jZNvWYk+S4q3y6AXINXy
	nQTPbd6A==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdqt-00000004urt-0C0P;
	Fri, 17 Apr 2026 07:43:01 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63H7eJVS13458892, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1776411619; bh=7bAnNbDSyQm2tbM9RfAjxsUZhyF08bOCjXCLhVyYxIo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=ikYCYNIvaltaimo4dwiRBzSVzmihzvmdYD7TJf2OPt27HwAJK2pvp050wzbnNDpoD
	 gI5FrY5GukW4H9GNS7Z1kcIf6SmsIhBmp3lZBv7QroZaIC0eTqzWICbkEY+G5h1d5r
	 3KySmlaUooQp2CV67wFWLnIO+hhX2I/FRBCq/V2yq0ASMgAoGvv6lYlojwTWhpXoPh
	 eSbvmaeKr0NDnEu6K2z8a6li55KM7/sDIec9azlCM1nMEvdpD/uJsfm157bMmn8M8s
	 NYOKKenr+GvPwy/Ed06c0MASG+m4oK9R9L1LAzV0mJHCRlnur+0mlzIOzv6/UrvlV6
	 KZNWlIB+mr0AA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63H7eJVS13458892
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Apr 2026 15:40:19 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 17 Apr 2026 15:40:18 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 17 Apr 2026 15:40:17 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <bmasney@redhat.com>
CC: <afaerber@suse.com>, <conor+dt@kernel.org>, <cy.huang@realtek.com>,
        <cylee12@realtek.com>, <devicetree@vger.kernel.org>,
        <eleanor.lin@realtek.com>, <james.tai@realtek.com>,
        <jyanchou@realtek.com>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-realtek-soc@lists.infradead.org>, <mturquette@baylibre.com>,
        <p.zabel@pengutronix.de>, <robh@kernel.org>, <sboyd@kernel.org>,
        <stanley_chang@realtek.com>
Subject: Re: [PATCH v6 07/10] clk: realtek: Add support for MMC-tuned PLL clocks
Date: Fri, 17 Apr 2026 15:40:17 +0800
Message-ID: <20260417074017.1198940-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <ac_XtHzDpIjHW8xT@redhat.com>
References: <ac_XtHzDpIjHW8xT@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_084259_708277_9A748AF1 
X-CRM114-Status: GOOD (  32.95  )
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

Hi Brian,

Sorry for the late reply.

> Hi Yu-Chun and Cheng-Yu,
>
> On Thu, Apr 02, 2026 at 03:39:54PM +0800, Yu-Chun Lin wrote:
> > From: Cheng-Yu Lee <cylee12@realtek.com>
> > 
> > Add clk_pll_mmc_ops for enable/disable, prepare, rate control, and status
> > operations on MMC PLL clocks.
> > 
> > Also add clk_pll_mmc_phase_ops to support phase get/set operations.
> > 
> > Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> > Co-developed-by: Jyan Chou <jyanchou@realtek.com>
> > Signed-off-by: Jyan Chou <jyanchou@realtek.com>
> > Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> > Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> > ---
> > Changes in v6:
> > - Add the headers used in c file to follow the "Include What You Use" principle.
> > - Move to_clk_pll_mmc() from clk-pll.h to clk-pll-mmc.c to limit its scope.
> > - Change offset type from int to unsigned int.
> > ---
> >  MAINTAINERS                       |   8 +
> >  drivers/clk/realtek/Kconfig       |   3 +
> >  drivers/clk/realtek/Makefile      |   2 +
> >  drivers/clk/realtek/clk-pll-mmc.c | 410 ++++++++++++++++++++++++++++++
> >  drivers/clk/realtek/clk-pll.h     |  13 +
> >  5 files changed, 436 insertions(+)
> >  create mode 100644 drivers/clk/realtek/clk-pll-mmc.c
> > 

(snip)

> > +
> > +static inline int get_phrt0(struct clk_pll_mmc *clkm, u32 *val)
> > +{
> > +	u32 reg;
> > +	int ret;
> > +
> > +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET, &reg);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val = (reg >> PLL_PHRT0_SHIFT) & PLL_PHRT0_MASK;
>
> Sashiko reports the following:
> https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com
> 
>    With PLL_PHRT0_SHIFT defined as 1 and PLL_PHRT0_MASK as BIT(1) (0x02), shifting
>    right by 1 moves the target bit 1 to position 0, but masking with 0x02 checks
>    position 1 of the shifted value.
>    
>    Will this cause clk_pll_mmc_is_enabled() to always evaluate to false since it
>    expects val == 0x1?
>

Thank you for catching this critical bug! You're absolutely right.
The issue is that I incorrectly used BIT() for the mask values
I will correct them, like PLL_PHRT0_MASK from BIT(1) to 0x1.

> > +	return 0;
> > +}
> > +
> > +static inline int set_phrt0(struct clk_pll_mmc *clkm, u32 val)
> > +{
> > +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET,
> > +				  PLL_PHRT0_MASK, val << PLL_PHRT0_SHIFT);
> > +}
> > +
> > +static inline int get_phsel(struct clk_pll_mmc *clkm, int id, u32 *val)
> > +{
> > +	int ret;
> > +	u32 raw_val;
> > +	u32 sft = id ? 8 : 3;
>
> Put variables in reverse Christmas tree order.
>

Ack.

(snip)

> > +
> > +static int clk_pll_mmc_phase_set_phase(struct clk_hw *hw, int degrees)
> > +{
> > +	struct clk_hw *hwp = clk_hw_get_parent(hw);
> > +	struct clk_pll_mmc *clkm;
> > +	int phase_id;
> > +	int ret;
> > +	u32 val;
> > +
> > +	if (!hwp)
> > +		return -ENOENT;
> > +
> > +	clkm = to_clk_pll_mmc(hwp);
> > +	phase_id = (hw - &clkm->phase0_hw) ? 1 : 0;
> 
> Are you checking to see if these two pointers are the same? If so, what
> do you think about this instead?
>
>    hw == &clkm->phase0_hw
>
>
> Does you mean phase_id = (hw == &clkm->phase0_hw) ? 0 : 1; ?
>

Yes, I will revise it according to your suggestion.

> > +	val = DIV_ROUND_CLOSEST(degrees * 100, PHASE_SCALE_FACTOR);
> > +	ret = set_phsel(clkm, phase_id, val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	usleep_range(10, 20);
> > +	return 0;
> > +}
> > +

(snip)

> > +
> > +static unsigned long clk_pll_mmc_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> > +{
> > +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
> > +	u32 val, ext_f;
> > +	int ret;
> > +
> > +	ret = get_ssc_div_n(clkm, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = get_ssc_div_ext_f(clkm, &ext_f);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return parent_rate / 4 * (val + 2) + (parent_rate / 4 * ext_f) / 8192;
> > +}
> > +
> > +static int clk_pll_mmc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
> > +{
>
> Should there be a check for a parent rate of zero before the division is
> done?
>

Ack, I will do it.

> > +	u32 val = DIV_ROUND_CLOSEST(req->rate * 4, req->best_parent_rate);
> > +
> > +	req->rate = req->best_parent_rate * val / 4;
> > +	return 0;
> > +}
> > +
> > +static int clk_pll_mmc_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
> > +{
> > +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
> > +	u32 val = PLL_MMC_SSC_DIV_N_VAL;
> > +	int ret;
> > +
> > +	ret = regmap_update_bits(clkm->clkr.regmap,
> > +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
> > +				 PLL_FLAG_INITAL_EMMC_MASK, 0x0 << PLL_FLAG_INITAL_EMMC_SHIFT);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = set_ssc_div_n(clkm, val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = set_ssc_div_ext_f(clkm, 1517);
> > +	if (ret)
> > +		return ret;
> > +
> > +	switch (val) {
> > +	case 31 ... 46:
> > +		ret |= set_pi_ibselh(clkm, 3);
> > +		ret |= set_sscpll_rs(clkm, 3);
> > +		ret |= set_sscpll_icp(clkm, 2);
> > +		break;
> > +
> > +	case 20 ... 30:
> > +		ret |= set_pi_ibselh(clkm, 2);
> > +		ret |= set_sscpll_rs(clkm, 3);
> > +		ret |= set_sscpll_icp(clkm, 1);
> > +		break;
> > +
> > +	case 10 ... 19:
> > +		ret |= set_pi_ibselh(clkm, 1);
> > +		ret |= set_sscpll_rs(clkm, 2);
> > +		ret |= set_sscpll_icp(clkm, 1);
> > +		break;
> > +
> > +	case 5 ... 9:
> > +		ret |= set_pi_ibselh(clkm, 0);
> > +		ret |= set_sscpll_rs(clkm, 2);
> > +		ret |= set_sscpll_icp(clkm, 0);
> > +		break;
> > +	}
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_update_bits(clkm->clkr.regmap,
> > +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC3_OFFSET,
> > +				 PLL_NCODE_SSC_EMMC_MASK,
> > +				 27 << PLL_NCODE_SSC_EMMC_SHIFT);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_update_bits(clkm->clkr.regmap,
> > +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC3_OFFSET,
> > +				 PLL_FCODE_SSC_EMMC_MASK, 321);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_update_bits(clkm->clkr.regmap,
> > +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC4_OFFSET,
> > +				 PLL_GRAN_EST_EM_MC_MASK, 5985);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_update_bits(clkm->clkr.regmap,
> > +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
> > +				 PLL_EN_SSC_EMMC_MASK, 0x1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_update_bits(clkm->clkr.regmap,
> > +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
> > +				 PLL_EN_SSC_EMMC_MASK, 0x0);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_update_bits(clkm->clkr.regmap,
> > +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
> > +				 PLL_FLAG_INITAL_EMMC_MASK,
> > +				 0x1 << PLL_FLAG_INITAL_EMMC_SHIFT);
>
> It looks like the rate and parent rate are not used in this function.
> Will this always end up with the same rate when everything is
> successful?
>
> Brian

Despite receiving various rate requests (26MHz, 52MHz, 200MHz), this function
consistently returns 0x1b (represents the 27MHz) because it reflects the input
reference clock frequency to the SSCPLL, not the PLL output frequency.

However, the emmc host controller handles frequency division internally to
achieve the requested eMMC frequency.

Best Regards,
Yu-Chun


