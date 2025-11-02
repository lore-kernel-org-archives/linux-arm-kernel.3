Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EF9CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 17:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFpdLMII0EG/uXMQS+E4Vw7nKG+ReHRISfwxssVFI9s=; b=KWfUuDAyG5dw4bVNT9Ddspx5Mv
	ERBZXIKfXa1Ps8azmuXUMxKA7Dt+YFBAmuZWQSg08bNnC5wz4xGIqwR9aoshASQIE2PiN/C0bQTZ5
	99EgDrVIBsW2Af9UkIDkW73r9vRGila4bPJRdpVPQNCDJ4uKb9SVvsEt/liWu0HZi7UfWckF93s2L
	K8pi/RwlDl5cofwggNweTtrrtSjLNSuGtfZqYOY2ezLU/148MScfr09vXlZ7072vp4/d9iQ2+IVRG
	G+6GnfBKl5NztgGtXiySrizOohoRO66lMOsn5vkBdbJ9s8qs942t7nQJdjtHTI94zbGi8UbeTUlJg
	+sThdG6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFbft-00000008gO2-1Yu7;
	Sun, 02 Nov 2025 17:15:29 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFbfq-00000008gNe-3tEd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 17:15:28 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d01Z20q5Tz9slM;
	Sun,  2 Nov 2025 18:15:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762103722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BFpdLMII0EG/uXMQS+E4Vw7nKG+ReHRISfwxssVFI9s=;
	b=UvXRZ7bDu9O4ZrHV72XvvB6yU3Z5LI+jaMxZyKdMUO3KU2hA46wC+PxOVP9bzqNXvsneUs
	sl9HWw55Jlu4y11sF+dvaApaLFTp1oQVtMVHy2yA3AZt0K3Kh0b7dCpzsPydXqYbwCjFrU
	okvozNZIQgwpk/q1LcTaDYx/QIMOxKxcvhul3wifKN2qeUb0cgEI7dduhm6a3fW1k4lVdu
	A+CW9EgF0cmJ67bNJ8laI/8XlP5xaK4zEybXOCxsVG0R9vukPlju6vxyI3GjM/+iquR91V
	tuLoIL2I8aQLwgBt+kfOI0MXZc6BrnLQCuGQNOjQLl5zVGs9eoFpMXkaMcS3Ig==
Message-ID: <500852c9-2cd5-4897-a139-4e93988f5469@mailbox.org>
Date: Sun, 2 Nov 2025 17:14:05 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v4 07/14] drm/imx: dc: Add DPR channel support
To: Liu Ying <victor.liu@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
References: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
 <20251016-imx8-dc-prefetch-v4-7-dfda347cb3c5@nxp.com>
 <174bdb5a-b5a8-4856-a0ac-8caaaefde136@mailbox.org>
 <24f99c46-ca5d-43cc-a2eb-a6e5029e9f86@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <24f99c46-ca5d-43cc-a2eb-a6e5029e9f86@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 3sitdqczazy5k6eyore371b5sdu9hua4
X-MBO-RS-ID: 505e1783efc7f667bb3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_091527_137493_448AB0E2 
X-CRM114-Status: GOOD (  19.23  )
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

On 10/20/25 4:47 AM, Liu Ying wrote:

Hello Liu,

sorry for my late reply.

>>> +++ b/drivers/gpu/drm/imx/dc/Kconfig
>>> @@ -1,6 +1,7 @@
>>>    config DRM_IMX8_DC
>>>        tristate "Freescale i.MX8 Display Controller Graphics"
>>>        depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
>>> +    depends on IMX_SCU
>> Can the SCU dependency be made optional,
> 
> I don't think this can be done.  If you grep 'depends on IMX_SCU' in
> kernel, you may find a handful of existing dependancies.

Sure, I do not dispute this part.

But the SCU dependency can be contained in a component of this driver, 
which is not used by MX95, and used only by MX8Q . Then there will be no 
problem.

>> or per-module,
> 
> Well, DRM_IMX8_DC(for the imx8_dc_drm module) depends on IMX_SCU just as
> this patch does.

I assume it shouldn't have to, because the SCU dependency is only 
relevant for the prefetch engine ?

>> or somehow abstracted out (via regmap?),
> 
> Like I replied to your i.MX95 DC patch series's cover letter, SCU accesses
> registers via Cortex-M core instead of Cortex-A core IIUC.  I really don't
> know how to abstract IMX_SCU out, especially via regmap.

The simplest way would be to use regmap_config .reg_read and .reg_write 
, if there is no better way.

>> so iMX95 support can be added into the driver easily too ?
> 
> Like I replied to your i.MX95 DC patch series, I think i.MX95 DC support
> can be in drivers/gpu/drm/imx/dc, but it should be in a separate module
> (something like imx95_dc_drm) plus an additional common module(like
> imx_dc_drm_common).
This design part is something I do not fully understand. Sure, it can be 
two modules, but in the end, the result would have to be capable of 
being compiled into single kernel binary if both modules would be =y in 
Kconfig anyway.

