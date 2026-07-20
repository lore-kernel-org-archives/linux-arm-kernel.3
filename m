Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00BAC4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjxGraRdWr9o18D48nknKGR/TQtYQrAOX4PFkQIou1g=; b=bAYxbSeIA96vUMM9S2g06BJmpw
	Trvs+WgCQ230qXUMm5+4T5lX5CsWBRURHZtecnO8YtBCoWR6qdscMK7Zbcnxw5LcMdUkyBJOpkvZj
	KS4n0lmRNshuP0QjUVA1aePKKEyf3PbLsfLrzWbJxkWHqfmYqTFJMeJIG7xnpTAClkVxqZ9cDoof6
	+O6kwlY+BvQgviicesjIsrL/r+sMEPgFjSXyItGSNkGYR+t9qcc7zRLIUGkVHLRO8C2FYLO4sYVZ5
	f+Po9adrHE+rcY87hIl4QS/codUKorsZnpnm1E3Va+5or8GfAxpyPZzfJV18k6Y7xmQ/fVsH9Plys
	EZZnGipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloqk-00000006woC-1Ut2;
	Mon, 20 Jul 2026 14:20:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloqh-00000006wmj-1ySE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:20:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqb4S2498890
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 14:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sjxGraRdWr9o18D48nknKGR/TQtYQrAOX4PFkQIou1g=; b=gOFLNXiHFRrsIK1w
	rpNq7QNHCXsdyzVUgcfHx5cszS0zvJkjoXzOyBb68dxrSRiPeEpwP1os0jAD1xo0
	1TBn+YB0559oBLJM25Z1JN8Vycq0XHXc7HvAIxRlQShfBvy1hgI/DZF+EkP13uNK
	SuQUFCRJz7l+vfyc+WVjLNyRAGR0a32Tp+dobB/74sDu8ImG7QD5P2qVKEhAIjPE
	/+LIaN4IZyoBl0tU0Rb3j0J0TagttyjL2sjr+BmmExq3NSvTn6hxJ7QLTAvOih2x
	NwYp1Krx9v3yg+QenF58VF9GGAeWCX90boApEW45IrZIWlcTU0SegRFVIXDCG8Tt
	753IHg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhh5y17bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 14:20:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d137a68so272066581cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 07:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784557202; x=1785162002; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sjxGraRdWr9o18D48nknKGR/TQtYQrAOX4PFkQIou1g=;
        b=hrtNOGCjn8ROkjymmsZ0hkhoJIX0kfmBxLsi9zPnyfrMiUuVSpIZyOQc8vud8Nc/mL
         PWJ2r7h6/lgok2m4tL2bTf9uuTrTuj+IIKl1iJ0w50ZgKlHFo1HhwzrTP6kc+7qReYMx
         dxO9N62etRinUfubhMLOzNhnVmh+ufvDB1Pfed10396elg3WPyYUyfsDR0UVIR9m5FJf
         ob9Y23eNS86Uqv9aUYdVzhWS5Qt9a0mCdL46aO7q9gnUFZm0xTc+Ij7LZxlmPcEeLu+b
         L4uCRKSxp7xVz6+nnd/c2FSV8poN9mf251ltFWp0wN/E7NdgJWPveVvn/fkrYVHybAVJ
         orAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557202; x=1785162002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sjxGraRdWr9o18D48nknKGR/TQtYQrAOX4PFkQIou1g=;
        b=L1QAHeLWBQm9OGBQfPQbkFpXiuLSeNEZW4h01yNC1k3LmEtm6NSPbuYr7PDoiTCGyG
         RvmU+8mT57gSAzSGTU9TjIPx8JEJhq3oJDpyJ8cFxR7ekt+EoKATR7LXspMvHPW87lah
         BVoGLbUiVS6g1U4Z6pLrqUAyZnuzSGbYIAlq3gFhMk7/VzWkTfVV6jl1lWmgdgw+3loc
         chKTLFvQ0onDh04kdoQAYvnRYqretU5oR4aD3km/Gl+/ZjemCBOooFQfbh96wKb2oVL3
         ZyxIn6iwE50Ds3a+PMnT9qAQZtJtHLRbrYaS0NGt/6fqiFqIHSAKjk/0d3G30B0fE9KF
         KCxw==
