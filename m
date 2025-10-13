Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43057CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 09:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rx8J4MgMfyoyIB9Cg93xakdWKsCgTAkkJzKjLa7Cv4M=; b=ovJRwtvjMpCd8LbmZlY+0nQIf9
	vDwjEK6DAAzT0/WPvVHq5LU+043QUt4b/ggLK7K2FYc4UAEAcz1p9/C5AyxusaEhsStHvA1FlAew+
	a9ei4wjbVnbF0GiW4FyciBefgYR25odn0jMfmxgxB8HvTk6X1vBUihj+nloaRNUtoF1xfhTzTaflS
	BPSz6lN2iE2cySNAf1l3G8vY4F04NPkUFnrbGViH/x3OD2QmOA8gm71be607ZS2sgjNfAAFBWjk9B
	fSPD8qK7bdvshzpabfgCundzZNLVysjC8PRfglhuGyerFw8DDRE1ygI85Kpt3xt6EWhiFbsS7N7Px
	Gn8MllzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8FAH-0000000CnBJ-10La;
	Mon, 13 Oct 2025 09:48:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8FAE-0000000CnAM-2DAi;
	Mon, 13 Oct 2025 09:48:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760348900;
	bh=JOvjW/lfUeuYYIXnwJ056RTGV0z63bXinyG8mV+KbQo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kwCIXgDcdXFWuWbKgvg6bN9nqe7wcQ7VRVgqehMENXgkMlvPH7G2X0o/0+1sj0NUm
	 M5SFgxvflc5U+j1qQOvqoy8Edug48cq+zqx6HTpx+Zs9JUWFN/eAHiqnl74gj0r0Qw
	 HnwWNv4vYp9q5TX3YYJqA04ehxX/rQ/9QVXnKHOdPNKIOAv3Wp00hSr2y7sEwmPY15
	 3XTeldB0cROPEVdREos9J4lT7iDAT0xmq3bCPUmDjaWh6oFt/b8e2G+HU0mnvYm1u+
	 81hr6bgXvfIriNGXgq7Sqb2ESoyEoMpVt3MFrZ9PliG4ln33b7j9WGboV89muaNYsm
	 +S6Nx6ZU8mYAg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 027FD17E1292;
	Mon, 13 Oct 2025 11:48:19 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org
In-Reply-To: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
References: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
Subject: Re: (subset) [PATCH 00/10] ARM: Add support for yarisxl mt6582
 board
Message-Id: <176034889996.23450.1397548842527992486.b4-ty@collabora.com>
Date: Mon, 13 Oct 2025 11:48:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_024822_738206_2C918A9F 
X-CRM114-Status: GOOD (  11.20  )
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

On Sat, 20 Sep 2025 20:23:25 +0200, Cristian Cozzolino wrote:
> This series adds support for Alcatel Pop C7 (OT-7041D) smartphone
> board, named yarisxl, based on MT6582 SoC. It also includes some
> preliminary patches. More in detail:
> - patches 1 and 2 add support for mt6582 to platform code
>   (verified by looking at generic mt6582 downstream source code)
> - patches 3-6 do some maintenance work to mt6582.dtsi
>   (I was unsure if squashing timer node patches into one)
> - patches 7 and 8 add devicetree and dt-bindings support for yarisxl
> 
> [...]

Applied to v6.18-next/dts32, thanks!

[03/10] ARM: dts: mediatek: mt6582: move MMIO devices under soc node
        commit: 1e955255a8eebcf93f0b399cb46c8947e648c0d6
[04/10] ARM: dts: mediatek: mt6582: sort nodes and properties
        commit: e898d7a2e2aa60c680227ef67a536f5a48d9776a
[05/10] ARM: dts: mediatek: mt6582: remove compatible property from root node
        commit: 5f3204e33a00fe7ab652c0eb57becc8ad58e7f29
[06/10] ARM: dts: mediatek: mt6582: add mt6582 compatible to timer
        commit: f6b85f1cec503aadc2b260c7648a09433897df1f
[07/10] ARM: dts: mediatek: mt6582: add clock-names property to uart nodes
        commit: a97a57c68d3d02510e826d41bf2e49c6f7e515b6
[08/10] ARM: dts: mediatek: mt6582: add enable-method property to cpus
        commit: 246475ee9ba806a4268cd2abb40cb63990b05a6d
[09/10] dt-bindings: arm: mediatek: Add MT6582 yarisxl
        commit: 10dee355bdc1a8409babc71e5aa36c7d7f995910
[10/10] ARM: dts: mediatek: add basic support for Alcatel yarisxl board
        commit: 12fd34e32d5d0b7c276eec83b575c21a5cc12485

Cheers,
Angelo



