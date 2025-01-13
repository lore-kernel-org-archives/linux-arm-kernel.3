Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90614C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 21:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+p3HjcTPs6cUGhlZ08w+IM+7oSzoEOQFMQB2ubcEu1k=; b=nJeMa0MQTgNY82Ej7VG1QWc48U
	B4q7JdJDa7s5Zjc27fnQOAewFhZpCyX5ek5j39e7AnbGqmwrfSKx+5RvluVUDdRoayG+6DkOxeyee
	hJd7QPx7yzohZ4PhAEg+T46oQ4dgmkp34o2wCLm0qJCCE9EJPGFBi/qLsaYXgf/qnujrsrQ6KPYqO
	dq9l8vnzAjDpPTDLySPqKCaRN8sjiQydjhNOakhVmhLjmE77X9/caN63srwoVpOVv5pyQrurD5Uaf
	LNGVBfnBSfYz4h7zdOKLIJ6/vHs/m26lxKS+NHE46zwdnmgY0lRNUX2KEovpcmXcoI8Al62D7P7WH
	1WaGwOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSHZ-00000006iq1-30mO;
	Mon, 13 Jan 2025 21:47:37 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSGJ-00000006iV7-2Iww
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 21:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1736804776;
 bh=+p3HjcTPs6cUGhlZ08w+IM+7oSzoEOQFMQB2ubcEu1k=;
 b=haS6i7qiFGlb4OflBSu0Eab3+0Rv/nUYP6T5++9RpNbPa4fyv2EqGz+jLlBab2TpgUUc4DN28
 Wz3naM4LBwWb4Lsq9mK88uATL2JYwZ2bOAMdRbU6KAxvKSaU3c4WjZjVQp5oyDUM9i6n+5AkyYx
 ETy3s9yHN4tdES6We1jdigY7+4zNkSGczWtMrON3HiOJzYcVd6dhuF/uxALmanHGiy/NOHf0JPW
 Q5CqwR3teJiHgarqu0BgL3V1ovYJ2olc7J1MZvclCYdV6nAC+9yoa9uKOiBJWQ6HaGdTV4rCpGu
 sFuD+8lyNS+67JoSfXrR6qGwcvOwbP11UYTvq+h4iWVw==
X-Forward-Email-ID: 6785899ca2e821240c331f5b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <df8e0ff8-355b-4c18-9349-0f04ae16e01b@kwiboo.se>
Date: Mon, 13 Jan 2025 22:45:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] phy: rockchip: naneng-combphy: compatible reset
 with old DT
To: Vinod Koul <vkoul@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250106100001.1344418-1-amadeus@jmu.edu.cn>
 <20250106100001.1344418-2-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250106100001.1344418-2-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_134619_619364_A775B118 
X-CRM114-Status: GOOD (  16.28  )
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

Hi Vinod,

On 2025-01-06 11:00, Chukun Pan wrote:
> The device tree of RK3568 did not specify reset-names before.
> So add fallback to old behaviour to be compatible with old DT.
> 
> Fixes: fbcbffbac994 ("phy: rockchip: naneng-combphy: fix phy reset")

The commit fbcbffbac994 ("phy: rockchip: naneng-combphy: fix phy reset")
broke backwards compatibly with old DTs and has already been backported
breaking i.e. PCIe and USB on Rockchip RK356x boards on stable and
longterm kernels.

E.g with v6.12.9 on a Radxa ROCK 3A (RK3568) board:

  rockchip-naneng-combphy fe830000.phy: error -ENOENT: failed to get phy reset
  rockchip-naneng-combphy fe830000.phy: probe with driver rockchip-naneng-combphy failed with error -2
  rockchip-naneng-combphy fe840000.phy: error -ENOENT: failed to get phy reset
  rockchip-naneng-combphy fe840000.phy: probe with driver rockchip-naneng-combphy failed with error -2
  rockchip-naneng-combphy fe820000.phy: error -ENOENT: failed to get phy reset
  rockchip-naneng-combphy fe820000.phy: probe with driver rockchip-naneng-combphy failed with error -2

  # cat /sys/kernel/debug/devices_deferred
  3c0000000.pcie  platform: supplier fe840000.phy not ready
  fcc00000.usb    platform: supplier fe820000.phy not ready
  fd000000.usb    platform: supplier fe830000.phy not ready

Please revert the commit fbcbffbac994 ("phy: rockchip: naneng-combphy:
fix phy reset") or merge this patch to restore PCIe and USB RK356x.

> Cc: Jianfeng Liu <liujianfeng1994@gmail.com>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

With this patch PCIe and USB start working again on same board.

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

Regards,
Jonas

> ---
>  drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> index a1532ef8bbe9..8c3ce57f8915 100644
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> @@ -324,7 +324,10 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
>  
>  	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
>  
> -	priv->phy_rst = devm_reset_control_get(dev, "phy");
> +	priv->phy_rst = devm_reset_control_get_exclusive(dev, "phy");
> +	/* fallback to old behaviour */
> +	if (PTR_ERR(priv->phy_rst) == -ENOENT)
> +		priv->phy_rst = devm_reset_control_array_get_exclusive(dev);
>  	if (IS_ERR(priv->phy_rst))
>  		return dev_err_probe(dev, PTR_ERR(priv->phy_rst), "failed to get phy reset\n");
>  


