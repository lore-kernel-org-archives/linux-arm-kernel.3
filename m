Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD0FCAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVO5xNIVYqZvF4xlVxFswaKEPI9bsSAehw30odPu6KU=; b=hUcR9tEH2+yHkP/wyZgxtFt6bY
	Ak4ftbrCvuTcuxp9QHPoV2VuyMZdRXLHd9QhhUNKpGPcH6t94oCI/45q56F8J3hiwodqT14Big+A5
	V5Nfb4ScIXEvM4T87u2XfmBjWi/8a1HxAnuInaXPXrNMNeS2FQUctms3dCYM2gHhiaJY0kqkACxaZ
	cv5gox2iELzjAXlr1GSMB0JiYuORm8AYIcYQU47H684bcNTL3e6faCW58E3tjOZHMdTJfgOpg/MY3
	6o99LPNF6g6NfziBuvjfnhR5RtKBp7es9lTNhVGFbONZAu3WlOahCgHW1HX+NlcMGx69d7CK0llUQ
	vTYM3z8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NK7-00000007pdj-229g;
	Sun, 21 Sep 2025 16:54:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NJt-00000007pSj-3hBQ;
	Sun, 21 Sep 2025 16:53:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F40F419A2;
	Sun, 21 Sep 2025 16:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B882C116B1;
	Sun, 21 Sep 2025 16:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473629;
	bh=gVO5xNIVYqZvF4xlVxFswaKEPI9bsSAehw30odPu6KU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=i3VPWGCnokTLF7UHMmnVfu0S0pp9LJ0vefynAk4f6dzG88dnSzlnA6Vz3nlhO8E9s
	 dZpvFHbrUyx/m2YlHUZGAkvLR5/N0xM3OwmGUhIZuvFNxl69kFoRNm/2+DhRxdnRrm
	 Y4ivXeq9Jdn1u/Dw4XyML3CUrUGY7KO2/Q3bePNEPlplch1M0w/nw2faZp7rwcIpWi
	 Ccr8wjs0Te/UykGsAD0M4O2qxovAfggprGSLC4Na48DyW2bPxn3sTQzxtcqQAPdygo
	 f/DY/YIrYPBs/lNfgZETgbvlKK1+zauHGbdLS5RmVWcV4ug1SzsvoBgCbYSS/mpghm
	 /ZznKWkCIY0KQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-10-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-10-laura.nao@collabora.com>
Subject: Re: [PATCH v6 09/27] dt-bindings: clock: mediatek: Describe MT8196 clock controllers
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:53:47 -0700
Message-ID: <175847362784.4354.9605164942435120239@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_095349_957591_A44E7B06 
X-CRM114-Status: GOOD (  10.82  )
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

Quoting Laura Nao (2025-09-15 08:19:29)
> Introduce binding documentation for system clocks, functional clocks,
> and PEXTP0/1 and UFS reset controllers on MediaTek MT8196.
>=20
> This binding also includes a handle to the hardware voter, a
> fixed-function MCU designed to aggregate votes from the application
> processor and other remote processors to manage clocks and power
> domains.
>=20
> The HWV on MT8196/MT6991 is incomplete and requires software to manually
> enable power supplies, parent clocks, and FENC, as well as write to both
> the HWV MMIO and the controller registers.
> Because of these constraints, the HWV cannot be modeled using generic
> clock, power domain, or interconnect APIs. Instead, a custom phandle is
> exceptionally used to provide direct, syscon-like register access to
> drivers.
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

