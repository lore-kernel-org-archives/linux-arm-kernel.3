Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E621AC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 12:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7m3HgDEgwPc2M5bdJVDKa0ZV1s5Em7NO5hn4UyXD+U=; b=l9AdBvXS1fuxEMOckpPo+t8dey
	84atHYuqF0JyGShZPqrQvjsmuVgbvCDUKsJ+s510w6bY/XPJkDUzzYBkblS5pj7Py95Y6MXlDoLP0
	Bbv0H7+EXZbY9cHZlcEGHYYjYqYm22/Z/Yz1DXpkwW01yl5RJI/1q70I10LgiCjpMb8u5Yo8I/X2Z
	2XKZmoq+MsPBZnSQkXqtcG2WE8QQ6DB8P1oP9oLaIFtcYhlvZ3iR7oTOBcOut3fAVmxujDZGSWwmB
	be4tGfW24ivg3GJ+f1BCyHt2KO5JUIzfKrqIxI5QV2ydUWahT7SZduJNsgnb5P0KCaIiYwCk55xku
	7Xz/IlsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRs4B-0000000A9yw-3MFt;
	Wed, 18 Jun 2025 12:38:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRq8r-00000009oAa-0mzl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:35:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F01A9A523A4;
	Wed, 18 Jun 2025 10:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7174C4CEED;
	Wed, 18 Jun 2025 10:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750242939;
	bh=uQq6wFByjowqdb8ZEtYJxgOfGSnymBUZntpzmJfPC0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F92DU9XzfpeDePTmi2dV6OxHOR7wG+d2NFrXKZ4CscAbw2YikJiNyofF6makh6pyA
	 0vybxsewrYkr9u9DA72d9lj1Z1WT8PF8dmdf1vy2apu6nbQUlJy3AiUjcCbhe+QAfJ
	 /dQwKblIKnB8f9V0X3JgYKDE+xfbW5qfv0kDbkNC/PyAL3Qv4/N0ppmo5n6e91hdzf
	 892yBFvCGJX65BlcE/g0Q+/5sq3Wnwl4Kq3noWBPsos6Y8+Eg5sxNWC8YQKoD6s5VT
	 L5U1s75FOUNwfvz99tBBbM7kDV8xzifCqotAcEJOM3IWhQmosGvmIs5jQpdZ3sF79s
	 XxsrIZxy/We7Q==
Date: Wed, 18 Jun 2025 18:35:30 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, shawnguo@kernel.org, s.hauer@pengutronix.d,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] usb: chipidea: udc: add
 CI_HDRC_CONTROLLER_PULLUP_EVENT event
Message-ID: <20250618103530.GB34284@nchen-desktop>
References: <20250614125645.207732-1-xu.yang_2@nxp.com>
 <20250614125645.207732-2-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614125645.207732-2-xu.yang_2@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_033541_286359_5DD2F054 
X-CRM114-Status: GOOD (  16.22  )
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

On 25-06-14 20:56:43, Xu Yang wrote:
> The device controller will send CI_HDRC_CONTROLLER_PULLUP_EVENT event
> when it's going to pullup or pulldown data line.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/udc.c   | 5 +++++
>  include/linux/usb/chipidea.h | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 1a48e6440e6c..64a421ae0f05 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1970,6 +1970,11 @@ static int ci_udc_pullup(struct usb_gadget *_gadget, int is_on)
>  		hw_write(ci, OP_USBCMD, USBCMD_RS, USBCMD_RS);
>  	else
>  		hw_write(ci, OP_USBCMD, USBCMD_RS, 0);
> +
> +	if (ci->platdata->notify_event) {
> +		_gadget->connected = is_on;
> +		ci->platdata->notify_event(ci, CI_HDRC_CONTROLLER_PULLUP_EVENT);
> +	}
>  	pm_runtime_put_sync(ci->dev);
>  
>  	return 0;
> diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
> index ebdfef124b2b..e17ebeee24e3 100644
> --- a/include/linux/usb/chipidea.h
> +++ b/include/linux/usb/chipidea.h
> @@ -72,6 +72,7 @@ struct ci_hdrc_platform_data {
>  #define CI_HDRC_IMX_HSIC_ACTIVE_EVENT		2
>  #define CI_HDRC_IMX_HSIC_SUSPEND_EVENT		3
>  #define CI_HDRC_CONTROLLER_VBUS_EVENT		4
> +#define CI_HDRC_CONTROLLER_PULLUP_EVENT		5
>  	int	(*notify_event) (struct ci_hdrc *ci, unsigned event);
>  	struct regulator	*reg_vbus;
>  	struct usb_otg_caps	ci_otg_caps;
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

