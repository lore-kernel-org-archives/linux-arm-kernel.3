Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2998EBFD17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GL35w21i6Oup4PSOvN4GGMypaRuDityLXo5jWceivLQ=; b=vlwNn/Ir+sxIAcDFRK4HLSnoPl
	rI8P/t5H2IGsqGJean3W78FUJeunKM1DpAkhQSAdC0v828YVOpF9LwiQNlPdd6smfw7eYpaexM+MT
	Vw3J+UVkALNlcCf5ozQZnvkzpBvQvl9GbhYsEKr7utp2SS19lc7t9FM159GL269DfvmQGQlbV7JhU
	YkpC1xqpnsO0j4HYb3HkID/bmLWI/ljwI6CDsAB6Y+xrW8SADDnWAwHRye2plyji0O5pNCwagtHLj
	zXTDo8EFAdIu6DNijulCAwLc0t2q1nx6hZxREG8oOmiFTsh0dhJsMkW8wni9QW/KHO3xaaeBWfRC8
	6bsGEhgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCChA-0000000FH2Q-0FTJ;
	Mon, 13 Apr 2026 08:31:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCh7-0000000FH0T-1ItY
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 08:30:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GL35w21i6Oup4PSOvN4GGMypaRuDityLXo5jWceivLQ=; b=BAluyxU9buv0wLB7IQqBslXd0o
	vm9dmL5oCN5/GnTrAW9X5WLNMGDA9wz1aL/GxPRXYmIG60bwFbnRmPVv7/f+5N09c/xVqjhau35hm
	72ZKU9nRCHPrJkn0EjTfCDf8nfRA3dLDvJil99lQvEx6zvr5b3DTGtDzxUQ9WXRmV3urPe75DrrXO
	4m/M928na3eBuYL7PupYcg4pnyKcYmFJ3YPk9QbQRrRB9qWwSaxMXgw3MK2dpDoFEiQa/88ofEbfC
	zEZfXghigamQI/Slc8g1sTaZbvkrzlY9VK9xiMp0FyZv/4vveXqm03TkK5KlCO2QajZEuXNlsYQdb
	uriClPxA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCh3-0000000GOkl-2MKM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:30:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 370E635A6;
	Mon, 13 Apr 2026 01:30:44 -0700 (PDT)
Received: from [10.57.61.173] (unknown [10.57.61.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A5683F641;
	Mon, 13 Apr 2026 01:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776069049; bh=RFHIm2Sf0rt3owYwPBLSJ4ZIUoXyzf+Q4lHrYTPMaSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sRgWKPoQHJHcJ1UBIp3DIbF5++EBsP6n06u0lDoKLYwA3otYtOfl3eA2xDufoKHIf
	 tfERiSCPA8F9v+1/5WyiseslUFr152Cte2GY+bN/MDbS4JyNa3QEx3FWPQa0KoWnsg
	 HEqeGmRC5+/QTgogguLbpNfrhN5bUMaZwnLm2zCw=
Message-ID: <8bdc4347-c8ed-40e8-b55b-5d5cd6392653@arm.com>
Date: Mon, 13 Apr 2026 09:30:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] virt: arm-cca-guest: fix error check for
 RSI_INCOMPLETE
To: Sami Mujawar <sami.mujawar@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com,
 gshan@redhat.com, YeoReum.Yun@arm.com,
 Jagdish Gediya <Jagdish.Gediya@arm.com>
References: <20260410163636.259443-1-sami.mujawar@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260410163636.259443-1-sami.mujawar@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_093053_968413_945123F4 
X-CRM114-Status: GOOD (  17.70  )
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

On 10/04/2026 17:36, Sami Mujawar wrote:
> The RSI interface can return RSI_INCOMPLETE when a report spans
> multiple granules. This is an expected condition and should not be
> treated as a fatal error.
> 
> Currently, arm_cca_report_new() checks for `info.result != RSI_SUCCESS`
> and bails out, which incorrectly flags RSI_INCOMPLETE as a failure.
> Fix the check to only break out on results other than RSI_SUCCESS or
> RSI_INCOMPLETE.
> 
> This ensures partial reports are handled correctly and avoids spurious
> -ENXIO errors when generating attestation reports.
> 
> Fixes: 7999edc484ca ("virt: arm-cca-guest: TSM_REPORT support for realms")
> Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
> Reported-by: Jagdish Gediya <Jagdish.Gediya@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/virt/coco/arm-cca-guest/arm-cca-guest.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> index 0c9ea24a200c..66d00b6ceb78 100644
> --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> +++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> @@ -157,7 +157,8 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
>  		} while (info.result == RSI_INCOMPLETE &&
>  			 info.offset < RSI_GRANULE_SIZE);
>  
> -		if (info.result != RSI_SUCCESS) {
> +		/* Break out in case of failure */
> +		if (info.result != RSI_SUCCESS && info.result != RSI_INCOMPLETE) {
>  			ret = -ENXIO;
>  			token_size = 0;
>  			goto exit_free_granule_page;


