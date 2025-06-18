Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9F7C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 17:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BCLKEf2oOx2tVI9JbEmowwEMi82HX6Gm1IExPrNnGo=; b=rAv9ZXR51YCpMfScLv5icpAxLN
	xrdSF6C+6QJDcEK667DZ0cH7ypZ+S8Hja8/te5+FCQBmZDQF20qtv5xNCPID13ZbaIy9FySMrIghl
	OZQhCUWz48i2WaVAFhOP2dpuTDXD46VpHkCSVOkV4zCLB516X/AvrHQunucq15aoMhiHwlFDRmuTp
	+Ug5qJhscDdZf/SPRHwbS3alSSnWqC0I5XIvHIgagLjWDA9dMInBZwFGXXVFr9QnzYppVyK8JUE0v
	ESkQrT3H4J95euwQHs9cpapGkIvoeGpG5JlumyFC8ny0aC6LPs+LfadI7CUWK1PAsgN4x4ALeze1K
	0oU2JgYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwP6-0000000ApAq-2I5c;
	Wed, 18 Jun 2025 17:16:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsPp-0000000ADOa-2q4q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 13:01:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D49366112A;
	Wed, 18 Jun 2025 13:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E20C4CEE7;
	Wed, 18 Jun 2025 13:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750251680;
	bh=u7wvhY7UzWw1Kiz3j8CRU+e4HYpWNK/WmjXrT+hmz1Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t9M5sjk9OMnqNmnD8XQpdhvdPF1id4DxIs9zMb2tisdrYNb2LRVjjwhXsr2PvHY8z
	 +VC4KrTR+Ge2MPX0Qc8/aseWBZQH6tIQZ2W9zbpP3peoaYUc64PHH3/pTCdQz6p/rq
	 GS4f3UAo/UdMi7mUvW1L3UHqPZRbX06+eTZSbIpmVLur0ch7XMXQZcH2irczT8jroM
	 xP6ThLv5Ojq/Gi6WhUP8lv8ZfEnwE+Nvy+biotp3EiEGASoiU/0POC1BGey0SC+VYJ
	 WszjFFf09BaB/QukhQ21YNnOqG5z/tvYEuepHd835awBrRJKTYb7EkYbE3PutlPBnY
	 LIKIdO5Zaxbyg==
Message-ID: <6f644654-c906-46f0-942e-ad50ba159786@kernel.org>
Date: Wed, 18 Jun 2025 15:01:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] platform/x86: dell-uart-backlight: Use blacklight
 power constant
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 danielt@kernel.org, jingoohan1@gmail.com, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 fnkl.kernel@gmail.com, j@jannau.net, ilpo.jarvinen@linux.intel.com,
 sven@kernel.org, alyssa@rosenzweig.io, neal@gompa.dev, deller@gmx.de,
 support.opensource@diasemi.com, duje.mihanovic@skole.hr
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org
References: <20250618122436.379013-1-tzimmermann@suse.de>
 <20250618122436.379013-2-tzimmermann@suse.de>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250618122436.379013-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 18-Jun-25 2:16 PM, Thomas Zimmermann wrote:
> The backlight subsystem has gotten its own power constants. Replace
> FB_BLANK_UNBLANK with BACKLIGHT_POWER_ON.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans




> ---
>  drivers/platform/x86/dell/dell-uart-backlight.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
> index 8f868f845350..f323a667dc2d 100644
> --- a/drivers/platform/x86/dell/dell-uart-backlight.c
> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> @@ -305,7 +305,7 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
>  	dev_dbg(dev, "Firmware version: %.*s\n", resp[RESP_LEN] - 3, resp + RESP_DATA);
>  
>  	/* Initialize bl_power to a known value */
> -	ret = dell_uart_set_bl_power(dell_bl, FB_BLANK_UNBLANK);
> +	ret = dell_uart_set_bl_power(dell_bl, BACKLIGHT_POWER_ON);
>  	if (ret)
>  		return ret;
>  


