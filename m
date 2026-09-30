Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D48CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 19:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0peu86CV94HT+ZId0KjjmcWabhYufxkvU6Qb3rMbNMQ=; b=K/OiChQCASDVEOJfsop4Nf0WOS
	ffwP/4zaGZnfa8BcxoMKeKrvM515C+9dmFWiNvAYF6BXxowqqAONCeuVgJps5YzQKz2OSV357b3gf
	zChS18//PH+V2CRaSxvqGjK3sEAuoD+1XRk6ib6SRjS3QvEYWscHHoWE8zN1TrR3CaFfLkcCxVjZD
	20vFXQTHdMkaxVx1BM4oaWTBfd2vv3CO/wo673ODnIWhRf+qKn79T09bhhktCPxDNIdr4kPM6Q4sD
	bSln+qkZ5p/UnavMCGd8pPwNraL2TTI1WxOrBlLTTatOBHnCsR7Tbjsw/USLC3sVLSf/ByWZjX+gt
	Hjh4c8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC0Me-000000077UX-0j2y;
	Wed, 30 Sep 2026 19:53:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC0MZ-000000077TF-3wLw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 19:53:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 211301A1062;
	Wed, 30 Sep 2026 19:53:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E754060749;
	Wed, 30 Sep 2026 19:53:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 32CB31032A65D;
	Wed, 30 Sep 2026 21:52:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790797983; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0peu86CV94HT+ZId0KjjmcWabhYufxkvU6Qb3rMbNMQ=;
	b=quZMChohV1lnyObXH7qPqvMn2uYfyQa2hKB7mbvqvJxBTEtE39udp0j3QwPK0ZQjEYnl6R
	qS1Tb0rdUbn6Y2g1vGJhlGo1+SgBHZW5g/vwDIa5Uh6JZU6tZh5DyL382xfLywMkUG4n8a
	Ddmo4yKRf7FL9ACPlnwXbgB7P7TlgntT+ojacuNe7a/kcT9ZdxiRzfnBVoZavrWfuq9P2K
	Sy85qxmzTDQv62tgK81SE8vMgYfc8FS/huhez/L5mfgjdgHX2b3+I3fCHS3GhPU1R06Bkj
	iak6Oq5OOJWQuTTXuD4rpVkW4TqtXA+rUijQO5RB34eKNMXsg7iIl+oZAoVkAw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Nicolo Giuliani via B4 Relay
 <devnull+nicolo.giuliani6.studio.unibo.it@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nicolo Giuliani
 <nicolo.giuliani6@studio.unibo.it>, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: marvell: Add Sophos XGS 107w NPU
In-Reply-To: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>
References: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>
Date: Wed, 30 Sep 2026 21:52:58 +0200
Message-ID: <874if68qjp.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_125312_125038_E5E3FC3A 
X-CRM114-Status: GOOD (  22.64  )
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

Nicolo Giuliani via B4 Relay
<devnull+nicolo.giuliani6.studio.unibo.it@kernel.org> writes:

> The Sophos XGS 87/107 desktop firewalls pair an AMD x86 host with a
> separate network processing unit (NPU): a Marvell Armada CN9130 SoC with
> its own eMMC and SPI NOR flash. The NPU serves the eight RJ45 ports and
> the SFP cage through a Marvell 88E6193X switch on its MDIO bus, which is
> connected to the SoC by a 10GBASE-R link, and reaches the x86 host over
> PCIe.
>
> This series adds the Sophos vendor prefix, the compatible string of the
> NPU board and a device tree that describes the NPU as a standalone system:
> UART console, eMMC, SPI NOR flash, the SFP cage and the switch with its
> ports. The port LEDs, the USB ports and the PCIe link to the x86 host (the
> CN9130 acts as a PCIe endpoint towards it, which needs endpoint support
> that is not part of this series) are not described.
>
> Tested on an XGS 107w with Linux 6.18: boot from eMMC, eMMC and SPI NOR
> access, the mvpp2 link to the switch at 10 Gb/s, the 88E6193X probing with
> its eight user ports, and 936 Mbit/s through a front port. The SFP cage
> is untested.
>
> dt_binding_check passes for vendor-prefixes.yaml and armada-7k-8k.yaml,
> and CHECK_DTBS=3Dy on marvell/cn9130-sophos-xgs107w.dtb reports no warning
> specific to this board.
>
> Based on the mvebu/dt branch of the mvebu tree (008e9faade).
>
> Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>

Applied on mvebu/dt64

Thanks,

Gregory
> ---
> Changes in v2:
> - Patch 1: drop the second sentence of the commit message, add Acked-by
> - Patch 2: move the entry before the SolidRun ones and list only
>   marvell,cn9130 after the board compatible, as the other CN9130 boards do
> - Patch 3: use the compatible list of patch 2; pass the switch reset as
>   reset-gpios and drop the boot loader workaround; remove the LED
>   expander node and the SFP address comment
> - Link to v1: https://patch.msgid.link/20260919-send-dt-v1-0-365615a74ef3=
@studio.unibo.it
>
> ---
> Nicolo Giuliani (3):
>       dt-bindings: vendor-prefixes: Add Sophos
>       dt-bindings: arm: marvell: Add Sophos XGS 107w NPU
>       arm64: dts: marvell: Add Sophos XGS 107w NPU board
>
>  .../bindings/arm/marvell/armada-7k-8k.yaml         |   7 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  arch/arm64/boot/dts/marvell/Makefile               |   1 +
>  .../boot/dts/marvell/cn9130-sophos-xgs107w.dts     | 188 +++++++++++++++=
++++++
>  4 files changed, 198 insertions(+)
> ---
> base-commit: 008e9faadef8c0aaa9b8a3ff05a2126e3c5b08b7
> change-id: 20260919-send-dt-6bbd08a470d2
>
> Best regards,
> --=20=20
> Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
>
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

