Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9E7CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 10:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rOpE8iB+0UAEKUNNrpbZZLuX/QiWeqr9b9yMvbbkIc=; b=XfaSYpS6ZbZTOCIxadBCexscAK
	Tvo6fuY1K38ll3f2zGi1W9/yUYnMths7aXybJpy1qK9rhFWL9c8GsDzno63FXIP72YnxPRilTSweT
	qoyCxzGym6cQ+q62Wi3fYWH6ijiCtqrBJLWoHtzK80sjCg39HxR65eRZ3KX6GF17rxO5Tl1v54a3u
	eRaZu1I2ndjTaLDvbMpU5OLnhplN8mBSt4PffKS/bzqvt2eTzGJzNECrsSv7+zxfmRV/WjuGOg2Cz
	gZl9yv+LRW/Kyf4VwL0cgEtRQgvxYRxNPE15v8H/0RSv5qyz89kt8p19H4oz3+wnk3Bio1ZWhNTgO
	Dn/gYoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8FXl-0000000Cs8A-3HZ9;
	Mon, 13 Oct 2025 10:12:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8FXi-0000000Cs72-0SZo;
	Mon, 13 Oct 2025 10:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760350355;
	bh=fvody/N+TtFr8YaKm9xxOM5M8VJxlmWe1gbQsXl9S3I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BfIjGVpt7PFZysR2qzYqH7yRDuXrtlLlkPcg+gY1dpqRUy4/kFznU2Cdl6wteExCi
	 U66JuBxEwNJmDCavBRifnBvh7t4zUi0AEgMg8Z0DlD5PZr3fFkSifQ5ShBsGgWQTpk
	 znqHKMUNA3pWtUFAJt5nbaZgEwW7MLOGL5/OoOiJGOI6d2W99Cb/inkR/NxaSe/v89
	 Uio+8tLkFxIdFR7KdZM316wVx/8Pr0AvWJsorriCVDjw3Uc3PxP3PrBYEDpr3wrmbZ
	 CjgDy+0v/g3v9SNjRTyN26HFJCnLkjWGVSLZEp4AQ6c+1Q4zmPPWQlSDiMTCNpnJJz
	 sHcz6pNssAUHg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 45CF817E0023;
	Mon, 13 Oct 2025 12:12:35 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
References: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
Subject: Re: (subset) [PATCH v3 0/4] Add support for mt6878 pinctrl
Message-Id: <176035035521.25543.3841544464727224416.b4-ty@collabora.com>
Date: Mon, 13 Oct 2025 12:12:35 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_031238_308526_D27C0605 
X-CRM114-Status: UNSURE (   8.73  )
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

On Mon, 15 Sep 2025 14:46:22 +0200, Igor Belwon wrote:
> This patchset adds support for the pin controller found in the MediaTek
> MT6878 SoC. This SoC has 9 pinctrl groups, and 4 EINT controller
> instances.
> 
> This SoC also uses the new "eh" bit for controlling i2c driving, support
> for which is also added here.
> 
> [...]

Applied to v6.18-next/dts64, thanks!

[4/4] arm64: dts: mediatek: Add MT6878 pinmux macro header file
      commit: 07a9bd3079e307fb214d391e4cae7d4090d02c89

Cheers,
Angelo



