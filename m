Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA7BD7878F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 15:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jTYiglxStDtXsSEnUykLvaztp4zFR1IyBOZjWnkqBQ=; b=QAmcRoMS8QOy4FPKx0OTYjTSFD
	bczEuULT1/im1CBEn+oUBsRkUw4zRKtRmLtXSyuqGipw/QgVXVsmMfFQDRShcu0Z87AJw/Mc28FO3
	xChkF2rJwIfmh4fQap/MDR4q+sQdVnCjuynuCxY72dJwnVjvxlZ38zhXl+Pb8kJzcHu5LtfaydbGE
	XrRZu0gqGZrl3iLRox0Hmh4AR1IxHaM0iJrUN4EkFWpIloOD/QE3D+qGYhOo2zdoUXWvTFypmO12a
	w2E2GfM7wxDvPCT2BUNRzLfy5Z226Tvnbj+XIZgH0XuA6VytYYu4HJe2szuriDbHwBmdjSIH3UzET
	24WzjTYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcOT-0000000AVcz-00MH;
	Fri, 19 Dec 2025 15:27:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcOR-0000000AVcq-1Qbl;
	Fri, 19 Dec 2025 15:27:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7433E60177;
	Fri, 19 Dec 2025 15:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053CCC113D0;
	Fri, 19 Dec 2025 15:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766158066;
	bh=vQauREzCyjgGY9d4eFEp7tYVqXhmLb3hWwe5rJcduI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M+gjTr59eWJ38omM1OBz1Aw3Z7BgGjrTF7L2zoReMfykc2mprtIUIxC2MrLS59UHz
	 BXIBUYW1nkC/gCxC1SpLaywXJqzVf7xPY1AKkZdnGfgp/SwlRdPdG+k4EfFcq3wmcP
	 9ndPN66aiP5VhnCvhvn5le22dEfUkiTRdtlUh0eWB3s8my10jGljuPyxNlrgO7waH0
	 GVU0D3pJAOv4bh6NccjiQAagkn9IfWygDqiWBvvuJJrFeIb9/4MhQmpgBau2/+kJ0F
	 BKKPfpgghVFJ3AHPkneiOaWNqqPm5bcPqpc694BUuaYjkD4ZZt8MQ3J6I2/FO9Jpni
	 ABGjKE404Gk4Q==
Date: Fri, 19 Dec 2025 09:27:43 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 0/2] build full dtbs for BananaPi R3/R4(Pro)
Message-ID: <20251219152743.GA3410594-robh@kernel.org>
References: <20251119175124.48947-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119175124.48947-1-linux@fw-web.de>
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

On Wed, Nov 19, 2025 at 06:51:21PM +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Build devicetree binaries for testing overlays and providing users
> full dtb without using overlays for Bananapi R4 (pro) variants.
> 
> It is not required to build all possible combinations, only for
> common usecases and to test if all overlays can be applied.
> 
> This series is based on
> https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/log/?h=v6.18-next/dts64
> 
> Frank Wunderlich (2):
>   arm64: dts: mediatek: mt7986: add dtbs with applied overlays for
>     bpi-r3
>   arm64: dts: mediatek: mt7988: add dtbs with applied overlays for
>     bpi-r4 (pro)

Since there's been no movement on this, I've applied this series and the 
other patch and will send to Linus today.

Rob

