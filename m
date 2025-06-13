Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DFEC71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 01:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNSQ64cT373OaCtnIDdjjowAPRVl8grFK8GwPySFH44=; b=mHZjSUuJtCb/hVaF5AZx9MMgCw
	cILLBkCR/q0IEvcjwSZ3Jhjy/6LVo1GgXPHKD8hsnHYy8+BZTbZ6H/BWGctPQYkFaZI5mnPGGXCkK
	rdyZLxY5grDAJOD4aYfCz/92HvuOespxCYulu4rTegnimLZeuyeChJuVYWx15D/RCsct/GXMHbgCG
	wQArhwWKB/oMUM7ALK2Z/c2hJoB4Xyx1JIaGiGA/VoTsM/U58x7H888EzxeCbDFSMta6u8+Cusm4Q
	vRhgY2Wg6H7s+wKS0DTJPfftUEtArzccwPtM65LK9LWljXJpE/OKt5/iONunD4yNU7nD/ye8sovmx
	XmXiZtPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPtds-0000000F6Oh-3I80;
	Fri, 13 Jun 2025 01:55:40 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPtbi-0000000F68y-2w9j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 01:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yNSQ64cT373OaCtnIDdjjowAPRVl8grFK8GwPySFH44=;
	b=XjzXugX+Y0L5kDUQGGjBHSbYml6ugiTpJjEekPdIPyky4WzCp7f+UKXTMsm1Sa
	Bd4SxbYcN6a2Iax1T3Fp+GnzoJaHo3Hy7fS9uVAL13rtZEvSUQq4U/4AiJUzKbdp
	AtWsWRfVrsNJfW+u00De/02wxsQCow1Q8oz0/p78dbOkA=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3l3xyhEtoHGyLAA--.13454S3;
	Fri, 13 Jun 2025 09:52:52 +0800 (CST)
Date: Fri, 13 Jun 2025 09:52:50 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: freescale: imx93-tqma9352: Limit BUCK2
 to 600mV
Message-ID: <aEuEcqW/Na69wfsM@dragon>
References: <20250514094130.621087-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514094130.621087-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgD3l3xyhEtoHGyLAA--.13454S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnHq2DUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBdrZWhLgIcJPAABsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_185327_034970_B8898561 
X-CRM114-Status: UNSURE (   8.34  )
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

On Wed, May 14, 2025 at 11:41:27AM +0200, Alexander Stein wrote:
> TQMa9352 is only using LPDDR4X, so the BUCK2 regulator should be fixed
> at 600MV.
> 
> Fixes: d2858e6bd36c ("arm64: dts: freescale: imx93-tqma9352: Add PMIC node")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!


