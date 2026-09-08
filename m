Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B11C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOyngVYrItRuLe3u/yuA0H/Ld3sW0yaOzRVeptexYE4=; b=cvBGVudI/Ue1z18LvcEB1CM71W
	3/AlU0t3zqe3gOtBAVbt1uNvb7EK0h+wxwHBFuOrUED4xvdZhhZ0HTwML1qaeksQQ9cLz5LM3sZF7
	sjL3bADGaTGGsUY8dZTiqgg8Tg2GkEkN+kHiuh0oUjuZbReVdEAQ+4vD0X3Y+R80znwZ/X9tC8mD7
	6Fe/T9kQA4LuJ6lry/WiSVTEsYbeOsSQPGixp4hkjRcEYeKmRSa17DRqQsgeRfgMpLwjBQECtMKb7
	THjtI/9bCOUnpTpwvyJBHv8U+G1s5HF4PDe6K71s/hMtrNc7eowyZk7NyZFpNR5rNKk+YpZgQgY7C
	Unj97QYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sT2-00000008fuB-3YTF;
	Tue, 08 Sep 2026 09:50:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sT0-00000008fsN-2iE3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:50:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A0AC860AA3;
	Tue,  8 Sep 2026 09:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABC11F00A3A;
	Tue,  8 Sep 2026 09:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788861013;
	bh=pOyngVYrItRuLe3u/yuA0H/Ld3sW0yaOzRVeptexYE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FxUwqzV9pyaNtShWLPvMjWVA5HEpu5Ub9FmlIllTLQreh6DS7qrSu8hfJciWclUVd
	 Ad5gj8mwGP6G+4HRp+OWSfuIyQSVLgaRm23zc0vN+7VEc0nLNEjAFRiVTafVoakpfM
	 JDpqNEt3bvhylnCF3pluCauOud2JP5unjMTvr4Orkw5/UNT+hT/v2p6ehYJIxIENiM
	 h45pmRxWFjGH7iLSOOk7L+qZOqCZHKyKvVBJIdHSrkI7qbrDdhy27BO7wvVZO4+eyn
	 ipvrYCjPdee0DYRtxFUQNw4GgnUSfkefWDsWfMoTq2Ciw/m/ptonV3FVA6RGV3XOYF
	 Q18xFkcU2iSWA==
Date: Tue, 8 Sep 2026 11:50:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, 
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com, marek.vasut@mailbox.org
Subject: Re: [PATCH v7 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
Message-ID: <20260908-huge-shaggy-cockatoo-52b7a6@quoll>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <d362714624fa5025db50293b1b737d3fa3ce2c49.1788496816.git.nas.chung@chipsnmedia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d362714624fa5025db50293b1b737d3fa3ce2c49.1788496816.git.nas.chung@chipsnmedia.com>
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

On Fri, Sep 04, 2026 at 03:46:28PM +0900, Nas Chung wrote:
> Add documentation for the Chips&Media Wave6 video codec on NXP i.MX SoCs.
> 
> The hardware contains one control register region and four interface
> register regions for a shared video processing engine. The control region
> manages shared resources such as firmware memory, while each interface
> region has its own MMIO range and interrupt.
> 
> The control region and each interface region are distinct DMA requesters
> and can be associated with separate IOMMU stream IDs. Represent the
> control region as the parent node and the interface register regions as
> child nodes to describe these resources.
> 
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../bindings/media/nxp,imx95-vpu.yaml         | 162 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


