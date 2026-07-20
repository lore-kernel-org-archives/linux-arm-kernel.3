Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009C3C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2Q9kB+OhOHRGwJdCIrp5ZxHtHi5xN3KIzIRU/fLzWk=; b=CEpQ007sA9PgVL1Nt9tstlutBt
	ZrfA3g/L+BxCqb+bJcYpzDcQ+B0w/BuVmjS3aY/R6qEMPXtk3Yv91ClBpySSBwdrwjnsGKpluP61x
	iN4v3E3TYE4UIRbUsNW5ppKSOQCu3fRg6Pf2l6917+Blyfe0UBG1OcxFwnt/nLv4qcCTnoLdAiope
	jsxMhzf5Z6vYdiY9kHzIrBivpT27FJQLOan/LEZddnklEhehkG/SYubcLP/XJzxYzwsx3cGxF/HUt
	D4G6HJoMGaxKwAxiG+dwdGxZdbXkzcOL5+LA4At2bvd1uTjeEd/tgxySKo9bP29L//Zr2Eg6piack
	fKFoqBOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnZO-00000006kOI-3CYw;
	Mon, 20 Jul 2026 12:58:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnZM-00000006kNX-2RzC;
	Mon, 20 Jul 2026 12:58:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784552281;
	bh=pXwbG8g2ui3ZnNKrmpTi8SOGTs2VjdyKpZo2s1V1Tu4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kd/53mxygveWECGvoQk8w3hqEbj3MP4CoAy22jUj+vMtB6aLXXcZOvGSb91flcRQj
	 tx3QduIDWI97BVjk7+R6WptXYqTyJsLeMfbTteiEqiaTH40GcwKUgeIoTGbQKhOgLd
	 7LOi4LqV6sjwgqr7MOusvmSorHgetrKE5X1kBXBnPseujlKemKL1ho9dh+pLR2THz3
	 XGhuiq6PvnZ1DmcRbGPk9yT7s3l3HVFPST2sx+UNsE/KRS4BTuKYUjhBWiKp/6zaax
	 heL/QeLriNwO2tE6a1vna+8BiUPbLn1tVzlckNW8SAyIchyrR7Fl93JPyT357vC3mn
	 Lfg/UvycIH17Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C247F17E0CF1;
	Mon, 20 Jul 2026 14:58:00 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260720092759.1831105-1-wenst@chromium.org>
References: <20260720092759.1831105-1-wenst@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192-asurada: Disable mmc1 on
 Spherion
Message-Id: <178455228074.74351.3461241181620580397.b4-ty@b4>
Date: Mon, 20 Jul 2026 14:58:00 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_055804_787667_28AD674C 
X-CRM114-Status: UNSURE (   5.52  )
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

On Mon, 20 Jul 2026 17:27:57 +0800, Chen-Yu Tsai wrote:
> Spherion does not have an micro SD card slot.
> 
> Disable mmc1.

Applied to v7.2-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8192-asurada: Disable mmc1 on Spherion
      commit: 934cccd2c6795a20d04bd470ec7eb3151950fbfc

Cheers,
Angelo



