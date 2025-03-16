Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC73DC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 21:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3BUKa9QvnPlmXnONvzXA2ROEjOwfnjtdg2uvv5bZM8=; b=WU2l2Uv2VDkLElG18/wpE2gzL/
	jGAi4hGibHB+IDypxnAcN2krNKY8V+ZQyK7hOSsBp2PlNAGItnXQZcXQyQTWWJhQY/BO1DeXDPAWL
	2lCBqGmLpdUTNX2PBNX8QhR/o1JAd/UK7NFPOqGq05tBmIMiLpkEUbp/Sn6Td6FQ4mTzakiOoq/TB
	+r/EO8U5dqtobQvMMl9S+JuVxfnYcRjnXgMc6+m53AGGvZw4HiiKWIWNpFzBFqQhg/IX42hb3R0Tu
	M/whPWXr+fAZgkuvw56fozyJEEWb0nEHNhXwUDESLsWiS06xVUeIJDLGSVlYdcsBFEVV0+i8V4yx9
	cxrD9Sfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttvWU-00000000dfj-3ZTq;
	Sun, 16 Mar 2025 21:27:54 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttvUj-00000000dX2-1Do0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 21:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1742160363;
 bh=W3BUKa9QvnPlmXnONvzXA2ROEjOwfnjtdg2uvv5bZM8=;
 b=H7YH9UbfM+ToUMBVj20jAtrSWTj/njVsequW+PGdfDvaiBKqB+4wyKsOwibBidG0dvEDlv9Eu
 pefN7le7UEy14Rfh8Nyu0T1H2DeCLgeJgzHDjhMygC8Mk19pHbYSlGEivjCHjei+HbQ2nefU4df
 WsDBfPXjBUkkbcBSQ1RGyFqAfQYd6Zw6aP3d6Zeo7M2USwGT0Dzf+QiWYf3K6/BqaPjxAIUIHcI
 IT1UQVTH0l6PtclFWepjeCYkfek7crJE4e/B7dFWEiMWLWrzneMKr4QIdCR0Q0FBgNNyc8GjcpV
 BVbKh2Cvis876NdDRylJBJT0+OBsRnct2wC46A5Qru8w==
X-Forward-Email-ID: 67d741e6615b196bfb50dc90
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <7e5ff689-c013-47c2-982b-e7f4c1d233ca@kwiboo.se>
Date: Sun, 16 Mar 2025 22:25:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] nvmem: rockchip-otp: Add support for rk3562
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 Finley Xiao <finley.xiao@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250227110804.2342976-1-kever.yang@rock-chips.com>
 <20250227110804.2342976-3-kever.yang@rock-chips.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250227110804.2342976-3-kever.yang@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_142605_913391_AA9AAB1A 
X-CRM114-Status: GOOD (  14.83  )
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

Hi Kever,

On 2025-02-27 12:08, Kever Yang wrote:
> From: Finley Xiao <finley.xiao@rock-chips.com>
> 
> This adds the necessary data for handling otp on the rk3562.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v2: None
> 
>  drivers/nvmem/rockchip-otp.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
> index a04bce89ecc8..6f86cf8ec390 100644
> --- a/drivers/nvmem/rockchip-otp.c
> +++ b/drivers/nvmem/rockchip-otp.c
> @@ -341,6 +341,17 @@ static const struct rockchip_data px30_data = {
>  	.reg_read = px30_otp_read,
>  };
>  
> +static const char * const rk3562_otp_clocks[] = {
> +	"usr", "sbpi", "apb_pclk", "phy",
> +};

These are the same clocks as used for rk3568 below.

> +
> +static const struct rockchip_data rk3562_data = {
> +	.size = 0x80,
> +	.clks = rk3562_otp_clocks,
> +	.num_clks = ARRAY_SIZE(rk3562_otp_clocks),
> +	.reg_read = rk3568_otp_read,
> +};
> +
>  static const char * const rk3568_otp_clocks[] = {
>  	"usr", "sbpi", "apb_pclk", "phy",
>  };
> @@ -372,6 +383,10 @@ static const struct of_device_id rockchip_otp_match[] = {
>  		.compatible = "rockchip,rk3308-otp",
>  		.data = &px30_data,
>  	},
> +	{
> +		.compatible = "rockchip,rk3562-otp",
> +		.data = &rk3562_data,

Here we can use rk3568_data directly without having to add a new
rk3562_data struct.

Regards,
Jonas

> +	},
>  	{
>  		.compatible = "rockchip,rk3568-otp",
>  		.data = &rk3568_data,


