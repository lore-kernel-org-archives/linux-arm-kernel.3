Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B32C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 11:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=waS164PqlakW+UgygtgeQVfm3kMlq1ZVAQFEkzdN4x8=; b=fCGRr9BlUg1GfBA4ZNhWMxJsc2
	9QJuF8zWSOktMhmVhZnkZ0N5e60snOy7Kqjijb7oFwsauakEeLQ80vsoXlLtAPUVfm4UM+EBBCdSP
	3mji+GARiJOm0Dwq5plFkHgRpwdhezmZ3X/wCKVYDdEyW+HZzSYVk9riZIXDBOv8y/D9c2xRYnvTi
	ABMA6csLQf8P7wkuB6LCVLHHUPwceCkV+IBag7QBkNQOfHTHaOelMUF39t3VbiudSSUQnt8L7Wnnf
	BoS8QqQVszn6KBkzG1+fjGdLAkLljs/oGOPytvsypbxxRBi07Y0NyWoBoWNqyPDwUYQ0kj943k/+q
	cYK3qFmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXs1-0000000AvxR-1Atc;
	Thu, 13 Feb 2025 11:59:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXqb-0000000Avkx-2i92;
	Thu, 13 Feb 2025 11:57:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=waS164PqlakW+UgygtgeQVfm3kMlq1ZVAQFEkzdN4x8=; b=UuEJNbPxbN4pA8k+Rx+/RuyCZj
	E+o1aql/vVaDcojnZlisZt92x8Xo9LXRD40KCfl/ELhf/5QhNBADmSotxXtLo2cE7rV39EkQhM87H
	9hOpRLkksS597ufLya2Kis6GtYKFL3vL0VgCcmTCMfHkF4edYTfb/r/bb9VgilYrsdfhq1mnyB6FG
	BQ7VXM1fgjb80wJMULYqyJtbcviyImY4Q1jF7qZn7XBvLkhufOOlVSfmnURcaRoVk9xc0iyuZDhI5
	gTtWZd+S0OJZ8RDjJ6OFTK+sBQ3xw95EdVWcxr/rMgFrd0wqtoWKbYvG9KhkaBMACaeqXpHRkZVxT
	gGflaCyw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXqY-00000000yur-22On;
	Thu, 13 Feb 2025 11:57:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739447847;
	bh=YOhLwbRHhk8jEbhv3DzdTGfR6kzMixlKHQx3sbdPVso=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GKrHl5G+Hie0jBehvw3JXIeYQXhU4lOZfMHhCaxe57xLP4c82RvwAuEK13xlmfEhv
	 pmiXrVUqmaZfwg6XlTDglG5XmUsSwM9McMthU/lAl51rdogzSUYVYpXf836n43pIkm
	 75N317CsGbzLX7ZZHsrXB8l8W8QfWqle9cwjbgVlSkqz7XMQH/tNQGUuagr7pZBa4O
	 uABQGx7O38U8jM5zk4OwtZg9xFuLjfUa8b+hshqxMnK0igXKfKaJTSgJ2zC6+sSJ1r
	 7T19QEjI1zqRdSLe8f/3PUazDMsGZ8x6shjmp3cCq5O1ezdzO0op2vBpz11l4D4fA0
	 RUA8E/P3mZIIQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F017517E0F44;
	Thu, 13 Feb 2025 12:57:26 +0100 (CET)
Message-ID: <46621db1-6096-46af-b021-c919c1cae7ef@collabora.com>
Date: Thu, 13 Feb 2025 12:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
To: Zoie Lin <zoie.lin@mediatek.com>, Qii Wang <qii.wang@mediatek.com>,
 Andi Shyti <andi.shyti@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 teddy.chen@mediatek.com, joseph-cc.chang@mediatek.com, leilk.liu@mediatek.com
References: <20250211144016.488001-1-zoie.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250211144016.488001-1-zoie.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_115734_760608_CD6F3DC8 
X-CRM114-Status: GOOD (  26.62  )
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

Il 11/02/25 15:39, Zoie Lin ha scritto:
> Introduce support for runtime PM operations in
> the I2C driver, enabling runtime suspend and resume functionality.
> 
> Although in most platforms, the bus power of i2c is always
> on, some platforms disable the i2c bus power in order to meet
> low power request.
> 
> This implementation includes bus regulator control to facilitate
> proper handling of the bus power based on platform requirements.
> 
> Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 73 +++++++++++++++++++++++++++------
>   1 file changed, 61 insertions(+), 12 deletions(-)
> 
> This series is based on linux-next, tag: next-20250210
> 
> Changes in v4:
> - Removed unnecessary variable initialization.
> - Removed unnecessary brackets.
> - Corrected grammar issues in the commit message.
> - Confirmed autosuspend delay is not necessary.

Turning on and off regulators at start of transfer and end of transfer respectively
is very expensive and, while it makes sense for power efficiency of the controller,
it doesn't make sense for:

  1. Responsiveness (latency); and
  2. Platform power efficiency at a whole.

As a start, just set the autosuspend delay to 250ms; this gives you at least time
to bring up clocks and regulators and usually finish a transfer at 400KHz, giving
you the chance to also get some more requests before autosuspend decides to, well,
auto..suspend the device.

The right way of choosing an autosuspend delay a bit more precisely, though, for
this device, would be to check the bus speed and calculate the autosuspend time
accordingly.

