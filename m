Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D2BF8E4B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 07:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9r2HFX/egjy9s/xWA+hiUJJinVNHnndYfN4FJrJMfxg=; b=R0LjaHmk0SQYjiHy6cJJ9IiRg9
	Rxz8DTQHpipbrYXUxp3ad0Ac4wcF86zx6+SNsaAEnZuDLUJbRd02zOOolKCwt9OLlilv4/XiE/jmT
	CYmvga3HS7j2vKA+z1v3ZrWQNOYlW89T6G3nCT2mQWHe4z/GKL0conyYPZFGcofMeyZ2aQmupI70O
	iJNE29FOH356TN7wLSCCrUwBnPK8jZdeS9IDIYH5Qb0Rn7ccy0yWGfT/zn4AwrJIlvZIFVi3+zUtY
	uttlj0jIrq05psYuGA1EdBULld3wNja2dzvxZWD+EwurWj/9q9KWTXJFO0EgzivqQ3Tv02ipXD4pb
	GBb3y4rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdrG-00000003c9U-3Q0d;
	Fri, 17 Apr 2026 07:43:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdrF-00000003c90-27oh;
	Fri, 17 Apr 2026 07:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9r2HFX/egjy9s/xWA+hiUJJinVNHnndYfN4FJrJMfxg=; b=lOfUmGb41VqYGnCDa7NLZ8+9MD
	XYc9uQ/gQkdzaRzrBc5sI1FybsfwFcHYaJD0Yj2YHNrKRfNGebHuRnOP47XrhXAqCOohI8wO6xTLs
	STqCsh1RBHliWW+XcFFNBBBSNiGQAAbSFebfWzXhUPp6JiLEOfIqeYmk0EFtoX9l1KCIrH6u2WDKk
	9CyN4PJMJMqpT/kVl82sYoe5KFo7/UgtInm11GKxWKX2yvwnbJmbC8a7u6YsVR57XtHWJrwKb+uip
	dCsHFEVjhU5kl46/hg5ofZ1IgBzWMh4tB3vVxLRSR5hQvPrc2XHcTFbRPoCb3hfffIXWFw2AzyaCg
	DFLj4ugQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdrB-00000004uul-0wJh;
	Fri, 17 Apr 2026 07:43:20 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63H7h72B13460439, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1776411787; bh=9r2HFX/egjy9s/xWA+hiUJJinVNHnndYfN4FJrJMfxg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=QB5gqyfgFn+JVG1BuBzmdKk2LmXCsteFMaU2But9hSjKVpNnXUnB38EsyVzm3m+mm
	 ZeUJHrhqCLbRABsLGAfGRNxGimXyd0k4swqYdFzbB7KhTjhwAxeCCIS4hGnN8GfqTp
	 vSoLpxXT3eG++003oL61Q+S+rasAheCQ4RQ55JO47P3qPMRMtnuyl7HooWd6z8Tdj9
	 Revn5QY45LZeiOh7U4dMjCFMHdOF+oF2ydnb7Zmi3lvwlieMH2X3Sc7BICc+YY986c
	 VE/y3HGuYedNw84EcSxuyvYYhrkWHHf2Z+iIov7LuFCWPkZRJGfQkJ43/KAdhYrCt5
	 5j3GO8RWb+VEg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63H7h72B13460439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Apr 2026 15:43:07 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 17 Apr 2026 15:43:07 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 17 Apr 2026 15:43:07 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 17 Apr 2026 15:43:07 +0800
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
Date: Fri, 17 Apr 2026 15:43:06 +0800
Message-ID: <20260417074307.1408308-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <ac_YfHe0dscb3MPw@redhat.com>
References: <ac_YfHe0dscb3MPw@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_084318_661702_5C9AB2A7 
X-CRM114-Status: GOOD (  18.91  )
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

> Hi Yu-Chun,
>
> I should have finished going through Sashiko while manually reviewing
> your patches.
>
> On Thu, Apr 02, 2026 at 03:39:54PM +0800, Yu-Chun Lin wrote:
>> From: Cheng-Yu Lee <cylee12@realtek.com>
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
> 
> Sashiko reports:
> https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com
> 
>     Is it intended to use bitwise OR to accumulate these return values? Because
>     these hardware operations return standard negative error codes on failure,
>     performing a bitwise OR on multiple negative integers will merge their bit
>     patterns and create a corrupted error code.
> 

Will return immediately upon the first error.

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
> 
> Sashiko reports:
> https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com
> 
>     Are the mask and shift values mismatched here? PLL_FLAG_INITAL_EMMC_MASK is
>     defined as BIT(1) (0x02), but PLL_FLAG_INITAL_EMMC_SHIFT is 8.
> 
>     When regmap_update_bits() applies the 0x02 mask to a value shifted by 8,
>     won't it evaluate to 0 and fail to set the intended initialization flag?
> 
> Brian

You're right, will fix it.

Yu-Chun.


