Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3DACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 22:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLGl7PzNPrdk/BRbrx08T1/GhgcZAys2R92RWoPbyHU=; b=gIJ6i30/3HNkaxRiExDvV8F4M9
	Xtm1C2NsPZTTAZmDjzCUk0SGcflfCf7OkD4SPVCeZKji5mW/wlZJ46bYcXajFRF2r3pJPMvKgWrTV
	dCs4ExBSP/xQRBy/4IHMbxVK7DjZ0D7sm6mAKCPtR2/aybKFzqlFsRe8TmrLxdGKyZnhDfogdJDYC
	EejrmpRkdWok825OoBsCkBWNMu+8FBSnodbHCpZnugkcpSHgFATE4Ioeb+Uy3P8jQ2jhmCc4Pb/aY
	7BnQu8smz2o2NHGM1Re99KgyewTHEqEtHazReMI9JnL7bIppMXgxa+4gNCAYMMsW7cay11vMr0fRc
	Vp+36PnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH8wE-0000000GL7y-1LCR;
	Thu, 06 Nov 2025 22:58:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH8wB-0000000GL6u-36ZO;
	Thu, 06 Nov 2025 22:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=yLGl7PzNPrdk/BRbrx08T1/GhgcZAys2R92RWoPbyHU=; b=0oIE+TDkUR5Xe9oW4u1KQvnBDI
	mvNZlhFQ93tSoMj+tW+QRijfF+cVMrnkH4YLtQKQDX4dDbmpCD1Khn8vhsyOqddP0yYsQbOL9PFlS
	z0yJTeUEqSvf7YuX7cMvrm6iR4GSWjeLFzq3IKLYXztiuj9oKUEUn2kXTFGGX0d2H95FlrCHAfRWZ
	eIV/0h8Rv8TLknTZvJgmHnzi2hd4nDGdBqzrJfgFZaOhHzK0fLK3/hVf2q7mvF0a9DZugVtue6f8R
	293OZgDEJUPy/mTr6/cfih+Z3jYNAruQJEwf3VqaSKm+wIZv3g47ggaS9MMeQ1JvtKOCzou20/+qD
	86TFcWfw==;
Received: from i53875bac.versanet.de ([83.135.91.172] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vH8w9-0001pr-PN; Thu, 06 Nov 2025 23:58:37 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Andrey Leonchikov <andreil499@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix USB power enable pin for BTT CB2 and Pi2
Date: Thu,  6 Nov 2025 23:58:31 +0100
Message-ID: <176246989731.210200.17367570635141107915.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251105210741.850031-1-andreil499@gmail.com>
References: <20251105210741.850031-1-andreil499@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_145839_776418_1F8E3D85 
X-CRM114-Status: UNSURE (   9.74  )
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


On Wed, 05 Nov 2025 22:07:33 +0100, Andrey Leonchikov wrote:
>  Fix typo into regulator GPIO definition. With current
>  definition - USB powered off. Valid definition can be found on "pinctrl"
>  section:
>  		vcc5v0_usb2t_en: vcc5v0-usb2t-en {
>  				rockchip,pins = <3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
>  				 		};
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix USB power enable pin for BTT CB2 and Pi2
      commit: a59e927ff46a967f84ddf94e89cbb045810e8974

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

