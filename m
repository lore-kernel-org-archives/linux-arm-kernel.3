Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DC8C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 06:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UsOhWfOpgc+uO6vqHSI1XSOwHG5IdNprxkyzTXcs2k4=; b=vpW5GSly/CoHR2/PciTBaTR5n2
	C0wWv+F1vGPqTgD0S2/+6iJwAzYYkEjY+KbBf3lMo06KkHB+qpvDh68QX3SkAs4cBPseZDM0ZJz5e
	2wMS1XmaQseCNwRZ9UtEwxhmg/TdJuhMbe93wXgopUazjYaGqgDpQJDxeIOfaM5mMpFgDITs9oYJn
	zM0aynG3fraGEjULoEyGZQ3hVs0PJAsv6MERAqOi5n+xIFonO4xuILWWpsVyZiV9Q10pO5y3vRQRo
	QiGlN0N7MXOkBSiv3pt03oulLMyzonr4a5qxUmxEDLfifAgKERndGI9tnXpbgJkhOZnkJW8iuIr+K
	MOyGbyXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teppe-0000000EdQB-23fj;
	Mon, 03 Feb 2025 06:21:18 +0000
Received: from smtp-17.smtpout.orange.fr ([80.12.242.17] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tepoK-0000000EdH6-2klJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 06:19:58 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id epoBtmWefA83BepoEt3aNX; Mon, 03 Feb 2025 07:19:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738563593;
	bh=UsOhWfOpgc+uO6vqHSI1XSOwHG5IdNprxkyzTXcs2k4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=N4rSMGAnK5LbeaOLWEhO3/iVpJCArVQF1WC/bgG4mPyLovuDKAD7lcx5zypq0ZWmZ
	 qG9tRC2cA8ZXDGRgrZUS7Py+iqF4hPBVwk0Frjrd3+MB+OQuOJsRWCHON/WLB2kKBp
	 QLSTQPkttxtA29w2Kjbw5vev/XVvPYsgM+3YStZKzcM6gBnLih0F08KvhZiNs5HxRq
	 axtNrJFjqw/OU9TNayvY6II67Om5rkZiGJiOqufMRq2hZ/cA/UJsed/1X4WIyOLyns
	 GxjDTMxXJ6SD5jRZI719TOI0xz6ZIb1dsGASME8LIqxUjBQdEWzY0u7AKOa4fkn7pz
	 8ZJ8F6Fsb3t1A==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 03 Feb 2025 07:19:53 +0100
X-ME-IP: 90.11.132.44
Message-ID: <3a0f8cd9-fe3e-4f07-bf9e-e1b877ffda0a@wanadoo.fr>
Date: Mon, 3 Feb 2025 07:19:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: phy: mxs: silence EPROBE_DEFER error on boot
To: dominique.martinet@atmark-techno.com
Cc: festevam@gmail.com, gregkh@linuxfoundation.org, imx@lists.linux.dev,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 s.hauer@pengutronix.de, shawnguo@kernel.org
References: <20250203-defer_usb2-v1-1-2366f26462e0@atmark-techno.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250203-defer_usb2-v1-1-2366f26462e0@atmark-techno.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_221957_109578_34D6EE69 
X-CRM114-Status: GOOD (  15.41  )
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

Le 03/02/2025 à 07:09, Dominique Martinet a écrit :
> Use dev_err_probe to silence EPROBE_DEFER error on boot on i.MX8ULP:
> [    0.127301] mxs_phy 29910000.usb-phy: can't get the clock, err=-517
> 
> Signed-off-by: Dominique Martinet <dominique.martinet-9u97MdVgWv6RbxiC3EKwHAC/G2K4zDHf@public.gmane.org>
> ---
>   drivers/usb/phy/phy-mxs-usb.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 7490f1798b461c39c29bb74e1e57e0a4adce2bd7..dd2b4a5633934e257e792bbd61d6748304b5e679 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -770,9 +770,8 @@ static int mxs_phy_probe(struct platform_device *pdev)
>   
>   	clk = devm_clk_get(&pdev->dev, NULL);
>   	if (IS_ERR(clk)) {
> -		dev_err(&pdev->dev,
> +		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
>   			"can't get the clock, err=%ld", PTR_ERR(clk));

, err=%ld", PTR_ERR(clk) should be removed now.

The error code will already be added in the message in a human readable way.

Alignment could also be adjusted so that "can't... is still under the (.

CJ

> -		return PTR_ERR(clk);
>   	}
>   
>   	mxs_phy = devm_kzalloc(&pdev->dev, sizeof(*mxs_phy), GFP_KERNEL);
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250203-defer_usb2-ee26f66a01ad
> 
> Best regards,


