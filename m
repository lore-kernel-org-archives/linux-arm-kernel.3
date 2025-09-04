Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E2FCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 18:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Eyv4JfVwk6E7rSyv4qxxGsrvnR26XQTwFmzC798VcA=; b=0D0CgGdPYcHDQ6OZQ7eZxTDFoN
	6odUQqAifc5SwrikMOFV7oTZLOnrGBHM+K9gEOIoLpfG6E+IjgJq9X+TU7V3dCkezkhyErph6ASfV
	1SMB64yCJCnuYOFTMvPoMxZ9wjvFMaYx7Ya9izOlQ1b9MJuUNQFOWcP8cNf/e6DccySgR/ozPFPxp
	SBYaJZsFWs+CDHa0V2U8gw/Hhn2vHcOB2hvZFEVAQ7OFj4vlbdw5GTqI+QXjUP6WpyDh9j3gVEdHl
	lWYXyj9w5hXwEuSxMYq+sDEtA3dD9xG8/Szvc02ZeMdM4mxR7NvroB4WZZovrZxfgIWU814Rz+UbR
	jj2ByMow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEkX-0000000DajU-1iLq;
	Thu, 04 Sep 2025 18:31:57 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuALO-0000000Bzze-1iY0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:49:43 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cHgnt1KWHz9srp;
	Thu,  4 Sep 2025 15:49:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756993778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Eyv4JfVwk6E7rSyv4qxxGsrvnR26XQTwFmzC798VcA=;
	b=Z8oGhy3BizEHytmaH8F6sq9GpUXO8WVDZYaX3DqqpQ5FOZLnpCLgY5+KwRcHe/2Bymwo53
	pWeX0VVqcbLJTlM/79SHzKAKZTPcxMe+OFOu+vlajVrtgz2pcbha11l+uViNnaak+dE5tC
	kdIvb4wYEbp0Cr8BIdD6BsZyQeTGT3pMmZUS19RKcBlSNN8ty8CCZXCjYiMVOANSdqXdSx
	1iKFM0oZB10Ks2J6ktdRWIVDBHng1p6JLsrJN+onB7MYAv6LiRMZ3P7h6ImasnOfyQH5cX
	ZaWy/mNKr9TO6yOdfJUnjtbuk5NeSbBsHtIrAqNZJm7WotSMIBOIZtAEdl4WWw==
Message-ID: <7d4e773b-64ac-49ce-8d8b-7a39c353d18f@mailbox.org>
Date: Thu, 4 Sep 2025 15:49:31 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-5-marex@denx.de>
 <20250324094333.7afb17a1@collabora.com>
 <c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
 <20250325084349.344a0f11@collabora.com>
 <7aadf355-edf0-46fc-b969-65c3789375ca@denx.de>
 <20250325153507.61d82e39@collabora.com>
 <4c06aef3-a254-437c-aa15-8e3eb7bf5951@denx.de>
 <20250325155231.0d1b1000@collabora.com>
 <838a0c6b-845b-428d-86b3-1480e5b8080f@mailbox.org>
 <20250904082224.113d0cd1@fedora>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250904082224.113d0cd1@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 74f787c64e361a067a0
X-MBO-RS-META: 4dihidnqffe48jkhfqpgw3ysi95xrxr6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_064942_594704_8E7512CE 
X-CRM114-Status: GOOD (  23.30  )
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

On 9/4/25 8:22 AM, Boris Brezillon wrote:
> Hello Marek,

Hello Boris,

>> Can you please test the following patch (also attached) on one of your
>> devices, and tell me what the status is at the end . The diff sets the
>> GLB_HALT bit and then clears it again, which I suspect should first halt
>> the GPU and (this is what I am unsure about) then again un-halt/resume
>> the GPU ?
> 
> It doesn't work like that. What you're describing is like executing
> "shutdown" on your terminal and then typing "boot" on the keyboard
> after your computer has been shut down.

That is what I thought , yes .

I think what I am looking for is the "power key" .

[...]

>> That means, the GPU remains halted at the end, even if the "GLB_HALT"
>> bit is cleared before the last print. The clearing of GLB_HALT is also
>> what panthor_fw_post_reset() does.
> 
> After the halt has been processed by the FW, the memory region where
> you check the halt status again is inert, since the micro-controller
> (MCU) supposed to update those bits is off at this point. The FW
> interface is really just a shared memory region between the CPU and
> MCU, nothing more.

Right.

>> I suspect the extra soft reset I did before "un-halted" the GPU and
>> allowed it to proceed.
> 
> Hm, not quite. I mean, you still need to explicitly boot the MCU after
> a reset, which is what the write to MCU_CONTROL [1] does. What the
> soft-reset does though, is reset all GPU blocks, including the MCU.
> This means the MCU starts from a fresh state when you reach [1].

I have a feeling the write to MCU_CONTROL does nothing in my case.

Is there some way to probe the MCU state before/after setting GLB_HALT, 
and also before/after the MCU_CONTROL write, using 
gpu_read()/gpu_write() register operations, to find out what is going on 
with the MCU at each point ?

