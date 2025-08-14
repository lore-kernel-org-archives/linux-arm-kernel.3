Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63007CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 21:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LniqOhWqcfPcYgW0emKwQu5jQjjYuwZidM1X+bvbAcQ=; b=pxE9UMzf3sl8O1v4HzXfsGHTWm
	C1pBR9g1lulOXkEYatsb1BTjDK96msjRcnGsdOLzqZBs8nD/5QtBypscaFtRyyuRE0gbaQ7mX4rYi
	Zn9+98GUn/hnDpxKBGIZmEP4L2+FL0ch6MZZlZW8HaBSTz7z8XVZpCvbysTWX6WZT91qnsxCDCGuf
	gOk5yepLk4ONT7g0VWb+lYzEitPX4lqIfoQcPQGldBNl1RnK9AxxQ47FmWbNi2eNR+JPWng+jMxLm
	bqLKP3mdnnRjRAj4rtWMP19NIj5sEqwFDF8ehAcagm5FvWIqS+0PPMbLO+LS/l7Q/jUstNFZf9R7H
	+r6MKOyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umfA0-00000000Z3v-15bj;
	Thu, 14 Aug 2025 21:06:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umf7R-00000000Ysg-3wRh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 21:04:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 03EC9601D8;
	Thu, 14 Aug 2025 21:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C74C4CEED;
	Thu, 14 Aug 2025 21:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755205426;
	bh=/cMIpvVKVnuyA7oJNfhFxhtMLJRGewWERCpdem8N3co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W+MNVYCUJLQBc1yK3Cc8ydKZ9H12nGPrcgFKWMP1vAYJzC2tZj8gx6g8cYrk8q394
	 FMRzyJifExSgLEtFxzycID4AguyW7K0Esvv/juQ86Tr+rwy2mZ8kzlh1sMrCJnuRXu
	 QT8Jvn9a/nRtPQP0ffsQIvm2lmn8ATVoPHOsA0wkRRFJ9lOm/z1NT+GLgvdRPj3SsZ
	 iVEDgMJ0c86KKXWxTKE+3DwL31kWKiO/oZYJZGxvEGZj4tdl5/IRkq8jKqltbUeMrx
	 PkQNmNxCa9NEh4Ld8WhCl3CJA6YBWwaOat1fv11RXZ/QnkOp7RPVTx4CXg+RlyCZxz
	 tgQv0JTSmEiPQ==
Date: Thu, 14 Aug 2025 16:03:45 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: List actiontec devices
Message-ID: <20250814210345.GA3905129-robh@kernel.org>
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

One two?

OpenWrt's

> Actiontec MI424WR revision A/C and revision D, both
> of these are IXP4xx devices.
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

