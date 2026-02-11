Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF2CEB596B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 06:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3i4QaJkd3AhcRjLw4R/fNEU4UqPrl/kFUJHQ9w/9VY=; b=qtW64bbzDrbWhEtvQXzYF99m0l
	pmD69+l+mzL7SJ2HDoPFJ+WVL4wrEvz25t7AVcHfp4VgX8MECtC7I6tKOnV8NZ8FSXVvy1+PQ4haw
	bCgrgWdIJ+bmDJeoQraragXGmI1wkwPdaXHVYwj2Fn4hwrkyHAz2nomoDGnL8gsG5a2Uh/1rmIZBO
	NHfSNOqvgzv/WrUlQETTIii+NVYPU7uNMUgEyFO6JJj8+Y44UXUeSkloObeoqVYP+LHzV88zqRBH2
	Ap8WhfP+5WWgtELfL9ObgNrvb48HBQdvIx/c8q4LZRBGOATnleD+wWp57PwRZW+GtuEAKZ5gMjcuF
	/4x1zPFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq40P-00000000Ifu-20uZ;
	Wed, 11 Feb 2026 06:47:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq40N-00000000IfV-0omj;
	Wed, 11 Feb 2026 06:47:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 79EC4442E1;
	Wed, 11 Feb 2026 06:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAF5C4CEF7;
	Wed, 11 Feb 2026 06:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770792438;
	bh=D39DBVuYgmIqcUJ5WRCSy4xXOe9xyGcoG2v7vm14CAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cKotFZScyMprPsBLEJTJD4lj3XdUBAZuOt4X13Iwha2YeV7f/pWZ0yuPc+JGGQc+Q
	 maQUwcmbsTrwvpO7qBBOhEZ4Z4sH3xemDzfigZ8nxdO2mRQABtVMj4U25zYJNC95uO
	 OMoRFCiHxYXzxcoQFK61Nf+DFQhxZ9M/0cb6Q2Aae6FtgNFaCX8iellA1cB/XIxtxo
	 g1R6CGsl96a80EV48V58qtDlKl90vavUmEEqF/pwgpfTPssXHaOSf1McXnUAET6Xog
	 0hS+hQPnk2N2ohDdb0GpGYfgr2RySSFxA1Aw29E+UBHtrvEi6baFjpK0rupG6lSkn+
	 /DHGQLhVtEDHw==
Date: Wed, 11 Feb 2026 07:47:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev
Subject: Re: [PATCH 5/6] media: dt-bindings: add NXP i.MX93 compatible string
Message-ID: <20260211-notorious-crow-of-lightning-627b63@quoll>
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <20260210-imx93-dw-csi2-v1-5-69667bb86bfa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260210-imx93-dw-csi2-v1-5-69667bb86bfa@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_224719_276627_15D69236 
X-CRM114-Status: GOOD (  10.67  )
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

On Tue, Feb 10, 2026 at 12:11:12PM -0500, Frank Li wrote:
> The i.MX93 uses the DW CSI-2 RX controller, which is similar to the
> Rockchip RK3568 implementation.
> 
> The i.MX93 variant provides one IRQ, two clocks, and no resets. Add the
> "fsl,imx93-mipi-csi2" compatible string and keep the same constraints for
> rk3568.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 47 +++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


