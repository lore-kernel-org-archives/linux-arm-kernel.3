Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFD3C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaTOsyqLfltEiDVoe0qUuVANOU3C1a+/jJ0nViOag58=; b=ujZvO/n3AoQIzwBWpmN6qmchCv
	5qcKkvGZlM+4Tv2i31DBimYtDRTn8xmQheJvu1WDKqMEbZQj04a675H1IIFzOHT1EEeASEorUI8d9
	zdK6nVqkhHx7wLs/7TKmWcWXsB0xYxaBjS9uzi4oNebwuGkxFx3v/JWjnyS5lmZRLK0By7XJ89wMu
	ZJNPSUy5Qh9VVNPvmD71rZV1+Me/MGgGclXvqRPH406EsGI8amIHhoJyqSupBQS0NFIOrGQTZwTco
	c5ucmu94QiaqPHYzNOJfNI6VbH6AaQ7cjZI7V4W/qfxvEEMvqo0Hg398SszN/tGWufrU2mmcF4KmW
	YAEbfyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFwe-0000000227K-48Cw;
	Tue, 04 Aug 2026 14:16:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFwd-0000000226m-07o8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 14:16:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 407094E410DB;
	Tue,  4 Aug 2026 14:16:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F4AA6029E;
	Tue,  4 Aug 2026 14:16:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A8B911C32DC9;
	Tue,  4 Aug 2026 16:16:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785852992; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=aaTOsyqLfltEiDVoe0qUuVANOU3C1a+/jJ0nViOag58=;
	b=iP1DpoQ3bSprJou1YjQfnOdmTMeWqNvH3Ap2/OSN6GaZs5u1ttfNd6lQnLcpO2rBvwDcOX
	nMjoAeeFHsf4BTH6QX/tDncYNstU1vGm1mbDy9w42zHHe5f7/FLZYtlOZz6M/N5U6ayiYI
	K0Icri5wm8rNerXBZExE3oxWAzDr1E6TDEHfBSHBsegflBk1jzpesUXOfbxo1wnFEsPfE5
	lzVp5Pt/yXqk62VpeKuTT3BCAcsEQv6PI1hCWSHDYOI5iRgKPoJnQVUhCqMPOeBzJxepSH
	BeD532/p9eDch7lYyfkDVJxY1N8PJ6iea/0lsEFDOirM3BDDHAjTzcwPN+RLrQ==
Message-ID: <807166df-2de0-4176-aad6-6bf632670528@bootlin.com>
Date: Tue, 4 Aug 2026 16:16:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] net: stmmac: manage error case during
 stmmac_dvr_probe
To: Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, linusw@kernel.org,
 antonio.borneo@foss.st.com, Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260804132052.205273-1-christophe.roullier@foss.st.com>
 <20260804132052.205273-5-christophe.roullier@foss.st.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260804132052.205273-5-christophe.roullier@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_071639_211644_8FE6A1B8 
X-CRM114-Status: GOOD (  12.62  )
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

Hi Christophe,

On 8/4/26 15:20, Christophe Roullier wrote:
> In case of error during stmmac_mdio_register, pm_runtime is not
> cleaning before exit probe.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Can you send this path to the proper networking tree ? Is it a bug you've
encountered in the wild (like, eprobedefer or something ?) or just
something you've noticed ?

If this is something you encountered, let's send it to -net (and it would
need a Fixes tag), otherwise just target that to net-next

Thanks :)

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 0de4bc949913..852de0f51c09 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8062,6 +8062,8 @@ static int __stmmac_dvr_probe(struct device *device,
>  error_pcs_setup:
>  	stmmac_mdio_unregister(ndev);
>  error_mdio_register:
> +	pm_runtime_put_sync(device);
> +	pm_runtime_disable(device);
>  	stmmac_napi_del(ndev);
>  error_hw_init:
>  	destroy_workqueue(priv->wq);


