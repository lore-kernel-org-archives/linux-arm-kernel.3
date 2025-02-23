Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06FCC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 11:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m70OakGwCdr54vivJBtmBWI+oSVHcmNI9aCtPbQHn8o=; b=AV5BMnbb1qrZOscdt4tGPF8BmO
	t0FQ/+sPVaF4SGbVquE7BFSUPzt585IQX8YxwYT+hfhHv9PrERal5ZNRG9ghqk71ZHsfWwXT7PM2q
	bT3u4akSn11oQ51Ua4GFDacgPt8ENxCiaqh9BRpSzF9uv5APx/5D5szrHbUTig9qsodiylCtn19QY
	Bym/0i33qitB97pdCtu/H7hnu+FOvJxcGwbUOhXncPJWGBrqi+E3/5xA/k/spqNpkteF8wp5D0pRr
	4AsQQYkjvouzGDmWu9Xsbv7nmnj7xLyJCnUnKOcwChQoyiAeQKd90QHUPJVNZscqOkFqQTmRQf+Hh
	By/VBaFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmATo-0000000B1JC-0VTO;
	Sun, 23 Feb 2025 11:49:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmASL-0000000B17v-1Fvn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 11:47:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 97A8F5C684B;
	Sun, 23 Feb 2025 11:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B5AC4CEDD;
	Sun, 23 Feb 2025 11:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740311252;
	bh=c4aBh0SYBAutVvanVxoT09U90yHT1CI9HJ/ZAilY5pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d6hIdrU4aGsFHMMbxt1e9/3Y0ICd4bfWi47R5Uug8BSA/kXMSRCX/EC9EBIX5UAXG
	 wZMAjExlH1Nyj42BjFD4Ugzxw+Vj9xckTxsnHtxaw/WyZeETnHy//jyUeOv4E2SaxA
	 pmA/At6I4FTTbqRtU19T5ZKg5i2K7YvonGYCX4eQTQY6ecbWowqRNB/gnLcQQBLy/A
	 sDDXxfvevXqY7hGH26jvPfeECvlD/beQoi3rc3yn7s/1iIQqHRSZJTwW3OoRUGyMlV
	 oDFmIa4TReSq41pgSUls1VpcL4rPUKA7QK2gHOfU9aisL0iqhNs8O2iTxu0wuMKUOY
	 pol7tTiEHedLw==
Date: Sun, 23 Feb 2025 12:47:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ming Qian <ming.qian@nxp.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: nxp,imx8-jpeg: Add compatible
 strings for IMX95 JPEG
Message-ID: <20250223-military-garrulous-toucan-c9a410@krzk-bin>
References: <20250221-95_jpeg-v1-0-053decdb452c@nxp.com>
 <20250221-95_jpeg-v1-1-053decdb452c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221-95_jpeg-v1-1-053decdb452c@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_034733_390127_C49C3F67 
X-CRM114-Status: GOOD (  10.89  )
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

On Fri, Feb 21, 2025 at 12:48:18PM -0500, Frank Li wrote:
> Add compatible strings "nxp,imx95-jpgdec" and "nxp,imx95-jpgenc", which
> are backward compatible with "nxp,imx8qxp-jpgdec" and
> "nxp,imx8qxp-jpegenc". i.MX95 just need one power domain which combine
> wrap and all slots together. Reduce minItems of power-domains to 1 for
> i.MX95 and keep the same restriction for others.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/media/nxp,imx8-jpeg.yaml   | 28 +++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


