Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867F5CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 02:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yP/TRVjC/7Q9E9T3KmokV8Ki6NrjRZ4h0baPgK9eilk=; b=ZkAh7Lt6PKjImsSmDNkvnmbNyt
	xLPUJjmvD3rJHUhNRhDUa2RayCI+Kiv6tXzeanv7T5fPvs87JIdiustargK2pot6aMtiBmwMXVBhW
	NkIhmkOV51xhZaOa2E5X+/PQVdLb7/b4DJzB8rvMqxwt9KlJgKwSDR2K8ek1CCyMnRKxU1Pf2rYV3
	PYb8nA0X26Jp4z3HMJB2umh/VzWURjWmX8h25ne6QkTELLVie3svf5iZ8h82jSVTEkGXvzmoqYOxt
	kljkCqFY4GIcZNL8OgOQbK7k9hX69lH2GGsKO98dRISe84qmbIRBDLfWryUlyDhGI6om+3qKf245w
	+7JIqsGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTsCE-0000000A2vf-48FT;
	Mon, 01 Jun 2026 02:16:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTsCC-0000000A2vJ-2dOk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 02:16:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 466AE42E05;
	Mon,  1 Jun 2026 02:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050941F00893;
	Mon,  1 Jun 2026 02:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780280163;
	bh=yP/TRVjC/7Q9E9T3KmokV8Ki6NrjRZ4h0baPgK9eilk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BgzRNauKAd9kY/bAeTwLzMQaFgF1dSIweh7ys5pMWuiIQerJZF9XxyxTWVlhwq+5X
	 NQKUlO5n3hsLxbATQw0YgNf5/8niuKa6uzklYKLdKb16N62sda1KSST4CbLPb7J6UL
	 gA2UT0cXHWb+ogTQYjy8iCl+P+zflSSsXAvp9Ru1/hZyEjlAUB/pGJLXYSfWEVf1x4
	 Pt5Oj14jlGp931fYhNtvBLeCroyfwewEUxXYb8m2RTuhKhndXbURP6MM3NvZFm0fM1
	 3QfVYRtdzPK/S6eJdIWAqY2b2qbYKA2Ueyo9CFfmDhQ40o+bw9S39Io3+O/jpsjEAu
	 FgCThEsTkxI8w==
Date: Sun, 31 May 2026 21:16:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Frank Li <Frank.Li@nxp.com>, David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: imx: Add television encoder
 (TVE) for imx53
Message-ID: <178028016047.3956673.12104802707727267478.robh@kernel.org>
References: <20260521193734.1496372-1-Frank.Li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521193734.1496372-1-Frank.Li@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_191604_688944_AC9FD9EB 
X-CRM114-Status: GOOD (  11.34  )
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


On Thu, 21 May 2026 15:37:32 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add television encoder (TVE) for legacy i.MX53 (over 15 years) to fix below
> DTB_CHECK warnings:
>   arch/arm/boot/dts/nxp/imx/imx53-ard.dtb: /soc/bus@60000000/tve@63ff0000: failed to match any schema with compatible: ['fsl,imx53-tve']
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v2
> - add Krzysztof Kozlowski's review tag
> - move fsl,tve-mode to required list
> 
> About cleanup 300 lines warnings for i.MX ARM platformi
> ---
>  .../bindings/display/imx/fsl,imx53-tve.yaml   | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx53-tve.yaml
> 

Applied, thanks!


