Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F011C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 23:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cr+K9fucicfn2CYUDinJHBaNUSA0IsCWffQRF+dMoVI=; b=D7P0fQ6tu8Mr1c7/q8vjQVYAv+
	7dwdIefz2kpkSJDqmh5j8QUelSr+E/y6H4SOyakyvztJhHYh6DWVwYiqmubBGoCvxW0IoGQeSrS+c
	kN56D7As/AeCPWT8JhDznWTPFuvzuBxR4gvlxizsyrPfrA8s2v4g2x0mGYPoFA6BhxGtOSK+6i9Gw
	qjiSvo9wzz5Zvn3XuKFAVPzJkqlF2nIKVa7TTZnO60OvUoy+8RSwP3bjL9Bqrum66z9AbLhLWKL8Y
	BtNpcF4jqIvhtp9YGfbFLkYAdW/i0tee4dJl3Wqtb2iXscme3Uh/cbHLrsRPelknqgR0QiHxl5Zbi
	T4eZnXLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNKMg-0000000GoE5-0wYL;
	Thu, 05 Jun 2025 23:51:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNKKV-0000000Go7D-3M2O;
	Thu, 05 Jun 2025 23:49:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E656D6154E;
	Thu,  5 Jun 2025 23:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 591DEC4CEE7;
	Thu,  5 Jun 2025 23:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749167342;
	bh=g2l0xw2YqveNWEewJqmbBDGNV3httJi1IBdHEF4xqNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIKNNcukSh03Z7tTG2B00Jbxsd9ShCS5ns2E1k/Q5BwUymKAeEZH+mSPgY3tXmluX
	 AHJq0j4RP0gZZdHRIcULT+Ajc0A7O7RVVfrxg8QcTjnAoH7nXht7KwVgdr+QC+voq9
	 mmD4zhiUWtnUiNfyqxLhPG/A7BBjP0SvtJPilvlwuJclyWqzSEXCbRki5UTWB1Tela
	 SgClrATKsUvE1vgTfUrERdWEj2YBLpEaHJrjFIrvoQTtJuD8DWt7+cvRgEtLU7znLh
	 BojgW4+O3py0R3wiG4CtIT935bFg752YtPArEg7qjVACgjhbe9tX+KBEa8VsfgjbH5
	 aDSUGiLvExMgQ==
Date: Thu, 5 Jun 2025 18:49:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>,
	linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org,
	Johnson Wang <johnson.wang@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kyungmin Park <kyungmin.park@samsung.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] dt-bindings: interconnect: add mt7988-cci compatible
Message-ID: <174916733838.3486621.4521189465385649614.robh@kernel.org>
References: <20250531112425.10525-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531112425.10525-1-linux@fw-web.de>
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


On Sat, 31 May 2025 13:24:23 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible for Mediatek MT7988 SoC with mediatek,mt8183-cci fallback
> which is taken by driver.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v2:
> - no RFC
> - drop "items" as sugested by conor
> ---
>  .../bindings/interconnect/mediatek,cci.yaml           | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


