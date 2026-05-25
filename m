Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED81CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 01:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7sucLlFPpFoBQBCSVha1cyDgINh3mIbBw2+BnctLfQ=; b=O8uMIattLZq4LkxpOUklCyVkrx
	LGw+fEsyoTk5i3SBD4YliCTFfU1AM3turGu5Co3QjeX0Kx6SeamzwqnuUrIIxMFO+SdNbOKgWWQEh
	EKuEnqGC84UHUGDVNU8GiDql8sqG4z5tn0UmrTqhxeKGKVl8bzhSVyvA4e35fgDwEi7qEXM2OSHmI
	9/rMmvqtkMMG5m2dPrEkgjwaQcJNQIW4o3LGbXWSEA5qv0BFNY2LkJP/jntemOfHFHU4Ue9weMLaR
	1Jb3YtbpDjz6zmT1P7jb/G2CZg9dp0ESz903INCy2JPQa8PQV5LmM9n7HPVCkLicRmXE1DTIU3Ozu
	sgf4iglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKNC-0000000G33v-3xIb;
	Mon, 25 May 2026 01:44:54 +0000
Received: from mail-m93122.xmail.ntesmail.com ([103.126.93.122])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKN8-0000000G31J-2RFw;
	Mon, 25 May 2026 01:44:53 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3fa1a865a;
	Mon, 25 May 2026 09:44:32 +0800 (GMT+08:00)
Message-ID: <41863f57-3911-48b7-8a6b-11f877b982a8@rock-chips.com>
Date: Mon, 25 May 2026 09:44:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mmc: dw_mmc-rockchip: Add missing private data for very
 old controllers
To: Heiko Stuebner <heiko@sntech.de>, ulfh@kernel.org, jh80.chung@samsung.com
References: <20260522184307.2979579-1-heiko@sntech.de>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260522184307.2979579-1-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e5cce1cb309cckunm290c57cce95c2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTkweVkNMGR1DQk5JGUxDHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=jj268jkFHMoTIsiOtgqq9u0y0urwFy4t48maGZDE2qh2OqIXJryXcryFPY9s1GioHPCBPkOFsug9lJNJv+Ta9AfaHnrIRjsALv9lwnxqtq0Vr1z0vixqhMogPEYCW6JKwD6uLmtGilMlK0jmhMM+KcP/+bs4/hOCKTkEBLP7OWo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=w7sucLlFPpFoBQBCSVha1cyDgINh3mIbBw2+BnctLfQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_184451_183228_F2B2B28D 
X-CRM114-Status: GOOD (  20.96  )
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

在 2026/05/23 星期六 2:43, Heiko Stuebner 写道:
> The really old controllers (rk2928, rk3066, rk3188) do not support UHS
> speeds at all, and thus never handled phase data.
> 
> For that reason it never had a parse_dt callback and no driver private
> data at all.
> 
> Commit ff6f0286c896 ("mmc: dw_mmc-rockchip: Add memory clock auto-gating
> support") makes the private data sort of mandatory, because the init
> function checks whether phases are configured internally or through the
> clock controller.
> 
> This results in the old SoCs then experiencing NULL-pointer dereferences
> when they try to access that private-data struct.
> 
> While we could have if (priv) conditionals in all places, it's way less
> cluttery to just give the old types their private-data struct.

Thanks for fixing this.

Acked-by: Shawn Lin <shawn.lin@rock-chips.com>

> 
> Fixes: ff6f0286c896 ("mmc: dw_mmc-rockchip: Add memory clock auto-gating support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   drivers/mmc/host/dw_mmc-rockchip.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/mmc/host/dw_mmc-rockchip.c b/drivers/mmc/host/dw_mmc-rockchip.c
> index c6eece4ec3fd..75c82ff20f17 100644
> --- a/drivers/mmc/host/dw_mmc-rockchip.c
> +++ b/drivers/mmc/host/dw_mmc-rockchip.c
> @@ -441,6 +441,22 @@ static int dw_mci_common_parse_dt(struct dw_mci *host)
>   	return 0;
>   }
>   
> +static int dw_mci_rk2928_parse_dt(struct dw_mci *host)
> +{
> +	struct dw_mci_rockchip_priv_data *priv;
> +	int err;
> +
> +	err = dw_mci_common_parse_dt(host);
> +	if (err)
> +		return err;
> +
> +	priv = host->priv;
> +
> +	priv->internal_phase = false;
> +
> +	return 0;
> +}
> +
>   static int dw_mci_rk3288_parse_dt(struct dw_mci *host)
>   {
>   	struct dw_mci_rockchip_priv_data *priv;
> @@ -514,6 +530,7 @@ static int dw_mci_rockchip_init(struct dw_mci *host)
>   
>   static const struct dw_mci_drv_data rk2928_drv_data = {
>   	.init			= dw_mci_rockchip_init,
> +	.parse_dt		= dw_mci_rk2928_parse_dt,
>   };
>   
>   static const struct dw_mci_drv_data rk3288_drv_data = {


