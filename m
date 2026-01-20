Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC24D29C49
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 15:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ksy7oTP3n9EcNSGY38zUbSes8FptNvycCsb5JU2cCnU=; b=CjgzveAN0Wd/B+SYH3TGYOGIO1
	JFetHqvWG4fj4DLGOKPFC9QmZrjhnidyei09+1qHC5d8m7YXg3sm2gFGQUXAmpnAcERsvLC1mMwi4
	m/hwF0yo5Ugn8o8o2fL3kJqBiAsYE+Pq2aH5Uxk8NTADd9rADltQbkisxPhJU9SRpLjIejAQtm7/p
	qJKs/h+LWqFqy52BQf9Ru6Co6ZzSf4GbipP/GQ8w9MgkJnDXx1JEMMBtKRMS1fr9Px5HSbKykQKkn
	Ut+CA1iCGbc4skHL2q4cWDUDgiwcJtq/BDZ0nAZUORaghqsrZjwDrbKQKvq3wSxUFgwb5/G8P9rpY
	au+0CyfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viE5l-000000047Ej-46Kg;
	Tue, 20 Jan 2026 15:56:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viE5g-000000047EC-3Nw2;
	Tue, 20 Jan 2026 15:56:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 06AFC43DBD;
	Tue, 20 Jan 2026 15:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C92DC19422;
	Tue, 20 Jan 2026 15:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768924583;
	bh=rSnO2feB5EiBNnb+J7F2y47pDPabNMsyZVGuP2G3Me4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r6w/78DNUnD4q+ZazBqHFykSpmDASwle1jvKAY2RW9wyLAp/h8G9L5/tjcaI9R/jM
	 9pRu6XIQK58sNBOix3DUSxJAq7MGN3x7E8NTjrtIOI/uILhVnbs0VkuqcaXhSSbzSx
	 swptr9+aCpYx581VWAng2j1zVu/RRPFuuWnCouU8btpDxdR6WRbaoJr10df8ytCsFY
	 UkrqYgEkKKCWWIF25sQTEzeJKUEZJ3Dqe1gPvToi/kSr2kbxMprL3cXbeRU3Qhfmbo
	 qFnEWJIFDqk8tL7fjcl7l7VdEtHtZGx0jqyXBGygOjnA8UewhShmk7XC0A7k+OUeXr
	 NZ9th1dp5NoLw==
From: Lee Jones <lee@kernel.org>
To: linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 sen.chu@mediatek.com, sean.wang@mediatek.com, macpaul.lin@mediatek.com, 
 lee@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com, 
 broonie@kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
References: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH 0/6] Fix dtbs_check warnings for MediaTek
 Helio X10 platform
Message-Id: <176892458032.2302579.3859197830409835881.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 15:56:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_075624_867262_2E152D66 
X-CRM114-Status: UNSURE (   6.72  )
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

On Tue, 13 Jan 2026 11:59:54 +0100, AngeloGioacchino Del Regno wrote:
> This series fixes various dtbs_check warnings happening on the MediaTek
> Helio X10 platform devicetrees.
> 
> Depending on correctness, either the bindings or the devicetree was
> changed as a dtbs_check warning fix.
> 
> AngeloGioacchino Del Regno (6):
>   dt-bindings: mfd: mediatek,mt8195-scpsys: Add mediatek,mt6795-scpsys
>   dt-bindings: mfd: mediatek: mt6397: Add missing MT6331 regulator
>     compat
>   dt-bindings: regulator: mediatek,mt6331: Add missing ldo-vio28 vreg
>   arm64: dts: mediatek: mt6331: Fix VCAM IO regulator name
>   arm64: dts: mediatek: mt6795: Fix issues in SCPSYS node
>   arm64: dts: mediatek: mt6795-xperia-m5: Rename PMIC leds node
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: mfd: mediatek,mt8195-scpsys: Add mediatek,mt6795-scpsys
      commit: bbdf8911f92c84c7ebd4a214200391748a1d2ff1
[2/6] dt-bindings: mfd: mediatek: mt6397: Add missing MT6331 regulator compat
      commit: cbc07585c95e08c7223bea753afba85fbe86e54a

--
Lee Jones [李琼斯]


