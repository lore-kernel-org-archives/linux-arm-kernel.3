Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D03C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 10:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPAECwi1sARv7eAmVFOM+fpUzU8SLY9n+snp32WCYcE=; b=dbuSGauAyZzA3KCM/VrV4qm3WW
	1qz++v5u0eeQks5Q0deai6mWUPZ6VLFCKODuUvCefbE34qYq4PWCybjb1VfQSW5pexTi+uSIvbQkd
	AFWWVGYhiI7jaNqH8z4rslfyJC/TTXS/c7D6QFn8BZGuQ2RYy4Fn385OHoP3QaVRZP6dc8KHWoIb+
	upLIf7DH1YEjtN0TvWKIKUI0ytDIR8ZGVakp+0gGHTaQ78XbNy2eSkV0tFHoBGal+h+inQ2WbaJt/
	YONo0pUb30xCaOS3QQt6nvBSMGhHTxlJzo6Jvhad10doOWtpeBq1EstARWsoXhf74Tvd4u3F3F+YU
	3yp+GQUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GcG-00000001Nju-0dkt;
	Mon, 14 Apr 2025 10:00:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GV6-00000001M7f-2XTT;
	Mon, 14 Apr 2025 09:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744624391;
	bh=yvlYf0lgTFOTR2e19nZHR4rkgRdNU9AGWdXDAjN0rnw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GRoGQATZhCuJ+tpYk6h069OuC3HLH+dn6ET/9LtFYGAnE95p6TQRTBydXob7CX9Jb
	 cish8Tgwqe0Gjeuxp5+2oXY2PV/0H/F8VWQqSoswPM/5y6sfzDxSAstuK1aMfgGKF2
	 Pp7/NyHfJWrqladE4Kam6dRGoZ5M8qhOISj9ehhA9I0DoaINdwZyDOejQDzHReBUo2
	 W6ItpZAAhC3vQOu7WtyldsINDMFmsPS1kONIkfHiD5GZBPTiJhfk38cy0vjOvu52hk
	 cRcCyZldx/cnr3i6KDp5iE5r/JzztGxVeQamrJ+jywRl04XF3Hd+BBPz8qmohKc5AN
	 apWRWchPznwvQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7EA2517E0FA7;
	Mon, 14 Apr 2025 11:53:10 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, weiyi.lu@mediatek.com, tinghan.shen@mediatek.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com>
References: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH v1 0/2] arm64: dts: mediatek: mt8195: Power
 domains fixes
Message-Id: <174462439044.45420.1600636248450657277.b4-ty@collabora.com>
Date: Mon, 14 Apr 2025 11:53:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_025312_793083_67CB8E6B 
X-CRM114-Status: UNSURE (   5.38  )
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

On Wed, 02 Apr 2025 11:06:13 +0200, AngeloGioacchino Del Regno wrote:
> This series fixes hardware access issues happening on the PCI-Express MAC
> and on the video encoder and decoder IPs embedded in the MT8195 SoCs,
> fixing system suspend functionality.
> 
> AngeloGioacchino Del Regno (2):
>   arm64: dts: mediatek: mt8195: Add subsys clks for PCIe power domains
>   arm64: dts: mediatek: mt8195: Reparent vdec1/2 and venc1 power domains
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[2/2] arm64: dts: mediatek: mt8195: Reparent vdec1/2 and venc1 power domains
      commit: 394f29033324e2317bfd6a7ed99b9a60832b36a2

Cheers,
Angelo