Cheers,
Angelo

> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 5bd342047d59..1979b46d75f0 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -21,6 +21,7 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/scatterlist.h>
>   #include <linux/sched.h>
>   #include <linux/slab.h>
> @@ -1245,8 +1246,8 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
>   	int left_num = num;
>   	struct mtk_i2c *i2c = i2c_get_adapdata(adap);
>   
> -	ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> -	if (ret)
> +	ret = pm_runtime_resume_and_get(i2c->dev);
> +	if (ret < 0)
>   		return ret;
>   
>   	i2c->auto_restart = i2c->dev_comp->auto_restart;
> @@ -1299,7 +1300,9 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
>   	ret = num;
>   
>   err_exit:
> -	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	pm_runtime_mark_last_busy(i2c->dev);
> +	pm_runtime_put_sync(i2c->dev);
> +
>   	return ret;
>   }
>   
> @@ -1370,6 +1373,38 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
>   	return 0;
>   }
>   
> +static int mtk_i2c_runtime_suspend(struct device *dev)
> +{
> +	struct mtk_i2c *i2c = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	if (i2c->adap.bus_regulator)
> +		regulator_disable(i2c->adap.bus_regulator);
> +
> +	return 0;
> +}
> +
> +static int mtk_i2c_runtime_resume(struct device *dev)
> +{
> +	int ret;
> +	struct mtk_i2c *i2c = dev_get_drvdata(dev);
> +
> +	if (i2c->adap.bus_regulator) {
> +		ret = regulator_enable(i2c->adap.bus_regulator);
> +		if (ret) {
> +			dev_err(dev, "enable regulator failed!\n");
> +			return ret;
> +		}
> +	}
> +
> +	ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	if (ret)
> +		if (i2c->adap.bus_regulator)
> +			regulator_disable(i2c->adap.bus_regulator);
> +
> +	return ret;
> +}
> +
>   static int mtk_i2c_probe(struct platform_device *pdev)
>   {
>   	int ret = 0;
> @@ -1472,13 +1507,18 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	ret = clk_bulk_prepare_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	ret = clk_bulk_prepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>   	if (ret) {
> -		dev_err(&pdev->dev, "clock enable failed!\n");
>   		return ret;
>   	}
> +
> +	platform_set_drvdata(pdev, i2c);
> +
> +	ret = mtk_i2c_runtime_resume(i2c->dev);
> +	if (ret < 0)
> +		goto err_clk_bulk_unprepare;
>   	mtk_i2c_init_hw(i2c);
> -	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	mtk_i2c_runtime_suspend(i2c->dev);
>   
>   	ret = devm_request_irq(&pdev->dev, irq, mtk_i2c_irq,
>   			       IRQF_NO_SUSPEND | IRQF_TRIGGER_NONE,
> @@ -1486,19 +1526,20 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   	if (ret < 0) {
>   		dev_err(&pdev->dev,
>   			"Request I2C IRQ %d fail\n", irq);
> -		goto err_bulk_unprepare;
> +		goto err_clk_bulk_unprepare;
>   	}
> +	pm_runtime_enable(&pdev->dev);
>   
>   	i2c_set_adapdata(&i2c->adap, i2c);
>   	ret = i2c_add_adapter(&i2c->adap);
>   	if (ret)
> -		goto err_bulk_unprepare;
> -
> -	platform_set_drvdata(pdev, i2c);
> +		goto err_pm_runtime_disable;
>   
>   	return 0;
>   
> -err_bulk_unprepare:
> +err_pm_runtime_disable:
> +	pm_runtime_disable(&pdev->dev);
> +err_clk_bulk_unprepare:
>   	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>   
>   	return ret;
> @@ -1510,6 +1551,7 @@ static void mtk_i2c_remove(struct platform_device *pdev)
>   
>   	i2c_del_adapter(&i2c->adap);
>   
> +	pm_runtime_disable(&pdev->dev);
>   	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>   }
>   
> @@ -1518,6 +1560,10 @@ static int mtk_i2c_suspend_noirq(struct device *dev)
>   	struct mtk_i2c *i2c = dev_get_drvdata(dev);
>   
>   	i2c_mark_adapter_suspended(&i2c->adap);
> +
> +	if (!pm_runtime_status_suspended(dev))
> +		mtk_i2c_runtime_suspend(dev);
> +
>   	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>   
>   	return 0;
> @@ -1536,7 +1582,8 @@ static int mtk_i2c_resume_noirq(struct device *dev)
>   
>   	mtk_i2c_init_hw(i2c);
>   
> -	clk_bulk_disable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	if (pm_runtime_status_suspended(dev))
> +		mtk_i2c_runtime_resume(dev);
>   
>   	i2c_mark_adapter_resumed(&i2c->adap);
>   
> @@ -1546,6 +1593,8 @@ static int mtk_i2c_resume_noirq(struct device *dev)
>   static const struct dev_pm_ops mtk_i2c_pm = {
>   	NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_i2c_suspend_noirq,
>   				  mtk_i2c_resume_noirq)
> +	SET_RUNTIME_PM_OPS(mtk_i2c_runtime_suspend, mtk_i2c_runtime_resume,
> +			   NULL)
>   };
>   
>   static struct platform_driver mtk_i2c_driver = {



