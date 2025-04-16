Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B54C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 18:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1k0AD284MweT/SGAj8SP6tJOeaAk3NXfuY7QbnjwG4=; b=tqAx1Lq7Z66Fk18BhNJYhFQ/K/
	39zE3O08C5lF2tuQYjHtLhtRLpjL874RqhpR/sxvGxgI24+w1vSrCt2HOoXsPb2t0aB047rfuXzU3
	3s+drx+EfMJHR39hzAbKoq3V7w9jL4ALDFjrffikty/llc28Ciuz+CL3eSXDj/xh+zTSRSZk9vH/n
	tomFDjv9/yQDFUJHF2N8wCxUP6iWA5LQ9eiMCNSErr2JNWSYOAQUHj5dogzIjpIPZWCviaIOvWkwU
	dHzxJb83as9btJEFEPWHdktchuShQY8worhVHMJfqbu1RZ1T8eR1iJ07ra3AKwuTSkfWvZanYqhpF
	K/BsKkWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57Tr-0000000AYj8-3hfC;
	Wed, 16 Apr 2025 18:27:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57Gp-0000000AX9U-2TtK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 18:14:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6CEAD5C3A7C;
	Wed, 16 Apr 2025 18:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98A1C4CEE2;
	Wed, 16 Apr 2025 18:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744827238;
	bh=E4ZCn18zFjw6q5PMnJTlMEpj3cHQAfhZ5PeKZVr6sKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vFwg2W7ulzfpoDWHo1BLmWMkAnQCxVGe2j5NOi6tePl5s07giWZMkhjfYjNaGhc+E
	 DoBfd+PAHJHY/uyGUOngwGsQdhpWJHeDC6rfW5EjIw+t0fUgVImU6oGJEL7ADtGIxP
	 6XJk9xzY9LEnlV+XZRLm/mfjI0maPA5jnsuQoRLQD7zcaiTgFVGcbomv13di2oNWOD
	 CRvFOfgosj6N16eIFvBGl8ilBctjMJxXdAbEcVnGTxSMAnidclUHGCLaB9Qu8f16rt
	 Rwpf8jN2dNbArsyt3fhr1k6LvGZP6RYSu6VLJDX54u6I0+4BdCLquqlRV0xVUbi3ZQ
	 Fp+tph9YwLL/g==
Date: Wed, 16 Apr 2025 13:13:56 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	imx@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/1] dt-bindings: display: imx: convert fsl-imx-drm.txt
 to yaml format
Message-ID: <174482723439.3590548.522151644513682982.robh@kernel.org>
References: <20250415212943.3400852-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415212943.3400852-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_111359_669682_ABF8DE27 
X-CRM114-Status: GOOD (  10.08  )
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


On Tue, 15 Apr 2025 17:29:42 -0400, Frank Li wrote:
> Convert fsl-imx-drm.txt to yaml format and create 5 yaml files for
> differences purpose.
> 
> Additional changes:
> - add missed include file in examples.
> - add clocks, clock-names for ipu.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../imx/fsl,imx-display-subsystem.yaml        |  36 ++++
>  .../display/imx/fsl,imx-parallel-display.yaml |  74 ++++++++
>  .../bindings/display/imx/fsl,imx6q-ipu.yaml   |  97 +++++++++++
>  .../bindings/display/imx/fsl,imx6qp-pre.yaml  |  55 ++++++
>  .../bindings/display/imx/fsl,imx6qp-prg.yaml  |  52 ++++++
>  .../bindings/display/imx/fsl-imx-drm.txt      | 160 ------------------
>  6 files changed, 314 insertions(+), 160 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx-display-subsystem.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx-parallel-display.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6q-ipu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6qp-pre.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6qp-prg.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
> 

Applied, thanks!


