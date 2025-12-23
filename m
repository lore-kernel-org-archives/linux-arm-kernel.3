Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2021E6F085
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJDvRtW4Qrq16EMTlgKACHbyaVDCeazp1+QnqcqIz60=; b=v2Qs9y3VWP6UExIRf8Cecd1gVS
	L4Q3p/cyKdcTIZK/aCUni7vMC6eUg79m+2fJLgJ81YbMA4tmXaZRLdExLNPtYpU8yjrSHmU3PH4So
	56W2CzggqDn7vgBfBT2o53w9BOSsTFhhNG2bYiZ6ggwVoxTekW/X2zsL9UkNgIGMjeQX4O/WE2Uxg
	R1edb/PYB3+jLI3/mnsOwfyQzzc44lswxzYxmyeoU919ofRE+9TNUdba3J0krPMlxAv4VQNR8eARV
	pQif0a/C+ZbXyJWPxponVKDXGJEMmKZtApNYaPT/oMe5q03+uY+6j2y6YlTuRoi/M18XgSYTiUkth
	oXRZNZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6Ro-0000000FrKE-2Io9;
	Tue, 23 Dec 2025 17:45:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6Rn-0000000FrJJ-1r3W;
	Tue, 23 Dec 2025 17:45:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D263560143;
	Tue, 23 Dec 2025 17:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B177EC19421;
	Tue, 23 Dec 2025 17:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511922;
	bh=T2nlD48GlaoJgKHs5BjofUYL/ofPr9ZNhb5JsuIEU9o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Chi1/a2EXD0CKQMuWgr/euJuLk9PeIwxJo4Ad0fSVfmFTxJyLyaMR9hFIPE7eLw3M
	 Dh97j5qQUJquRz6X8otCn8/i/fOJcHJPK1pmso20pPvzHSmTLA2m2W5+1PbuQUVvun
	 DD14V2claROpYdReo59+hOqMSLmya+QrGbw8ojQwGlNFK5PWFzwxhbjEtn4tHbKilu
	 0nQuWxjA5mQkbG66rDOw4/yw/vZuyrOa6ssAFN7xqlE1C/uiHu/Fmdc9OWg8+LtHvB
	 HKofrm39lylBMF4y3jcx55jZJ6Mitcwj9BJQJ6jusKaDSpLBXWhtiLKP9b98jMuyPZ
	 NUIFXy8fKQWRQ==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, alim.akhtar@samsung.com, andre.draszik@linaro.org, 
 peter.griffin@linaro.org, kauschluss@disroot.org, johan@kernel.org, 
 ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com, 
 s.nawrocki@samsung.com, Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com, 
 dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com, 
 selvarasu.g@samsung.com
In-Reply-To: <20251124110453.2887437-1-pritam.sutar@samsung.com>
References: <CGME20251124105651epcas5p20d9987d882d5d3850b599b4b46cf70d5@epcas5p2.samsung.com>
 <20251124110453.2887437-1-pritam.sutar@samsung.com>
Subject: Re: [PATCH v10 0/6] initial usbdrd phy support for Exynosautov920
 soc
Message-Id: <176651191635.759340.5010016532880564804.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:15:16 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Mon, 24 Nov 2025 16:34:47 +0530, Pritam Manohar Sutar wrote:
> This SoC has a single USB 3.1 DRD combo phy and three USB2.0 only
> DRD phy controllers as mentined below
> 
>   * Combo phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
>     compatible to the USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is added
>     to support USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data rates.
>     These two phys are combined to form a combo phy as mentioned below.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 HS phy compatible
      commit: 28810c0dfe8aa82e6514858bdcd7a83f0848e90a
[2/6] phy: exynos5-usbdrd: support HS phy for ExynosAutov920
      commit: 031314bd37cb6ce352b1300ffd4e07a7bebce1ef
[3/6] dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo hsphy
      commit: fc58d4628396e4ae2791ff2396793d04940348e1
[4/6] phy: exynos5-usbdrd: support HS combo phy for ExynosAutov920
      commit: 22a401c9a2e1e27a136088e4291bec49869cecf5
[5/6] dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo ssphy
      commit: 05681c9c7e59c164d7e1fc34696f3130d088bc64
[6/6] phy: exynos5-usbdrd: support SS combo phy for ExynosAutov920
      commit: 2fdfc1bb752e393561cf532f5d54607d70e464bc

Best regards,
-- 
~Vinod



