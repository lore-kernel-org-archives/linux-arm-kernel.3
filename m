Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9E1E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 12:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFifa8ccl5RjkZmJV5Bnljn6AmhjaZzsqoQL6C+WMaI=; b=NGm4flCIBBRxcFCTrbgg5xmNgS
	qfp3fD8kWp+BrBFyUfHKKKROjH5gYyCWnzCvxbBOuSi8Jn+2AzULW+lQhxjaprjarL2ZetNMVxyOI
	EObZLXMcoMwNwifp4k6+diMtjoTILTY9qzGxPHi2oag462pAgcQ+yRU/w867VFOuQP7hg9a91IUg0
	shh15K73jfoj58DnPu+dMJ6Konj7j8jsSFA/9HMcr0dlyjuHLzM1no77X3LT/fItCeHbOQi8VOd4p
	lT/n0+pcH0yc2blUI76D7C8MEFQc3jdDM8qgMrhnt3fxYo1dZoIQGdi+RVM3zkxZfpR9neXpUAp+I
	qXnbntIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFXG-00000001llZ-1ol4;
	Thu, 19 Dec 2024 12:21:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFW9-00000001lVb-0f2f;
	Thu, 19 Dec 2024 12:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734610835;
	bh=6I5nC4pkzPQPTM76bNW5JcA9mDmtxzl0/S6e8Z9l9so=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=exPgg5mqxnXefGuruwVmotBP2Pc1lYfflmOuK/oIfx+S2I6YDC9ACfpzXDit5wV7h
	 TLpWmq+IgbM9d8+BeygQL6eSnol/qiAHFB7VoeuDvQIlpwHwkWn6Z0RALfP7IwYLxV
	 9KZk1bAdq9Z7X2uQjKhrv7+gNpEw9a61x9KfGuH6jw6GCxUzClcke/5SJI8vUd3hsw
	 nAo2lH/V10k9wSf3aembiTCOdBcp4Vo4Ov1fhZ9G+sXJM89XtanujtiNfJj3A6Z9yV
	 aDdVvRcWq+W5bo3+pXDflvFmrS698L+kJNsABF2mx97tvi1rtC2LQqK58U4pgQ/5Pp
	 8simtcZrDKBsQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7FA3317E3684;
	Thu, 19 Dec 2024 13:20:34 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20241218-mt8195-pcie1-reset-suspend-fix-v1-1-1c021dda42a6@collabora.com>
References: <20241218-mt8195-pcie1-reset-suspend-fix-v1-1-1c021dda42a6@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Remove suspend-breaking
 reset from pcie1
Message-Id: <173461083442.58336.13259484924514720817.b4-ty@collabora.com>
Date: Thu, 19 Dec 2024 13:20:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_042037_355764_7FEBA6E8 
X-CRM114-Status: UNSURE (   6.97  )
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

On Wed, 18 Dec 2024 19:01:08 -0300, Nícolas F. R. A. Prado wrote:
> The MAC reset for PCIe port 1 on MT8195 when asserted during suspend
> causes the system to hang during resume with the following error (with
> no_console_suspend enabled):
> 
>   mtk-pcie-gen3 112f8000.pcie: PCIe link down, current LTSSM state: detect.quiet (0x0)
>   mtk-pcie-gen3 112f8000.pcie: PM: dpm_run_callback(): genpd_resume_noirq+0x0/0x24 returns -110
>   mtk-pcie-gen3 112f8000.pcie: PM: failed to resume noirq: error -110
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8195: Remove suspend-breaking reset from pcie1
      commit: 3d7fdd8e38aafd4858935df2392762c1ab8fb40f

Cheers,
Angelo



