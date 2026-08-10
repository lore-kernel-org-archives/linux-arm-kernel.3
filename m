Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2068AC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 07:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COaUeTCLiC6/x/enOdcDm7m3J3BQbpu2C+HiphZ+rII=; b=jzGY3oMxGm5v9RqPX64jjTE1dH
	VqgtAmip2ZsRcNPwnagrvvs7IobrRKKSGx1tVmSB1qeeQwexSou7XWo+YdhAXzQibEWo+bIgz+DDA
	pMm6cWJwN22sYnQoq13+5OH67k5ONu5l2dBfB2zrQ4h7DC+C2pF34mOHasBxXvfMWtJcC3b+aZx4Q
	WvLjdVjoeA7dquGAAAKncB1lZ0bD4IqQhOxDq5oTk9ABB6AwfrYC70d9oRn9tMmDcp2wV7D48i64P
	7kW6omIZjDBpeDElACGLycA9zVs0YtttC34ldupxdGKBTuky48Z99V+dqsPNW2QW3kev5ldXYJNqU
	B4ttFY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKBN-0000000BB6M-2eVC;
	Mon, 10 Aug 2026 07:12:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKBM-0000000BB5z-2Yup
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 07:12:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A902360120;
	Mon, 10 Aug 2026 07:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81821F000E9;
	Mon, 10 Aug 2026 07:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786345943;
	bh=COaUeTCLiC6/x/enOdcDm7m3J3BQbpu2C+HiphZ+rII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VUqmyhbfMBOS1FXtoKdFP+hMikiAiRZebva27LL+5ide3tHHtTYOaz/xuo9YdJPr+
	 yJkLroRSTobte/93yBnmsugwgHF3OzGCZVAIAEIfub5qJJGzwe8OH+z01ym8JW6wiQ
	 5jx4ZgLMdIPEHKQXm/AxjrsWvQLubsjqFiE16VyODK4VrMdmfOXOuhTnicHhOXVqi/
	 nIUM6ZObJhU+KTiw5D8pQHsELpQL9+4zAaaw+4JGPGpdm6Bdtdpa6178a/tLpXwOWn
	 mfdUPkDdALWesk3UNN8aZToizZEO0/3lAqu7aKZ8HNhrFyhHHnbxk4eT2yWpYuj6he
	 GrwUXWKMoEHPA==
Date: Mon, 10 Aug 2026 09:12:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
Message-ID: <20260810-magic-olive-gecko-5e8a36@quoll>
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com>
 <anH5i7y3JkB1moee@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <anH5i7y3JkB1moee@SMW015318>
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

On Tue, Aug 04, 2026 at 09:39:07AM -0500, Frank Li wrote:
> On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com wrote:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent independent conversion paths when multiple pairs
> > are in use simultaneously.
> >
> > Add a ports container that enumerates up to three sub-ports, each
> > representing an independent conversion path:
> >   port@0 -- conversion path 0
> >   port@1 -- conversion path 1
> >   port@2 -- conversion path 2
> >
> > Each sub-port references audio-graph-port.yaml as before. Hardware pairs
> > are allocated dynamically at stream open time; each active stream
> > direction (playback or capture) on a port consumes one hardware pair.
> >
> > For backwards compatibility, keep the old single port property but mark
> > it deprecated. A schema constraint (not: required: [port, ports]) ensures
> > that both forms cannot be used at the same time. The binding example is
> > updated to show the preferred ports form.
> >
> > No existing upstream DTS file for fsl,imx-asrc uses the previously
> > documented single 'port' node, so this change does not break any
> > in-tree device tree.
> 
> if no existing upstream DTS file use it, you can direct replace with ports

And what about all other users of this binding?

Best regards,
Krzysztof


