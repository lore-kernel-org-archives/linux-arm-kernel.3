Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C32ECAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 07:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYiHZELFarw3PToNRADNwpDtZ4cHTMNtElA+diEGHz4=; b=0lAoqgX6HgGN5c6mcrSQZIQ1AD
	lA2/p9e9UiiHpB1e2oLYC1nBrznC1sxC875Nc+iVrOMzuskBehCuE8976xTTzdxx83UELmRx7OHwV
	6BUkrgoOFZSa8qp5N3O8cdS5QukcoyF0LD/5W/tDJneiETj5aP99TOxuCLG8JGW14jnnObFKAIosT
	QErrmcKFJMDHcYxC4kw/5VCrPXteHcLw0TFJZRYmYdHsiCmK07IlWv1xg6nupBRiVzYYSzpmXsFUV
	V4lW1jnfiXzmNxCwTFeLBiVurwd7JZK7aHiIQuLGTSVveme2ys5JBDAXFfYXmuvwHR3xGki7BjgkA
	cOHfam2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy3ih-000000034MK-1fLs;
	Mon, 15 Sep 2025 07:33:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy3if-000000034LQ-1RlN;
	Mon, 15 Sep 2025 07:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757921627;
	bh=CvSpZpuhDtzZdxfbopkSom4BlyFhn0H99cY81Z+ClJ4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=PpNo0Gm0NGeq8BUqPEaE3VEteESp1T51bYoPqaOnH7v0WlIn2RZNrOED5yoZLgRWS
	 e1TFKJSQT5faQR8H3/9zZUn9MAypxIdcoqz4J+JPljcpa5IcQ9WOpYZTHYj9eIR6rk
	 yvitPSU5wIU9kNIrlI9EMBUsCqbpmxp0BLsCyOOVcEpKkhe6Ay2wVB7sox7L+EpBx8
	 jTsXFoH68PEU7dja1RyyC1g63aE+Po3RfQnADOAYE0hY/YXvfN1h/rmVxjtDE8Or7D
	 bnavYcMIvsHSxO1+qdnHpvZ5A+kCIg5tEOlgQt+wLJoKkMagR9yj1fHSYC4v6idDJb
	 wpCkaCbCfybyQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CD81C17E0AC3;
	Mon, 15 Sep 2025 09:33:46 +0200 (CEST)
Message-ID: <8b1c1796-6de2-4526-9a29-d8649141b878@collabora.com>
Date: Mon, 15 Sep 2025 09:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tty: serial: 8250_mtk: enable baud clock
To: Daniel Golle <daniel@makrotopia.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Yu Jiaoliang <yujiaoliang@vivo.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Changqi Hu <changqi.hu@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Steven Liu <steven.liu@mediatek.com>, John Crispin <john@phrozen.org>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <5d6acd2273e3c98a5cbc685ad94eff19c6b6d044.1757807642.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <5d6acd2273e3c98a5cbc685ad94eff19c6b6d044.1757807642.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_003349_551032_F16CE3AE 
X-CRM114-Status: GOOD (  19.46  )
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

Il 14/09/25 01:59, Daniel Golle ha scritto:
> Some MediaTek SoCs got a gated UART baud clock, which currently gets
> disabled as the clk subsystem believes it would be unused. This results in
> the uart freezing right after "clk: Disabling unused clocks" on those
> platforms.
> 
> To fix this request the "baud" clock as enabled to prevent disabling it
> among with the unused clocks.
> Runtime power management can probably also be restored to the state before
> commit e32a83c70cf9 ("serial: 8250-mtk: modify mtk uart power and clock
> management"), but that isn't strictly needed to fix the regression
> introduced by that commit.
> 
> Fixes: e32a83c70cf9 ("serial: 8250-mtk: modify mtk uart power and clock management")
> Suggested-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Is there any particular reason why you didn't en/disable the uart_clk in
runtime PM ops?

Cheers,
Angelo

> ---
>   drivers/tty/serial/8250/8250_mtk.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
> index b44de2ed7413..9329ed1f759d 100644
> --- a/drivers/tty/serial/8250/8250_mtk.c
> +++ b/drivers/tty/serial/8250/8250_mtk.c
> @@ -475,13 +475,13 @@ static int mtk8250_probe_of(struct platform_device *pdev, struct uart_port *p,
>   	int dmacnt;
>   #endif
>   
> -	data->uart_clk = devm_clk_get(&pdev->dev, "baud");
> +	data->uart_clk = devm_clk_get_enabled(&pdev->dev, "baud");
>   	if (IS_ERR(data->uart_clk)) {
>   		/*
>   		 * For compatibility with older device trees try unnamed
>   		 * clk when no baud clk can be found.
>   		 */
> -		data->uart_clk = devm_clk_get(&pdev->dev, NULL);
> +		data->uart_clk = devm_clk_get_enabled(&pdev->dev, NULL);
>   		if (IS_ERR(data->uart_clk)) {
>   			dev_warn(&pdev->dev, "Can't get uart clock\n");
>   			return PTR_ERR(data->uart_clk);



