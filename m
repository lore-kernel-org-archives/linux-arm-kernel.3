Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0807CC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 11:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYioAv1QtY2jiiIOxBbQCs8XERepMbW2M3Sg9GYqtAQ=; b=vKCTEI0FVpb9eaSbeuVtfYCtKZ
	RrmpB7RDCv/V1ns0wnnEQ6Qyb3PwhwPsCVAD3xC8RbnBCFcQHiAILHuoTWq4CrtmuSNwZPGDVlpDu
	6XRftsJXllj8R13UPVJLeTepnBMtZrrEkork0tuwqf+aEJbeU7rgFowXI/sZwXTpSFNyPZ1s331pX
	qkdc77CKfF51KIi8u57HZliKzwKWTHlDdHCWd/7cXMP+k1NiYG5U8Puc1b5xg7Tg1dL3ChJ8i9kSG
	e4ScAgzzgieDEVkXAM/QLRyCAOgqttiWWHywg7FM8oMxl1sv3APdSTzTM0QYp3QNbc/FB+HeUkszr
	K6H0CxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyv1-000000092wA-3dgx;
	Mon, 19 May 2025 11:44:31 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGysy-000000092T6-1vQ5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 11:42:25 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EB91241086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747654941; bh=iYioAv1QtY2jiiIOxBbQCs8XERepMbW2M3Sg9GYqtAQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CruDbJtfD9besvy1uHkdDkSIG14vlZZi9KI7M7Dk9hZ3EC10AzYGj1QakCxHkNcaP
	 Jh3rgslDlimkSXAWaa/z3RhwNN9IN0eBj9zfYHej5bbSwhnbahqO3qj2sYa0TloZA0
	 fai1pHZQj1VDc2zvkNn24kJWVwkyELreEyAKnmrjGi+HLYD8wIdP4kki25TkE4gOLw
	 VW/7QsWiCaNEroGkzdelnuHDkId+vT1iRNsvjXDuMwIgn/5cF2deiQwKmBXbqKoy3q
	 McEFTGmP81sh8ixvRWJTk4zThLc1uUqlNijLt3r8eNjFpCIqoLrvx9ijUmC9VhlzD3
	 wcNCGFM9VxxXA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EB91241086;
	Mon, 19 May 2025 11:42:20 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
 suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
 skhan@linuxfoundation.org
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Hendrik
 Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: Re: [PATCH] docs: fix "incase" typo in coresight/panic.rst
In-Reply-To: <20250513110931.15072-1-hendrik.hamerlinck@hammernet.be>
References: <20250513110931.15072-1-hendrik.hamerlinck@hammernet.be>
Date: Mon, 19 May 2025 05:42:17 -0600
Message-ID: <87frh0kesm.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_044224_495061_4DA5312F 
X-CRM114-Status: GOOD (  16.36  )
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

Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be> writes:

> Corrects a spelling mistake in Documentation/trace/coresight/panic.rst
> where "incase" was used instead of "in case".
>
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> ---
>  Documentation/trace/coresight/panic.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/trace/coresight/panic.rst b/Documentation/trace/coresight/panic.rst
> index a58aa914c241..6e4bde953cae 100644
> --- a/Documentation/trace/coresight/panic.rst
> +++ b/Documentation/trace/coresight/panic.rst
> @@ -67,8 +67,8 @@ Trace data captured at the time of panic, can be read from rebooted kernel
>  or from crashdump kernel using a special device file /dev/crash_tmc_xxx.
>  This device file is created only when there is a valid crashdata available.
>  
> -General flow of trace capture and decode incase of kernel panic
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +General flow of trace capture and decode in case of kernel panic
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  1. Enable source and sink on all the cores using the sysfs interface.

Applied, thanks.

jon

