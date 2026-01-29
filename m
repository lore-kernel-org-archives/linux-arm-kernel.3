Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00085D73E83
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbQkO/aU6GO1ByLXLbgZaMgMyf+e1d/FazyAtfU3Usc=; b=l5dkToiil8DadAeQYul/O20p3d
	CWr/N3jccWlwyhDGg5aUTraeM+2qpL8b+F4cIKeRDyuZWjGikIdl4iRykKLRrqtforyUQS2/qbHGz
	Z5P/90YoXIbVqnl6ZInNWSW497oQ3TvYFlB8h4acQV0WZcYJdx0ey3oEIUbiscZ6h50Qouor+p4Uo
	NX0vpZuMUKbHq7M3zQHviD73sjamAU5246gRXh+j9I4PAuBLZYMvUAp/0sAflq1yB0MQ7Y7zkloeY
	xQijPvNXfuYckIFuFGLiPhBtjEUgWEZMxGM0ukk6Jj/G02jx2PxMQjubsv4Jfwm7xnf4luXfq+CMK
	cn9THQ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlW6H-00000000T77-1LvT;
	Thu, 29 Jan 2026 17:46:37 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlW6E-00000000T6k-0kaE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:46:35 +0000
Message-ID: <a95d7feb-4d94-4b25-be96-c7c367342c19@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769708791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sbQkO/aU6GO1ByLXLbgZaMgMyf+e1d/FazyAtfU3Usc=;
	b=sY+tz50AYFXBsC6bljckZOdSlmfyEXAcftS8CKgQCNTOjImPluZCAXtLfgcvmvE4s1lvEM
	+sN8/m4q5L5ohdcFHV5t5g0m/xQ3gvgfXinC3WU3hRdmh6ZyskdGACWzD94JEcOFOPjjnL
	VyfKUFzpi02PxRmAbM2lG1zaUE+TMiU=
Date: Thu, 29 Jan 2026 12:46:27 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from
 registers
To: Mark Brown <broonie@kernel.org>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Michal Simek <michal.simek@amd.com>,
 Takashi Iwai <tiwai@suse.com>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
 <20260129172315.3871602-3-sean.anderson@linux.dev>
 <700e4e67-a2ed-4b37-a00b-303bbc5ee6cd@sirena.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <700e4e67-a2ed-4b37-a00b-303bbc5ee6cd@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_094634_532545_66A8068C 
X-CRM114-Status: GOOD (  12.73  )
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

On 1/29/26 12:27, Mark Brown wrote:
> On Thu, Jan 29, 2026 at 12:23:15PM -0500, Sean Anderson wrote:
> 
>> -	ret = of_property_read_u32(node, "xlnx,num-channels", &drv_data->channels);
> 
>> -	ret = of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_width);
> 
> Given that the properties already exist it seems wise to continue to
> parse them if available and prefer them over what we read from the
> hardware, it would not shock me to discover that hardware exists where
> the registers are inaccurate or need overriding due to bugs.

I would be surprised if such hardware exists. These properties are
automatically generated by Xilinx's tools based on the HDL core's
properties. This has a few consequences:

- They always exactly match the hardware unless someone has gone in and
  modified them. I think this is unlikely in this case because they
  directly reflect parameters that should not need to be adjusted.
- Driver authors tend to use them even when there are hardware registers
  available with the same information, as Xilinx has not always been
  consistent in adding such registers.

I am not aware of any errata regarding incorrect generation of
properties for this device or cases where the number of channels or bit
depth was incorrect.

--Sean

