Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C1DC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yoJKjaYZwT3kC7Z+BcMIAXUq6iz8NORS15vjre6gIE=; b=WJABpzfn4SnBUA+3dKVBK9CQRd
	sKDVLo4ilVyU8jVm3ugwjXtbjIycZSSpvlwSxwhoWwj6FSWm+wj+xaXOFZypB04D6i/MRgz7PBz5E
	MQmFy4I848C/P7l4v3gdEwftqlrdijLn101Saw7kOh5jZ7lNI/xL84ekTyH5ukMaTu7uN76ZIpbdX
	aOCgVN+i4UMkiXsej+moyPcxYv32RQoUzT8Ihy+bpIFF2/XfihNqNFKUOzRLyLTvBhQN/qlWLge2J
	Iw0LjM+l5LGfjqOXOqjuf18UzziE3uZWVw9SzBBc1kp8rqJGkpkdbgpJA0XGTxYTmRnwsjmDJfYD5
	sTypWPWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumEI-0000000278s-2AJg;
	Fri, 14 Aug 2026 07:21:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumEC-00000002750-24uo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:21:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 51BEC60A63;
	Fri, 14 Aug 2026 07:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9CB1F00A3A;
	Fri, 14 Aug 2026 07:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692079;
	bh=8yoJKjaYZwT3kC7Z+BcMIAXUq6iz8NORS15vjre6gIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hx1lDAS615F21oEJLRKd/1lm1N/2JFVEQZaTxSBYxSiIli44zw5NBm4GCXg3f3o5H
	 fqZdNxeTjJ3wGSwDGJzM/zzbUgydnaK0qs+ScQU7j/8jc72hbT6vrH5zFmVaUZd+i2
	 BnZi/izwsueYRVq8cheOLfhaMR9gkwFSPq72CKe4eguJOR/bo7OXoQ3LHycqAuF2xY
	 yl66dizcw2yrWZxlXPoKoMlWxy678+kX38OcITVc2LEOL9wVwwWv9qOFRzh3Pp5rdf
	 P17BkykcZWcWQIx7pLahv+Zxuj7/3u/5byqZmStYZHMdaKJ9BlL4JBN2OXe6hrvE2T
	 eNnjrTgVcxuoA==
Date: Fri, 14 Aug 2026 09:21:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v4 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
Message-ID: <20260814-lean-classy-hyrax-60aab2@quoll>
References: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
 <20260813070020.719810-2-shengjiu.wang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813070020.719810-2-shengjiu.wang@oss.nxp.com>
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

On Thu, Aug 13, 2026 at 03:00:16PM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).

Each one or only the newest? You will be getting the same questions.

> The existing binding exposed only a single generic audio-graph port,
> which cannot represent independent conversion paths when multiple pairs
> are in use simultaneously.

Best regards,
Krzysztof


