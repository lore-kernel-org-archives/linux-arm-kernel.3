Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691BCC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5nsasYsVpqPL+PS1T0O/OPdX2crYTy9APW+0J4EPsqY=; b=YBC+67OSsv34tdPd7Ya+I+Ph7p
	8YJw4qgL4VeK4xr0WrW06c8rkp5NMPJJH6LdGgkPw3LXX0fpzIyrYY+eEkJ9vMtXF62/iUZKNu3UL
	jL16C7XnFiOfc1W7F71xwnC6IpZVZ3nbP8nmb/i7GEki48sN3/tqderM+MBaD400H3RzOqadSoind
	ifRrxXQu+2iC+wj/DUU7zWhKTYoOAGAdeIrT3fGSdIWVNCIlw5uZGvbBBtDK5RIggOHg6cfddgAYp
	lO6uC1v1PdKMNsNB275tfSuvVQ7vWmV+NJxxKtBXDHdZuEK+QJKKjXWMHbrDtq8PiKEDVFN+VGhzw
	RlJPmn7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumFL-000000027xT-2E8M;
	Fri, 14 Aug 2026 07:22:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumFJ-000000027vY-0NDF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:22:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D43840BE0;
	Fri, 14 Aug 2026 07:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D2D1F000E9;
	Fri, 14 Aug 2026 07:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692148;
	bh=5nsasYsVpqPL+PS1T0O/OPdX2crYTy9APW+0J4EPsqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PZdJsjtLrZaFxUGs51rCB2U5saAMMm258m1HgOetllheuxIWBY1CFZe021AXh+TXE
	 GxF6usQ77ZAsfcgTlgOUWii2nkiEZbuOkDM1y/W6RfnHoTDDTevU/cHYtBStaLKC+N
	 UUow+nBQMBTvdgudOMX8RBOfNqm0qGJPdoWfz2T3Ymj7wvsh4YVyU/xeHz1X2wVDUB
	 K4cipgmFGR3OlyHHYcIYgljLPI3xS3golURmvxFY7+R1LgXzXAPVyMpMHmeDrOxAIv
	 TBetY3QtoOeqrSb024QBNWulX6lBiizlkBANiqfD47MXe7BZCs0k8hUEECvWbRatjT
	 +gRohztSaNwQg==
Date: Fri, 14 Aug 2026 09:22:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v4 2/5] ASoC: dt-bindings: fsl,easrc: add ports binding
 for multiple conversion paths
Message-ID: <20260814-pegasus-of-phenomenal-charisma-c1b3ea@quoll>
References: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
 <20260813070020.719810-3-shengjiu.wang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813070020.719810-3-shengjiu.wang@oss.nxp.com>
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

On Thu, Aug 13, 2026 at 03:00:17PM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The i.MX EASRC hardware supports up to four conversion contexts
> (A, B, C, D). Add a ports container property to the binding to allow
> each independent conversion path to be represented as an individual
> audio-graph port:
> 
>   port@0 -- conversion path 0
>   port@1 -- conversion path 1
>   port@2 -- conversion path 2
>   port@3 -- conversion path 3
> 
> Each sub-port references audio-graph-port.yaml and follows the standard
> audio-graph binding conventions. Contexts are allocated dynamically at
> stream open time; each active stream direction (playback or capture) on
> a port consumes one hardware context.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,easrc.yaml  | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


