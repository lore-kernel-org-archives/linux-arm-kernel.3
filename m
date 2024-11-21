Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85B4D75BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 08:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NM3ladxQGHFmtehcRtdN3eRX4S67+d0iraiByaKd4Sk=; b=0RI0LTlsOgliUSvDIhZS+l9Csk
	DKHwtnaryZZ/ygJQAzCtuKIRnx8+HbonLqdR2k7GJPgZdmiN4r+3myXd+4EhLRCNDapT7y8rOY8Ir
	3CBqG83oWJXQBfQMchpb81lBhlCpKOs7aw/tr0TP20dqzfsWm7DD9Jj+bg5UtnzDZCsyTS+5JpGy0
	kJW0jAyyJUXmdwrVRQ15BV5tJKv6mmb8lip8U8xSJcOlZ4w4bV3jWXkLhjPx7BMDkNVVnJBvcU4WN
	8pxqh2gbqXM7C/l2D3rW+bK0Ab7OwvyTUYi5FqorUEXliR6mulXtLFmeAgu9/15MwvezQTjxvfM+o
	fBzP7w+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2jo-0000000H7KS-2lYp;
	Thu, 21 Nov 2024 08:40:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2is-0000000H7C2-0sTP;
	Thu, 21 Nov 2024 08:39:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 10096A40311;
	Thu, 21 Nov 2024 08:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E740C4CECC;
	Thu, 21 Nov 2024 08:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732178373;
	bh=SUvWzbHGe7kApkeBmO6P2id2KlN/J7nuQhPn4eL2GIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKsvwfjAZ6SGQoFQEVeGNmAIkbQkY477sov7z1nGhsTVAXulxrk7umXUn1ZbJDzha
	 e5YoQG1nbBXnmLiBCX6ASPmve/V5n3WjfecR2IO8hDKD9M0l4zmVk+iE1DOVaANvUr
	 A2pHOMwTsvZRVr+/A/LK1XVstnPv+1cm06LIaGicbSL2uVIItj3HaVGtwVdpQT2DlT
	 JtaizkXMAwgtphjzkdHVqijdl/q08BiE6MO4TfPraoP/zBgYWICw+bVE9iFumkAN+k
	 2ZFsN93OCPMBkuJgnLxmpvxgVCd3z4l0b5/i4yToeGONZoLtxKTO2IiqCv7iFArc2l
	 1Oog9ipylULig==
Date: Thu, 21 Nov 2024 09:39:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 1/6] dt-bindings: display: mediatek: dpi: Add MT8195
 and MT8188 compat
Message-ID: <tutddhqzp37frzi7fkvljrjemfwfmcfgv44eetaalodc5pmauc@h4hklzisfyfk>
References: <20241120124420.133914-1-angelogioacchino.delregno@collabora.com>
 <20241120124420.133914-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241120124420.133914-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_003934_308019_B8EC92C5 
X-CRM114-Status: UNSURE (   9.81  )
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

On Wed, Nov 20, 2024 at 01:44:15PM +0100, AngeloGioacchino Del Regno wrote:
> Add compatibles for the Digital Parallel Interface (DPI) block
> found in the MT8195 and MT8188 SoCs: inside of the chip, this one
> is directly connected to the HDMI block.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


