Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AFFC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 08:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12WYngxbWb4em1bSnCysshytHFtoYZ7cOQtmsoj8oPk=; b=CyhoOfe2f3dtnIAQOBMddvQTUp
	0C22Zc5Iw0/CEKM/fXF/HyxmDO5twJ9ClurHe5D+ULE9NrsWh6sq7wdeGyQVXAnsjxGgie5KB3OA8
	2ypBgUROAB9xmIuaMDGeEeQSBAf6iNp7X7sibCgqP8X9b3uk0jWLGprth8lJw9/i5HuX8v2CYC8lj
	wK3gFRUFVD5lcmRcfxLIt6SKx7jgQh+zun1fhKRA1rGyvYFZWOEaM5YuNaXzeS+XehvAGVhpOr4wC
	ZUaqft07GwOrACnrZvDQdYTR8dLkOAmuAS2u1Ufz+5YK5KZ1CTlWZpERbSum9taOBcnwuE7l1EYBH
	pZtxqx2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bHw-00000004vQF-2pfZ;
	Tue, 15 Apr 2025 08:05:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4b3X-00000004rwS-1iSc;
	Tue, 15 Apr 2025 07:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744703405;
	bh=ZSydm9Jlx+I1aH900HrLtzFJRplcxK22NCacX8LxP4s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WWI9D+B9tLo4kylUCqMTuhqvPIDHD7Qzag0J/WLsfI1ZLdrb2taQv8V5YscJjQK4/
	 MNxKLWcZKjAdFQBV6JuK/pXIrDLr23zsmLp0O2ykMMAlDm1OE6+Fp8TX7l8bpCOLCR
	 AJhEz8Xu74ppF+hz/6NL7FGvSerfwn6j21imTQiMAX/AFLH3N5Z08/BqgkHCSJpGcX
	 Y+ifpIQqN3WrM7ozbTKF5wOowgM9sUr3QVfKW+uOg/mMNbT3hYp5E7kBbfZIIs2cQH
	 zNg5l8ljLiQrLcN2Lh9XxtAaqmwCQyEuBynbVptCmofRiIXp/sNiP7VjoZT0IDpvCu
	 xmjNStevdO9WA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F1F2417E05EA;
	Tue, 15 Apr 2025 09:50:04 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, 
 Chris-qj chen <chris-qj.chen@mediatek.com>, 
 MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Tommy Chen <tommyyl.chen@mediatek.com>
In-Reply-To: <20240925080515.16377-1-macpaul.lin@mediatek.com>
References: <20240925080515.16377-1-macpaul.lin@mediatek.com>
Subject: Re: [PATCH v3] arm64: dts: mediatek: mt8195: Add power domain for
 dp_intf0
Message-Id: <174470340491.18036.10677308762787483666.b4-ty@collabora.com>
Date: Tue, 15 Apr 2025 09:50:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_005007_596161_C2FDEBEA 
X-CRM114-Status: UNSURE (   6.27  )
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

On Wed, 25 Sep 2024 16:05:15 +0800, Macpaul Lin wrote:
> During inspecting dtbs_check errors, we found the power domain
> setting of DPI node "dp_intf0" is missing. Add power domain setting
> to "MT8195_POWER_DOMAIN_VDOSYS0" for "dp_intf0"
> 
> 

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8195: Add power domain for dp_intf0
      commit: c6419e4f2ae22bf1404ac39e88c9bf0de8767874

Cheers,
Angelo



