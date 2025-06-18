Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61723C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 12:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccUPpMYLFJa8bfl4e7s/VKR2SJncpCgtletHtW4R8n8=; b=lJ1LxuZGxL5AYuImXgTqxM/M+q
	W5/v08ePi8W6UXxsYUlphGEJwz6pvuDuZe5U6mc8xFBObW3C7LfNIj8pRuh3sZ1d+Tq9roo6z+EcZ
	rsBIjF3q3dWX7jrnJZ2ysyFYJDZFWsPcF+1i+DYilMgvz0AMw1nYFhpJrDQ1FED/GzNltGvsdx2R4
	p65bZVGxqyvy7Z6Wn4A3obQK0TmD5dNkqFRtt9jFe6HGA2z/Cn5nQO397RUXUOFnBII4b4gQp36u5
	twn218JFCaxDt0p9BvAmIewp5itielnR5lzaDIVPf1QRKvSv1sRb3dXAUC97UUjPLi+fOJJ79G7MJ
	XF/QsICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRs6N-0000000AAUK-2OmN;
	Wed, 18 Jun 2025 12:41:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRq9U-00000009oHp-3PUn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:36:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0FD4CA523A4;
	Wed, 18 Jun 2025 10:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00E1C4CEE7;
	Wed, 18 Jun 2025 10:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750242979;
	bh=B6uo7xeHOpk/UKaFSXaNj5iI3yuU7iwtArZSU8kFH1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qUyhWSW7hJmut7cEo8X4rWRBAvs9aorCV2BVuTkcGwy3nlPmtFY93eBQJ3yXwj01k
	 pHaJC/fq6WfriQV3/e2G3xohuC7a1rpjlOZ+ERM3ZC4mEFtnwz260b/VUkHGKJEnWX
	 wv2X3bjLFeAk3NEj8oRZWsuSPxQYatT5QCUBsYf6VMgKVlSD8NSmph9ZDT9wt20mgz
	 3KeoSXdcRu0mvmwCJI9k2EtFyNrdpF3iAMx8+dPViWiUrOWcKryJ6PGAyd4cFRYSwp
	 p1H57lsxHW0cL4++UzzB+KkeoYZOVOAbHEWDIpaA2hjdZt7nShD35BlntAysCj51hX
	 hQd/Ltyw2oFkA==
Date: Wed, 18 Jun 2025 18:36:12 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, shawnguo@kernel.org, s.hauer@pengutronix.d,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] usb: chipidea: imx: add imx_usbmisc_pullup() hook
Message-ID: <20250618103612.GC34284@nchen-desktop>
References: <20250614125645.207732-1-xu.yang_2@nxp.com>
 <20250614125645.207732-3-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614125645.207732-3-xu.yang_2@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_033620_922717_41707F42 
X-CRM114-Status: GOOD (  17.15  )
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

On 25-06-14 20:56:44, Xu Yang wrote:
> It's used to do other pullup related operations if needs.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.h |  1 +
>  drivers/usb/chipidea/usbmisc_imx.c | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/ci_hdrc_imx.h
> index 88b8da79d518..cb95c84d0322 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.h
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.h
> @@ -37,5 +37,6 @@ int imx_usbmisc_hsic_set_connect(struct imx_usbmisc_data *data);
>  int imx_usbmisc_charger_detection(struct imx_usbmisc_data *data, bool connect);
>  int imx_usbmisc_suspend(struct imx_usbmisc_data *data, bool wakeup);
>  int imx_usbmisc_resume(struct imx_usbmisc_data *data, bool wakeup);
> +int imx_usbmisc_pullup(struct imx_usbmisc_data *data, bool on);
>  
>  #endif /* __DRIVER_USB_CHIPIDEA_CI_HDRC_IMX_H */
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 118b9a68496b..9db67d6d0ec4 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -170,6 +170,9 @@ struct usbmisc_ops {
>  	int (*charger_detection)(struct imx_usbmisc_data *data);
>  	/* It's called when system resume from usb power lost */
>  	int (*power_lost_check)(struct imx_usbmisc_data *data);
> +	/* It's called when device controller changed pullup status */
> +	void (*pullup)(struct imx_usbmisc_data *data, bool on);
> +	/* It's called during suspend/resume to save power */
>  	void (*vbus_comparator_on)(struct imx_usbmisc_data *data, bool on);
>  };
>  
> @@ -1225,6 +1228,21 @@ int imx_usbmisc_charger_detection(struct imx_usbmisc_data *data, bool connect)
>  }
>  EXPORT_SYMBOL_GPL(imx_usbmisc_charger_detection);
>  
> +int imx_usbmisc_pullup(struct imx_usbmisc_data *data, bool on)
> +{
> +	struct imx_usbmisc *usbmisc;
> +
> +	if (!data)
> +		return 0;
> +
> +	usbmisc = dev_get_drvdata(data->dev);
> +	if (usbmisc->ops->pullup)
> +		usbmisc->ops->pullup(data, on);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(imx_usbmisc_pullup);
> +
>  int imx_usbmisc_suspend(struct imx_usbmisc_data *data, bool wakeup)
>  {
>  	struct imx_usbmisc *usbmisc;
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

