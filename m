Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24056CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOHJwh1s0NuamW/p2z4BcgkGlddB15OwH2HIIS5GZeY=; b=M5abyfikMajXnK7w9ZIJUahvHw
	dBE+dhIp/ey/dWp2rSbvYTW7KWhSpcf4ZH79Zpd7gxFxB4qJ6Dg3wWi/LWDw/SptBN13vDBUlkuOR
	Cm/tjocCxlXL9pxEs6rdE7Ir7yoPh36x9UIzqNcAgZIoQijnHNVQW9QOfSw3csWa1zbJSwifUL/Au
	Xwt/2NfGjP624LZODJPaSWPmOqwFcxXZ6tNUBuurQv/RXTfc3N5F/0Xbbi1lPOGYi1z2z9vX2LWbU
	MSV75Sczw5NKdxFDz/nj7+CqhWv2wM/X8xl7ZIIK7QngdInwMNntXEdeZoxmzaKAVPdh8QUr85Vhx
	PCq/B6sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NLs-00000007rIg-148w;
	Sun, 21 Sep 2025 16:55:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NKu-00000007qOn-04Vk;
	Sun, 21 Sep 2025 16:54:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AFE3740BF3;
	Sun, 21 Sep 2025 16:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3E4C4CEE7;
	Sun, 21 Sep 2025 16:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473691;
	bh=iOHJwh1s0NuamW/p2z4BcgkGlddB15OwH2HIIS5GZeY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VN0mQN0ZX/QKnwQqCXdFSTjON+UfALxUPNmvvDkgHgn1eH2HzXhwNV3jvTdp8ct1o
	 VWYcfA1nvZy7+MDQ9POlp/Br2ldLcNYYCPPWLIFuyyFiwlRGfhoWcp96ngzq3qqlPE
	 u2cV3kfjuGmg0LwvJBfmHqXd/ie5QhfGWFE1GX7a7M8U+OVsjh/mt1MNQIqja7AgDH
	 H3+yj0Ld8ntTsg11oCLYgzcf3s1fu3VTxsVDjIT7C0sOG2+3YDAXZZDeViFlmtgmWI
	 dwcpYfDt9y3mPnGSxqExInZtG3Cj1Gr80S9hxAQbnLCnBuZvuY1LKtFNmmkqvtOh2U
	 v3GpPX4SCfXjQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-23-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-23-laura.nao@collabora.com>
Subject: Re: [PATCH v6 22/27] clk: mediatek: Add MT8196 disp1 clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:54:50 -0700
Message-ID: <175847369007.4354.11383510254378857738@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_095452_079943_ED7AA6C5 
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

Quoting Laura Nao (2025-09-15 08:19:42)
> Add support for the MT8196 disp1 clock controller, which provides clock
> gate control for the display system. It is integrated with the mtk-mmsys
> driver, which registers the disp1 clock driver via
> platform_device_register_data().
>=20
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # CLK_OPS_PARENT_ENABLE re=
moval
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

