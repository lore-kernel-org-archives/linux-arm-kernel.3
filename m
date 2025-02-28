Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074E0C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 18:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEWR1Biyrz/i/9OwEZXDJ1J5UyzPcJrvLTGLj7Exnds=; b=tC/h+GhC+z2kcVpRrWBHOQxqvM
	y0DngFKO8XXltVA3UpSCFgeIFjbFGqgqoxenPp6Q5NyMcYCrP17b/DbSvhs/n6hBHP8+lvRjRHQ/v
	RhrGYa0VR2EKnfKMyT+dY23Sk0qMLA87+tRJuYfJ9vEGrFse2KgV7H+SYwLTv1coQwskO0iXfNksB
	o+ESnDiBGux07DfknYt8b/4WMfVAZKUDv7g64KamJMLaj+tLFBaCytSBHzR7puu2Fs1jgh5ikNwnN
	tO/zIuWgv3YZqLAvqrxKFLdxyGYr+UFuGIcZrDK51wCSh1ofqpdaj54mYKgXi6RVOeG87bRed3uCA
	9HsteguA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5CI-0000000CAh9-2gQK;
	Fri, 28 Feb 2025 18:34:54 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to54m-0000000C8Db-2EdG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 18:27:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 083DA1034EAF8;
	Fri, 28 Feb 2025 19:26:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740767223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EEWR1Biyrz/i/9OwEZXDJ1J5UyzPcJrvLTGLj7Exnds=;
	b=dILOl6dKlPvSkD8jJQ3pREfonS5ajNyFDt0yNkJ2Bmgk2sqUHs9TQKM747E5dq1gdWxUT5
	JjYuCzYPpZwkW/JK5vHS+mvIUP1E0Q4opAw9di3+a/A4GykvnQGp+XO7xLmhV5kKDcTaRm
	BQ+xQqFdvPo4EMC8nTKIoHdotUusxvCf410fQLT1RjkHqA69JqwIljUIAjar1HUGbXC+nt
	wfQUeDba/PRyfRG9wRFGfJp8B8WVC1ftkaWvMOFyXtJPmmIuVty/XMp4YEtvOjy1c2wVzR
	JUnEsnCLSI618BX+wB5nIc70D9Rir0sWbtYEJCIPHhd67M6oCcKTVHCvakQTZw==
Message-ID: <bf3486cb-4f87-4cf4-ab6a-6c8cc627ce53@denx.de>
Date: Fri, 28 Feb 2025 17:43:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] reset: simple: Add support for Freescale i.MX95 GPU
 reset
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-3-marex@denx.de> <2425297.NG923GbCHz@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2425297.NG923GbCHz@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_102708_737832_39ECC304 
X-CRM114-Status: GOOD (  13.92  )
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

On 2/28/25 10:58 AM, Alexander Stein wrote:

Hi,

>>   drivers/reset/reset-simple.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
>> index 2760678398308..1415a941fd6eb 100644
>> --- a/drivers/reset/reset-simple.c
>> +++ b/drivers/reset/reset-simple.c
>> @@ -133,9 +133,17 @@ static const struct reset_simple_devdata reset_simple_active_low = {
>>   	.status_active_low = true,
>>   };
>>   
>> +static const struct reset_simple_devdata reset_simple_fsl_imx95_gpu_blk_ctrl = {
>> +	.reg_offset = 0x8,
> 
> Shouldn't you add ".nr_resets = 1"? Otherwise this will have 8 resets
> (resource_size(res) * BITS_PER_BYTE).

I should, thanks.

> On a side note: RM says this is a write-once register. Do we consider writing
> this register again?
> BTW: Would it be possible to disable it completely (until reset) by writing 1?
My observation is that this register is set and cannot be cleared by 
writing 0 into it, if I write 0 into this register and read it back, it 
stays at 1 .

Maybe NXP can clarify whether modelling this as reset-simple is really a 
good idea or whether it would be better to rewrite this as custom reset 
driver ?

[...]

