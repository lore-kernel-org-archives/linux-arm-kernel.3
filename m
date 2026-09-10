Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1EDC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXPPn9tlwNb8+IWe2bNCfwjQ82EFPAzHyWLZ359hzmA=; b=BQpUiIb4szGWnKh3dk2xYZVAyf
	+Dz/7Fp8A+5+QxZEgqUMlagPAYpDRy53yKsLVwfu33aOp8bRGQGRKX4yvB4Xrk0YhSsozP925bmHr
	k2RHvgZRrLH5gfzi1Kn1RiogO0M5d3mQ+DwLa/Q41mU+FPR5cSTW9CYqAAhnlDqroCblXqKbKxKTz
	/+fLlctYnBUBctFde6UXRPnKurWC7aKOCNOm8PrnzQWF1Y2Wzu7bUIP7ho+Gn9N71QBlecETPuDmD
	DXSAgKoe7vAjmo+7DFStzGE7IeWhZI8tpr1lml8gA0XOSv6I6u4efiH9gALEwODJA1Hf5la3mNfH9
	jqEPa45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fy9-0000000Eenh-3ecx;
	Thu, 10 Sep 2026 14:41:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fy6-0000000EemK-3CNZ;
	Thu, 10 Sep 2026 14:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789051295;
	bh=NQhEknJQA8Ya6L5zdIqdUOsD85jIBAx1y0eYH103iRE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=l/3pZbarrLBIxC/Bgeh0sOVvNAHiwRlpACyCd/tvr6a1aDM1yE39N2cpwZK+VQkVE
	 MgyWtOO0Dc/G1ZYcB3Qm2E1JLOY5QbBZm9ZMoR9VGyxl8WU4ADu2K1EFkl5j0Iad/6
	 XiSMMocF2vJVEhsJ1ZOcck/zDrlzfTgL8Y4/YjcB/mFxDppjKilV/UtDKUyEpZP31Q
	 mTKYy9+55otmsuxQ4ciXEEflpRBMZuFFQOBurS1VbeCxTqCCwf68d/vmE7JBrSXGzi
	 NWXbHAsrvc2mgBb8+DDl0wZsc62pBjWjXdb1zlMM5WGG2NQrb7qk2p8HS+ZRws6USc
	 ICkrBPI187SkA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D79DB17E05D3;
	Thu, 10 Sep 2026 16:41:34 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Zakariya Hadrami <zkh@mailbox.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, zkh1@proton.me, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260910-mt8127-amazon-ford-basic-v5-0-3cb9eeaffd5c@mailbox.org>
References: <20260910-mt8127-amazon-ford-basic-v5-0-3cb9eeaffd5c@mailbox.org>
Subject: Re: (subset) [PATCH v5 0/4] ARM: Basic support for Amazon ford
 tablet (MT8127)
Message-Id: <178905129482.89344.17321319958555136692.b4-ty@b4>
Date: Thu, 10 Sep 2026 16:41:34 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_074138_955355_B148EF54 
X-CRM114-Status: UNSURE (   6.92  )
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

On Thu, 10 Sep 2026 15:29:11 +0200, Zakariya Hadrami wrote:
> This series of patches adds basic support for MT8127 SoC based Amazon ford
> tablet.

Applied to v7.3-next/dts32, thanks!

[2/4] dt-bindings: arm: mediatek: Add MT8127 Amazon ford
      commit: f97be0d722ebef4de65a39813778f6ba62c2ac1e
[3/4] ARM: dts: mediatek: mt8127: Add watchdog support
      commit: 5e23e7d730c6e984e4f03c3b25e2188de9f4ba99
[4/4] ARM: dts: mediatek: Add basic support for Amazon ford board
      commit: 2e195497fc9fc0dd89cf95dab80a2d0486dab65b

Cheers,
Angelo



