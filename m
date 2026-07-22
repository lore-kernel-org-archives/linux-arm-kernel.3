Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4A9C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 06:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXENoZht4E5/1Rwkl9nffLsBsIgL4pApnVWv84N5yyw=; b=JGS8OAorUG/6HBWi306g8MZTg9
	5RPgQFpE4W9pDdp9EtVhQqVeMhnV0s9muQgqG+ynspHI2tBPw4szfm/+Xcepx5V3aTmn0z42VIKa/
	JBAazlY/xJll3n49uZRTvCsz8JpzYkIKKCS9YGdc/h2WAiyVRrIhb9ybq4+OmjcHZQLWdQWi0pU4p
	QGuOvQTtAOYKUwTU/Llhe8l6/UiXy5MH5bZ/vxb9SkU2FBeeqiskkUWeUaCj9O2YLqX+J9c2s/Nxi
	Shxk0PrJl1iTtp1Lg7SpvjEv2Xrktg4iXP+ICiSnPtR/qx9m8Pd5k8lOkV+62TkzMJPiMPwpzV0la
	1q8eYhfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQq9-0000000B0pE-05n3;
	Wed, 22 Jul 2026 06:54:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQpy-0000000B0nU-0ink;
	Wed, 22 Jul 2026 06:53:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9260D41238;
	Wed, 22 Jul 2026 06:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36D71F000E9;
	Wed, 22 Jul 2026 06:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784703229;
	bh=zXENoZht4E5/1Rwkl9nffLsBsIgL4pApnVWv84N5yyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F4fJBH9EYonk7TRv37q86oOyCnCbMJY12aIjQdqQtCsSAHaQO9w39E4HWmIajyBXE
	 2Gq3bRrvznOYU60Ipa64lvCz/cWQcgEWXig03ke6r/EjikBkqhNhj8+4ApV2jJ1UJk
	 BMoaVOSszUZKWDcHMl4ovaOCTQ/dfakzt8cdbbD3ctkmOZTLR3l7Tj+qdoESCnFpzm
	 LKTfcwr7lVka9YG5BYzTYeBnWq+mGgODR+rznhorRgDdeu/pjy43Z6YfW7g9TRWYft
	 vMxJd8sPyTQ5h1DYpln4y4MxwCn7Xv+ZkVBpPkbwy90KIq8O6JOvhbNnctp/0Ic6lK
	 8qyXbQm2Tfrig==
Date: Wed, 22 Jul 2026 08:53:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: nicolas@ndufresne.ca, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Subject: Re: [PATCH v10 2/3] dt-bindings: media: mediatek-jpeg-encoder: add
 MT8189 compatible string
Message-ID: <20260722-agile-fresh-jellyfish-dfb48b@quoll>
References: <20260720062829.7343-1-jianhua.lin@mediatek.com>
 <20260720062829.7343-3-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720062829.7343-3-jianhua.lin@mediatek.com>
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

On Mon, Jul 20, 2026 at 02:28:28PM +0800, Jianhua Lin wrote:
> Add the compatible string for the JPEG encoder block found in the
> MediaTek MT8189 SoC.
> 
> Unlike some previous SoCs, the MT8189 JPEG encoder requires 34-bit IOVA
> address space support. Therefore, it is added as a standalone compatible
> string without falling back to the generic "mediatek,mtk-jpgenc" to
> ensure the driver applies the correct hardware-specific configurations.
> 
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
>  .../bindings/media/mediatek-jpeg-encoder.yaml | 38 ++++++++++++++++---
>  1 file changed, 32 insertions(+), 6 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


