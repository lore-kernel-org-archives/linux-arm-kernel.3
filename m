Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B575CCA9ED5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 06:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vPTVfQX0lP4O9dxbl1gVroQOSOKrj2GjFIjLYc/2qPA=; b=lZIh8hBlFP71TH4X2z6w6P4KW4
	Kv24SccstZSzUo5FkUyU02yXn0RvtoGpmuew/bCRlCFcf0jr3hfmafXYenRc1HQ5tA+GKYs17aXuT
	iUaFX1JHyVT90uGSUR6Nv+n0vyIEaXHt/V84ojQDflqdREbYZHi88Rw8Rj6RQlvSg1+N01iHAh94R
	WnNhP5xzVXbe0SHfEispAq2uNUg/ydg3uJq8L19Ol10Z6ozDjC/zpGsyHfN/ggIlpo4RxkDUUp1QC
	D6WMVAlG4HGoHZULyK7SMvVMm7dVVdlf2B2l1xGCIpFcD6qVOTohKEisDIeTlIOsW3ubLrN6YOqDg
	3HcUV0pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9l9-00000009lHP-0fMc;
	Mon, 12 Oct 2026 06:43:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9l4-00000009lG6-32Ba
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 06:43:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FF2660AA1;
	Mon, 12 Oct 2026 06:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13A21F0089B;
	Mon, 12 Oct 2026 06:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791787416;
	bh=vPTVfQX0lP4O9dxbl1gVroQOSOKrj2GjFIjLYc/2qPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kUegjVzcYrvWsI+bjoCIh8UMRt6HTYK0eHjhU9kMK8zCs95X0/uXu2ndLtEDGppvo
	 2C7Eum9cjZSbs46GKbeVyU0UY7WihNSs8NsmbzuCbdme3fSqXB+B7VloZbfcvSxpU9
	 Yi/k9I9dNF7hhmomDqYjNusxkhgNxantpn8LXY+19rzqdJKRiOz26IkV5Bfob48Q4Z
	 T1HJpGQB+JdFAfX/gDh3Vha1AVQuQ7kkBBR1vEiU1mnHhs//j4pdeQ9ahveP+xNTAY
	 SvI91HHSamxOAP8kP6Qnq3SLIf2sFmpzISbdFDk31sV/UksyusXcUuVF8iTIlILr2N
	 6h3xVcrX33tLQ==
Date: Mon, 12 Oct 2026 08:43:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: sunxi: Add Teclast P85T tablet
Message-ID: <20261012-inquisitive-python-of-competence-a2bbf1@quoll>
References: <20261001022415.913959-1-iuncuim@gmail.com>
 <20261001022415.913959-3-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001022415.913959-3-iuncuim@gmail.com>
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

On Thu, Oct 01, 2026 at 10:24:13AM +0800, Mikhail Kalashnikov wrote:
> Document the compatible for the Teclast P85T tablet, which is based on
> the Allwinner A523 SoC.
> 
> Assisted-by: OpenCode:DeepSeek-V4.1-Flash
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


