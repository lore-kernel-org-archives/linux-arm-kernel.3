Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C761FC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 09:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzI1E+oOIoSk80d4S3TvWsn/IU5ID9KI4c1rk+PvR4c=; b=sVUt8AYunBLiERaC908jFN/Bz0
	rM9WaUPDol4vTZgYNDgWNTvoE7ElzJZvV4f4QLwJWI5Rox2erFs2Zf1Z8/e1aPNzt5sla4eZlexnE
	cdydguj56L8byQTgATVZOgWte7AdHpNP2YELwOhZsVv+uca8NOZ75w8H3G5BTuIEgWPHtdxDk8LYi
	Vfnm8erkauAvcL2TUuCRVAOaxRRd7keaz4s75Dd5bXaBezK0ZRYUyyzztQHY0OYX122o+jpD6X+oc
	ACVeoI0Q2Acpkc5XWri3dW4AY14ZfSb3NIRg8aX6ykJgGRXezSJcu3u8SW6Px6Ne3Adqm3WxoeQwq
	Jk5k0b6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5nO-00000003sQ6-3ou5;
	Mon, 16 Jun 2025 09:06:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR50b-00000003lUw-0yZa;
	Mon, 16 Jun 2025 08:16:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A765C60008;
	Mon, 16 Jun 2025 08:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4611C4CEEA;
	Mon, 16 Jun 2025 08:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750061760;
	bh=MzI1E+oOIoSk80d4S3TvWsn/IU5ID9KI4c1rk+PvR4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YAsx8iw2J+P8iF16mbNBojULCRJaBQw2oBbEDuBkQ4KNUNupDYsn5kl7aR6HTar7O
	 YdWPfQkHo8709sXukjS939uiygkNpS4JS8ltNiIGeVw6Y8eodN2WSjXJIlC9DfsTob
	 okqRDWrx6uFdjHOp2vnZYiv08M+qBEl3ZwBFH6fSE79y6q8xupKhdhrYLTNJ7mM/L2
	 7vdMZh+59JlJJhWlzt0FPpf+n+jYG3MFE6qitS+ZNudIp6OQkBFVe7fBPVkVEyArDU
	 7YQZd3mmgsXC2vvxrZMs0XWEnB8nsv5j21HienB9q4WF9SBFWJaEVAjg8kXiO7xbvk
	 f2CH+5CV2EqHA==
Date: Mon, 16 Jun 2025 10:15:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org, 
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com, 
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com, 
	selvarasu.g@samsung.com
Subject: Re: [PATCH v3 4/9] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo HS phy
Message-ID: <20250616-snobbish-chimpanzee-from-arcadia-bd9fcb@kuoka>
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
 <CGME20250613055050epcas5p3f995a6696ccf4f7eeb0b5d76382f71f7@epcas5p3.samsung.com>
 <20250613055613.866909-5-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613055613.866909-5-pritam.sutar@samsung.com>
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

On Fri, Jun 13, 2025 at 11:26:08AM GMT, Pritam Manohar Sutar wrote:
> Add a dedicated compatible string for USB combo HS phy found in this

I reviewed patch #1, then went here and see that this is HS PHY. So
patch #1 is not HS PHY?

Best regards,
Krzysztof


