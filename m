Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C47C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 17:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtmTl91yGLtBjaDUMdCAObOeItGmfmztx41OdR/0/f0=; b=rdksNErT2X/U6Aw4pNO+awNV1R
	e6pAqM4D5wqCCHcmVQX7pYhYb7J9GDo8IlNoqUTy5qFTI7J1i1MUE8EjSMX3HZP7Uy7rs4tvdoBqA
	wlyJ3G8nUBafqclvUOwYutZ4htPRtSo06i8KTO/GEVXCDF6aY9JAioHtow10RGhcG5/r674fubyrS
	PagLwZUKqu/7ODowTHNwnZIhdSjERGLh7fECh/Ip0nweosJkH0R1JxqJDDpnhwDJwYssScmwD7Wun
	GpAL/1QiU4duSqz0BN8yaUUTcPNjI/Ax+W6/3QzR5aD0Od2Ohbv0LtCC394Od895mXVewrWABDFlR
	HVuq1zVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3IKX-0000000EYKE-2Li5;
	Fri, 11 Apr 2025 17:38:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3IBi-0000000EWfa-2AZm;
	Fri, 11 Apr 2025 17:29:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C4AF43666;
	Fri, 11 Apr 2025 17:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED094C4CEE2;
	Fri, 11 Apr 2025 17:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744392550;
	bh=kKVBjIqLG2SX8Nr3mknDt2/BoyEzhiQr4GWv7mcthbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jNFD5a9zggf36yMG/tqyz74ogYdV2LE9lSIvp3npsNeWkOj88E2IjHslVbWUHDvGg
	 OWBqPEx6hE9Q6b3maM86H7muU4fF5ZCTEBT5w71z24O5gdVKAiuRKDNLRBbqErgxtK
	 iHcsb60Nvfbr9q19Cuo8Q/AknxtA29o4B9F6ZjfGo6Xc1KeUPcPI/sY6uBhQy523Dz
	 YxBl7iIriVlDF12PQj7vfiDO56qiQjvTAa+grnun4Zsi0zy3ZOCo+l2grjFD92JH+2
	 zVw8/FdeMhGGOwneH2vjZojqfMAM4JL2SvNbqJHTSVJ/BECrcUygSGHP0f5HEmrGCg
	 bA7yNVwgkl4cA==
Date: Fri, 11 Apr 2025 12:29:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@kernel.org, linus.walleij@linaro.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	matthias.bgg@gmail.com, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 1/3] dt-bindings: pinctrl: mediatek: Add support for
 MT6893
Message-ID: <174439254848.3599304.13968796413519137053.robh@kernel.org>
References: <20250410144044.476060-1-angelogioacchino.delregno@collabora.com>
 <20250410144044.476060-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410144044.476060-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_102910_572823_090F6427 
X-CRM114-Status: UNSURE (   8.35  )
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


On Thu, 10 Apr 2025 16:40:42 +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the pin controller found in the MediaTek
> Dimensity 1200 (MT6983) SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../pinctrl/mediatek,mt6893-pinctrl.yaml      | 193 ++++++++++++++++++
>  1 file changed, 193 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6893-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


