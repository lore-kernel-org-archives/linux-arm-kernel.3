Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC366E6B272
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 11:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upSZ8oieq25q9EsqldQZ2xPa49Q29ErhTqmSkmZZKLw=; b=h1lfsLkxTBMFYjtR9hJuRn36me
	srK1c7QTTQRegFfaropqAVpbJYylEGLQCbsESZVoFhJQxA61SUN4ROmOYl4BPGqqNPIiKg7YL7tHi
	LAc8GtnSsQUH6+nl88oOGLIG8CoQv5ERSzryIjxZPu5uRZw/yzFPBm2hDHf3FRA/txXUpj43B38oW
	nMP2hfLYTPHcn+yR9BzIUU78BnwjEOx4pmqns84QBunGJUdaiPG1LfFzXUjOHMav5neFh6amA+0SX
	s0E/zk7ucKyGRxrnExqaeTyQJTDoTlig6RAwhHMRlnz2GMjnftGrMj3nQ41eEwS+OnMAC721MrTAD
	YApD11Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0ZR-0000000Ewwb-24kk;
	Tue, 23 Dec 2025 11:28:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0ZK-0000000EwsS-0pzL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 11:28:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB59743FBC;
	Tue, 23 Dec 2025 11:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ABBAC116D0;
	Tue, 23 Dec 2025 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766489325;
	bh=eOIiJTg87KZoXyZI/ZS/lA9apqI7cx2ccwsU6fjgU3w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BXcrXQUKMKbWls6QLJXwo/Wt8OeHk0k8ksI2AvD21eKBO3haiE04qbJSt2PByaa3F
	 pKXqD/+T340++ZrRFo2Qy8nRIeoQB9OXKzGeoXT5Cw2ZCQZpJvnR79s098srsjH0rY
	 rLEowP+kqQt1sjKll1naO8PXjKzUZvNJh+bkp6h8QfeyNa74FT0oRODxbbKzeaujF3
	 9tNnnELLuNFz6GhZ64qsdnWdX7q+oMf/kF286WVhAe0wtEk3HJbpuDThPJhvyJbAHs
	 rx9dEVj7xGaP4EwTNftnZaoXh8DylkOOC19c/EFiusciCq/X+6QEs8/1LSMADwS2SJ
	 FTHmSpxn2XJEg==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, "Sheetal ." <sheetal@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
 Sameer Pujar <spujar@nvidia.com>, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250929105930.1767294-1-sheetal@nvidia.com>
References: <20250929105930.1767294-1-sheetal@nvidia.com>
Subject: Re: (subset) [PATCH V2 0/4] Add tegra264 audio device tree support
Message-Id: <176648932106.697163.11384203027531307860.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 16:58:41 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_032846_299002_7C2F045E 
X-CRM114-Status: UNSURE (   8.64  )
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


On Mon, 29 Sep 2025 16:29:26 +0530, Sheetal . wrote:
> Add device tree support for tegra264 audio subsystem including:
> - Binding update for
>   - 64-channel ADMA controller
>   - 32 RX/TX ADMAIF channels
>   - tegra264-agic binding for arm,gic
> - Add device tree nodes for
>   - APE subsystem (ACONNECT, AGIC, ADMA, AHUB and children (ADMAIF, I2S,
>     DMIC, DSPK, MVC, SFC, ASRC, AMX, ADX, OPE and Mixer) nodes
>   - HDA controller
>   - sound
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: dma: Update ADMA bindings for tegra264
      commit: 0b4f3aeee766fd3cc3bf254a26b9761d9b53818b

Best regards,
-- 
~Vinod



