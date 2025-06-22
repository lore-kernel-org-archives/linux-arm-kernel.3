Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895A3C7EE2E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Jun 2025 21:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRH4hMACcrJ9IpVyVF37mpGPo04ZkN/zThl4hTG3eOM=; b=Vp+E9NKce31p3dP3HVt9FWUrQE
	oe3FbnuNmVSXajHbW1FL/4d3TomOcbR88tJa4HAE6gr+xoGPsPx56nAMo6kJYLtbenJRcXkYCzvtz
	Kjz/N6A4Z2OHvsKGEOL0zjQZ39g5wfGtnWZMcbVKSEVPHbkIF09KrlKTjOiXes5jE+K2zOirCsoy2
	zlEQUBozoTZxSabcojjHw+2XRvzyApWii2XxDMC3cXetynVW6UJm1XU+1tVjHDRs6GZ739NxqHUzb
	Af6u6hBGm+FWLVbR/eFVE7JrHb+J1rWksvDxGXi/Spdcls0q/eif/cv8yGJhwAf7OORORECAC1l0w
	pv/f5NLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTSKE-00000001F3O-2Vqy;
	Sun, 22 Jun 2025 21:34:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTSHs-00000001Eip-1t4c
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Jun 2025 21:31:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9EC644960;
	Sun, 22 Jun 2025 21:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80AD4C4CEE3;
	Sun, 22 Jun 2025 21:31:39 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id 7CAAE180958; Sun, 22 Jun 2025 23:31:37 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Thomas Antoine <t.antoine@uclouvain.be>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
In-Reply-To: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be>
References: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be>
Subject: Re: (subset) [PATCH v4 0/5] Google Pixel 6 (oriole): max77759 fuel
 gauge enablement and driver support
Message-Id: <175062789749.296878.8897572566383047929.b4-ty@collabora.com>
Date: Sun, 22 Jun 2025 23:31:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_143140_515488_1B9B7259 
X-CRM114-Status: GOOD (  11.21  )
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


On Fri, 23 May 2025 14:51:43 +0200, Thomas Antoine wrote:
> The Google Pixel 6 has a Maxim MAX77759 which provides a fuel gauge with
> an interface with a lot in common with the Maxim max1720x.
> 
> Modify the Maxim MAX1720x driver to be compatible with the Maxim MAX77759
> and enable it for the gs101-oriole board.
> 
> The voltage, current, capacity, temperature and charge have all been
> tested and show coherent results. The charge full design and capacity
> equal the ones seen on android, the ratio between average charge and
> average current does predict pretty accurately the time to empty under
> a constant workload and temperature is coherent with the dynamic state
> of the device.
> 
> [...]

Applied, thanks!

[1/5] power: supply: max1720x correct capacity computation
      commit: 58ae036172b5f051a19a32eba94a3e5eb37bf47e

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


