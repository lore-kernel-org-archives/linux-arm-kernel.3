Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACF2C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 19:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcwlO0XSoc9LkdUgOJxqAcvMnUBiMfotDFah26wg1fM=; b=K4RWl6V4mcwWhlQNQJNlcbiTxW
	He9leNu13x+cgpicY/R83bYxsGvo4Sz3V2OWU5zzWCBAHlwcm9Yloo7/DHkJXAEUfx1kwsa76llV0
	VvqVP8nTsTlFbIQdjWTXhdHbWa1XFAvugdsY8gvhG/aV9tZhaFGOE9Hy14dk3XCATVosbtibR5knP
	LFHlDg9h34CHK6DB1aVwH6BhWgptZRxlSKvqOoXo7OtPGb+aY1mhwGZkX/+hqTscdZrgueJkxZcxL
	K2/ywOOTgsZGn3pMcuIuDT4xgBvwpTRGuFv3tIx6Xjdb73KQLtsHq4KuoHbk2mbn7xK7G/xlaSphL
	eLLFZ25Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7JaO-00000008LV8-3pmq;
	Tue, 22 Apr 2025 19:47:16 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GCP-00000007qNa-0kCj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 16:10:18 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1u7GCK-0004il-Im; Tue, 22 Apr 2025 18:10:12 +0200
Message-ID: <4c195c2a-81c6-41c8-a134-1c7813904115@pengutronix.de>
Date: Tue, 22 Apr 2025 18:10:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: imx: drop master prefix
To: Troy Mitchell <troymitchell988@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Yongchao Jia <jyc0019@gmail.com>
References: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
 <20250421-i2c-imx-update-v1-2-1137f1f353d5@gmail.com>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250421-i2c-imx-update-v1-2-1137f1f353d5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_091017_218552_D05AC075 
X-CRM114-Status: GOOD (  17.87  )
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

On 4/21/25 07:36, Troy Mitchell wrote:
> In light of the recent updates to the i2c subsystem,
> drop master prefix.
> 
> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Please use a different cover letter title for your v2, adapting the
mainline doesn't tell the reader anything about what the series is about.

Perhaps something like i2c: imx: lock guards and cleanup

Thanks,
Ahmad

> ---
>  drivers/i2c/busses/i2c-imx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index cb96a57df4a0..dd07fde79632 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1690,8 +1690,8 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
>  }
>  
>  static const struct i2c_algorithm i2c_imx_algo = {
> -	.master_xfer = i2c_imx_xfer,
> -	.master_xfer_atomic = i2c_imx_xfer_atomic,
> +	.xfer = i2c_imx_xfer,
> +	.xfer_atomic = i2c_imx_xfer_atomic,
>  	.functionality = i2c_imx_func,
>  	.reg_slave	= i2c_imx_reg_slave,
>  	.unreg_slave	= i2c_imx_unreg_slave,
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