X-Forwarded-Encrypted: i=1; AHgh+Ro09OpKyu2/3w0nHzJndbD3WSABXXyZ97FlLCwTmhPlsi5QIXnzwrDqbFrocFJqkv+odjUgyoZCRdIguM6o5pM9@lists.infradead.org
X-Gm-Message-State: AOJu0YzBF92uVS64P3wRRaw+9ZBqY2JYn3QjgsrD7YulFuG0dVvQU04C
	/dBW6VtkHxRoKrD0uQqa9WDIl/m0kT7ROZ9KicjqJDX9ypQkNLwRbz1MUk6FLQ1t/RxCWbXGNz2
	jSYjczXFzNi6uS6+c39EewLuin/LtbeO2/t53DhEHt6PXXhfV6m/feVJYOmpLPeMrehFlkql4Xj
	ZiWg==
X-Gm-Gg: AfdE7cnMvo6L22RG6YUP9qPO8Zc3x54GZp1Of507PRLvIxm48l7hELOHmnroMbqoz2N
	UNqWsoc75P1Z4e2rR9nV+6WMb4jzJzy9MMN0TUE/X4f0/q6APifnpYnmdCPMLUN/AhAq2DRygBf
	68dnJ9tWx++XlJKw8aPQL/kbda6vqzk2/BCGFQOv8/cEsSC1GvvNtRspJnwNuAFZ1/FZmiGeI+S
	OH7ynvIEKhxaYGMfzbDxz1FgQvCn55il/Zy02WoFHRL1jg/hZH1a0+GL1hcO79MKGbyczn6VBqg
	lCdA2kesbhb6eOG3zbQm/30Uy8xgev5SPJUSV+O1hatFzb1qW9OIXWak49a8jd8T/aFoBRK6zdT
	yGD4jsg25E3yvtkLemyl/1L7cILWEjEIYpA6S52AnbW6Y1bRnIIPeZ9MmtepLLD9EESDa3AXrtk
	8GT/sl899sy3i3vg==
X-Received: by 2002:a05:622a:1186:b0:517:6804:3732 with SMTP id d75a77b69052e-5213e77cf30mr120810521cf.55.1784557200507;
        Mon, 20 Jul 2026 07:20:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1186:b0:517:6804:3732 with SMTP id d75a77b69052e-5213e77cf30mr120806691cf.55.1784557199310;
        Mon, 20 Jul 2026 07:19:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e245e5sm2381076e87.71.2026.07.20.07.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:19:58 -0700 (PDT)
Date: Mon, 20 Jul 2026 17:19:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
        Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
        linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas =?iso-8859-1?Q?Niederpr=FCm?= <dubito@online.de>,
        Simon Wright <simon@symple.nz>
Subject: Re: [PATCH v4 5/8] phy: rockchip: samsung-hdptx: Drop TMDS rate
 setup workaround
Message-ID: <al4ujA5d6B5s23C4@umbar.lan>
References: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
 <20260612-hdptx-clk-fixes-v4-5-ce5e1d456cda@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260612-hdptx-clk-fixes-v4-5-ce5e1d456cda@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE1OSBTYWx0ZWRfX/zVgXZlhAnBO
 ivEFE/z7hu4sX9ZfMoMUMB37udMk3qBLBcxdD9Hz6EDsxifCGWGrmiumP9GoU1dfecZQvYC0L6u
 4M+tTKYh4GVhA0UVzzeMqCEeODILTOM=
