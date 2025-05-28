Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DF3C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 11:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxDo9IO9ATTuQyALamZSwSmn+16k7bv0aYEa/a+N+TE=; b=Yx5FPrlgjEt4d9+NXDfVkF525Q
	ZPqUV8AwWLc7cmPUiSgrHPMHrvECfbpYIwzUXALF38SqO2yGc9ldC2IGf8CIQAPC1A01Yfl5futga
	AM6vldvZ8572xCzGE/2NET4f/UKnMNSty5zcBIZnwA/wYcm6Oh9nQZ5l593BanQs5AeLPmfkN29D+
	vFkkrBjecmw7/Jf1YHvwXTMuS/OUtFrN3a4mfHjRpix/OLdB8T6h4jDdcUQ1fgfq3NXqhiayMF7HE
	FYYemB/Lnv2k155UBJ7c/Dq/R46NDtn0cIfi98lI2Vbmwh75Sd/Nr6t8hRQFCtVtOp7mZIuwS3ger
	x1fNPdDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKF5M-0000000CzSV-0nIS;
	Wed, 28 May 2025 11:36:40 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKF3D-0000000CzK1-10XZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 11:34:28 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 5BAD51FC91;
	Wed, 28 May 2025 13:34:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1748432059;
	bh=pxDo9IO9ATTuQyALamZSwSmn+16k7bv0aYEa/a+N+TE=; h=From:To:Subject;
	b=kIe2dk6UVZiF19EuFHoJjx5/xbuPmkmdu8StW+SA/Ai7aStdASEzonHThl7qB5dnR
	 CEAQIqUuim4oh/QL7e+IR5BUZ2aI1W7JT+yMXNnOtB8gTjlW5vcXbL1uu6OGKUkH+X
	 Ne4o2nzkAFgxdnqqrz+KuFTVVkZWtZPMns761Ts5l778QqlE+aA33ayRCgFXnUrHpm
	 xxJv2IvcG0r6Odg2VYfl9/B3msT/nVgWcj09VMg95w1FBgeWOHL03rFfeQ+/SXeGCO
	 DnQIo2zHYtvxNS5LPfEYDSUFGAtLRNztqBZjM9HkVpSfczNyocrxLq9W8G9hHvHR88
	 cdcmYBA/hWRiw==
Date: Wed, 28 May 2025 13:34:15 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Enable pull-ups on
 I2C buses
Message-ID: <20250528113415.GA43553@francesco-nb>
References: <20250528110741.262336-1-ghidoliemanuele@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528110741.262336-1-ghidoliemanuele@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_043427_436586_D17D07E0 
X-CRM114-Status: UNSURE (   7.08  )
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

On Wed, May 28, 2025 at 01:07:37PM +0200, Emanuele Ghidoli wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Enable internal bias pull-ups on the SoC-side I2C buses that do not have
> external pull resistors populated on the SoM. This ensures proper
> default line levels.
> 
> Cc: stable@vger.kernel.org
> Fixes: 316b80246b16 ("arm64: dts: ti: add verdin am62")
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


