Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2602ACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 21:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbNv0DX9Rnzx7YfV0NOFzD7Xn4lhnzrsYlrrxxGNRqA=; b=wbdLQDMaTpZifp5sC+VA8haJ+6
	CZ8cyGqjR5oTobr704Zt0P2FLHkEnlh+oxRBYM+UefzjIPIif8/c5cTbhBPvQjD6LjfnZQpGkg2Z8
	uFPa0b1evHrCgWOLAxgy7hOSmVCp03YWdszX9h8Y3JH5CHVYkSO7idw+er6pHIRacW3cFDQx5tpNW
	8C2Dpf/FfZ1H2/VWjTUgOcuqAdp6pjl1i/Dmao3xIkc1g65QwLF/7xVfmgNj1S412h0ROzOVnzHuY
	FI4QSjwk1SDhgNWYEkOCYCWIiBbpTmB4A6gCJ9kNNSJNy58FuRleSZ37BD0deQO1tJIbeYHoqnaSS
	OK0GfiHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umfCW-00000000ZF1-3zhx;
	Thu, 14 Aug 2025 21:09:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umf7X-00000000Yt6-3IQ2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 21:04:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5F6460208;
	Thu, 14 Aug 2025 21:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848BFC4CEED;
	Thu, 14 Aug 2025 21:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755205462;
	bh=n13b5HQISlhA/70Cv5syYWGpEOsvm9HFOMaW2LiyC80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k9UbsbGDQ8YDvU1zxj6IvmOWierLnzXIcfTj3I2z/1kvlZY07CSJlxgWGOgfN+E55
	 v/ZSrVKkZhTd89dB0WnoF1gqw3tKLCvj91Ep5lRM3qrqScJ74CKxB2AXYJTKSOcJ06
	 uoll0I5NMxa+EARnlcD4UEHyzrCBRJphjw+0cEj1tpCEIE9H6WCq7JlgvVRWCWzo31
	 FCir+mFiK9iVYCEDi4b9uODINZbPHRU21kTuMn9stDif9DP/iINjhWVwRTYKoBdoOR
	 0L+nOrI7kT7XnKk3VhVC+BRtLCmqyyGLdY2sELoEwSoCKJMkrVxmIcJ42Ky5ItzbjQ
	 jDn0c1lNYmcrA==
Date: Thu, 14 Aug 2025 16:04:21 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: List actiontec devices
Message-ID: <20250814210421.GB3905129-robh@kernel.org>
References: <20250814-ixp4xx-mi424wr-dts-v1-0-b7c10f3c4193@linaro.org>
 <20250814-ixp4xx-mi424wr-dts-v1-2-b7c10f3c4193@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-ixp4xx-mi424wr-dts-v1-2-b7c10f3c4193@linaro.org>
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

On Thu, Aug 14, 2025 at 06:40:04PM +0200, Linus Walleij wrote:
> One two IXP4xx device families from OpenWrts backlog:
> Actiontec MI424WR revision A/C and revision D, both
> of these are IXP4xx devices.

Also, 'ixp4xx' should be in the subject.

> 
> Revisions E and later use different chipsets.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml b/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
> index d60792b1d995f909f621b3326e62d19223f6683c..b7b430896596aacb792983d8538b84f389cc5bd1 100644
> --- a/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
> +++ b/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
> @@ -16,6 +16,8 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - actiontec,mi424wr-ac
> +              - actiontec,mi424wr-d
>                - adieng,coyote
>                - arcom,vulcan
>                - dlink,dsm-g600-a
> 
> -- 
> 2.50.1
> 

