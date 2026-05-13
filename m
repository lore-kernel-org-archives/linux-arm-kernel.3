Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7163BCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mePCShuuPbSQDWENLogL7Rh7ddSTNfhpxADtyNmcUZI=; b=IWfM84F2jPocuSAF0du2Nm0TTi
	Q5nqq/cgGXNF+nTYsV98Qb85uHkVErsxrYofN5NUkYL2uKn8wMTdKCPYW5uE7Cpv/n03J+jhAbyBI
	uczuUNcsf9FhKtBox535ANJTA48bcD8pVF+ZXtv9XYYlRlWWILA6DilQMs/efwNJiAlfOVebNL57e
	Eoyx2rK1RKTKSbH1kbsfSGZnzeYa4w78PbCOhFPK+MUyLtlwZXM9iBSvpeSR1c3a4zjI1EcHy09c9
	a6syjUXoydCXcy1veS6FDyR7WpYaecZSLTTQdEXPmXopJZ5YgJf2XmW/m4Ywg3CK6Tkc8S6ii1qkU
	LICHme4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCht-00000003FUw-3lGm;
	Wed, 13 May 2026 16:45:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCht-00000003FUV-1Sen
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:45:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4929060129;
	Wed, 13 May 2026 16:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD15C19425;
	Wed, 13 May 2026 16:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778690712;
	bh=msDVtcqmbmg66KjNFHJpNOm8yFfAcfXZQ+MbCdSjyII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Umk+nQqfftUIQjg05CAeja8xnssdz9t0+lnmY9bCiojocCGCPcSDmJzJt1/etBL6U
	 hqjNbZXsGJkvxXpwIwd5SjmBOdhvmiRMv5oP1VnZsUlIn/a6VdSbeiMOcQK+e3d7vM
	 p8i44SrcPHtfgfN7URfm225mfu6GDVZjoWNLnRPO+YRZeTB7f9v4QJ+GDjfapd+imO
	 EzhbxAYNUJORt9ExeMNZNiLp/+fEC/TFDGeWo1XmibrzNBZzClxDaKgBXOPURcUbMF
	 mPnKHbsny1EWeDebt7n00Ken2sNqEPdrTHRhytSi9dS5iJXVBf0wSkVoBRRHUKzCJF
	 vjj1d03javrBA==
Date: Wed, 13 May 2026 11:45:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: display: imx: add deprecated property
 'port' and 'display-timings'
Message-ID: <177869070825.1285462.2467866866860816055.robh@kernel.org>
References: <20260511220924.1905571-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511220924.1905571-1-Frank.Li@nxp.com>
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


On Mon, 11 May 2026 18:09:24 -0400, Frank Li wrote:
> Add deprecated property 'port' and 'display-timings' for i.MX5 SoCs (over
> 15 years) to fix below CHECK_DTBS warnings:
>   arm/boot/dts/nxp/imx/imx51-apf51dev.dtb: disp1 (fsl,imx-parallel-display): 'display-timings', 'port' do not match any of the regexes: '^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/display/imx/fsl,imx-parallel-display.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../display/imx/fsl,imx-parallel-display.yaml         | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Applied, thanks!


