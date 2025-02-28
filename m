Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A118C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 18:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PSz7ZuQ5nzLnJet5Y9kbEfPUEX42BXLUnRfN3fMKwQ=; b=iebH/8nZRzeFejy7Vmbhi8kNSz
	Ae6YLiO+SD6YyEqKMAaRM6+v/i+y1Vd2ytj8VltRBFXVRG+UB1eucoGFUUYh5EWjS4W3GB9XfvsiO
	32X+Hw7aCq6ByuQhR/cTKcJgssR2zWJd74Q6WZfz1kbiHFeyHRVNYEBVLSoj3MBEMaIREUCNLmhIy
	Q1GUJq//+uyVgHNB25USAj30gnceeOw57zpvULMOKkWZV2VCTcPocQYtmQpYcciz/Vm3fb3O06eqO
	7LmerYGfVoNCO671SDRgUDWjKTfllbtrry6DFqz95i2e00OcUbVbET9XEMZg31VlyMJCd3MREc5bv
	6l8BRTiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5IM-0000000CCF4-2HEH;
	Fri, 28 Feb 2025 18:41:10 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to54u-0000000C8Hb-27NU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 18:27:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E13D102901D2;
	Fri, 28 Feb 2025 19:27:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740767234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0PSz7ZuQ5nzLnJet5Y9kbEfPUEX42BXLUnRfN3fMKwQ=;
	b=eQ8imoeEEwidEDudYu5MHyQsLjGLBO8dj5+QfJK9e2JR0FczsFVk87HbncD71csVZAqfeX
	NqtxMeJMIE2eDYNpvkV6pDJpNYP2pKf4UpMnXXPmNweU/w9RFgQHyHC3Vi/kDcQDtgIgTU
	lGkR9vFKdJPU4zaH4OEzkKqebb5/sG74EKmGOKYh5PFC/7XScQvvcbC2GXgL3WH16wBk3q
	AB4jy9asH5ejxdYyy6Z6DdnfxSOwE8I/HdYJN9CFrbULwwWdeBIdG0OzU7y/roQOtPbNYz
	O3lTUWEFE3vEf5Tt37NRw/70PeHGwBobRkeXb5t8wOkcncG9sgLeV8oSL2MBfA==
Message-ID: <b6eed3e6-e416-4c36-9fdf-f14471b029a8@denx.de>
Date: Fri, 28 Feb 2025 18:17:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] dt-bindings: gpu: mali-valhall-csf: Document i.MX95
 support
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer
 <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-8-marex@denx.de>
 <20250228123010.GB2321092-robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250228123010.GB2321092-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_102716_689560_7ACDD25C 
X-CRM114-Status: UNSURE (   9.50  )
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

On 2/28/25 1:30 PM, Rob Herring wrote:
> On Thu, Feb 27, 2025 at 05:58:07PM +0100, Marek Vasut wrote:
>> The instance of the GPU populated in Freescale i.MX95 is the
>> Mali G310, document support for this variant.
> 
> You should combine patch 4 with this one and make resets required for
> imx95 since you said it is required.
The reset support is orthogonal from MX95, but I did add the resets 
requirement for MX95 , thanks !

