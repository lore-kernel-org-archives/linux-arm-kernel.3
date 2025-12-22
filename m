Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AEBE674B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 13:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgEuAcD0+6Ay73Edf5LnTItfyQ/3fcSTfEnINuf0TSQ=; b=ip1s1cp3gaxaEp1ChM+NFiHP7G
	EvBwI4pugL2cSv1IZYrFcka8utLvR0rjosj3spS/PwsDXbPcNU3bfSS3lWwV2PmFlIzFgRH00+Oxp
	q2bJryN/l//9I+qLwnpKtDQRsUNqbWdlH2J3rREurHpTYOLYMc/hUPSUntfY060ntWPBKvdXIVz0t
	LaP/UVGl9rbhADm/TrhYnNpnhUdLavYX2Wjz3ncYx+unFO6h1TcpLZpRVrQwVNxjI3Afn19uXc/zG
	hueF1HGwJPfgoon5qKzh4phPZQkMOdCbHONMiP5cnyw2WeNA6tN04cLZXtDKPp6kTJuzFv9f1phJM
	hLzOT5Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXg7U-0000000DouA-1REz;
	Mon, 22 Dec 2025 13:38:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXg7Q-0000000Dosk-14ld;
	Mon, 22 Dec 2025 13:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=IgEuAcD0+6Ay73Edf5LnTItfyQ/3fcSTfEnINuf0TSQ=; b=M68rJ7N3PNDLHySBpxN5PAQvoH
	cm+wfEmR8nF7mjoRJ9gboUkBPAosc6YOaICBLYaIXn/S75VAnUtKLlHaUDMbNjr91JVkCpKVLW/1o
	oMj3K0Ay4aCHr6UsjOX5oI3iMa1ndrugdOD/S7VhhDwBxQrxdvE0E5oSt+/GaJBAkwoaTTL29y/b9
	s/YSzgOWWRWHn9WwPRJjQ9v2b/FvKQk4L5TuKVERJ2jjqjKw23CFfdpBaxZ3KII4fkniwVusTl38D
	JFc7rMD3RryDFr2iT43ewOMQuxiZL7MoYUG5oBZTs8crvLTit48sLY0dlxiUTQH6O2RXyLfCXPyqs
	XUqPogMw==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vXg7L-0005s2-GI; Mon, 22 Dec 2025 14:38:31 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hsun Lai <i@chainsx.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	stable+noautosel@kernel.org
Subject: Re: [PATCH RESEND] arm64: dts: rockchip: Fix wifi interrupts flag on Sakura Pi RK3308B
Date: Mon, 22 Dec 2025 14:38:25 +0100
Message-ID: <176641067335.1648325.10724252333112097745.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251217091808.38253-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251217091808.38253-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_053836_541769_6B27C515 
X-CRM114-Status: GOOD (  11.09  )
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


On Wed, 17 Dec 2025 10:18:08 +0100, Krzysztof Kozlowski wrote:
> GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
> These are simple defines so they could be used in DTS but they will not
> have the same meaning: GPIO_ACTIVE_HIGH = 0 = IRQ_TYPE_NONE.
> 
> Correct the interrupt flags, assuming the author of the code wanted same
> logical behavior behind the name "ACTIVE_xxx", this is:
>   ACTIVE_HIGH  => IRQ_TYPE_LEVEL_HIGH
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix wifi interrupts flag on Sakura Pi RK3308B
      commit: 7c6bbcb010b1b8e4e6452de109f0506bb05d6efb

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

