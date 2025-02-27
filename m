Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFA9C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 20:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5paXk8CuIpllFtZyzBI8hLiK7ySHpJX/BjOS1QXq1c=; b=RFy/4H9YLiiPpmotZaG+rJBSQh
	RfkXHL1AyCUpYc2bt42eO14eyPvw/tO7cPkP6vSf5he1x6VP6pPgc2cckGEPoXXoszy5JK0iERNXt
	ZhZcn+3/Dhknas1YySOYLtv53/zXwTkFA1N7PyjxzgMhaPDCqDrUQuYRUJObHzH83fyi81IgKWxdw
	1yMMCxl9phMJgqWYWIuIfZXObNCIdk99IEdx7NL2cyiQhUsN+MDtzzpRkD+UqcsZJv6ZKmgBGicaS
	L77AnuVOCnB0mk2paXkCiz5bgjrIwlkAaS7EdjVsQSzSGdZjfwkmLmeiNhj57dgI1hkV0/dpBSxVZ
	Ukw5VMhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkjD-00000008oFy-46z6;
	Thu, 27 Feb 2025 20:43:31 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkgB-00000008njC-46nY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 20:40:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA6DA10382F09;
	Thu, 27 Feb 2025 21:40:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740688820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u5paXk8CuIpllFtZyzBI8hLiK7ySHpJX/BjOS1QXq1c=;
	b=bjzE60xn2grbCyDLcgf4cvBjgXrgbTgdCZusBPh/MjDLbijsz7kCSuJQZDVxz+Qeb1x7Ad
	9Gnsm7K6hNbl4UksrjfhaPt67lZLYimUv9rtg/YSZMlUkfHYwOemCV7R0bex8trcHLM6Ec
	TvD1qNWAUI9nMS8Ldp+QXsa1oo7leylqHHja2xJ2pPmsh7VAk8/kn4tc7aAYxWXuRUUk+d
	kme3oH/nvnLQrrBczjGB77HYUgVs4YoIwy/1wUYBipx3v67RpmTXnp1BuwK3lPTh6AcSA5
	3pca0iff+GNUwQYsacCr1LuRzOjLbfAH/svVd30/KM1s8DTJumXHlg9cyZif4A==
Message-ID: <77585efa-29f0-47ef-af02-d927a512b9ae@denx.de>
Date: Thu, 27 Feb 2025 21:31:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] dt-bindings: gpu: mali-valhall-csf: Document i.MX95
 support
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Thomas Zimmermann
 <tzimmermann@suse.de>, imx@lists.linux.dev, David Airlie
 <airlied@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, Steven Price <steven.price@arm.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sebastian Reichel <sre@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-8-marex@denx.de>
 <174068152164.3906545.6393185343383919273.robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <174068152164.3906545.6393185343383919273.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_124024_167366_8BBCB60F 
X-CRM114-Status: GOOD (  11.31  )
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

On 2/27/25 7:38 PM, Rob Herring (Arm) wrote:
> 
> On Thu, 27 Feb 2025 17:58:07 +0100, Marek Vasut wrote:
>> The instance of the GPU populated in Freescale i.MX95 is the
>> Mali G310, document support for this variant.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Liviu Dudau <liviu.dudau@arm.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Sebastian Reichel <sre@kernel.org>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Steven Price <steven.price@arm.com>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: devicetree@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: imx@lists.linux.dev
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>>   Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> 
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250227170012.124768-8-marex@denx.de
It seems there are no errors in this list ?

