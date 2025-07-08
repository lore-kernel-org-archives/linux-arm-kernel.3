Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E047C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 21:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fn7/+qPj7dXp4qPzOxoauoDa8e4PbB8N5ngJ7Og5Swg=; b=25JNY++LOwCZ+M0SmwuefYswzQ
	rX3jjZaR+5Ge6o8bhMjFQfa2qBzUMkTNZBhiBg1TWxNJtI46JRpUf9tCAH2nbwt3zYq4JWmYMTI1g
	gCzGcPUVWfXuMdfvY+BrfKDyGq545yUDNwiVWmsr5EJcc6Xmge6Y+UgT8nV3JMTFddGw8xSeLpkSv
	DsvjgfhM6mpchWBmv5t3TPmJVvI1zHDOXl8bbwJaHuCqlD2MIdh4tzDBDd2RnjQHdo+T9uL1/3xCU
	l+IZhIo4RUUgVz/pP0juqz/RBesjsjLR1Kogp3JyXGlBgxdr+TWSNFFSTR3vQWVeVnuErEmDgniJD
	3Srh6kEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFhU-00000006dGq-1TBd;
	Tue, 08 Jul 2025 21:18:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEYQ-00000006SO0-3mHF;
	Tue, 08 Jul 2025 20:04:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5889F6112E;
	Tue,  8 Jul 2025 20:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74CCC4CEF5;
	Tue,  8 Jul 2025 20:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752005078;
	bh=WN1ciI/LBieroqRWpekh0sk9z4c32M5Jn2j2cKXXWbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TXZXtSc8A4M1kGlmmHXWb8WChesdfRf/CIbbhEXgPJTuajjcvw3s9028JCk25xnxq
	 TYBOSLzvLwMcs//T9t2W31twuSOwleBbh4pUthoRYKRGu0PcSTlx6S+JHYT8tjmoly
	 sor3zkrlM50x2wIGRByPFSb4sBGvWTOIo6AmyRUpM1vbBd43Htwi12+OuQx8MlVBpQ
	 g4BrGONzUhh8OX7AJtkMI9A2b9S1BM7mXzq+Ni3gjTdNgN3NZEooxXVlLAxSDHCK+c
	 z5CTPG6h+9ccQ6MiZTos1Pclvqzk4RUsVjYZcIavkOaDUfAIWkPuLYg/88hESurgjS
	 OCPtOGqgiVfSQ==
Date: Tue, 8 Jul 2025 15:04:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, quic_jesszhan@quicinc.com, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, hjc@rock-chips.com,
	mripard@kernel.org, tzimmermann@suse.de, devicetree@vger.kernel.org,
	neil.armstrong@linaro.org, nicolas.frattaroli@collabora.com,
	linux-arm-kernel@lists.infradead.org, andyshrk@163.com,
	dri-devel@lists.freedesktop.org, conor+dt@kernel.org,
	maarten.lankhorst@linux.intel.com,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 04/13] dt-bindings: vendor-prefixes: Add prefix for
 Shenzhen Bestar Electronic
Message-ID: <175200507614.878155.13962765298111291094.robh@kernel.org>
References: <20250707164906.1445288-1-heiko@sntech.de>
 <20250707164906.1445288-5-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707164906.1445288-5-heiko@sntech.de>
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


On Mon, 07 Jul 2025 18:48:57 +0200, Heiko Stuebner wrote:
> Add the prefix for Bestar, named in full both on Panelook.com and their
> display datasheets as
>   Shenzhen Bestar Electronic Technology Co., Ltd.
> which produces at least DSI displays and maybe more.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


