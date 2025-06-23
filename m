Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD429C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 11:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95k1N+AF/9IjBnDVXoJOa7ehhH7ZyrHfKcJq5bb9yE8=; b=g5gBii67VvxuPmaUXWHcjIxcX/
	uF8BW8Kkv1mzjsiBXvNT1Hg0vCedhJcjVfGLnazDfG7ugiO9vrwShybszmZ30fwO51s4JzTT8GpUv
	a/51el6apeDcvM+3rQYyVlVus7AtgQ0UcwiSHmwtnlYoojprwt34Nv8Ir1Uzh6yVYZlZJ+mmNaZah
	l0M1pcvnDju+Guapxp16gaV8CkGn6ue2Rf+O8deXg5E6isUt1+byoZRlCCSF4DbxxyY728Vj4Dzho
	xSiNV7kXoXG6iEA7kDbHgGHNUIJMw/RQvfAftphsgyWuNeNg2o9ApenMw5/RsjMkpt0IbQ13LDaat
	iplZfXvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfGB-00000002UkH-2BXZ;
	Mon, 23 Jun 2025 11:22:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdcO-00000002CgS-0eJD;
	Mon, 23 Jun 2025 09:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750671454;
	bh=SwoRLQ+iuWPKqGVWX7YPE161XfI39ceasvYcyMBIjx4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eg5JeYziaxU8gpuHcQwT2T8BRQsgn6EzUbazcS9qgbmZwsIcXFP1H40vWmcqVt1Pl
	 5GoqgyPbgCatv6icJmlMG1KSgnaNVGzdbfT/U3jGtEieuvN9VIiTuCfChbpCGVHoVp
	 L5AkIMFPjtCiEyVyZXvReDh9scMKB/iGFHRESnWNPZy37kow8TIdDhH+fltdtgiuug
	 gh1QqwaWuImV5FIv10z0Z4W7US4N6RvyCjmT99xVsRaerGtZ6Mwd4dCDi58La7mxWF
	 9pLGqVsNh6fh72Un8Hq77janpuYIiFYAtye04UeSea9OQYw3Fu0xvsV0V8nLtmY/5o
	 hC8cAKTr0C4fQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D755F17E05BD;
	Mon, 23 Jun 2025 11:37:33 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, bleung@chromium.org, tzungbi@kernel.org, 
 Laura Nao <laura.nao@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 chrome-platform@lists.linux.dev, nfraprado@collabora.com, 
 kernel@collabora.com
In-Reply-To: <20250318102259.189289-1-laura.nao@collabora.com>
References: <20250318102259.189289-1-laura.nao@collabora.com>
Subject: Re: (subset) [PATCH 0/2] Use ChromeOS DT hardware prober with
 MT8192 Spherion trackpads
Message-Id: <175067145378.62389.7783242126407636871.b4-ty@collabora.com>
Date: Mon, 23 Jun 2025 11:37:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_023736_345635_92F2836F 
X-CRM114-Status: UNSURE (   6.84  )
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

On Tue, 18 Mar 2025 11:22:57 +0100, Laura Nao wrote:
> This series marks the trackpads for the Google Spherion variants as
> "fail-needs-probe" and makes them compatibile with the ChromeOS DT hardware
> prober.
> 
> Laura Nao (2):
>   platform/chrome: Add support for Google Spherion in HW prober
>   arm64: dts: mediatek: mt8192-asurada-spherion: Mark trackpads as
>     fail-needs-probe
> 
> [...]

Applied to v6.16-next/dts64, thanks!

[2/2] arm64: dts: mediatek: mt8192-asurada-spherion: Mark trackpads as fail-needs-probe
      commit: 6cf6156bc71b5234c1dfce5a1a57c0229448ae40

Cheers,
Angelo



