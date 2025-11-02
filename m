Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C9BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 16:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yXnbX8obOxTZByxtaFJTonCzW0Sj9xEqQruBvutIFTA=; b=HfYl6BICPROK76cD6vNjz8LKaW
	Ng6nLazj67WO5yaKrq04GwgGC9gidmSMtG6IoWHk5KZUHnyQBhYTSoq2VgwrZSYp1Z1qHG9NMYoa0
	yiSWHjdIYPrR6q7D2A3+AJGYeM6Fef2pBK7aBW348J8OKcW7MwpUCEAnH+FyecrRcksKvVco4QVFf
	ytQPFgL225cukvQyWCVr4PakPG86VL5um/9k5Aj3klEMdGefTaXosdHup506G/WoXvaEUedIK1iP1
	qgHGQrw5UsCXF2mV/fwXdEBMfn82K8DNbtWbWLRex4D+as4cMNXwJoq6xL8xqdJEvhexNxASr2TMt
	iuG/F7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFaXm-00000008dQ2-20bX;
	Sun, 02 Nov 2025 16:03:02 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFaXj-00000008dPQ-0AtU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 16:03:00 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4czzyF0XKyz9scN;
	Sun,  2 Nov 2025 17:02:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762099365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yXnbX8obOxTZByxtaFJTonCzW0Sj9xEqQruBvutIFTA=;
	b=Ue/O+sHMUIkVTVRZaqnQY+gmPnJbUOOEBZIbT8CGO97u8N3tB+gLpKYvh8BEZtSersVGge
	upilb0Rhvh6hy5E5+SfBTkm5u7AMVoh4LoIdO9lVcDn7ddtBLV0KOk2b/GQsWIO7THRJeK
	HsvvmAILyejprOUKQjlOBCmfc9CjlbUUgjpXAOtVTqYmxF+ILu849OgGIF1BDsjXxQQx9x
	rGdzrgx0nwi6Rrt0CVCFLfodWD7QfgB+/t67TckYeO+UHNaUE+BblzA2MXBOD+xbDisIK0
	Gv3wb3/8kkofEhxIpZfEYCRKdtpTJSiDdzv7v+4RI5nWyxcmOcHIKdGUeK9qRA==
Message-ID: <f9057853-8b43-4ab6-ae65-ee5e4d569c46@mailbox.org>
Date: Sun, 2 Nov 2025 17:02:37 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
To: Shawn Guo <shawnguo2@yeah.net>, Rain Yang <jiyu.yang@oss.nxp.com>
Cc: airlied@gmail.com, boris.brezillon@collabora.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, robh@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org, simona@ffwll.ch, sre@kernel.org, steven.price@arm.com,
 tzimmermann@suse.de, xianzhong.li@nxp.com
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
 <ba95487c-ada7-48a4-90b7-fd99a0278f51@mailbox.org> <aP7DZCMk1pQ7wsFo@dragon>
 <aQB88c_AEC1RAZtH@oss.nxp.com> <aQCIAfyUC6N5y2fB@dragon>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aQCIAfyUC6N5y2fB@dragon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: s6w1ijnr4si371hym9im6ykirojs63uu
X-MBO-RS-ID: 393e84e1997a987fb3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_080259_234533_FCE00C8E 
X-CRM114-Status: GOOD (  14.11  )
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

On 10/28/25 10:08 AM, Shawn Guo wrote:
> On Tue, Oct 28, 2025 at 04:21:05PM +0800, Rain Yang wrote:
>> On Mon, Oct 27, 2025 at 08:57:08AM +0800, Shawn Guo wrote:
>>> On Sat, Oct 11, 2025 at 12:53:29PM +0200, Marek Vasut wrote:
>>>> On 9/25/25 10:38 PM, Marek Vasut wrote:
>>>>> The instance of the GPU populated in i.MX95 is the G310, describe this
>>>>> GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
>>>> Is there still anything that should be changed with this patchset, or can it
>>>> be applied ?
>>>
>>> I'm waiting binding change to be applied first.  Or is it already done?
>>>
>>> Shawn
>>>
>> Hi Shawn,
>> It might be better for Marek to remove the always-on GPUAPB clock from the DTS, given that
>> it's an SCMI protocol clock and the kernel expects it to be available during operations.
>>
>> Also, the gpu_fix_reg appears unnecessary for the driver and could be removed[1].
>>
>> [1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a8cb5ca53690aa809f4f65e14192753073e61a71,
>> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=02df3543f3e0ea572e2c739605ebd6c20e1149c4
> 
> Ah, sorry! I did not know we haven't reached agreement on the change.
The feedback above is new to me, so I am somewhat surprised too.

I'll just send a rebased V4 now.

