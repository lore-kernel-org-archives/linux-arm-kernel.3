Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFEDCCF2DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0j8xZJKX/4mbINzA6wXnFac2i+N8zyKdGYZVUMx/a+o=; b=PTioQpLMxULZV0UHwKYfQJ3PTs
	4AcmfRG4ZFWUX4lh/MWxafRAtYqMROmab99BbsiswSGmeeo20lO1He4Sr/WuyPiNzUI5TKhLcsKk1
	AsEmwB/mF7SAD7DC6hCpMo7oWq8On499CxzG3j3HynzAgsl85it3Oz6nhBLFi4pLSs1oMLaVVpcHL
	d/SNPwpvwUdJHY8mH0X47+GZhU3UNaSTgrlSKHLpr4LGJ2nBan3nmtRYnC+598mRfCH8h6NgUKHRR
	vobi+sM0KNuHgwvzaknrAS+piL94LgPBlMzWoMAZQs8aectVTfYLeHkHkCd70HO/tnvfcr7RkHDQH
	ENWdtL+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhn7G-00000001rAA-2HnQ;
	Mon, 19 Jan 2026 11:08:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhn7D-00000001r8b-3QXb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:08:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F6C941986;
	Mon, 19 Jan 2026 11:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C115C116C6;
	Mon, 19 Jan 2026 11:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820891;
	bh=fOCQQatKJkAsP/8aCqj/CsMBsA/Znj0mtdxM6Z1bniQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nep/NM8G8LkTEJd5plGPg9EQoqA/Jk3Te//DN57NcVg99WM5Tmu9m/En4Lq/XbxSW
	 8tFsNoGyCBi514D8uUE6IhigyDSkHHy9NNjZmPD7fH5G9f4G5fhV1XBdvuvlr7g+OP
	 MkSkyDiIh8gNd5hNBMXpbMPW/b31+MpuWPkyW8nK30G1C7793fOeq0FZ1GWa6rEOc2
	 F7ctsmLlXgEJrQo9kccckQ0JfYchVr42jjohlOOAZi1txpzP8gD2AgiJIA9ReX7F5F
	 A7TUSgK8XmxyIULpB18MIwQN0BybFvJnZK+F28d5q++GnKL/yryTTzZ4JP6H0Na9+4
	 F6JFGXJPWGAmg==
Message-ID: <db748d3f-53c8-43cc-a5bc-94940252ca0c@kernel.org>
Date: Mon, 19 Jan 2026 12:08:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] base: soc: export soc_device_get_machine()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_030811_893412_4010FC44 
X-CRM114-Status: GOOD (  19.33  )
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



Le 19/01/2026 à 11:40, Bartosz Golaszewski a écrit :
> Some SoC drivers reimplement the functionality of
> soc_device_get_machine(). Make this function accessible through the
> sys_soc.h header. Rework it slightly to return a negative error number
> on failure to read the machine string (SoC core can keep on ignoring
> it). While at it: make it use the __free() helper from cleanup.h.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   drivers/base/soc.c      | 16 +++++++++-------
>   include/linux/sys_soc.h | 10 ++++++++++
>   2 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/base/soc.c b/drivers/base/soc.c
> index 6f42632d2b0fcc8a729484e6ad270f9bcabe4a0b..bec8771d40f0590d4d7c3985c08fedfd4043a394 100644
> --- a/drivers/base/soc.c
> +++ b/drivers/base/soc.c
> @@ -5,6 +5,7 @@
>    * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
>    */
>   
> +#include <linux/cleanup.h>
>   #include <linux/err.h>
>   #include <linux/glob.h>
>   #include <linux/idr.h>
> @@ -111,17 +112,18 @@ static void soc_release(struct device *dev)
>   	kfree(soc_dev);
>   }
>   
> -static void soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
> +int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
>   {
> -	struct device_node *np;
> -
>   	if (soc_dev_attr->machine)
> -		return;
> +		return -EBUSY;
> +
> +	struct device_node *np __free(device_node) = of_find_node_by_path("/");
> +	if (!np)
> +		return -ENOENT;
>   
> -	np = of_find_node_by_path("/");
> -	of_property_read_string(np, "model", &soc_dev_attr->machine);
> -	of_node_put(np);
> +	return of_property_read_string(np, "model", &soc_dev_attr->machine);
>   }
> +EXPORT_SYMBOL_GPL(soc_device_get_machine);
>   
>   static struct soc_device_attribute *early_soc_dev_attr;
>   
> diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
> index d9b3cf0f410c8cfb509a4c1a4d6c83fde6fe33c6..2d2dbc18462a39ddee95e38826a769fab089026f 100644
> --- a/include/linux/sys_soc.h
> +++ b/include/linux/sys_soc.h
> @@ -37,6 +37,16 @@ void soc_device_unregister(struct soc_device *soc_dev);
>    */
>   struct device *soc_device_to_device(struct soc_device *soc);
>   
> +/**
> + * soc_device_get_machine - retrieve the machine model and store it in
> + *                          the soc_device_attribute structure
> + * @soc_dev_attr: SoC attribute structure to store the model in
> + *
> + * Returns:
> + * 0 on success, negative error number on failure.
> + */
> +int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr);
> +
>   #ifdef CONFIG_SOC_BUS
>   const struct soc_device_attribute *soc_device_match(
>   	const struct soc_device_attribute *matches);
> 


