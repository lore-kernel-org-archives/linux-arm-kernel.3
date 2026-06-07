Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46F7CD8C88
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 06:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnbMUaAUGWbhJ7kILtaMcBgwchhzxpm+oFvWPyiGaSk=; b=rlKkiCRbO0f+F3BmHJvlKvuvuS
	KydXAtC0yM9lRVCPTk6r9M2bXyBh4XjcQIG383Ub+rDjjtJgUB5D8CFN9S6w0L5FFZhVlr/zRTYhc
	aIz8bpTmLPJs0r6/gqTpfbpddgESM/3NzUMjNRaA8yjtTMkQwE0+CYcWKNFmaltarweRR4VH1ZR0u
	6l1Clw5KbRvp2kPW/LymiLtg7w55T0pziHlgxXIIsfFxqcDpj0P5gtkEtS0wtIvRBjNcwDRJ5EEab
	+Ak0dOMk4st3g7IN4vQgLLhi7q5TOnA9XI5FMDR4T/Eq1Fs5riEi0P3pZF48++iWBTmBveA8YC3yK
	jPI7HZ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW7Co-000000024aZ-3XIJ;
	Sun, 07 Jun 2026 06:41:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW7Cn-000000024aT-36UG
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 07 Jun 2026 06:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=qnbMUaAUGWbhJ7kILtaMcBgwchhzxpm+oFvWPyiGaSk=; b=MW9EmKycHIuucksVRjQGbX6V5j
	2PGwaMXlqUb5W4GuhOXZiJtCvMrzB2yVmF1D0fHqMQZb7s5SAR5GzmYqWe5Ec7ZhJvJ7KdrbclP8R
	xU34MMZAnBsfOdVn5C43MPydOWTBZ7Se4S+z7D9VkxpTBjLZHpjIA4jXRWrE4B7yWpwWo2e/OBCyM
	s6QUvYd03mZfxaibo0eGvm84HdWEImI9uFAkMFVizi9jbbxokcQq32vWlxrk39LmUUatQNb91u/oK
	NzH9TPbmHyy9qiOvE4cZ+tvaABW81Mme8mq8Pj6EbDpHgaI85GJR+cArb5r21SRCq4d4CrEEBV1an
	wDaCeoyw==;
Received: from smtp-16.smtpout.orange.fr ([80.12.242.16] helo=smtp.smtpout.orange.fr)
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW7Ci-0000000BWFu-2Ovb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 06:41:55 +0000
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662] ([10.64.95.103])
	by smtp.orange.fr with ESMTP
	id W73lwsoCxVvp8W73lwSTeo; Sun, 07 Jun 2026 08:32:37 +0200
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id W73dwnUfCJkT6W73dwFmhI; Sun, 07 Jun 2026 08:32:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1780813956;
	bh=qnbMUaAUGWbhJ7kILtaMcBgwchhzxpm+oFvWPyiGaSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=kOtcEY9yrMD2rh1xwEPTX/vzt1SW3y0/l8dFkhASECYsn0Nvar2NLusK5OuhRMv3h
	 Z6ce9NujD5LDU77KDYjf7y9eP003GlCp8EMJLfqrvTAm8GH3/HsgjQNxNZ2TYFIRZ+
	 14YmCrgonL2yL6TA9TNpxbqruf8tt5+MnHZ6E0Df+QgMTmx9dqNvM36XZ+gXyKANPr
	 xPwJ86WLT87a7J8N3a+AEKh1NsuVwcn60pPxlTp1VND8Lr+fCG6zAuL3rDdqbfkpIA
	 1P559zwHmZdEK4sJJGLjovz8XLHH0lIuq333T/4N5B7p0AQe4zIp5R6a9cnJyqzwQn
	 70hkyT6x8KxpQ==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 07 Jun 2026 08:32:36 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <81cb20eb-a27a-45f4-98dc-7d529b3ac0b9@wanadoo.fr>
Date: Sun, 7 Jun 2026 08:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sun4i: fix refcount leak in sun4i_backend_init_sat()
To: Wentao Liang <vulab@iscas.ac.cn>, wens@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jernej.skrabec@gmail.com,
 samuel@sholland.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260607030950.83636-1-vulab@iscas.ac.cn>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20260607030950.83636-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_074153_100420_E753A94B 
X-CRM114-Status: GOOD (  19.91  )
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

Le 07/06/2026 à 05:09, Wentao Liang a écrit :
> When sun4i_backend_init_sat() calls reset_control_deassert() it
> increments the deassert_count of the reset controller, and must
> pair that with a reset_control_assert() call to decrement it.
> In the error path where clk_prepare_enable() fails, the function
> returns immediately without calling reset_control_assert(), leaking
> the reference count.  Other error paths, like the devm_clk_get()
> failure, correctly jump to the err_assert_reset label which performs
> the missing assert.
> 
> Fix the leak by using the existing err_assert_reset label in the
> clk_prepare_enable error path instead of returning directly.
> 
> Cc: stable@vger.kernel.org
> Fixes: 440d2c7b127a ("drm/sun4i: backend: Handle the SAT")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>   drivers/gpu/drm/sun4i/sun4i_backend.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
> index bc35dad53b07..c9ec5fc26f7e 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> @@ -686,7 +686,7 @@ static int sun4i_backend_init_sat(struct device *dev) {
>   	ret = clk_prepare_enable(backend->sat_clk);
>   	if (ret) {
>   		dev_err(dev, "Couldn't enable the SAT clock\n");
> -		return ret;
> +		goto err_assert_reset;
>   	}
>   
>   	return 0;

Hi,

another way to fix it and simplify the code at the same time would be to 
use devm_reset_control_get_exclusive_deasserted() and 
devm_clk_get_enabled().

just my 2c,

CJ

