Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3894BCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 17:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbv+KRaNAVLTmYg1Zr76xVCZJ54DiXiMKuxdaUODFno=; b=09x4snVVl+jqo1gShlwJ00/Xeq
	FfjIzf0N7cLs5PXXkOJz7fFsflsJ6kAJMjxO/lYJqj559b+RZRmuAO8ZTAPm2jhhOecJJIbo5aAfs
	qjzTvLzv1oG/6WdDzQsYD6hsq/JPQrKAqDl/EyIUYeTET2CB2rHUB4FFh/MU8VTE3S03q8pq2rL5b
	LO7IM1MTI5KqY5yIC42PKKc+zb+bVyCaBmyVqQxYSoJ3nI6YTkb2offHRSOSHM0/0+Sf224xq0+p1
	tGw1FlOAk5pi8YL0FJYAxqqLh4uuLvpRGXR6GhjBbFjlgGkEUbOR2RFoH3NEKULEuOtYRmzzfBd3L
	kxRqaG/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXiuB-00000009o80-47RY;
	Thu, 11 Jun 2026 17:09:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXiuB-00000009o7u-0wTa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 17:09:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AF42D441A7;
	Thu, 11 Jun 2026 17:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA28A1F00899;
	Thu, 11 Jun 2026 17:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781197762;
	bh=pbv+KRaNAVLTmYg1Zr76xVCZJ54DiXiMKuxdaUODFno=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RwHgmY7RZKkTYnwJzPsc39Z0T0OUPdI0CCdTnbRxtBCRHelzNApUCvYFx8T4FNfi/
	 MEVbR0615nCdY5EzdaXeyYJ2aPDWRF3SOTJYhJzZqhUctMbVk9a83cF1Wgm3jid0dJ
	 SbmimKIKSmFObOgKAtGbXKygAPK1c0N2X6aCTeUeAGTw6cqr3hoE0Rdav5fNEmzD8h
	 RefjMUDydpfsRVWfcc80ALmILKXqjNWwUQLnN8OgXaq+fJADghabGmQglOBLxdx7XE
	 y9mxo4rEb4ZXf+CPmCXXvwLt0f50Ldoz2thQXIIp7ZygzLTtegTZj7PPPKb/ebXDi3
	 T/XsEYt3JBN6w==
Message-ID: <33448148-3ac4-48d2-8119-4f9b765430f8@kernel.org>
Date: Thu, 11 Jun 2026 19:09:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] power: supply: macsmc: Support macOS 27 SMC firmware
To: Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Sebastian Reichel <sre@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260611-gate-power-v1-1-8a62721086c7@chaosmail.tech>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260611-gate-power-v1-1-8a62721086c7@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 11.06.26 18:49, Sasha Finkelstein wrote:
> The SMC firmware included in macOS 27 changed the size of BCF0 key from
> 4 to 1 bytes. This key is used for indicating that battery state is
> critically low.
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>   drivers/power/supply/macsmc-power.c | 34 +++++++++++++++++++++++++++++++---
>   1 file changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/power/supply/macsmc-power.c b/drivers/power/supply/macsmc-power.c
> index 33ca07460f3a..650dc8740f71 100644
> --- a/drivers/power/supply/macsmc-power.c
> +++ b/drivers/power/supply/macsmc-power.c
> @@ -86,6 +86,7 @@ struct macsmc_power {
>   	bool has_ch0i; /* Force discharge (Older firmware) */
>   	bool has_ch0c; /* Inhibit charge (Older firmware) */
>   	bool has_chte; /* Inhibit charge (Modern firmware) */
> +	bool bcf0_1byte; /* Battery critical */

The comment is a bit misleading, maybe "Battery critical key is 1 
instead of 4 bytes" or "Battery critical key is 1 byte (Modern 
firmware)" instead?

With that changed:

Reviewed-by: Sven Peter <sven@kernel.org>



Best,


Sven



