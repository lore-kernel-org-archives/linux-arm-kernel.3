Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCC5C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 03:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvlKpwDw0JnWdLrBgD0SyEbx1SEdPw/yjXNO5pH9DJo=; b=D02qUizvIW+AQJZ61YQDTpaogr
	NVBO/Ujv6q+Cx1873ECv6rGh0wNrIPyHkofeFhRbi910gR+NGTnmzuOOL2WPg1Gta4T2zfKCX8YfP
	PAsfzzRGs8O/r9SuXX6EWKypHC3izZqBtoEH6b7fW4SLFezDG0BTF/2FeNX/s+ZykrJnUY3iLxvYj
	BHNqRIYbIdIQXGmB0MNgXwiynMjLk0uLTikVaJKPaPdVZnuJSJozh7uK4HwrTdJENC5W45dPgdeQI
	ieVRE2CBVmkJX0k8Iwi5t9U3FGp3B1gN6tlx7W5XYJD6l8kMPmK4uTFlUQcWz025+7ol4HuO6Il1G
	smNIMelA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubW4F-00000003qiw-2c73;
	Tue, 15 Jul 2025 03:10:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubW1m-00000003qRr-2XY1;
	Tue, 15 Jul 2025 03:08:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A36F61485;
	Tue, 15 Jul 2025 03:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB945C4CEED;
	Tue, 15 Jul 2025 03:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752548900;
	bh=Een49Bjr0iYL6xkrFd8mI1xoBasVFRuwmM1PSNhGWAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bNbxOySX9+WgAkBnliDFYcCRgmpP/TPSU3wrJUCaacCjsapiFXEP/1NN2K1O1BjJJ
	 cqmw46GL3CawwfaWpuJRNvvXoctATh9bUjuUG9NHFkEwr56ejQtD3kqoceHoEdKVgU
	 dOCa1hsrlq66v5dhjujUxuKTtiVIWnIeAijMwbC5dT63ScRBiv3EPEoLFIMQaRe7d+
	 Ewn7i8lwqsnQ+rmm6YeG1Yosrmrsp1T+Ct8+1Q+TTFs6cZVRORVnRm0K5NsBfoV1Iz
	 w2BDw7fpS03XXEWpzCuSTMg3fBJ8NSsmedAVd11e9Eekov3PbZCVrpSeUtmeZTIdcQ
	 dpcX5Xi9lCVbw==
Date: Mon, 14 Jul 2025 22:08:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, Yong Mao <yong.mao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wenbin Mei <Wenbin.Mei@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Axe Yang <Axe.Yang@mediatek.com>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8189
Message-ID: <175254889827.4140322.15910226048522473514.robh@kernel.org>
References: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
 <20250711094513.17073-2-ot_cathy.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711094513.17073-2-ot_cathy.xu@mediatek.com>
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


On Fri, 11 Jul 2025 17:44:57 +0800, Cathy Xu wrote:
> Add the new binding document for pinctrl on MediaTek mt8189.
> 
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> ---
>  .../pinctrl/mediatek,mt8189-pinctrl.yaml      | 213 ++++++++++++++++++
>  1 file changed, 213 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8189-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


