Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FF310ED65C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHsX4v3MH/g0+zaLpCoOgzdQzAsK/kIJa1+i9BC+Rvc=; b=2mABBqbfpa3A+Dg1ZsbcECi2Fw
	iAUHsd+Fbojo8V7Hc/oP4WeUrDcy4i4L7YHX6p1foLAos0O3+NpyqbiI7SLiMef0oTu1JRvSBEaok
	WL6s8Hpgn8z8A9O8PFlBXHrm3Q5b5HXmB9B3n9r/JMM5e0Dl8jfcuuj+SnWU6x1H5AOoFpSASst6C
	j+6aTxO1AsAEk1eG9uX9F6B4AX+6u7yYTj1s5vNDycq52mJM5Qbb3ru+EMd4HwbsIS6oudcy+7OwQ
	FPzcqjjy7AvR1KfEG5rDjn4IDRxCPlT7T9lSXkzDEBha4qPqW+hNJ5qTp/NJBzMawBYHsHfV925jL
	N7IjId1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65jJ-00000007JOz-3u1v;
	Fri, 27 Mar 2026 11:51:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65jH-00000007JOa-1B4x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:51:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADA154340F;
	Fri, 27 Mar 2026 11:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A3BC2BC86;
	Fri, 27 Mar 2026 11:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774612314;
	bh=QGuvPPe1JtZ1isWkV9NXorQ9KG10bT2O55AFrSSxNUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uIpT78a5sMOBFX5NsnyJFZHgB1KFWLuNu8+A54M9fKOAD1eIo2GgRVA7fJhis1Asm
	 RyhoIOfYpP9wQWFuR3exP+z763/5teNmCEGZru0gFdRmmvlpwd9xxR3P9UM1JXceMs
	 mAjT2PxqgsxQMTyQ/stl3UNpOvzRamPg5iuFtlLUiE4COvvzp9xdm+Rc5w234Ng0UF
	 Ez3q1Jg4Rt8AFPXPhrnGK2/0LClk2r+CUSSCn2QRcPtgIV9P85G6nQ0f33zNKPAxp0
	 HrNcDOGuJKGTbiW49pPtrU9CjKGR/Kq6g3aT6aJuF75I8qwZSDp+BH4oKtefgD5qdq
	 RMSklOFToqarQ==
Date: Fri, 27 Mar 2026 12:51:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: soc@kernel.org, arm@kernel.org, Fabio Estevam <festevam@gmail.com>, 
	kernel@pengutronix.de, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] i.MX fixes for 7.0 (v2)
Message-ID: <20260327-glaring-aardwolf-of-joy-2201e9@quoll>
References: <20260323162849.1203617-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323162849.1203617-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_045155_340538_8EA86D0B 
X-CRM114-Status: UNSURE (   8.71  )
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

On Mon, Mar 23, 2026 at 12:28:46PM -0400, Frank Li wrote:
> From: Frank Li <Frank.li@nxp.com>
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-fixes-7.0
> 
> for you to fetch changes up to 511f76bf1dce5acf8907b65a7d1bc8f7e7c0d637:
> 
>   arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V (2026-03-17 23:24:44 -0400)
> 
> ----------------------------------------------------------------
> i.MX fixes for 7.0:

Thanks, applied

Best regards,
Krzysztof


