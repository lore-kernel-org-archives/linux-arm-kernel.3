Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05485C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 22:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROm4P9AhLZ98ncBE9zHDbf3TjPOygTmfSMJu/CK7f+U=; b=y3pPDQslO88td7qlihDjBXcQm1
	ESm+OSbhuZpyDxTZG8zvfJcxeuPJHuL2H+4fsjSPfKYy60UKBWbHSnoC1OLoAWlrvLg4yZAufwPpd
	ScLGsL48tp27lnEUn0iRvgKwNgFEyrk+MGpD5QfzHBGqq+JQJl9K8PUbJoWLf+AuzIkNX3bFiCUE4
	EbKvRXi6ZyYsTY7qt+FgGMRYPahnnIjuMBBqDVzjt1FVHPo8bc2dWq4a6J1PPympJhtO0Q64gzfvh
	mfuctrX0QU+fT0BErb4e3fAwJp+crzxucbLV9hWoRUIbPwzpKFtyrcxKVkRW4uBM778tvbtr/QKKE
	X5eyClxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cLB-00000003NuO-1rjs;
	Fri, 04 Sep 2026 22:24:57 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cL9-00000003Nte-3BWs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 22:24:56 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-86b03b75fecso26821487b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 15:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788560694; x=1789165494; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ROm4P9AhLZ98ncBE9zHDbf3TjPOygTmfSMJu/CK7f+U=;
        b=WKjUtTT+6qSdknI/0Zuih+uZ6C757F0gZnOAJhNlpxY3pqLltZNiKzMc4JiPQdVyxH
         0OQ9pkiMhVRd1Y1zdP7U0SvtbESGp2J0zbFZ9quL3lnAIHN3G0DYA79Ybjyd7f5AKSnB
         +FTiTMJBVG/ggO9WRIqrNZiqVemBXZwP7HYgR1IJZHYJmkDYpUf3goRxlvNejl6VJnaS
         VRUQvigGBXcMk9EQLH3TPvBlPNNAC/LXmjh2raf/Tdc0qMeSbzqslLdl29XNsWZ2dJkW
         BqL8eMP+YisVbVn/JUW+XzJfmh1PMkswGHRFaaoe3aRAEs76bBrm/zOmpRC2bM31T0Ct
         HkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788560694; x=1789165494;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROm4P9AhLZ98ncBE9zHDbf3TjPOygTmfSMJu/CK7f+U=;
        b=KOcKu/8SyxoOK0t5u+92LULiaqkFJ0o4xCbsEBLPIjtTJOKLRoUHWdcpB1APyi9GrS
         AWfJDb/Ql6gclaIOS5GxIRCXN6oJwtbTzeirIdvuuiyFs9K2c64NUcIkSZhya5NCkqVP
         slo3KG4CXY9+jNbqYrUZIT8Z++33fxcFM9Xu/hyIr76HB94FO2tjHnwc+hgMgbHIwWnr
         jEyis4tUcff/cFpP4HtCGMSAAEfUvoXv/ySf8yqUGyxTR+v1dmEWNQd0q6qnogwK1HYC
         1Mz+9I98rwz+lkIHm4jRmBBAkG8RGgMYqaR36E89XvSdsWM17h/VJjzYXXJkKKGtEoVI
         1ddA==
X-Forwarded-Encrypted: i=1; AKwUvByT+j2exQ5jg8n8bvRRcu8ODY1zsQSt525xZKRidO8WHhBCwFA692kyH4WRSsWbqui5GcX5IePGepsXGFbt4wju@lists.infradead.org
X-Gm-Message-State: AFuF++kLDZnmSNvRnE+bY2q3hYqAxj1xLOEhO+nYiXSK41X1obcLvoZG
	AGyVGuiI0bx1vLRnRisKb6MjfU2GB1bGCbQZ6NvHp6SPZD2/K3MTRh86
X-Gm-Gg: AYBFou2k8zXjtiuG+kqaW9VLyegfY2kpn0VqL8TkITs735xNya4rV93Bx6VCkg3SUoC
	uZYdYsKn8EuxrcczcPJmryu6eBu2guwIOG0jCyPAZOqyPZdFSt1kQrIp1zobMPkwL0BjiHLdBAy
	9foRXLc3haVM5Cc5hsDdb/63uartCc110IfQ4KVVuzkTS5ohLs4valMvV2slsQWBMr3HQ/lmVxx
	3Pj4pH9cm/Dc9e7U054tCJcK1RAK5H6chVrolLQU7+yTdI4xskPCZXN8Q5WNXaaWDZr7Nz4c+xp
	UBUNDpYYWs7Yc9C8Km/qCIZs1y68ArmbAVpolk8+P6JUfS+Oz2DPVRCvxr2R8K1jOF8eBO3J5pp
	XBfrS9UOkPqbrwotCzayPhfp+GsfPGSYcaRs6Dl3BIVcmIDs8S2pTzgHby6KYPKT6OAwveTU/X/
	3CS9AtFKTUD/j4u8MkuVoxo5XcO+U6R56PhF+zoKOflswVq76Pc5G5T+l5V/I1YBvM30ST
X-Received: by 2002:a05:690c:60c5:b0:853:d1fb:2121 with SMTP id 00721157ae682-87121cc3b26mr48539627b3.1.1788560693673;
        Fri, 04 Sep 2026 15:24:53 -0700 (PDT)
Received: from localhost ([2804:30c:94d:7300:da0f:c2c1:1aa6:43da])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149ebe7d6sm28056717b3.19.2026.09.04.15.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 15:24:53 -0700 (PDT)
Date: Fri, 4 Sep 2026 19:25:45 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: mdshahid03@gmail.com
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, rjui@broadcom.com, sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] iio: adc: bcm_iproc_adc: use device-managed
 resources
Message-ID: <aptFaaWIJ_azy9Ok@debian-BULLSEYE-live-builder-AMD64>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
 <20260901144030.509802-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901144030.509802-1-mdshahid03@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_152455_803019_1F39746B 
X-CRM114-Status: GOOD (  14.98  )
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

Hello Shahid,

On 09/01, mdshahid03@gmail.com wrote:
> Hi all,
> 
> Thanks for the reviews and suggestions.
> 
> For v3, I will incorporate the following changes:
> 
> Patch 2/5:
> -Add the direct includes for <linux/bits.h>, <linux/types.h>, and <linux/array_size.h>.
>  Keep <linux/device-id/of.h> and <linux/iio/types.h> out, as these are already provided through the appropriate headers.
> Patch 5/5:
> -Remove the now-unnecessary platform_set_drvdata().
> -Return devm_iio_device_register() directly.
> -Remove the unnecessary backticks around function names in the commit message.
> 
> For patch 3/5, I understand that splitting the ADC cleanup into a follow-up patch would be preferable from a patch-scope 
> perspective.I will split this into a separate patch for v3.
> 
> Please let me know if I have misunderstood any of the review comments.

I believe the above list is correct.

With best regards,
Marcelo

