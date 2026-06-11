Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C10CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 17:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDBmLI1jGDHWs/rlgRqCU9JunRK8+w2FOw4F5+o3Tto=; b=JA0KJV2X5XFJOD4DMd7XXq3U2p
	9TGOjtuG4S69NBSBXMmFfZv6WBNQ8xpKukLq82YgeIIwdQ8S+RwqAgxCM5IYEvegxutgCJj3tw/pw
	JirEyUS0A6uV98aylITX6/pquvopoZAI4MOUpJwEqjdJaYQdUpft3D5wd3O2ZRtUzzk2lwEJjbeYf
	TulJtLinTrs6wTHwTjd2LOI97ceHG7stHZO5Kr1txf7sRQh8TqsWV5Vbf4n08V/7EJwB3+hRtKqPL
	UGEtKXXwM0HktbszKvEXzl9iS5eLgR0x/802ESp9ksgp193apa24pEPAmk1wDmEULURowFf4XpTZ2
	RoHqKaOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXj3w-00000009p25-0Sdj;
	Thu, 11 Jun 2026 17:19:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXj3v-00000009p1v-3Yvg;
	Thu, 11 Jun 2026 17:19:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99A65408B7;
	Thu, 11 Jun 2026 17:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2DF1F00893;
	Thu, 11 Jun 2026 17:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781198367;
	bh=BDBmLI1jGDHWs/rlgRqCU9JunRK8+w2FOw4F5+o3Tto=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=O4OJHa9FDW5jjtyg71+66wM9iLy4o1Pjj0qTyotGe6ud5WtK1XdK6x4h4xowG9XK1
	 sH7rtyOnWjqwFeTe6o0QV4LJaAysiPQnPtpOXI/O3AMnbVGgmbLZeX7Nw1fcUYD32o
	 S5ufEWL0+OuyGOiKpwiXB778bLXy8QdSzuTJLWcX3l9TxDWAzqTAZyGcu/uCIupmNi
	 Lj6ZRk9C7nNaa489Kk9eX6vuM/6qmrh+Y0E0KeoH6pZdcihbFMieBoqA1OTyPNB401
	 AnS5yJL2qhbZDA0ZGL5aR+IGU5RWwxxe5gOpD5A8AkoZ7e+Qd/SWDFroE7KTfM9JsG
	 ZUl7mVYpRnqdw==
Message-ID: <104fd807-e041-4458-9e3e-b9dedd77361c@kernel.org>
Date: Thu, 11 Jun 2026 20:19:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: {Spam?} Re: [PATCH] media: bcm2835-unicam: Fix querycap multiple
 caps
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Naushir Patuck <naush@raspberrypi.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260611-bcmpiqcap-v1-1-10cf7fb438df@kernel.org>
 <b549ea8a-76cc-4a7a-bab6-710fddeaeebd@yoseli.org>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <b549ea8a-76cc-4a7a-bab6-710fddeaeebd@yoseli.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 6/11/26 09:51, Jean-Michel Hautbois wrote:
> Hi Eugen,
> 
> Thank you for the patch.
> 
> Two issues with this one, I'm afraid.
> 
> Le 11/06/2026 à 08:09, Eugen Hristev a écrit :
>> The unicam exposes two video nodes, one for image, another for metadata.
>> Querycap should return the right caps for the respective node, not both.
>>
>> video0:
>>
>> Capabilities     : 0xa4200001
>>          Video Capture
>>          I/O MC
>>          Streaming
>>          Extended Pix Format
>>          Device Capabilities
>> Device Caps      : 0x24200001
>>          Video Capture
>>          I/O MC
>>          Streaming
>>          Extended Pix Format
>>
>> video1:
>>
>> Capabilities     : 0xa4a00000
>>          Metadata Capture
>>          I/O MC
>>          Streaming
>>          Extended Pix Format
>>          Device Capabilities
>> Device Caps      : 0x24a00000
>>          Metadata Capture
>>          I/O MC
>>          Streaming
>>          Extended Pix Format
>>
>> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
>> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
>> ---
>>   drivers/media/platform/broadcom/bcm2835-unicam.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
>> index 8d28ba0b59a3..4bf36ce80047 100644
>> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
>> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
>> @@ -1833,7 +1833,10 @@ static int unicam_querycap(struct file *file, void *priv,
>>   	strscpy(cap->driver, UNICAM_MODULE_NAME, sizeof(cap->driver));
>>   	strscpy(cap->card, UNICAM_MODULE_NAME, sizeof(cap->card));
>>   
>> -	cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_META_CAPTURE;
>> +	if (is_image_node(node))
> 
> First, it does not compile, as node is not declared here.
> 'struct unicam_node *node = video_drvdata(file);' would be needed.

Sorry, my brain must have been sleeping

> 
>> +		cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE;
>> +	else
>> +		cap->capabilities |= V4L2_CAP_META_CAPTURE;
>>   
>>   	return 0;
>>   }
>>
> 
> Second, and more important,  I don't think the current behaviour is a bug.
> Documentation/userspace-api/media/v4l/vidioc-querycap.rst states about 
> the 'capabilities' field:
> 
> "The capabilities field should contain a union of all capabilities 
> available around the several V4L2 devices exported to userspace.
> For all those devices the capabilities field returns the same set of 
> capabilities."
> 
> Per-node differentiation is the job of 'device_caps', which unicam
> already sets correctly when registering each video device (your
> v4l2-ctl output shows the Device Caps are already right).
> 
> So this looks like working as intended to me, and the patch should be
> dropped.

Thanks for taking the time to explain.
Let's drop the patch.

Eugen
> 
> Thanks,
> JM
> 
>> ---
>> base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
>> change-id: 20260611-bcmpiqcap-f893a9ea2da9
>>
>> Best regards,
>> --
>> Eugen Hristev <ehristev@kernel.org>
>>
> 


