Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEFFC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 19:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQzvqfpgigCAffHosNyCJ8Um6TLPFt1XrXbkr0y6z2A=; b=lnmFYFO0cB+BigWIHDC+06LOSe
	ebNr4vgEvjYFtMkT/oRZt2pxSaEj2tDAIqO8a5sfCmj9YlXpo1W11PRJ9hhHfenLJ6R38L01gNzso
	uRpKaDbQ6yct/4dR2BP3D6DpGgK7DgfEA0mBPmG9yBJ4Q5CxsKCSrWNXGTQBIN4uRevgseIEdcnhc
	KTJB4x4PacXLGKLu+NjyLBew+i6Sa2TpZ9X6k24y+5YyP7mVxW2oLQthXz237J+MV9xuSy4gXHiGk
	jXlytXtBcD4yZL4JdT+hzL6QeCIwbUWkWItJWTlXfGYMQyBDPf7dNWMdZQCPZ7BU9QzirIwHKuNAq
	w8PaHN6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCkNw-0000000GZL6-15R1;
	Wed, 07 May 2025 19:24:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCkLy-0000000GZCb-3dW3;
	Wed, 07 May 2025 19:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746645767;
	bh=GHSW4wUcpOnEic7k+DsKOTurTrfizcPlOAPqQKlmSxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DJum2erF0U6Oe3JU03iuTHFSIhY6ng6wCMy0Mr9OR02DXfh6sR7teIeAzjz8skiz7
	 Hx8XeaOeFZGUBreY6dHMUMT23eP4TuamLtCc7Oi44RjECYYEKqYHNx9mI4TVmjEHhZ
	 m340VuRQezMVuaH/dQA652+UkGp5NwAyjQIOoqkWvG6qGY0NT23B9aupLILsYjfaD7
	 w4r81iugdj7GRaSF8pB0zCImSDP1lA4n/YNgF81y4BrnZua72f1R9Ad6CBhVHpCifo
	 zPSQri20rT87KaRg8vwC2aKb531baL1ShC4h4i0Jh/xIRaZiP0Zjk5SLbZ874xfnoK
	 8GGgMU/pLCsyA==
Received: from notapiano (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C48CA17E0147;
	Wed,  7 May 2025 21:22:42 +0200 (CEST)
Date: Wed, 7 May 2025 15:22:40 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hui Liu <hui.liu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH 1/4] dt-bindings: mfd: mediatek: mt6397: Add
 #sound-dai-cells property
Message-ID: <34399fb1-f876-4c7e-b164-4331defd4426@notapiano>
References: <20250505-mt8395-dtb-errors-v1-0-9c4714dcdcdb@collabora.com>
 <20250505-mt8395-dtb-errors-v1-1-9c4714dcdcdb@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250505-mt8395-dtb-errors-v1-1-9c4714dcdcdb@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_122251_062146_12D1E4D5 
X-CRM114-Status: UNSURE (   9.70  )
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

On Mon, May 05, 2025 at 03:23:37PM +0200, Julien Massot wrote:
> The 'mt6359.dtsi' file already uses the '#sound-dai-cells' property.
> Add the corresponding property to the binding to fix the following
> dtb-check error:
> 
> mediatek/mt8395-radxa-nio-12l.dtb: pmic: '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
> from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
> 
> Fixes: 9bc8353be720 ("arm64: dts: mt6359: Add #sound-dai-cells property")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

