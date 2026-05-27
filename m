Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC87CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 11:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbu7eIqkyk+q9nunKGOeIBPnQ9KXYFo7sIXPPUFEK1Y=; b=haDOCDN65ZRt508/xnc1TmOO4b
	tjUMBqO+8BSjc345RWs+74n5uxfIYAOQhe6DMD8lFDdu4TziBoykTztyVxub88tYNEUmjZRWTPrbp
	WVJ0FJxiZgJjev3cQUWHuz0npmxDVz1Wr3YtXKfb0Q0+sdEO7bWXZjIcQIwMDm72ThRnx2IiPeWFP
	8ACO1ASwoHIKpk97ILYVBmcdtgpZXgrBFHRoGTF+4l6ZkXaS7vhBi6K7QR5whGRUxkaD7aIFWdU3N
	K1j+LzMDF/hqlxvw1ar7SajCqMMk/Tizs+oq1egHkjfjlDGOKNnSthR+XKXtC/kg+jt6liW9gQH9L
	wYWx+YdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSChF-000000041je-22ry;
	Wed, 27 May 2026 11:45:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSChC-000000041hY-2QUv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 11:45:12 +0000
Received: from killaraus.ideasonboard.com (62-193-63-110.as16211.net [62.193.63.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAB949D1;
	Wed, 27 May 2026 13:44:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779882287;
	bh=J8HWEnOlJ6Qs7xGG5VUasoHKKzXrTRjUX3pcyYjgeGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O2gawcK4KnOj/A1H7gp8aanPxKgY9q8qdqLlmxYux04Nd/DsE69P7E95cc6zzdxeZ
	 B3c0LXeUS2T6iPXD82DZl0ED04r96Jtz0bPQlFxhYHDnwDELgyIDlYFpcEg1jgkg9h
	 9hPM1x19a0H7cMLV6xLy8UULktx7vc8VrCu91Fxc=
Date: Wed, 27 May 2026 13:45:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Message-ID: <20260527114504.GA480025@killaraus.ideasonboard.com>
References: <20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com>
 <20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com>
 <20260526-towering-essential-civet-19a5ad@quoll>
 <20260526094438.GE228394@killaraus.ideasonboard.com>
 <14f9923e-ae0a-4e69-b3b9-a7353b84b9f8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <14f9923e-ae0a-4e69-b3b9-a7353b84b9f8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_044510_800165_CE92C275 
X-CRM114-Status: GOOD (  16.48  )
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

On Wed, May 27, 2026 at 11:37:34AM +0200, Krzysztof Kozlowski wrote:
> On 26/05/2026 11:44, Laurent Pinchart wrote:
> >>> +  - |
> >>> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> >>> +
> >>> +    syscon@4ac10000 {
> >>> +        compatible = "nxp,imx95-camera-csr", "syscon";
> >>
> >> Drop entire node, not relevant. Or actually this example could be in the
> >> parent binding example.
> > 
> > I asked for this in the review of a previous version. The example only
> > stated "formatter@20" and it was not mentioned anywhere that the device
> > was supposed to be a child node of a syscon. The driver reads the reg
> 
> Binding does not have to state that. Parent's device binding will state
> that.
> 
> > property and uses it as an offset to the regmap of the syscon, I wanted
> > to see where/how the node was meant to be integrated in DT.
> 
> Sure, parent's device schema should have complete example. But we never
> add the parent compatibles to the child schema - that's leading to
> additional work later with no real benefits (that's only example, so no
> real code except maintenance effort).

OK. There was no mention of the child in the parent's bindings in the
previous version. Now that it's being fixed, we can drop the parent
here.

-- 
Regards,

Laurent Pinchart

