Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AD3C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 11:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13+8BEkXLheRkv5whG02ibWcosm7wt3oL6Kdm1ccKVo=; b=pnWayIjGraXHHhXv2gCgVoPrZ9
	jE4ZNggdAAaooBGOnoc9BZO15NJJwHzQx2xK+GyJzg1itjA99+vUn5eKvzsjtcMK7ICBGlwBO2K/4
	kZ0uNl3p0Am4IWA6dS1DEdpP42lB5oCLDSjJVMtsdPpGT8MAQDxJfEzNnMTmCt2aRoJsJIrLVUmOL
	Azmvn5FqZ7Vvbr7PvRPhkiv0fdXcAfMn8be6ulQ196MPB8IOCZ/szEtV8ZUaYfA8kzCF44yiP6ZsI
	3zMuD1mg+dHvWICZJuYSOE2LSVjrjpyqk+WFEcIaJt6bhPSnbk30YGDsUpdXU2JeTR3v1In2CPXov
	0sWrQjog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpB2-0000000Bavq-28Sv;
	Thu, 10 Jul 2025 11:10:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnYt-0000000BLBV-0wWi;
	Thu, 10 Jul 2025 09:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=13+8BEkXLheRkv5whG02ibWcosm7wt3oL6Kdm1ccKVo=; b=aBK+jOIFUszOvNCVOckQBv+F5W
	eV3wsRAw5OCEyYrM/Y36QJNlR7ZhA2+dI9M2c8dCRhAEX5PmsQYprUCLrIb61qjygWJPfwGYz2Tyw
	QVN/aPCyZRjcz5khxWuRK0YgFG7rTdKGjDqajOIdjSUaf9+4eWk3y530QBPpKzwF1rjEo6MIAoAiR
	VqNTRVMynKpvAwYa5X+Q1ZLk1LabmW9H88RdwoFTKxtghY2uOfqa8Pcd/n7aNVLfBClKsqvu4LN7A
	thOUT2bEDhgDioeuNaKRV+aDlo0SvwABD0wCtdjK5KqyY5hM5faBGuid0pMAJdobrb6CzwHzGc9JU
	ToYbO4aQ==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZnYo-0003fo-Gv; Thu, 10 Jul 2025 11:27:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH 0/4] ROCK 4D audio enablement
Date: Thu, 10 Jul 2025 11:27:16 +0200
Message-ID: <175213962003.1887379.17539289934653922939.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
References: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_022727_277662_278BCADA 
X-CRM114-Status: GOOD (  13.74  )
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


On Mon, 30 Jun 2025 12:19:23 +0200, Nicolas Frattaroli wrote:
> The ROCK 4D uses an ADC input to distinguish between a headphone (i.e.,
> no mic) and a headset (i.e., with mic). After some searching, it appears
> that the closest we can get to modelling this is by sending a particular
> switch input event.
> 
> So this series modifies the adc-keys bindings, extends the adc-keys
> driver to allow sending other input types as well, and then adds the
> analog and HDMI audio nodes to ROCK 4D's device tree.
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: rockchip: add HDMI audio on ROCK 4D
      commit: b78165281b25b676ed3e4f71610228984222d214

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

