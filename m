Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A380610F3DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 14:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iX7P5QWzv7flYt6twI40qPLaR8gYvgSjiaBf3DSyomQ=; b=3JrjCdSNxG16ncXqRmSfoJsmro
	x5huubFYuvqMvgM5Lg8+A4ZibNT+zTbJCVoy9TvqXPIAWRPstMykfMBW1MvOKSbAV2k7tDuuOUt/E
	ZPUvr/mFQ6HTtclq26cy7cvTZ1Zvbh0n67vDdCPlZZxL3R6g7gGUS8RwfmGX3gRiY3UuQfHDfAGIC
	zs3DqrBRkmI39r7RJOlM4Plbvat9vcb0VOaStAUHFgVutvxYHBgVO6JrClrp4hkwsDWZLHNLmp7i5
	dfMEdmcdjvbpepyNF+3jFFGrRryeFZniBpzxL8K2B/1NVh6Y7bdqX5sjq/GCNizdVQgTj9iHDPQMK
	pegD5HAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6UDD-000000090Ah-1dev;
	Sat, 28 Mar 2026 14:00:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6UDB-000000090Aa-41g3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 14:00:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A3CCE60054;
	Sat, 28 Mar 2026 14:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7746C4CEF7;
	Sat, 28 Mar 2026 14:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774706423;
	bh=JHRgANjYlG59Tmy8JU0d+EGviW+veg92wQFCjbKyeYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pdw7szfIMilLBa1KjFEH+K9moemQQBZavrASwgl665i90dRNijfVFBx2RizqEzE6q
	 EWVSCxBgIDoUmvwVvkE4qJi/iiZs9DWTGoZAT5sVz+Nq6SmzrUJq+vUTycjsuysfck
	 Xwa2pT0Wa4KWfOGRpCpXbXhbOOFACtIyxmqNFRn7eg+JV7eK46xyUN9Vf7Yc7mTvyy
	 gXfeOTha0qX8Ljg542bIxd7PrSEBLpCfNhFO+81v57Yf/cC7ti7svwPsDjO/pjh/V5
	 7PtVgyPYhERs2hnlF0Jl1e+23CCfxJrneaE47ILWl2yi9dilMEioCRedIkRX9H+2zf
	 KfnNDjzUAz6Ig==
Date: Sat, 28 Mar 2026 15:00:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: nick.hawkins@hpe.com
Cc: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: hpe,gxp: Add HPE GSC platform
 compatible
Message-ID: <20260328-chirpy-sturdy-emu-9eb0cb@quoll>
References: <20260327174445.3275835-1-nick.hawkins@hpe.com>
 <20260327174445.3275835-2-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260327174445.3275835-2-nick.hawkins@hpe.com>
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

On Fri, Mar 27, 2026 at 12:44:43PM -0500, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Add the HPE GSC ARM64 BMC SoC compatibles to the existing
> hpe,gxp.yaml binding.
> 
> The initial board compatible is hpe,gsc-dl340gen12 for the DL340 Gen12
> server platform.
> 
> Add the arm64 DTS path to the existing ARM/HPE GXP MAINTAINERS entry,
> renamed to ARM/HPE GXP/GSC ARCHITECTURE.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  Documentation/devicetree/bindings/arm/hpe,gxp.yaml | 7 ++++++-
>  MAINTAINERS                                        | 3 ++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/hpe,gxp.yaml b/Documentation/devicetree/bindings/arm/hpe,gxp.yaml
> index 224bbcb93f95..6f057cd58571 100644
> --- a/Documentation/devicetree/bindings/arm/hpe,gxp.yaml
> +++ b/Documentation/devicetree/bindings/arm/hpe,gxp.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/arm/hpe,gxp.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: HPE BMC GXP platforms
> +title: HPE BMC GXP and GSC platforms
>  
>  maintainers:
>    - Nick Hawkins <nick.hawkins@hpe.com>
> @@ -18,6 +18,11 @@ properties:
>            - enum:
>                - hpe,gxp-dl360gen10
>            - const: hpe,gxp
> +      - description: GSC Based Boards
> +        items:
> +          - enum:
> +              - hpe,gsc-dl340gen12
> +          - const: hpe,gsc

What sort of ordering are you going to use in this file? Usual choice is
the fallback compatible, but I see you have chosen something else. That
is fine, just keep that else sorting in the future instead of adding to
the end.

Best regards,
Krzysztof


