Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ED5CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 08:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMGkT2jafiSP9J/ouxf53BlYWSzuSfdY7OfSHuOjnLU=; b=wHVuiNzxcb/bvirdczYKgUX0i7
	M/r9DqhhcFiYqlh+FH1ctMtsj+8Al1+OGnSW7suK6dfhyHA7hoCAzMSa1pcQh/RftxM+ReX0xndXl
	jEdnFDtIh73CkWiev8Xg5yJ2TKIoBzlS26NtGH1WzG4NTv0xArCqOeUrVqzPRBybQIop+6SoA8u6K
	iOerav8viRBzhS64AupJO7TaGB1gc1Mxkwpz6PMpBdRc+/TkIJZKlAL286ux+rWYWtXWdCkzKy3j2
	NliKVk1Ks/XpIYY8OakCjmcWcjJJrEFCFWYU+w1rDRl91rGlAAcVSDkQD4IqXT3leSPLZpECDMv7E
	1xVpQELA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZDO-0000000DJsO-0O0I;
	Wed, 05 Nov 2025 08:50:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZDL-0000000DJrJ-2kfM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 08:50:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1403E43FDE;
	Wed,  5 Nov 2025 08:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFCBC4CEF8;
	Wed,  5 Nov 2025 08:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762332598;
	bh=2Y1w6bkA2Q5H1e/6/2oG37f+BVtHYYjkIoM1/5dBfiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jJSPmQEYTzfQYPTiek+jRvogb/YBMztLwwi7hhdfdJlXd556tHxFp+VkmjCAfIh41
	 f6Iah2WW4+4Orano4Wim+FwboOprywWhW2OefKKctrEhFFuEVa3APLSatzvawLcIeD
	 P0EZnPODL+7kWzrUaV/s++lRMQAr1KMn3JNxDRVkFOi9Ko7sz9Bd8zidiQSsabIfYO
	 EBx5VpgB7kQqFkRxNOnVUFoD5//NgbaFVVIjic4oqVMLySYmHmf3rbsJxg3tzzzxhh
	 k3dum8VVKQIKdMVrZrL+wbmXFjW3I2CPMOPIS6LTkkzt4YjKph3tQSGRWfeSd17q3p
	 Jcy2tEad3dcrw==
Date: Wed, 5 Nov 2025 09:49:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 1/3] media: dt-bindings: nxp,imx8-isi: Add i.MX95 ISI
 compatible string
Message-ID: <20251105-fancy-practical-saluki-1a6ec8@kuoka>
References: <20251105-isi_imx95-v3-0-3987533cca1c@nxp.com>
 <20251105-isi_imx95-v3-1-3987533cca1c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251105-isi_imx95-v3-1-3987533cca1c@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_004959_715275_B76526C7 
X-CRM114-Status: GOOD (  12.55  )
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

On Wed, Nov 05, 2025 at 01:55:10PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The ISI module on i.MX95 supports up to eight channels and four link
> sources to obtain the image data for processing in its pipelines. It
> can process up to eight image sources at the same time.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 27 +++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


