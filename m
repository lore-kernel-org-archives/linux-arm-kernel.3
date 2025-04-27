Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61459C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 16:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPwsKOKikUI2Hbjz9HM+ALtIQrd5D4385/ERHMTCY0Y=; b=rIrxhsnoiGBtYT5iqc6uNBkqD2
	VxbWPn8eYKiEsyAX48Q6FcOGoXrqkIJRgyV6XgHao51I2LZYDcUF+n6od1Wo7muTVAuHsPBSap2hN
	B/En4oge+hUM4KDTvIFbNFvIst6Aio81a/OAnDjHV6MxwG4ow6JEq95Pb6WW2m4GtZQbH1m4swto2
	JSnwsZR59TvVxBf2H7wS9CPhVY1oPl+0eMygcdxHMZ7JZHay+ReJEr8b7uSsjTrYaHJFADe6epQVa
	e7XSPO6//8+ypjWj5s7iGQgHNamuAN2pvU354o0jzWvoen819PWZQ8hNQ+7EjRDsAhJVnO9VLNwwD
	gIAWPOug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u94WR-00000003lGT-04Kp;
	Sun, 27 Apr 2025 16:06:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u94UU-00000003l6Q-1QEB;
	Sun, 27 Apr 2025 16:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MPwsKOKikUI2Hbjz9HM+ALtIQrd5D4385/ERHMTCY0Y=; b=g1zjxJB6RPGKQ4LCwMZljHL1gw
	uM9f+zmJYAJ6rzQ86RNIsle6oByl7fAxntteNqBleogvDg+mC0DI+CloD+oe6m4QZWmW57wwYs2Gn
	T3ZEkvVf9Sqf6GupTYJral8e6Yj8uEqKlwIw78Ei+uXFOy4NDWJ9X7X/kQd5h29EV6THscMBvRk6N
	G7ZEsIIeBDwovoN96KtO4HinIvfrMo+F6BPh0Z21HOsYF+bb03U7/3Qoem1l237xgRM82G5lxhDF0
	64ftXik4ybmPWI8HH4W/p6hCfaNLFt1ZxJijrkFVbKs8ExDs63hGrrv+ZVJTgR/4UiY7zJqYIUZae
	AUfeTYcg==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u94UL-0000000CUJj-3MCO;
	Sun, 27 Apr 2025 16:04:18 +0000
Message-ID: <4c17ae51-475e-4bd2-8bbf-c5e3233ef319@infradead.org>
Date: Sun, 27 Apr 2025 09:04:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v8_2/5=5D_auxdisplay=3A_add_TI_LP5812_4?=
 =?UTF-8?Q?=C3=973_Matrix_RGB_LED_Driver?=
To: Nam Tran <trannamatk@gmail.com>, andy@kernel.org
Cc: geert@linux-m68k.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, christophe.jaillet@wanadoo.fr, corbet@lwn.net,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20250427082447.138359-1-trannamatk@gmail.com>
 <20250427082447.138359-3-trannamatk@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250427082447.138359-3-trannamatk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi--

On 4/27/25 1:24 AM, Nam Tran wrote:
> diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
> index bedc6133f970..896f02b9a06b 100644
> --- a/drivers/auxdisplay/Kconfig
> +++ b/drivers/auxdisplay/Kconfig
> @@ -539,6 +539,23 @@ config ARM_CHARLCD
>  	  line and the Linux version on the second line, but that's
>  	  still useful.
>  
> +#
> +# TI LP5812 matrix RGB LED driver section
> +#
> +config LP5812

Missing one tab of indentation on all lines below here:

> +tristate "Enable LP5812 support LED matrix 4x3"
> +depends on I2C
> +help
> +  If you say Y here you get support for TI LP5812 LED driver.
> +
> +  The LP5812 is a 4 × 3 matrix RGB LED driver with autonomous
> +  animation engine control.
> +
> +  To compile this driver as a module, choose M here: the
> +  module will be called lp5812.
> +
> +  If unsure, say N.
> +
>  endif # AUXDISPLAY

-- 
~Randy


