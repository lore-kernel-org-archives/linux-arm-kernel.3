Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46C5C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 07:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tNAkI5vPOVX8HetVxMd0XhWn0MZflkc+mnZkRCDPdI=; b=oV4PEShASsnMqLMzHCmJW8+dU3
	iMs+nQFwbRSsStRn9TWRYCA0NZ0Tm+Bzjp6rJAucmYb51kl+C6lRKFQi24w5bIhsBoxOUknU1a0aq
	AuDXc7xL3iIQzMr+8M663tpSpKk2kb0qI6LZjxeZlMNekb3b3WdNRkXRNSN3SUVX+l0HW1+0R4IhE
	bmCGw3Ej1ZT6/p7H3X+qyK8RyoGZ1s0X8Q9LduWgLAoVFIP+TIpk/yRUpiEBsAGyoeKgcQDguPpw2
	i1Ts1SQFW+rUDBfhU1DKYFs5wxM5KQuff2LJaq+A2NuDg/0U519yzxwAZMzh/3DvRFRrsafgJUWf6
	c9YOOILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKDR-0000000BBJz-2orM;
	Mon, 10 Aug 2026 07:14:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKDQ-0000000BBJt-3zfb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 07:14:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B2AE640224;
	Mon, 10 Aug 2026 07:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1DD1F000E9;
	Mon, 10 Aug 2026 07:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786346072;
	bh=3tNAkI5vPOVX8HetVxMd0XhWn0MZflkc+mnZkRCDPdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X7ronXcdvcEuXosufT2+KbF+82VRzRQueYNYrv0YC5Isef6VGJZAU5v3WP6mwLZcq
	 5GQAxziFxT6+xFMhaN4tm8zVRzhlzet+1skX2m34LVhRnoewm+q3XqAK8hz1sMPq86
	 aE+SAHptjsCt5rJraZByYq5DR5iv+B1azs+6wbgX+BXdY+TU+DayG1YwlPTaX0n+vG
	 4uy8yPi2Gtrotr/TgpmFSXtNyc64OFkG3BA0jV7aZp1nZcJJ/raqSuvQWiPcU3VBss
	 aAORSjvJcAjsjvkq9T6s4sLCOIseteyYPwrhlB4fCfFnA5FfFPlTXp152Bv7UixqiD
	 7AUL3GPkpqpUw==
Date: Mon, 10 Aug 2026 09:14:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
Message-ID: <20260810-normal-cuscus-of-argument-4b230b@quoll>
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260804100218.49587-2-shengjiu.wang@oss.nxp.com>
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

On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).

Which SoC? Did you read this binding you are changing?

> The existing binding exposed only a single generic audio-graph port,
> which cannot represent independent conversion paths when multiple pairs
> are in use simultaneously.
> 
> Add a ports container that enumerates up to three sub-ports, each
> representing an independent conversion path:
>   port@0 -- conversion path 0
>   port@1 -- conversion path 1
>   port@2 -- conversion path 2
> 
> Each sub-port references audio-graph-port.yaml as before. Hardware pairs
> are allocated dynamically at stream open time; each active stream
> direction (playback or capture) on a port consumes one hardware pair.
> 
> For backwards compatibility, keep the old single port property but mark

Why? Did the old hardware change that it has more ports/paths?

> it deprecated. A schema constraint (not: required: [port, ports]) ensures
> that both forms cannot be used at the same time. The binding example is
> updated to show the preferred ports form.
> 
> No existing upstream DTS file for fsl,imx-asrc uses the previously
> documented single 'port' node, so this change does not break any
> in-tree device tree.

Does it break other users of this binding?

Why mentioning upstream in the first place? Either this change breaks
ABI or not, explain that.


Best regards,
Krzysztof


