Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53039C282D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mubNNhKyP7keuNJHmi/hDyhZOFe+1RpGW6KeB90qXfE=; b=Rnn4DrR66+RdJfdT4hiURoI5hi
	YHftacPo2W/M9eFm2mpjksTLcEYEUWrkdSk/0sDT2DB3gQPpeWlrkJFpc87z92VecDCYEWrlzNW8o
	M1j8Tb1w2kV7pS+l2ExmVRIxLo5/vO3itAV+p24DE+Uplo+xodTV5HWn9D/J90pMzjUewLA8q26SI
	r82iht99rHc0x2IkpgCkuse5Rwi5c1ru8vjVPZEVDSjW4TkEVNny4YwmKANStpFC5Ek1pT4gcVSHg
	iJoKt2fjEkyXhP5Yvj8fu/X8VUn6yXqfPt03OjFD9A7dAc6YT+EWBGXtLFhMHUosAaPQVPfCtXney
	nMaYL6Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR4t-00000004WjN-46MO;
	Tue, 04 Mar 2025 12:08:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPxY-00000004IXy-2ABY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:57:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C0575C54CA;
	Tue,  4 Mar 2025 10:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D3FC4CEE9;
	Tue,  4 Mar 2025 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741085831;
	bh=Uvkzu29Y8PUMAEcuNdr5Ez6in0wuHeIuBJMkRl6oCQM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YIyUKJxP1QiFVa39ZNliUPZUqE+mBxDuds863otU1QSxEG/kIDfZlii+GXo+v1bGr
	 Amz3O4YsNKPKtjcDlanJlT9Z6fY+5nGherJD7c5sCeY34T/piM2gXBBVnlOgK9INww
	 9UHMLJDWidn/TA9Khakir8hi6dgl0aX5F8cjWWGMBKEf6EcO49q7jsR/qfpnrqOXUY
	 7mjDDR7EVXIe4068pVDQ7qnYJzMOCM4yJv0ZMWfTMrRS/u2/KYkJrtG0Ro1ZgJR1sY
	 sKN0UAA21HVBXezAYetRAhgNVH//y1tNt7YOMdlxmQmEjTjmS4rmaZiLc7GcfYEe/L
	 S1S9R6BQBokcg==
Date: Tue, 04 Mar 2025 04:57:10 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, shawnguo@kernel.org, 
 conor+dt@kernel.org, kernel@pengutronix.de, frank.li@nxp.com, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, peng.fan@nxp.com, 
 aisheng.dong@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com, 
 krzk+dt@kernel.org
To: Jacky Bai <ping.bai@nxp.com>
In-Reply-To: <20250304093127.1954549-2-ping.bai@nxp.com>
References: <20250304093127.1954549-1-ping.bai@nxp.com>
 <20250304093127.1954549-2-ping.bai@nxp.com>
Message-Id: <174108583009.1693369.10518412306267353272.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: dma: fsl-edma: add
 interrupts-extended property
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_025712_592749_E54517B9 
X-CRM114-Status: GOOD (  10.50  )
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


On Tue, 04 Mar 2025 17:31:24 +0800, Jacky Bai wrote:
> Add interrupts-extended property for edma that has multiple interrupt
> controllers used.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  - v2 changes:
>   - newly added entry
> ---
>  Documentation/devicetree/bindings/dma/fsl,edma.yaml | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/dma/fsl,edma.yaml:102:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
./Documentation/devicetree/bindings/dma/fsl,edma.yaml:104:5: [warning] wrong indentation: expected 6 but found 4 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250304093127.1954549-2-ping.bai@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


