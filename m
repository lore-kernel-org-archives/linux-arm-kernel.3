Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A27DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 20:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8ACEuyNDLYUMJdsnlbLhn6wugLzJDUc8NzlV6FztT8=; b=k4B1sX8d1qGcNd4QX+RW0At8ny
	HOrt9Y2hetBXhc7xTEj3Y/wtqDlEZJFtOQ+4TxLQ91CBB3O8mmINTgtNqU10nyyGkCBd1dAfzTYda
	kahf32qrqk1p6dvOQA4X79/UU5GMs1k7vuPvRxarUHLtZ1hxr4rjDOl720h95i36+xB4Ix+KRL/5T
	+pctM0C/Xu5Yjnbjv93Ybo/3YnAslHsnrAh8NRrorURXky6+OOef5K87j8Wd+yAiHhUhPoxmoOnZc
	HOJ0FAoomPJUscLZNlI7F5fejxvgXqFBzh1eGCJ7atMkjEkeucmm9ZP/2zGuAm2VMThF/Be9xs93L
	aNY9ttAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkhh-00000008nun-1Xt8;
	Thu, 27 Feb 2025 20:41:57 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkg8-00000008nis-39YY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 20:40:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1CF6E10382D2E;
	Thu, 27 Feb 2025 21:40:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740688817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E8ACEuyNDLYUMJdsnlbLhn6wugLzJDUc8NzlV6FztT8=;
	b=Y6udNiAuASjGCPGlDzD77fbQ7ezJlJ4K2/iMpZltQjf5aZffExkoSZB9KKYv+95Fqsvb/q
	nkcIXtTK3MtOF6SVtekIt7nyeVCsrq9VfxTci6Bk5cCyBlisvdNPb4m75jYpY4Nbfvu0e7
	hscqaePaHkjchYcwSAhQGqPLEM2hNUjUK8UuzxowRAh+n7LGWtmOx8Sgij+43mgyc0HCcd
	r5j/Iba2E2z0zKQ8hmy0egAmG4CyyDuVEVMZ2mr0BDYploZQkWcf1WPvy9xtBpWmy51zPn
	GUWOnK6CDK4QJNhOi+zneKlA73/eQPbBb4015Y2mAjzdchoIDwnfBpUpX96JDg==
Message-ID: <53b63cbd-612f-4da2-a957-ab7adbdc3802@denx.de>
Date: Thu, 27 Feb 2025 21:22:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: reset: imx95-gpu-blk-ctrl: Document
 Freescale i.MX95 GPU reset
To: Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
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
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-2-marex@denx.de>
 <Z8ChTqXdQCbSTJCy@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Z8ChTqXdQCbSTJCy@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_124020_948120_B7A805BD 
X-CRM114-Status: UNSURE (   9.23  )
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

On 2/27/25 6:30 PM, Frank Li wrote:

[...]

>> +examples:
>> +  - |
>> +    reset-controller@4d810000 {
>> +        compatible = "fsl,imx95-gpu-blk-ctrl";
>> +        reg = <0x0 0x4d810000 0x0 0xc>;
> 
> No sure if it pass dt_binding_check, I remember default 32bit address
> reg = <0x4d810000 0xc>
> 
>> +        clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
> 
> suppose you missed dt-binding include file for IMX95_CLK_GPUAPB
Sigh, I knew I forgot something before sending this series out, thanks.

But we have a bit of a problem here, the IMX95_CLK_GPUAPB macro is 
defined in a header in arch/arm64/boot/dts:

arch/arm64/boot/dts/freescale/imx95-clock.h:#define IMX95_CLK_GPUAPB 
               (IMX95_CCM_NUM_CLK_SRC + 42)

Shouldn't this header be moved into dt-bindings/ ?

I can use fixed number 83 to reference the GPUAPB clock in this binding 
document until this is solved, even if that's not a nice thing.

