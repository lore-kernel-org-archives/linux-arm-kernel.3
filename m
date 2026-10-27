Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23801606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 23:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s2rHxa8d;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=michael.riesch@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=D5O1iFab
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4v/jJQwbsRSs6lwC4Nolc6758ol9hYYCgJeKIbFnn6g=; b=s2rHxa8dbj9IO4
	hUYbDcoZ1LJY59OBgGBhnf3MbzlQcIqJDzTRsst6e4WkNZdcVtThomCKLPpT4/wWpG0T7hGUl3Fgu
	pPmxgLj4E5asPDL8Tx1kRF1AQa/0Oi2x0jFZEVCPZy6bXqqeFklnEloKHZ50g2lqVjUrcNE3MBdnh
	V/RCocW1YFZWShm3F7yCooi9BjW9z3bCEKAJVq/JLTKYOScce+XtZE4KSO4nyUMtUBY5q7/OnTORS
	BVG+hyr7OdEvb+4EaUvS3lnHu695dd7oouGM1UuxPCOvHU7CVW7Al+fi41H+0Iag3En7wcGGa2ToB
	CcKZKlSmkpaXqWB7l2bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqcd-00000005vCQ-1Bih;
	Tue, 27 Oct 2026 23:30:27 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqca-00000005vBi-1qjD;
	Tue, 27 Oct 2026 23:30:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793143812; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SbL7Z16pOFv18Hwvzx36QtOl68276uL5GKnFPZLgqBu01Oui/z1/7pM/yLjtUCxEKAXEbWRQuCRbnPfGUgs07qOR5WsgDaxEh4DQn3b9/4qA086PHTC3rnqrzMhTLVxno1FZa9GgvGPXApXVCQhjdSD/8vi0ncYhBwf6JarC5Kg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793143812; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4v/jJQwbsRSs6lwC4Nolc6758ol9hYYCgJeKIbFnn6g=; 
	b=cH9W1iosI+m47d8phD8H5oXRPDRyVgmVq0beOpyoPUxoLxCblJNcvQPgDJ76OEdoVbUE48CDve1Xiq+aO73mVdA/Jmn3F4CflsaZdvO8MCz1Gpqoywr63DDascQuvG4vLEBCFWdD8w+ev2MeP1SkyXdQf4pj0bv9EbzS5dFDUJg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1793143812;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4v/jJQwbsRSs6lwC4Nolc6758ol9hYYCgJeKIbFnn6g=;
	b=D5O1iFabvUsZ5q0epzsXmnDjqu5JduqU8kpqkn3UIMkwpBmdhA2//uTMglg4tKHi
	sTEZq+R+K8vfvPZr4cH/36hCm8/abo6a0FbF/XJZrDxPUyTrsm45o8K6/CXGu+kvzVJ
	5KrOwPQE1WQ+UN7Tkl28A+ikpMlEhDSvcbbT7e5E=
Received: by smtp.zohomail.com with SMTPS id 1793143809239396.72077942876126;
	Tue, 27 Oct 2026 16:30:09 -0700 (PDT)
Message-ID: <9e16930c-26fe-4bad-b120-2d4863b05e67@collabora.com>
Date: Wed, 28 Oct 2026 00:30:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] phy: rockchip-samsung-dcphy: Move block-level
 setup to runtime resume
