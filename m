Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D535CC55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 19:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ufUQjn+PxTv6w3gV6MnAQZ9oTh+dMozsmrwmo9yaIs=; b=ROMmwoyFUN85d0qllXYB8+ouEM
	KVNrachZhfCll29BVOoEfedxlC7ipjzLepw66CBeY10CFekd31N/Xx4Xt8K6d0AHXoApG05DDv3Xk
	nTDH14rSlO6q5wYmA1HwRzTT/uSMVA15oN4hvXxKi0rI80o39eRg4HtYJike9+WKGjYcKEkKwt7RO
	daiGKcTxperKkb8Xa1UCc2tpTsggSHqiL1kJIK3oIUEeNS3KN1FQ5ATpVReJ+ctyte6h5kIgcJgLL
	OiPMRXsLvQ3dQd+TIPJs3fctwV137j76lLbVaPrOPt4kPNLK346YJ2z4BdxwFWmW6gCCMFgDk2Toh
	+oeM/Wcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqbZa-0000000FyNM-0dYJ;
	Sun, 02 Aug 2026 19:10:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqbZX-0000000FyMs-37mG;
	Sun, 02 Aug 2026 19:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=6ufUQjn+PxTv6w3gV6MnAQZ9oTh+dMozsmrwmo9yaIs=; b=WKzqgHgVPQFmDWhC56etYt4NJw
	ubR0xHH4U1L9st+OwTYSc4mX6wmZZXLg7vFG52yGPnoDH46SoVGMZxDvTro4+Yhi5HlRHfYIMUSAU
	kkKO7ZxI+jeHnTUqIHmIWKmMXOIBQue8rwk6pfHcWbuPDZ6M/1JfO+HgNXA+Jtw73/tP7XSyoyL8a
	gdcuRyShnnfnxV9BX6MtrI0WmUKMk+kKidV80AAPP7ZrL8ksxE9ENHI+oyMGSOBN4fG8tc5bj/3H7
	A5dmuMwDRipJdCVScygacgr9D1KWVYC96Ulo/DzHSu4hw14rtleAHYz1kLWuxaI/ncxsh5yKdkiL3
	P5LuShVg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 0/4] Add devicetree for LincPlus LincStation E1
Date: Sun,  2 Aug 2026 21:09:57 +0200
Message-ID: <178569771627.1410444.7870860670350024666.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260711192842.845048-1-samuel@sholland.org>
References: <20260711192842.845048-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_121007_786067_6BC35C3F 
X-CRM114-Status: GOOD (  15.24  )
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


On Sat, 11 Jul 2026 14:28:24 -0500, Samuel Holland wrote:
> This series adds a binding and devicetree for the LincStation E1 NAS.
> As described in the message for patch 3, it is not entirely clear what
> the DTS file name and board compatible string should be, so for now I
> went with the marketing name for the file and the OEM model number for
> the compatible string. This mostly matches the vendor firmware.
> 
> The vendor software provides quite limited access, so the unit must be
> disassembled and the board removed to access the UART test points
> (opposite from the power button; Ctrl+C to interrupt the vendor U-Boot)
> or the eMMC traces to force the SoC into maskrom mode. The vendor
> firmware uses rk3568_ddr_1056MHz_v1.25.bin from rkbin for DRAM init.
> Mainline U-Boot 2026.07 works with no code changes when configured with
> this devicetree. It is recommended to enable the fan as early as
> possible (e.g. `CONFIG_PREBOOT="pwm enable 0 0"`).
> 
> [...]

Applied, thanks!

[3/4] dt-bindings: arm: rockchip: Add LincStation E1
      commit: 2b009df2afd0874080a1e2a893df5e4db39cc1c5
[4/4] arm64: dts: rockchip: Add LincStation E1
      commit: 0f4c49bb3e538d01bdec403052ba6c35858aa0cf

Dropped the regulator-suspend-microvolt properties. They are deprecated [0]
and also were the same value as the main voltages the regulators used.


[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/regulator/regulator.yaml#n272

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

