Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69169C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 11:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S83gvmQyh65eRxiM3Qr44B2Mozm3wxxawwnOgnnPPHA=; b=MPjonQeAqNa2czmpbNE+ONOsnS
	jlJnhrlcrTNgVp/pwzN+4USps9hESId0uyGN+hQQFVnKvG479JtQ/fMpEFOE7ve67mIK52DUM7nsd
	ykXz/BpdUX8aXUl1T6grn6RegAC9uhu4t+OckEK/20BLxsmu8+lkx1RGzbmKam9i6EwgZ1LcjHbJB
	mm0p+BLgv8wF7N7H05K/AUjIVA0MOeFojubd7LpP5sA2zZ3Vn2fDFx/PSFLHAwMcb0+pt8zeKRIPk
	AwStZTbt5i5Mk7By44D0FGpmiLdk5XzXFNzxGrAx5IzMC2WJon6VPYADmBGLj3bzoM4d6UWSXKaS4
	3qMuIejA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Xyk-0000000AGIw-0pyT;
	Wed, 23 Apr 2025 11:09:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XCS-0000000A8yC-3KEV;
	Wed, 23 Apr 2025 10:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745403567;
	bh=EErdEvkJZMomWj346FuTips4HSCS6BxlmBws21IXYso=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SZg4ekLb9WzZnjsZFcLoTYV7rwAq3ALY3FMkS9R1RbijO8AqgtNq7raPnsv+bgkAN
	 GrCSO8Aiqqu52TYlhkzF9Icz5vv98EW0ER4EdXfUiG8gJBFcZFXEXcVeYV41tfRuIV
	 XHZ63x7jm1E5fQO4TdkjSGc1zUpdQHrQDT45Av4juFw2XZRRMMHf1CQujJKx7DQXCl
	 g8Zj+mlB+WUKDCH6y5MtVd/bHm6+ypsczbuFxnn30o3YkYzuSEwvyeYt9DW79+GyQq
	 zzG8SnDUR5olrdoXXf5ERp3PX7ljipA+PKlCUBvJ/GiS4T8nHyOQy9vqKDcalMMXhx
	 Ok+IrPwSoUqFA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C8BD017E0B56;
	Wed, 23 Apr 2025 12:19:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: kernel@collabora.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Julien Massot <julien.massot@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250423-mt8395-audio-sof-v2-1-5e6dc7fba0fc@collabora.com>
References: <20250423-mt8395-audio-sof-v2-1-5e6dc7fba0fc@collabora.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8395-nio-12l: Enable Audio
 DSP and sound card
Message-Id: <174540356673.70458.18087445471288730073.b4-ty@collabora.com>
Date: Wed, 23 Apr 2025 12:19:26 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_031928_986191_B31C00B3 
X-CRM114-Status: UNSURE (   8.42  )
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

On Wed, 23 Apr 2025 10:53:13 +0200, Julien Massot wrote:
> Add memory regions for the Audio DSP (ADSP) and Audio Front-End (AFE),
> and enable both components in the device tree.
> 
> Also, define the required pin configuration and add a sound card node
> configured to use the ADSP. This enables audio output through the 3.5mm
> headphone jack available on the board.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8395-nio-12l: Enable Audio DSP and sound card
      commit: 2521f47606eaffb2e477ea0b2985d2d8e31aa563

Cheers,
Angelo



