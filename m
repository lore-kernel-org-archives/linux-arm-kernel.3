Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B05C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 17:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fc92oh7aDThmIJFCnEhEjh4J35PksBP8E+CS5AvGzQ8=; b=3lZ8FiG1iMpFzUm9rsrHragfcV
	RC3e2NVqQU7JzP1jaoLHpmyY8sUdhEPSuMLGIBTy0CFSeg105KRhpMr+ee7/O/IxLmJ1wAq3YYjFz
	f3+RgiXivF7RueNYpMxpmfv/5h9JV+ceguM8TSYcEx3JfxOUAQhMtxcDQigjAicY0tC47USDRKo9M
	b6EqRuCRbl7HZTJnULGqWzPIDpvCkmPtHpa5/JnPd4ljHw8fcfhY4DtW05xNJJrV7txKPB/asP1JC
	a9fDnQhiCHWh7x9HfiQknW4TxAyknqKrmwKdN2g5ocq42qD+lqwczgCL02PmlZ5sk56fS1f0LFB12
	EJpYogdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcVP-0000000Efpq-0xqm;
	Mon, 24 Feb 2025 17:44:35 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcML-0000000Ee9s-2fXw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 17:35:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF968611DF;
	Mon, 24 Feb 2025 17:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26CAFC4CED6;
	Mon, 24 Feb 2025 17:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740418512;
	bh=7BpnJlKXV4oOIFthAX5G/EP8mXIMBtpkyr/ME1iFYgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OjV8/oTMaCzcrzFkD1o/RYCGAqz9fsdIfse+sngs8/DWwH4h3/fWkukPjBD7xgws2
	 41skETsxIOKiqpnZl210JKMqvEfMNkquLvD2QBTF4fwjX31mMP1WCDIH+ly14zlS62
	 vo24YZZCTCan8RJFokb4JS4nOsR9TXD/QCB+ib/kRVtXA3qGFBBfQ5dQsmrMhvKOMY
	 BjofZXZMYYZBGnVzqDsKPDyMaOxisxa5Zz/Gbiqnv2asvrEnIoYvMYWOobfYwfU5U6
	 TPTjVu3d4CldxmrDIH+68Jd+nBvjrk1km5NfZQ1Bcykp+zeDBv0ECKvLiZ/uk5gSjt
	 mBs57JSN1cSew==
Date: Mon, 24 Feb 2025 11:35:10 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: dsp: fsl,dsp: document
 'access-controllers' property
Message-ID: <174041850878.3566701.4991435952633058623.robh@kernel.org>
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
 <20250221191909.31874-3-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221191909.31874-3-laurentiumihalcea111@gmail.com>
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


On Fri, 21 Feb 2025 14:19:06 -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Some DSP instances may have their access to certain peripherals
> conditioned by a bus access controller such as the one from the
> AIPSTZ bridge.
> 
> Add the optional 'access-controllers' property, which may be used
> in such cases.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


