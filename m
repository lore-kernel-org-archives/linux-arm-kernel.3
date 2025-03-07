Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A61C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 21:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7eOdGDbXr5oQNJzgU4E9xQ0XM9ZpeR+1kzjj1FAd2Y=; b=z1/AsgZLM2hCUHj/6yvvg2bIeZ
	X1OV2/mxn4BoAhM1AOV/Y40kLydqc1LtvIcGVU66XssJODdGpiDKr/Kuf8UqWfD/NxnzVnowfT59p
	TXPK+u1GoIxHipAygIxL0KFUME526JhlnTQEUPXWQMpV3Xwt9ybM2IN6GwvwYsW5go+lZeohiYk03
	Ld1zETxtoUnRtGxMUKl++LPvhdWm7ik+7cBSScpN8pRzpvL1MegIxpUb1p1BGiGIePfY7E1EkQDIf
	HpG87bt9sgu1tvjPcuc09sghZ8yfK5mgdtCa4ElKCy5LTaYf6p4dWz1YX34Ph4lemTItxt5mDAtxD
	ybLs/UMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqf59-0000000FYew-1OWU;
	Fri, 07 Mar 2025 21:18:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqf3W-0000000FYUq-2RGD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 21:16:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 158AC5C59DF;
	Fri,  7 Mar 2025 21:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536AAC4CED1;
	Fri,  7 Mar 2025 21:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741382189;
	bh=6aVpZFW4tHxOAaUitb1GesMT9DiFjftuQE+6p0UOB/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ytm7P2hZRURzdJ+MU/yAIFDZSb+UrdpuCgMMNA+gp5StPf09sk47cIYEtNcl10w/N
	 xh9SDbphksavDOZuQ2QC+5X1/okH1S3pkn9k0GeJaAFDdwElork59YXyBVbqgYK8fZ
	 yOFUBLzLEUMZW7QGnQY/j/mEOBo/q+6xMTojJ+fquEt2oKfkC8EbU5Jqh3AmQcAopt
	 J0MLPZSbE7j1NB6wiKuTHTmCQLDf33ojUtxDw9vcEtGuRVq/8YygfECX6aTuq5LZqg
	 EFxoI3HJPn5+UM1dK/7zg5+PPZqwn/DTuCGxok4c0Hg6IcXLvnH6uTS0nkiHqQ/z0j
	 h7XCowHyUAxNQ==
Date: Fri, 7 Mar 2025 15:16:27 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: kernel@pengutronix.de, conor+dt@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	shawnguo@kernel.org, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, broonie@kernel.org, festevam@gmail.com,
	s.hauer@pengutronix.de
Subject: Re: [PATCH] ASoC: dt-bindings: fsl,imx-asrc: Document audio graph
 port
Message-ID: <174138218697.627767.13339354154836355271.robh@kernel.org>
References: <20250306053138.1914956-1-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306053138.1914956-1-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_131630_658958_E63DB84F 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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


On Thu, 06 Mar 2025 13:31:38 +0800, Shengjiu Wang wrote:
> This device can be used in conjunction with audio-graph-card to provide
> an endpoint for binding with the other side of the audio link.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,imx-asrc.yaml      | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


