Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E40E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//Y444dHme1VCI3iAER/89MrFvNQjjL93TTZLHF2X8A=; b=YGKpjIyt3zPNyEmdXzx8h70v3y
	3w436PJjXQ9g8aPvf1G20llEb4XRQB56NKBxi0kLxpBaLw+6OikKeRii5+QFrRBXQvBU5mC6N1utw
	Y5a4PjyPfTMhqeP8bTHFt/WKDJSkYQf2enRqSTAW9LRAU9QmAt3Sb2Ewh9/+1R7VL0GJZuaDFEgR1
	VqpDMiwCmhgBTwqKPEn7JV0dFEk0xlctHhn6bwuTs9ajtVpocYMivZN4DFaFL/rFZU47RbED9fMWc
	hscXBBoomHDBixUiS3mHHRTXXsQF4mJYjARWdpaLj5AaDmpjPp1AbAN5F+dir786FlEbng3rSXwTx
	dhK0Rbeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8Xo-00000004k1k-1Bb8;
	Tue, 07 Jan 2025 12:18:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8RJ-00000004ijE-3bwn;
	Tue, 07 Jan 2025 12:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736251924;
	bh=HVZqv3iMD3u/yLNSo6b7LYCx1bSeTRxSx/Qpuv+cJHk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TqXS3RsSldw/NUimwX1+CTL0hMA5ARGNP+nxLNA/mTBkSWFC99KATsm3zNR6e4P+m
	 NQ/1iMTIHQMnQPalj5D9KMo5Pyz3TjUZydEq1TGQ5sToZ8R0yUja7q1ohLH32lwIUD
	 jKD6qJjnvZBLdQYcWW0SWxnplUeIgf6+nuMz/uxLsi0vC+8vyQGiwDzWGQ/thXBGmN
	 xuajTcgmWdw7NNfUroAYOtktkN2WDQwHg1/VoTp3JjzHdPuLIXesXICIXuiNolp7A1
	 oafZ89/BCPRMSUsJIuJE1LPzDHcfr3vMn5hkdUl7/7ZTzJfq13ESdd8BETa/BDL+dm
	 Ij3cf9Yv/wySA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6A18B17E152A;
	Tue,  7 Jan 2025 13:12:03 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Val Packett <val@packett.cool>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241225192631.25017-1-val@packett.cool>
References: <20241225192631.25017-1-val@packett.cool>
Subject: Re: [PATCH 0/3] mt6779-keypad: fix compatibles and add to mt8516
Message-Id: <173625192333.58193.14854384840814849260.b4-ty@collabora.com>
Date: Tue, 07 Jan 2025 13:12:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_041206_046867_DCA61955 
X-CRM114-Status: GOOD (  10.65  )
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

On Wed, 25 Dec 2024 16:26:18 -0300, Val Packett wrote:
> The mt8516 patch was previously sent in another series but rejected due
> to not using an mt8516 specific compatible - which the other usages
> of this driver (mt8183 and mt8365) weren't doing either.
> 
> It's only fair to add the SoC-specific compatibles to all of them then :)
> 
> Val Packett (3):
>   dt-bindings: mediatek,mt6779-keypad: add more compatibles
>   arm64: dts: mediatek: add per-SoC compatibles for keypad nodes
>   arm64: dts: mediatek: mt8516: add keypad node
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[1/3] dt-bindings: mediatek,mt6779-keypad: add more compatibles
      commit: 3b19239ad4201123a2bc05af5859f5d75a30a49e
[2/3] arm64: dts: mediatek: add per-SoC compatibles for keypad nodes
      commit: 6139d9e9e397dc9711cf10f8f548a8f9da3b5323
[3/3] arm64: dts: mediatek: mt8516: add keypad node
      commit: 0fb0d360218129f00b76f13e30b86321b64e36f6

Cheers,
Angelo



