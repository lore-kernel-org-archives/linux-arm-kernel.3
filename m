Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD79C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 06:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOdCzSN2/f05dA92HAVY6g+EQoOjt0cmreIvV2RaoMA=; b=pAkem0tBz99p/rjPC0l4+NwGqx
	+ICSrV+4uAfFOz9BaNKJ4h0Hrht3LWCHzmVdEv4GqUKaaK/AJKk3thMrnYEmxYu0j/irHXNhf1HTy
	nOHTDNPBC9C0dpJR+zs24aczVhgEVBqO8aoYLRWvYkl+ue30uRZ+zqEyEaceEU+e51+6EpSneMEBM
	yWXjjaCUzaki1NZzTrDlMMg7nFpKTYPpFtYTFrsN/20CpCRTatZZ5/rpfJyg+a3DhkBKwRi2hVM0j
	hIYHcrNHdhPY4jj7KBZSvfnnARguklJCifOWHRsQ8Z/S8Heft10LdkNrHKefsR5KaAiOfMW0kofzp
	CVmPyFrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teptW-0000000Ee53-1wtW;
	Mon, 03 Feb 2025 06:25:18 +0000
Received: from smtp-22.smtpout.orange.fr ([80.12.242.22] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tepro-0000000EdiQ-3HmN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 06:23:33 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id eprhtUetmeIWleprlt7iQ8; Mon, 03 Feb 2025 07:23:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738563810;
	bh=sOdCzSN2/f05dA92HAVY6g+EQoOjt0cmreIvV2RaoMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=dNmYDMfnf8tZJagS0X3VZxyCxLgFqi7JvsDqSUFFRQGfW7sQHbwA+PnjRuDb8SZ7W
	 w6mkCF/i0ofE17RJBh2pnOiHVzL2C2Jsei+LFTiQuff575QWFrzxAgOno0N5oLGHAq
	 bvL5KckhWEOLVKqLUfYoBHE2IJL6Wce9APdHHzkxNTqcQbBB0+xjj5NhKHBjWeBsbj
	 rVCumjLL7bn44gH1L4JM6PXvvk3zdpaC+0OZ2gJRuNHrhH7nBsPgONyZ1M4+EVc5hW
	 BYe3H+RUcWj0tFzeoMM/fnFxvkgLUuLSfuTGWmAMLt766gu6YrudfIUs6l6W6WhwXv
	 i9E45wqKmlzZA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 03 Feb 2025 07:23:30 +0100
X-ME-IP: 90.11.132.44
Message-ID: <150812a1-31f7-43b1-8d85-fd097fc26c43@wanadoo.fr>
Date: Mon, 3 Feb 2025 07:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: phy: mxs: silence EPROBE_DEFER error on boot
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
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
X-CRM114-CacheID: sfid-20250202_222332_955292_8724CB22 
X-CRM114-Status: GOOD (  13.55  )
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
> -		return PTR_ERR(clk);
>   	}

extra { } can also be removed now that there is only 1 line left.

CJ

>   
>   	mxs_phy = devm_kzalloc(&pdev->dev, sizeof(*mxs_phy), GFP_KERNEL);
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250203-defer_usb2-ee26f66a01ad
> 
> Best regards,


