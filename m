Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8047FC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 16:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hELSUOXFmCsf3Hjs7eqtEVSjpiOQHW+vCtSXQjmnG1k=; b=RRPFbbyBsNx/9FYHM91LpT9yus
	lSvR2x6eILqjxEwvMT81qoWY8lcabzls7RDZf3DR9hzXngiW2TbIEmpS0UtD1iPgkkzLapCu+TgmY
	UKwcvTNTkoGjIDQzlIFiKqjXX07MAcffjKTAcbVaM3AVWIeRK/C/yn/wD36LmiRtj1V/6R+G7ZcqE
	7EV/MesfpLFlGn2Xx+X3s3Fu2BInSEMTK46nhlURyOAfnkWiDZKrWIrFH5HC477uBluYPQwmJ3aNY
	5dRqkAi72IoDj6KBB+isBl7IfpS0BEyx8OVYO7ohDnvLGimGDlRQ0LDvYSZbUS28WaUDJz1CGoW+S
	GmVpdR3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBID-00000002fdZ-0JTt;
	Sat, 18 Jan 2025 16:03:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBGL-00000002fRc-3ZYa;
	Sat, 18 Jan 2025 16:01:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 402D5A4150B;
	Sat, 18 Jan 2025 15:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CCBC4CED1;
	Sat, 18 Jan 2025 16:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737216088;
	bh=ViqJWys7z7tzicOakO0vgP9wxpUd4p24cnmiSBZE57c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZagNFP791YPBCAus+Oa7lHcvFzN//dKNmA9krZYQgEHkeBoKSn8W7Wi1j72eDdgWs
	 uSyY6HImdQxsqDUzqqpAQ8ncR8KjPgbHCXAvJeAhfFxKT3WO1OG0q28O+q16J1Vshw
	 QYlS1YXVi34INaEhgM0FoJP0LmTyiEJQSuQ+uoPbLSVt2pWUhjplMS/kb85EVDkrog
	 m+5Xj+dgnWjbhBMvtF2frabLZqDcjKA3QCZ6q+v3TvC9lxuxwhedttLS0MXfSlEekC
	 PPv54XusLiDlC+I1JyYhs1YLBn/986tJeBzlKg1qbOuV5D0H6cqDzuDcXSXU1lfpDV
	 hOGrlOK6L9gsw==
Date: Sat, 18 Jan 2025 17:01:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8370 SoC
Message-ID: <20250118-excellent-tarantula-of-rain-afaaaf@krzk-bin>
References: <20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com>
 <20250116-mt8370-enable-gpu-v1-1-0a6b78e925c8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250116-mt8370-enable-gpu-v1-1-0a6b78e925c8@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_080129_954938_40C0057D 
X-CRM114-Status: GOOD (  14.85  )
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

On Thu, Jan 16, 2025 at 03:25:57PM +0100, Louis-Alexis Eyraud wrote:
> This commit adds a compatible for the MediaTek MT8370 SoC, with an

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core).

Anyway, your commit msg explains "what" which is obvious. Say something
not obvious - e.g. not compatible with 8192? Why not?

> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 735c7f06c24e632ab738d062f15378f754c8adaf..6f6211950bb495fa6bfcdfe8d1e27e5ce7aeeae0 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -37,6 +37,7 @@ properties:
>            - enum:
>                - mediatek,mt8188-mali
>                - mediatek,mt8192-mali
> +              - mediatek,mt8370-mali
>            - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable

Best regards,
Krzysztof


