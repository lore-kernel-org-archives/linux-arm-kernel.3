Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B901CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 09:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOUmeS/QvtFRR7+dm90Jc3uTofnKDDv1LFlOq0Z/uCE=; b=wXtid+OY/h+Jz2XW6HKmllyqx2
	TtyRIj0xbtRNnTi6YNECZorE1COabOW+rcO+Et/AKI5Cl0/Fouyoz0+5d/OiJn7mrmLH3/KjvqU7h
	eluKbi3CTiwIrIJijKf52KiReEngF2i/qKOLs0eASK1GRNjwxEF1vW3CZWFkSaxDcLeUme8wRCDW1
	LTHd9RMqWNUfc683gQlubVgfzegs0dcv5zZy0LRYfTofyA99Qvw9k0l8GyhkVoR5ORWsow+9lTL40
	k/wGpfPItujDQwofKCs3AYFgA0d40OxTlDVfdrpj/6vFguaf0onV590kLhNuFpbx9S1pXVKo+TZT5
	DNA2X2MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EyP-0000000ClDp-0kju;
	Mon, 13 Oct 2025 09:36:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EyK-0000000ClAb-1GkV;
	Mon, 13 Oct 2025 09:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760348162;
	bh=k2yftSbq+5d+v9hZZrUZktEn1hoBtyA2dFQC4cr/uzE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dv3pEdxu2vwyeVkQ3uYW/Xkgw6f4rVrXZ2/e5titZmBsPGB0wfX1Abc2SzgXQqXPE
	 VZ3ayJqC4O40Ec+4hATCsL/fsZtxxw8qniZdfbpR64KvAMslE+sAIadjsqQ2IGkUqB
	 vgex6Ydq27I3RGhkkYmIG3cNRtnd7E/euA9/cQ8UmBDlri5QyiYfcYbb5sMk9FzTmw
	 v4jvMjpeVoJ32fCqlY0SZu4qzkfopOcmT2kdMqFxmRFLwSAy+2obbRv3C2nQoCIHa9
	 NRNSs4PvfvyuZ1APkUU1xiGJRqfgju01vwTdNGI0ZAKInBKBaU1JF0pg8UMZo5Guzm
	 kaztYa9qVaieQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6621E17E048E;
	Mon, 13 Oct 2025 11:36:01 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, 
 MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250918121751.229554-1-macpaul.lin@mediatek.com>
References: <20250918121751.229554-1-macpaul.lin@mediatek.com>
Subject: Re: (subset) [PATCH v4 1/4] dt-bindings: arm64: mediatek: add
 mt8395-evk-ufs board
Message-Id: <176034816136.21517.14207599704800072414.b4-ty@collabora.com>
Date: Mon, 13 Oct 2025 11:36:01 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_023604_515104_38FC52B0 
X-CRM114-Status: UNSURE (   7.10  )
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

On Thu, 18 Sep 2025 20:17:47 +0800, Macpaul Lin wrote:
> Add a compatible string for the MediaTek mt8395-evk-ufs board.
> This board is the origin Genio 1200 EVK already mounted two main storages,
> one is eMMC, and the other is UFS. The system automatically prioritizes
> between eMMC and UFS via BROM detection, so user could not use both storage
> types simultaneously. As a result, mt8395-evk-ufs must be treated as a
> separate board.
> 
> [...]

Applied to v6.18-next/defconfig, thanks!

[4/4] arm64: defconfig: Enable UFS support for MediaTek Genio 1200 EVK UFS board
      commit: b59a508c1f5fdb3fdc690edebe815d59b04491d0

Cheers,
Angelo



