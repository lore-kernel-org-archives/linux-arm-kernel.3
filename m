Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571A3E8FDB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 08:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQxIOYhP/lBm8zgHnPk9Fb7b4yQGSgbZTuZX0aqhzRI=; b=hZqwZMRCUUG9jngUV0ViBFbDRH
	mejB1cCyo3Uw/x58VAhzwNnWAePl/w1C8hmf7tky7ZIZ2AEcEc4DTfgXMcBN4LpDP6HFmI1mAcGFX
	aw3xfOcIut84k3XB5FZ8BU1ws2MKWvkQ9VYIFXqWizgVTKnQ5RXitPwql97ZAB+N4CR1n8Kyyieyr
	M4pJNQ8qVXRHBb2k7gPzqUpA1BKEyNum6hxOYLQT9GrTSEfEwrfTthy+sDmesGA3m+wR64dEfr14X
	Nmd2qUIsnJsSx3BGf8RaVSy7c1M6uom3CTmdBWI6WK7t+pDFla6PKWpR1o4B9PVeth5oExPIVgzks
	tTzPNJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va90N-00000003Uua-37sn;
	Mon, 29 Dec 2025 08:53:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va90M-00000003UuU-2NSd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 08:53:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB57760017;
	Mon, 29 Dec 2025 08:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A4CC116B1;
	Mon, 29 Dec 2025 08:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766998409;
	bh=uXL+n/Tl66FQbVUK2N0Y4zfxWQucSzI8EgEacDJ7HDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FRRdMgu3GOSK6fw9/oB7bikiDoA25Jx0PtgaN4hjZu0edajeALtUkvfsDmg7pBFq+
	 7cWA8mTOy8N6iyC3cbDjbY7twYC5RQpwv/c9v2Ptu9VRCtuHznsh2SvcCo0v344cV4
	 oCrRP5qJRx9kb4NAs1tf/yJYRwlHOWo3/q3+w1MKFzDY7gIS5z8yp0VtKADUt/NRtn
	 sVBrMV8jugRGWsE2Xp26EN0SW5gSdHy0l3J0Bm3svrZhfLB49Ktv1yy1tLVD8SFtXV
	 fNMO+M0X53SgzeFntBDCN3n2w6Mm+FMtlPdXzJLpEghH03HyzoWouBWQarLPflb5LS
	 G2ZwBdtCybiOw==
Date: Mon, 29 Dec 2025 16:53:24 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] two small fixes for imx8qm-mek board
Message-ID: <aVJBhP5lIZWaGUqi@dragon>
References: <20251119-dts-imx8qm-v2-0-2579434f95cb@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-dts-imx8qm-v2-0-2579434f95cb@nxp.com>
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

On Wed, Nov 19, 2025 at 11:22:38AM +0800, Haibo Chen wrote:
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
> Changes in v2:
> - PATCH 1: add fix tag
> - PATCH 2: add Frank's ack.
> - Link to v1: https://lore.kernel.org/r/20251118-dts-imx8qm-v1-0-63e226ffe512@nxp.com
> 
> ---
> Haibo Chen (2):
>       arm64: dts: imx8qm-mek: correct the light sensor interrupt type to low level
>       arm64: dts: add off-on-delay-us for usdhc2 regulator

Applied both, thanks!

