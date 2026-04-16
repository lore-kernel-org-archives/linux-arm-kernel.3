Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE841F8A140
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 07:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDw1aA0aJGL5LVw4zkko2JKL4HHId3Bi3Out6Lm4kEs=; b=i0WTJUwrsaTRgT2Ij/Na2PXunm
	VRomFGAUW4aPI5HuYEb1BRrk3+S5TkVfIgOObBvOQ3zK73hiO2/Nq21T24wjUklK1UphxsUKSln9v
	hP4+3inuwLOLvBfN/brMeIItBr5/GpHspJrv2qLAL2YkRxBM0BbWEq3HadN7ey8Q1b4yfnIZ6DagK
	x6k3nzm1J9RX8yZ7tfsoUpvd8LpHQtpB3aau0jJh534JUzCmRcYPjT6XWpzE3fJvqRdgax2rPMb9w
	l/bU2vbfFh+pSgzRlL28gQV+43GlaNOkCqgBqySIRUVaPkEdShBmAIhDn54KK/74ooh7GeGFSj6VN
	mqSaGp2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDHbg-000000029L0-2R7m;
	Thu, 16 Apr 2026 07:57:48 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDHbe-000000029KU-1T6I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 07:57:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EC70FC5C3C8;
	Thu, 16 Apr 2026 07:58:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0AEF75FDEB;
	Thu, 16 Apr 2026 07:57:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC9FB10459AF6;
	Thu, 16 Apr 2026 09:57:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776326260; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=wDw1aA0aJGL5LVw4zkko2JKL4HHId3Bi3Out6Lm4kEs=;
	b=M0udllnPe/Q05WsEcZoNNjkjkms1oP8gEzoT+kTRbsnB3G+xO7wJC8G82V8NOMQ7XTjqDR
	hl9ME7re9eBX6y0YUJp6YzSi3z2MuLHtzG51zeADDzJu98xrahg7l/uFMHMNPy0Wi1VLYD
	3SGPAU3zNltVXqPG6gDcVn8saRrwdG9/YJg8DzrJWmA8PrcAjD/7n3vgYfKGhHMtexwCgt
	2BooONaf+eB9JdAS4kQ5BQ5FhIJtAsOzYgcevff94hwkcUZSbXbegLHcoIkFYyznIbQjlQ
	BjUy0AqcvXmtWzEtXLW5j7vZk8BYCR8QYRRm0dVcNsH88fSogZs8Advp6ozidA==
Message-ID: <2721356a-e905-4074-a5c5-025f18b8fb27@bootlin.com>
Date: Thu, 16 Apr 2026 09:57:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] pwm: sun50i: Add H616 PWM support
To: bigunclemax@gmail.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 jernej.skrabec@gmail.com, joao@schimsalabim.eu, jstultz@google.com,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-sunxi@lists.linux.dev, p.zabel@pengutronix.de, paulk@sys-base.io,
 robh@kernel.org, samuel@sholland.org, thomas.petazzoni@bootlin.com,
 u.kleine-koenig@baylibre.com, wens@csie.org
References: <20260305091959.2530374-3-richard.genoud@bootlin.com>
 <20260413123920.2459916-1-bigunclemax@gmail.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20260413123920.2459916-1-bigunclemax@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_005746_534048_065CFA24 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

Le 13/04/2026 à 14:39, bigunclemax@gmail.com a écrit :
> Hi Richard,
> 
>> +
>> +/* PWM Capture Fall Lock Register */
>> +#define H616_PWM_CFLR(x)		(0x74 + (x) * 0x20)
>> +
>> +#define H616_PWM_PAIR_IDX(chan)		((chan) >> 2)
>> +
> 
> It looks like there's a typo or a mistake in the PAIR_IDX calculation.
> It should be like ((chan) >> 1).
> For example, for the 5th channel the result will be 1, but it should be 2.
Good catch!

I mainly tested with PWM1 as it's the only one easily accessible with a 
scope.

I'll change that in the next iteration.

Thanks!

> 
> Best regards
> Maksim
> 


