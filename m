Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800CDD73E83
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfgVT6JGIMR6eXQ8tXpPICGL+iN+h0cZ4Wiaawccogo=; b=0LGUiSGNUbwJlq8gpd2KlMU1L9
	4StQH4xUfEJxiWFZ+BvbeEgSkY/ejdN/tYX7W60KF46or/D/V4ZLY4Tw9ImzAbsKLAz1xssW1+o79
	0Q+wSEFtRof9Qct3Hi9yQsaEE9mAxGM5opvfsaKUyK27KOgHrED1iA+D4Sk/7EnvHGZbq+q6WunGg
	sXEjuWrx2Jo0pg4oBHxZVCVbzq49cuOIzRzWKz8BExTcLbrk+CMceqUQINY5VxJOVJQxhlwzZKXMG
	LRXt1LsMDdkUp59aQ6ssLyJvIUHB7KC8BS8nsFn/ZQsfbHCSrnVWbAQrwjPxYhmhRRsiTed2q5WM4
	ueVc932A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWBQ-00000000TL4-0kPV;
	Thu, 29 Jan 2026 17:51:56 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWBN-00000000TKa-1YeK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:51:54 +0000
Message-ID: <fbc56ced-ad76-492d-b446-630f97d427b1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769709110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xfgVT6JGIMR6eXQ8tXpPICGL+iN+h0cZ4Wiaawccogo=;
	b=YF0lX1Nk/T7lN9tZtrutoKYpRmrW+BcUMWtzRczMy8JGsv2AdWYHgHwxqWCLam3ag4Z0xB
	L4pzRaDulqKHOAfy6gDYDZwfrhvAs9jxOJ4g5yFFH1yBha8mrJgXxE/fby4KZ5Fw6lB0n1
	OVjTYXBp+CiHFsmgqT3R5QeD5SJPdWY=
Date: Thu, 29 Jan 2026 12:51:47 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from
 registers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, Takashi Iwai <tiwai@suse.com>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
 <20260129172315.3871602-3-sean.anderson@linux.dev>
 <7c0d283c-f6d0-4ba6-9686-ae6dcfaa4389@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <7c0d283c-f6d0-4ba6-9686-ae6dcfaa4389@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_095153_568773_C94027C5 
X-CRM114-Status: GOOD (  15.20  )
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

On 1/29/26 12:37, Andrew Lunn wrote:
>> -	ret = of_property_read_u32(node, "xlnx,num-channels", &drv_data->channels);
>> -	if (ret < 0) {
>> -		dev_err(dev, "cannot get supported channels\n");
>> -		return ret;
>> -	}
> 
> I don't know this device at all, so i might be asking dumb
> questions....
> 
> It is possible that the device supports multiple channels, but the use
> case is mono, and so xlnx,num-channels is 1 in DT? Would that break
> given your change?

drv_data->channels is multiplied by 2, so there is always an even number
of channels. Pairs of channels are always muxed together and AFAICT
there's no way to disable them individually.

>> -	ret = of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_width);
> 
> Could it be the device supports 24 bits, but the use case only wants
> 16, and so has this property set to 16?

I don't think that's possible. There's an option to output 32-bit audio,
but none to reduce 24-bit audio to 16 bit.

For some perspective, this is a soft core and these properties reflect
the configuration chosen when the core was built. The data path is fixed
and these devicetree properties exist to tell the driver how the core
was configured. If you set xlnx,dwidth to 16 and the core was configured
for 24-bit audio, you will silently get 24-bit audio (and the clocks
will be incorrect).

--Sean

