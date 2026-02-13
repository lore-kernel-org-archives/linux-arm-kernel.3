Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF9BEF48DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 08:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FlMFM8lb6whj7Eje16L7czXtxhAJx1UYksZKjTZ5oi0=; b=UOpW+c3HTQ/Aop8ZNAgDsF/ezi
	NsRZVYrbwVRWYmeoB+vbwhPPkaCRGTTRf6a1Re6ufojYJfkQEPf27NgY2IaVymmPQbs21jTofqDDB
	zgol8r+23xA2Ay9jmZhiSn6RrvfRojWBYbpxlHnC3aRDcPuIPXzwKpKp5Zm1sDnKzZ8MG/iba3WCR
	/XqSDMiHwTALT7F/hvNGpAdZ45M+jZ6rhvcdD2TAvOqHI4JX0yLHc8IMiJMpbreSAnXdIl+wylWcR
	zgRZTvz34iWZSSUwlCHUCZ7Ocvz7Z9SMpiHqMXZYWY6UeO+gcItd0KdDUApCPSmKN35jN52A1YNFD
	P//0/qFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoJ5-000000039Kb-3rcL;
	Fri, 13 Feb 2026 08:13:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoJ4-000000039KT-3ECo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 08:13:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C5A2B6091C;
	Fri, 13 Feb 2026 08:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D04C116C6;
	Fri, 13 Feb 2026 08:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770970421;
	bh=efH6EuANqnS2TxiSVaLEk2gpxJHIem6ZkrjkpUI/mZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QkZkpMJxDELSx0kyOcyzgRlBDuab8uiuaH+0QjEpnujwjpwC28sHsRqudyJxoqIrO
	 zSA9dqAV3AtuPvRhuNwfIQTFYYG+xhY0ft0S13tI+DlSLjUam8YiI1XGNJdYT6dGl6
	 mtynOORkRDeDs5pJh08Lv/6S2VjMqk2KMAsIHIkrXRjUfg2DG/2+If1CIr1/1rU6ef
	 6hf/G/kKKf5SPz1BZ3DjMUSpCKqfEvBKGssta1R7rt198fE02nw9dlIAxL07d8VkA8
	 xX0NhSHoWpNgCTK7KbMaP3XybkUALHrjaR973utl8/w4gbLqQGCdYdXPx1S4561yz/
	 N5+YdwJUWolCw==
Date: Fri, 13 Feb 2026 09:13:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hari Nagalla <hnagalla@ti.com>
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: k3-dsp: Add C7xv dsp
 variant for J722S
Message-ID: <20260213-poised-archetypal-trout-fcb5d2@quoll>
References: <20260213001151.17370-1-hnagalla@ti.com>
 <20260213001151.17370-2-hnagalla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260213001151.17370-2-hnagalla@ti.com>
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
Cc: nm@ti.com, robh@kernel.org, conor+dt@kernel.org, vigneshr@ti.com, mathieu.poirier@linaro.org, devicetree@vger.kernel.org, andersson@kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, b-padhi@ti.com, krzk+dt@kernel.org, kristo@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Feb 12, 2026 at 06:11:48PM -0600, Hari Nagalla wrote:
> J722S uses the C7xv DSP based deep learning engine similar to AM62A,
> but the reset and module enable integration in the SoC is little
> different. It does not have local reset from power state controller.
> So, add a new compatible string to distinguish this difference.

This does not explain lack of compatibility. You ALWAYS add new
compatible string. ALWAYS. Drop the last sentence and fix the patch.

> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>  .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> index b51bb863d759..c241d88f640b 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> @@ -29,11 +29,13 @@ properties:
>    compatible:
>      enum:
>        - ti,am62a-c7xv-dsp
> +      - ti,j722s-c7xv-dsp

721 < 722

>        - ti,j721e-c66-dsp
>        - ti,j721e-c71-dsp
>        - ti,j721s2-c71-dsp
>      description:
>        Use "ti,am62a-c7xv-dsp" for AM62A Deep learning DSPs on K3 AM62A SoCs
> +      Use "ti,j722s-c7xv-dsp" for J722S Deep learning DSPs on K3 J722S SoCs

Same here

>        Use "ti,j721e-c66-dsp" for C66x DSPs on K3 J721E SoCs
>        Use "ti,j721e-c71-dsp" for C71x DSPs on K3 J721E SoCs
>        Use "ti,j721s2-c71-dsp" for C71x DSPs on K3 J721S2 SoCs
> @@ -127,6 +129,7 @@ allOf:
>          compatible:
>            enum:
>              - ti,am62a-c7xv-dsp
> +            - ti,j722s-c7xv-dsp
>      then:
>        properties:
>          reg:
> -- 
> 2.34.1
> 