X-Proofpoint-GUID: xnmMJLntuc9K-xVSKtQHJ10TthsKnFSK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1OSBTYWx0ZWRfXwuT3R2jgK65B
 UfIC6XMR0meOnMeETt8EijS3FQXAND74s4lvbzfrmTdu9l6RbfYEqDkJU7NpgsCHy9OQByaoHGa
 XhYNP84i+8Pfvoe1950+Se/8duCUIQ7twJDAiLIZI9AlDKR5Sg7EezAT7fLSGj+ekktmeSg8/qt
 4F95BPNNc329Z9ECWwYv04AAjUpdh9uMBOj/Z+xTwpcD6Cqobk246sVGahWdDf98GIrbloK5l7O
 00LBv6a2mnebR0VBUVS5gkIuxXFAlJBjvamm03fCdtlk0KYe6eqUbRkZlgC4BgIUhKeRe7vdIL6
 e1OvNJJa2aGoJAeWUw8nRoO/3tmIAwuEmHyPz+n2IobeubM3qQqWAmYi7OVSi3FfPolAtk0hx0O
 LEGreMSod7rRIK2mrnqRlexTOcFjC0ua5TzaJNjoRbGBQxIlKJinvRj92xQ4jTPqGGWMSLP0QhU
 fSQ+wuAtGNH5O41jNLQ==
X-Proofpoint-ORIG-GUID: xnmMJLntuc9K-xVSKtQHJ10TthsKnFSK
X-Authority-Analysis: v=2.4 cv=f/x4wuyM c=1 sm=1 tr=0 ts=6a5e2e93 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QX4gbG5DAAAA:8
 a=zwdtIQzbwfcTUTQlMeAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_072003_509171_A2397070 
X-CRM114-Status: GOOD (  25.96  )
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

On Fri, Jun 12, 2026 at 02:45:24AM +0300, Cristian Ciocaltea wrote:
> Since commit ba9c2fe18c17 ("drm/rockchip: dw_hdmi_qp: Switch to
> phy_configure()") the TMDS rate setup doesn't rely anymore on the
> unconventional usage of the bus width, instead it is managed exclusively
> through the HDMI PHY configuration API.
> 
> Drop the now obsolete workaround to retrieve the TMDS character rate via
> phy_get_bus_width() during power_on().
> 
> While at it, get rid of the extra call to rk_hdptx_phy_consumer_put() by
> moving the statement at the end of the function.
> 
> Tested-by: Thomas Niederprüm <dubito@online.de>
> Tested-by: Simon Wright <simon@symple.nz>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 27 +++++------------------
>  1 file changed, 6 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index 25bd821cd039..35997087d61c 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -1660,22 +1660,6 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
>  	enum phy_mode mode = phy_get_mode(phy);
>  	int ret, lane;
>  
> -	if (mode != PHY_MODE_DP) {
> -		if (!hdptx->hdmi_cfg.rate && hdptx->hdmi_cfg.mode != PHY_HDMI_MODE_FRL) {
> -			/*
> -			 * FIXME: Temporary workaround to setup TMDS char rate
> -			 * from the RK DW HDMI QP bridge driver.
> -			 * Will be removed as soon the switch to the HDMI PHY
> -			 * configuration API has been completed on both ends.
> -			 */
> -			hdptx->hdmi_cfg.rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
> -			hdptx->hdmi_cfg.rate *= 100;
> -		}
> -
> -		dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
> -			hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
> -	}
> -
>  	ret = rk_hdptx_phy_consumer_get(hdptx);
>  	if (ret)
>  		return ret;
> @@ -1701,9 +1685,10 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
>  		rk_hdptx_dp_pll_init(hdptx);
>  
>  		ret = rk_hdptx_dp_aux_init(hdptx);
> -		if (ret)
> -			rk_hdptx_phy_consumer_put(hdptx, true);
>  	} else {
> +		dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
> +			hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
> +
>  		if (hdptx->pll_config_dirty)
>  			ret = rk_hdptx_pll_cmn_config(hdptx);
>  
> @@ -1716,11 +1701,11 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
>  			else
>  				ret = rk_hdptx_tmds_ropll_mode_config(hdptx);
>  		}
> -
> -		if (ret)
> -			rk_hdptx_phy_consumer_put(hdptx, true);
>  	}
>  
> +	if (ret)
> +		rk_hdptx_phy_consumer_put(hdptx, true);

This looks likes an unrelated change. Could you please split it to a
separate commit?

> +
>  	return ret;
>  }
>  
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry

