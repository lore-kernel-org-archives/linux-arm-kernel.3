Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012B1105A593
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 12:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dx5xrfB8QljT3YKbLMbYG97YqGaj2w38cqstIXSxVL0=; b=mudZQnqN23fTedE7gU9raxuoo/
	R6ltgB3uHI0mX6I8rvLpBHN/LBfw2g5q9nK28x9ICM5pWOQ5ujp6Zl8lQRgEZPj4PCoFnFqvTz2Kn
	LY9AJv3/2PD9lCh6Gewa7k1lLLwE+/mTd8mGvS2Iuth5CmJqbareO1bo3DCusfDPFRVdeCNzvJ8OG
	akqr/Nvpk+FxVsK4rIpmI4MVFRcOePumUYXaWBjuJJYHm3CoY2eaJqOQ48f0BI7whVJqR6knbhWzN
	pnjKlVyFdJsJ23QUu1FO6aYABmez8HagN/xEYowSMsWi76FQPf5/bX6aSwMbLuqArNXVaGvzcCV5N
	mPdY9kLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fDe-0000000E2y7-0ht2;
	Thu, 12 Mar 2026 12:32:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fDb-0000000E2ws-0CUw;
	Thu, 12 Mar 2026 12:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773318764;
	bh=o2UthO2WXzmSPYdwO0w/waxNRhhzupLP6L1ZNdbYEYE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G0STWHdqnJMF17OLN9SHIkyTCwRJMshhFVor33igF9UbKgMbSXRj6a07H4kmcB/nH
	 QvEJEwwTRLaeq1UnbZ+TMFjOK18j1AGkRptVxhVCJNt3DkQ34+D7m2+x9QsuXOqS0z
	 0Yqz4tTWIvJj7MR22SPc9bh77yjmFs5KZEDfpCCT63BDJBTloTgLZnD2iy59oj9Dug
	 GFp6A+4gZLEHkBiiB1R7mN0xCkemziqDr0MiBffLXGwGbYa8kQcmIe2biEXHDAl1E4
	 trVNlbuoTKODkdX+2T5nCX9PFEpkF8OuOMoPp//lUAue1bJIk4BtbO4yu+TC9yLZDW
	 Z0tYcVs9NlLHQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EBCEA17E05B5;
	Thu, 12 Mar 2026 13:32:43 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, sean.wang@kernel.org, linusw@kernel.org, 
 Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, hui.liu@mediatek.com, nfraprado@collabora.com, 
 mars.cheng@mediatek.com, andy.teng@mediatek.com, hanks.chen@mediatek.com, 
 sam.shih@mediatek.com, rafal@milecki.pl, ben.ho@mediatek.com, 
 erin.lo@mediatek.com, zhiyong.tao@mediatek.com, Jason-ch.Chen@mediatek.com, 
 amergnat@baylibre.com, seiya.wang@mediatek.com, tinghan.shen@mediatek.com, 
 Linus Walleij <linusw@kernel.org>
In-Reply-To: <20260312041533.187553-1-akkun11.open@gmail.com>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
Subject: Re: (subset) [PATCH 0/6] pinctrl: mediatek: Fix gpio-ranges and
 include guard issues
Message-Id: <177331876391.53170.11935383567217800525.b4-ty@collabora.com>
Date: Thu, 12 Mar 2026 13:32:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_053247_234381_803AFDA2 
X-CRM114-Status: GOOD (  11.43  )
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

On Thu, 12 Mar 2026 13:15:27 +0900, Akari Tsuyukusa wrote:
> While looking at MediaTek's Pinctrl driver and device tree, I discovered
> that on some SoCs, the gpio-ranges count was a little less than the pins
> defined. This means that the last pin will no longer be available.
> 
> And fixing this issue, I also discovered that the #endif comment in the
> include guard for some header files was different from the macro name at
> the beginning. These issues do not affect the compiled kernel, but they
> affect the readability and consistency of the code.
> 
> [...]

Applied to v7.0-next/dts64, thanks!

[1/6] arm64: dts: mediatek: mt6795: Fix gpio-ranges pin count
      commit: c4c4823c8a5baa10b8100b01f49d7c3f4a871689
[2/6] arm64: dts: mediatek: mt7981b: Fix gpio-ranges pin count
      commit: b62a927f4a46a7f58d88ba3d5fb6e88e1a4b4603
[3/6] arm64: dts: mediatek: mt7986a: Fix gpio-ranges pin count
      commit: 820ed0c1a13c5fafb36232538d793f99a0986ef3

Cheers,
Angelo



