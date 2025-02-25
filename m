Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87762C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/Eq+aT3YfTNg049lj44wHdY4UeAZzrUom+F8W56GCI=; b=2bfrYZIPN+ICE1GXAhfBQYLx3h
	aN5KoPcOb9wf1Y3gygk1wCpFZYoYVRZP5RD/UlZYBCKnx99UsfR2RSKBI/rxi5Npc/lbLBP9sI3vN
	qQj2HHNCFNP/LHdrfeDIZkbCDDeblxHPpJLdNPYi3xwEEcZW/k9UjXYe68PSUJuCyJrk1NNly9+aC
	GLHn4+rpMAiSS2zVY4UpqAx0fFSRPYxVXKAlkHFVJDJESF5Fym6HvKbhndz/um8i0WKDeze+mDizb
	2YcGr/V/2ooKAD9kRbx2otIrk0G1e1etEqcF7Hmsw60nbp1T5vz6hLuBtWvUo/g8DMzzIv9n5p/VA
	QMzFU0Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrSv-0000000Gf1f-1eH7;
	Tue, 25 Feb 2025 09:43:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqxG-0000000GWeH-0peV;
	Tue, 25 Feb 2025 09:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740474616;
	bh=Yk3HPQ8hjDp5/Q7XGX7XJygCR0BU1iRK53Y6ONED5MM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qOwLBGbkPYdP8OGXqU0X8bD/QVR/zCE8oDnt5gFjO1GFsD2rjWZJr9gl8LTQlYFa5
	 I+XY1waFiZp8SlWpgDcnrPkVfvTW6ZHwKAz8soh0rc48og6L2WrBdS0mZH+96pKtdW
	 d0sQPHvTbYMa+wqA4ZYiv1zGLbUaLVyQrvzzkWcXjfb0AvA9OIekxC7n/PyN7LuvxL
	 EfXrIl7l5dRLMW0wmt/jsAN0AOrvwt/YALCSOdCN40GLywPYZqt/j1CldCsROkunfY
	 zI5CGMBTGW0XoBX3jWsxYpnfUP2oiDE9n9iJIHITlc51Pdc4bq0Hd6z0kEH6LQ6ahJ
	 a65yFCUeDhy1w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3F9C717E0B59;
	Tue, 25 Feb 2025 10:10:16 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20250221-en7581-dts-spi-pinctrl-v3-0-4719e2d01555@kernel.org>
References: <20250221-en7581-dts-spi-pinctrl-v3-0-4719e2d01555@kernel.org>
Subject: Re: [PATCH v3 0/2] Add more nodes to EN7581 SoC evaluation board
Message-Id: <174047461618.21523.9112201674582810132.b4-ty@collabora.com>
Date: Tue, 25 Feb 2025 10:10:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_011018_383166_C8C92875 
X-CRM114-Status: UNSURE (   6.77  )
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

On Fri, 21 Feb 2025 09:01:14 +0100, Lorenzo Bianconi wrote:
> Add the following nodes to EN7581 SoC and EN7581 evaluation board:
> - rng-controller
> - pinctrl
> - i2c-controllers
> 
> Fix a compilation warning for clock-controller
> 
> [...]

Applied to v6.14-next/dts64, thanks!

[1/2] arm64: dts: airoha: en7581: Add more nodes to EN7581 SoC evaluation board
      commit: 3032e3b87ec218f82f5c60aba0c94ab2fc00a261
[2/2] arm64: dts: airoha: en7581: Fix clock-controller address
      commit: 0092294492fafe79a537915e486576a3d69c9a7c

Cheers,
Angelo



