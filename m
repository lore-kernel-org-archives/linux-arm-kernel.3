Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68F0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sB1xyBy7knHrLszPHAJ3MESeKHqNxE0grKNVyNhYz7A=; b=sy8juDGRYmxMGeyWSKKMFiAWsf
	wA1qXBi09prvL5rmGwbtQWMujLsAdo+RxfZYrqyOC7G+CdlIimfVgnGLHE4cXZXrwcpj5kaBkOuve
	AV8TGJguaHOnuf4x4prpe4uKVh/CDxuovfuRU9iCNzXpHMh0K4PKD3BeHHGCj9OOjDrEAzc+Giv8q
	M3rLDsJaLsZRNhmitvEREnVH/jEQMe57l1Yg9rXVw7kzPjZ/ReMcHJwgfxE07Q34Tyj0GON9YvnWY
	e1GK5RNbKf1kzhSDKOwwKOE5sM2GstBh+0Yry92xuYWfyyFuCBUgMtC9/DciYyhksS3QKJudacusL
	5r1eTGbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHhF-0000000GBvz-4BNo;
	Fri, 10 Jan 2025 16:17:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHNm-0000000G7SR-2dbN;
	Fri, 10 Jan 2025 15:57:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E42B55C0FE0;
	Fri, 10 Jan 2025 15:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6422CC4CED6;
	Fri, 10 Jan 2025 15:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736524629;
	bh=Zepb3Xf1LqvXqepzt+MhmKK6OG5jBl8iAJLNE0dVQPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NEvyIBtRig1NynjUKr+d72gORi8xggQKkHvmTDwaw+mxp6ygcL0HqICFfzPh84x3Z
	 LsJY2EfD8qZPaOR8yGe4MxG4lwmy4wziMf4LNwY33JkuVXED7L2c+QHfb9j8A7Wq1J
	 Tr6CQHqBQxP2XUEimgcLM6KrYb4Q0q/Bndd8xIW1y32DUGOGJwOKAz5EJd+YhfIpIJ
	 XkrhSUFBUN6AG28zCvbRnoJYIymyJY+Pt1P68yuiveXnp2xvXXDS4jf+JkNG7/4Zxl
	 du9aEo6KNrAuqISmeSYHyXfkMRZpVCxVR4ntT3PxWZvGRbF/03xLiO3dZVjvHsn+kp
	 Y5qJP2Z4A3XNg==
Date: Fri, 10 Jan 2025 09:57:08 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, tzimmermann@suse.de,
	jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
	mripard@kernel.org, ck.hu@mediatek.com, p.zabel@pengutronix.de,
	jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
	lewis.liao@mediatek.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, krzk+dt@kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
	linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
	kernel@collabora.com, chunkuang.hu@kernel.org, conor+dt@kernel.org,
	jason-jh.lin@mediatek.com, dmitry.baryshkov@linaro.org,
	airlied@gmail.com
Subject: Re: [PATCH v4 08/34] dt-bindings: display: mediatek: Add binding for
 MT8195 HDMI-TX v2
Message-ID: <173652462808.2939128.70242417447514107.robh@kernel.org>
References: <20250108112744.64686-1-angelogioacchino.delregno@collabora.com>
 <20250108112744.64686-9-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108112744.64686-9-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_075710_705363_C91BA4B5 
X-CRM114-Status: GOOD (  12.24  )
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


On Wed, 08 Jan 2025 12:27:18 +0100, AngeloGioacchino Del Regno wrote:
> Add a binding for the HDMI TX v2 Encoder found in MediaTek MT8195
> and MT8188 SoCs.
> 
> This fully supports the HDMI Specification 2.0b, hence it provides
> support for 3D-HDMI, Polarity inversion, up to 16 bits Deep Color,
> color spaces including RGB444, YCBCR420/422/444 (ITU601/ITU709) and
> xvYCC, with output resolutions up to 3840x2160p@60Hz.
> 
> Moreover, it also supports HDCP 1.4 and 2.3, Variable Refresh Rate
> (VRR) and Consumer Electronics Control (CEC).
> 
> This IP also includes support for HDMI Audio, including IEC60958
> and IEC61937 SPDIF, 8-channel PCM, DSD, and other lossless audio
> according to HDMI 2.0.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8195-hdmi.yaml        | 151 ++++++++++++++++++
>  1 file changed, 151 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