To: Jason Yang <jason98166@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-3-e63b49eabe2d@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261016-dcphy-rx-v1-v5-3-e63b49eabe2d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_163024_611776_CE7047C7 
X-CRM114-Status: GOOD (  27.72  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jason,

Thanks for the patch!

On 10/16/26 10:56, Jason Yang wrote:
> The APB reset and the BIAS references have to be treated as block-level
> [1]: both the transmitter and the receiver need them, and they only have
> to be programmed once. They are programmed from the transmitter's
> power-on path today. A later change registers one struct phy for each of
> them, and a second consumer coming up would then reset the block
> underneath a PHY that is already running.
> 
> Program them from runtime resume instead, where whichever of the two
> comes up first brings the block up and a second one no longer resets it.
> This puts the BIAS writes ahead of the per-PHY reset assert, where the
> TRM's worked example has them after [1]. That is safe: neither M_RESETN
> nor S_RESETN covers the BIAS registers, and the values written are those
> registers' reset defaults.
> 
> The output level select in BIAS_CON4 stays on the power-on path: it
> selects 400mV for D-PHY and 530mV for C-PHY, and the driver core resumes
> a runtime-PM supplier before the consumer's probe runs, so runtime resume
> cannot yet know which of the two applies.

This all is about to change. As discussed in the other thread, it is a
HW specific decision whether D-PHY or C-PHY is used, and it holds for
both PHYs at the same time. Thus, it is reflected in the device tree, e.g.,

&mipidcphy0 {
    phy-mode = <PHY_TYPE_CPHY>;
};

The value can be stored in samsung->type at provider probe time and
shall be available at PM resume.

> 
> [1] RK3588 TRM: sections 22.4.1 (address map), 22.4.2 (reset values),
>     22.6.1.2 (reset) and 22.6.4.1 (D-PHY transmitter start-up)
> 
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 25 ++++++++++++-----------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> index 7382043e1f31..1471a1563d2a 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> @@ -980,13 +980,6 @@ static void samsung_mipi_dcphy_bias_block_enable(struct samsung_mipi_dcphy *sams
>  						 I_LADDER_1_00V);
>  	regmap_write(samsung->regmap, BIAS_CON2, REG_325M_325MV | REG_LP_400M_400MV |
>  						 REG_400M_400MV | REG_645M_645MV);
> -
> -	/* default output voltage select:
> -	 * dphy: 400mv
> -	 * cphy: 530mv
> -	 */
> -	regmap_update_bits(samsung->regmap, BIAS_CON4,
> -			   I_MUX_SEL_MASK, I_MUX_400MV);

This can stay here but will need some

switch (samsung->type) {
case PHY_TYPE_CPHY:
	// write 530 mV
	break;
case PHY_TYPE_DPHY:
	// write 400 mV
	break;
default:
	//...
};

once there is support for CPHY.

>  }
>  
>  static void samsung_mipi_dphy_lane_enable(struct samsung_mipi_dcphy *samsung)
> @@ -1338,7 +1331,13 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
>  
>  	reset_control_assert(samsung->m_phy_rst);
>  
> -	samsung_mipi_dcphy_bias_block_enable(samsung);
> +	/* default output voltage select:
> +	 * dphy: 400mv
> +	 * cphy: 530mv
> +	 */
> +	regmap_update_bits(samsung->regmap, BIAS_CON4,
> +			   I_MUX_SEL_MASK, I_MUX_400MV);
> +

No need for that change, then.

>  	samsung_mipi_dcphy_pll_configure(samsung);
>  	samsung_mipi_dphy_clk_lane_timing_init(samsung);
>  	samsung_mipi_dphy_data_lane_timing_init(samsung);
> @@ -1362,10 +1361,6 @@ static int samsung_mipi_dcphy_power_on(struct phy *phy)
>  {
>  	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
>  
> -	reset_control_assert(samsung->apb_rst);
> -	udelay(1);
> -	reset_control_deassert(samsung->apb_rst);
> -
>  	switch (samsung->type) {
>  	case PHY_TYPE_DPHY:
>  		return samsung_mipi_dphy_power_on(samsung);
> @@ -1656,6 +1651,12 @@ static __maybe_unused int samsung_mipi_dcphy_runtime_resume(struct device *dev)
>  		return ret;
>  	}
>  
> +	reset_control_assert(samsung->apb_rst);
> +	udelay(1);
> +	reset_control_deassert(samsung->apb_rst);
> +
> +	samsung_mipi_dcphy_bias_block_enable(samsung);

Adjust this accordingly. I guess it makes sense to reset from the PM
resume method.

Best regards,
Michael

> +
>  	return 0;
>  }
>  
> 


