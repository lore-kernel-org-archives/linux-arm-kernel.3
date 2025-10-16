Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E2BCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxP0Op2GOPJGCmVQfhpVi9OKM831NuQf5A5nCw+dZv4=; b=Q00AdgTThqD2CZjC/gCG3SoQCV
	x0FFM/1vx766+wbBlwFXWCDP7M4Ly79UR66ytEo1X2aUZcsms8rzCe7XzrOUUZYhYEuTR3lDW9577
	Bk6ghAiMj/RVpVBhJlRAf9eRbIE69LMFREbC0ZmpoFLu/X4uPMwYPKF9vUUq4qPxo29tEWMWVtopr
	IyzA5cKNtbHCAst6nOfBIKRzvou1HQkrff6fjftWUBBohHstJBIH9XyZO4s2DAJWweA1XRaGb6nQG
	HA9JeSPSleSsLaqCNSnrRmH0hOVKc9seb+x9uc3pGaErDbXsZOffswNdBUa1Ccp1bvfHrtO8NztAQ
	E8r/v1XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Rxb-00000005cCj-1gIo;
	Thu, 16 Oct 2025 17:40:19 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9RxZ-00000005cBv-0phd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 17:40:18 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cnZwX3zWhz9tHQ;
	Thu, 16 Oct 2025 19:40:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760636412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZxP0Op2GOPJGCmVQfhpVi9OKM831NuQf5A5nCw+dZv4=;
	b=uSAD+5cfZSmQYp83bqgCZJ2GFHuuQhmPjHL/wN/5mHexJACIMaAVV+lt/vEBlttehdTl28
	eEGLhxwyU7vQRgALRAV8NAQEzMqaJiVtYNBbV2ib9G/rQblwYzxhZZOxWuBiUpr5yD74OG
	N/nf9nemOKlaXVUVo0kriTvuDpV/ik6jDF0IMYpBfNu4OzqHNTkcR/lSnwV+czwWXkrTxR
	T6BnyiZzrG8Xwfrv1a+RPavCsuU7dgc9HBKTfXiH5y90zKUKLtLahQ5S2j/a8ScaDBx8bB
	Srzn/G0HBPbRhDnoTJohEiB7CRI9xQu3XNqYz5kfGWHWvNc09KH0S2WkKb/YLQ==
Message-ID: <174bdb5a-b5a8-4856-a0ac-8caaaefde136@mailbox.org>
Date: Thu, 16 Oct 2025 19:39:58 +0200
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251016-imx8-dc-prefetch-v4-7-dfda347cb3c5@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: oisd1xzkoiz1sooehr5hspunmxjz571t
X-MBO-RS-ID: eee63f1da7d39cab528
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_104017_400885_A7A9B073 
X-CRM114-Status: UNSURE (   7.32  )
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

On 10/16/25 8:32 AM, Liu Ying wrote:

Hello Liu,

> +++ b/drivers/gpu/drm/imx/dc/Kconfig
> @@ -1,6 +1,7 @@
>   config DRM_IMX8_DC
>   	tristate "Freescale i.MX8 Display Controller Graphics"
>   	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
> +	depends on IMX_SCU
Can the SCU dependency be made optional, or per-module, or somehow 
abstracted out (via regmap?), so iMX95 support can be added into the 
driver easily too ?

Thank you

