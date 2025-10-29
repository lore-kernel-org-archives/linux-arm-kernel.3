Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B60CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTY+fh4/ukja1oSr3pfFFJ7ZbrQGeiX8cxOtmfsJPd4=; b=i/ood1Ck0DkBvKsCXlzJA1UlRn
	5Pp/6orfTOmgXZ05p9QoFHzRb4+iCA9N/6KCdJTssBT4GkAI/ozCYXtHTws99TlnI9lc5hMEEzG61
	si/k3nSOuhMhckbkTJ9FhRBL5kLx+d8yt3ZAtk8V0LrHjTJDhiYPt+NPP1FrED1Ie62b75Ls8QjYQ
	dG0qOtHQdDx7olJDuVFelX4iNHsGaFRT81YPDpZFmKh3W/Dr3/UZb0syg9NlqDzZcPVlYACpr6TQ7
	37KsfQNdVmbZ4E5hdURf75yxe8YHtqgyezKPYN7siC9aJpO54tUzSU8kE2ZJt4rBpCGsqqSlkCF/e
	1VjfvXuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE653-00000001Kgm-1V0j;
	Wed, 29 Oct 2025 13:19:13 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE650-00000001KeZ-2TGy;
	Wed, 29 Oct 2025 13:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=gTY+fh4/ukja1oSr3pfFFJ7ZbrQGeiX8cxOtmfsJPd4=; b=HviZ1Y9fNLqZQLJBsqf+T5iiuZ
	VHg4Qq5Zbf3kkn2oBIkKV32E56t/jxmh8kAkCTNx9/v8IaqTbsLd+707COElupQAfkzwVm5wQgb8H
	9vS5w/DArwM4rgQaoPTo6VLw39iDXuSmLjOhmxEtWY09lHZQAm1yLZxI08zaRKWSx3iT9JK3ymeAy
	iGxc31YFFgFE2WUgao8mFzvkW/5+Facdw7ONRSCrnISwRzm4JnspiG2hfvEVANaK4j4VTYJCdBgqY
	G4qLMhiMLJeNisDW5gWdspBpX1Df8MIxpwt36HgsNBe+DEiWwYcVszxCttm4TJa6jdn6rshAHaCdd
	YRxbJP3g==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vE64q-00Gcm4-7S; Wed, 29 Oct 2025 14:19:00 +0100
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1vE64o-000l86-63; Wed, 29 Oct 2025 14:19:00 +0100
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail with esmtp (Exim 4.96)
	(envelope-from <uajain@igalia.com>)
	id 1vE64n-001UFh-1y;
	Wed, 29 Oct 2025 14:18:58 +0100
MIME-Version: 1.0
Date: Wed, 29 Oct 2025 13:18:57 +0000
From: uajain <uajain@igalia.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Stefan Wahren
 <wahrenst@gmx.net>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>, Rohit Chavan <roheetchavan@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: vchiq_arm: delete unnecessary check
In-Reply-To: <aQIS6Q73Ss8xyJTD@stanley.mountain>
References: <aQIS6Q73Ss8xyJTD@stanley.mountain>
Message-ID: <86db61cb04863e9799eb20962a47ecdc@igalia.com>
X-Sender: uajain@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_061910_921147_E4F7ACBA 
X-CRM114-Status: GOOD (  12.87  )
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

On 2025-10-29 13:13, Dan Carpenter wrote:
> Both sides of this if else statement print exactly the same thing.
> Delete the unnecessary if statement.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

LGTM,
Reviewed-by: Umang Jain <uajain@igalia.com>

> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c   | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index e2cac0898b8f..130be2f58342 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -4001,10 +4001,7 @@ void vchiq_log_dump_mem(struct device *dev, const char *label, u32 addr,
>  		}
>  		*s++ = '\0';
>  
> -		if (label && (*label != '\0'))
> -			dev_dbg(dev, "core: %s: %08x: %s\n", label, addr, line_buf);
> -		else
> -			dev_dbg(dev, "core: %s: %08x: %s\n", label, addr, line_buf);
> +		dev_dbg(dev, "core: %s: %08x: %s\n", label, addr, line_buf);
>  
>  		addr += 16;
>  		mem += 16;

