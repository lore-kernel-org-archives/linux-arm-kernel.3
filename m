Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CD3D30CC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 21:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+SHeZVK/c1VfybhG+F1pjmmTDWN7HSf5RdSW361WXY=; b=drfzAyoGcpZphngAuSQ5RiWxNG
	E/55VTkS0KPsl0dEe5jE+qa4mIL6FDUOlVzzi8YQjRC/RyePlUwyMwoqPWhqrpPGyfcMzOA2+9XST
	NUHY0DLGEaS4esvKDxkmLWDV03u2F/6dDYX7vcuEmUmNKsDEewrzwIxJeH9iTCqNQAZAze8gq8buQ
	VAzi2nlmuv9xZWa/d7b0HyJ/EGVzpkkvS8CWPP/Z/wN6xTvzgBj+rfdCGIulRi5LGW1Nr1FNjVe7p
	wXv21ekUS+uSqkCXoM+3RCtJRg0348zxgsJ+U06zV/5QGcvcIJR76V0pol/KuRkRH1Sz0oJoCj4Bh
	twFbxjfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfm2U-00000007klj-3ZDP;
	Tue, 13 Jan 2026 21:34:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfm2T-00000007kl9-2Cfb;
	Tue, 13 Jan 2026 21:34:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 916966000A;
	Tue, 13 Jan 2026 21:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F2E4C116C6;
	Tue, 13 Jan 2026 21:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768340096;
	bh=AnaM8x3f3W5v51ldvRJdYxt23fxs7tH71LL/EHiuuHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7DOZsRtYsi8tQ07yvJmBY197Ps+YF5i45xHC7lnF4We8vBF0KOQCCjaVE6MQnmK1
	 BewQRe/Xe4mibBZd+IiOA/EHpZ35RqlMKn3vXzTrRWoDKCwRtzRqcVTAvOaejd6mqF
	 uLXiD+wmN1eNahhvm826cWRK/mjL2Cy3NWCufJG6E47CoYYGE6g/GlCFzTAT9lhLGq
	 wxIZ6phqwK0QtFlfy08DmUoeduPbP8q4PLVaUHUxxCU2bjhEDaMXvUb2VB339469vz
	 tuH22HCo0I2X9kszfxQOmyCpH1gfKA5L48itAsFk0HskG+P7FQ1goKEocSuvGAXtGU
	 k22NPKK05CY4w==
Date: Tue, 13 Jan 2026 15:34:55 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ulf.hansson@linaro.org, krzk+dt@kernel.org, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, sboyd@kernel.org,
	mturquette@baylibre.com, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: clock: mediatek,mt7622-pciesys: Remove
 syscon compatible
Message-ID: <176834009281.195401.17311235589252333547.robh@kernel.org>
References: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
 <20260113110012.36984-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113110012.36984-2-angelogioacchino.delregno@collabora.com>
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


On Tue, 13 Jan 2026 12:00:08 +0100, AngeloGioacchino Del Regno wrote:
> The PCIESYS register space contains a pure clock controller, which
> has no system controller register, so this definitely doesn't need
> any "syscon" compatible.
> 
> As a side note, luckily no devicetree ever added the syscon string
> to PCIESYS clock controller node compatibles, so this also resolves
> a dtbs_check warning for mt7622.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/clock/mediatek,mt7622-pciesys.yaml        | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


