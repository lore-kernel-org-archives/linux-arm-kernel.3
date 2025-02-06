Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B03C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4Jun6b/tFNG6ZRUeA+LW8b5NX7uCPY7iuSPYMJuNbU=; b=GsaIkCAGN4FBby5UeUm2P284mD
	0fV/KH8TJGjuuYWVhjtUPNzm/hPSVRs7nlAt1b401xauPSOSBWWxuA7HdjdusE3SvaURFBNGAIv6j
	GRLcyZH3hOgINjwfKBTLlQF0PxwlsE/ApKkVkIEUL5c9QqcYgCR6j0D/4u+abVtdDSoVKOewwpDaU
	AI9QjwBxe6KuNR4di9+v6OTc00vqpG0xPpysiRsqZslXTECTD7q2obMGfitwV5/P0JmrlSgCP++Jl
	dZG3vLXgmLX8j9fLMM/zkD5BvuIEYWMO3fucegJ/Q2S5Fij2HtxHQmg9wZK97OpLxRHjsYOexsqQE
	ubH2b2gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0Ku-00000006BfY-2YnD;
	Thu, 06 Feb 2025 11:46:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzkU-000000064hj-0fyX;
	Thu, 06 Feb 2025 11:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738840124;
	bh=B96pNeVP/csttWGc2+txPTceRHARr72NUxlrXzj7tYc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hexXYyR6Y7wgHWSYswcPQe36UCjRD6P/ph0NJHRow+198GyHWT4328ySIFBRnLTbn
	 KHFnNJXAwfwG8vsnL1pRJtpaRTdv0G39UiBvAN2kglfzf1oQtcYsTiUhJRCdR0hmx8
	 mfFv6RP+icHaW+3ACzhm1GEROHgoWYf4QxDto/r4t7pxv8eUqgars3ovtztCr+JRIy
	 aLbKjX/87xczCfwOUTKjIdYyb9pYbU3S3fwv1LiUis+Dl7I+UOptiFyq5X9dJupu3u
	 qHXGZzNlr9MBopCoJrdmD0Ygot8ZMgLoShUekFEpflN3V8+LJHduNBsIa274AuDWje
	 IXA78/6WZDqvQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2459917E0FC3;
	Thu,  6 Feb 2025 12:08:44 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20250108083424.2732375-1-wenst@chromium.org>
References: <20250108083424.2732375-1-wenst@chromium.org>
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: mt8173-elm: Drop pmic's
 #address-cells and #size-cells
Message-Id: <173884012408.110657.5683585328217308497.b4-ty@collabora.com>
Date: Thu, 06 Feb 2025 12:08:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_030846_391800_FC0593E7 
X-CRM114-Status: UNSURE (   7.62  )
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

On Wed, 08 Jan 2025 16:34:21 +0800, Chen-Yu Tsai wrote:
> The PMIC has child nodes for each of its functions. It is not an actual
> bus and no addressing is involved.
> 
> Dropping the bogus properties fixes a DT validation error:
> 
>     arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pmic: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
>             from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
> 
> [...]

Applied to v6.14-next/dts64, thanks!

[1/3] arm64: dts: mediatek: mt8173-elm: Drop pmic's #address-cells and #size-cells
      commit: aaa0b40e157c65aaa5e0ad903675f245333381bb
[2/3] arm64: dts: mediatek: mt8173: Fix disp-pwm compatible string
      commit: 46ad36002088eff8fc5cae200aa42ae9f9310ddd
[3/3] arm64: dts: mediatek: mt8173: Fix some node names
      commit: be035e4a26edf8fdcbc4fe95d16c28deade13bb0

Cheers,
Angelo



