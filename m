Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE22BE92FD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 03:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8epxQQ6xUkcc6EnU3IePNmeq7hU64iYP0kmQ8lPeMI=; b=rxXYXkljfroV5FiiNj7jKI6cp/
	qR5yZqdM7pie9UaYX8KhsMIQcTtPUcBIQ2jOQnuPCuew97RwxTbI3IeaeYdq7FDZF7LQJ+ul3Btkx
	z8KQhzBiRyFD29EmnC5xIUkTcGaWZMK8vSg/7fx9GKtxY3Vk58HuSnGKp/UF+aUjKlSnJEIg/6h3j
	qaEn2Nzbz16fyX7m6YnQKuvwAFCpjtJF+KeI6rkYxEdHXxrUris/NKeriHBBTYFgh9Xq80ULBiv1y
	lBtTkujcULzBdTOcb7xpWo6+gByOtvLmPXzJLgZiYCwLuBuGQ329pMcn7Ep3JtI1aBUmj/6C5ljap
	3jEpizxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaQAw-00000004Lp9-3u0a;
	Tue, 30 Dec 2025 03:13:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaQAu-00000004Lom-27Dc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 03:13:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9EC8F404C1;
	Tue, 30 Dec 2025 03:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025F9C4CEF7;
	Tue, 30 Dec 2025 03:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767064411;
	bh=SChn05DCiVGJdEArMObQBUB0k7u74rd1jxqKVOfotXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZsMCxrhl0Y73xf02NnAyflBkAM8ZsZ/LKgcNJBMCS27TtnxlLNcKL5JH4COq9XRNr
	 dtr0JtYv7gSSXvU6d7HOV9QRtzNap6B7u1FMnQu4Is5Er9VH0CfQDWZio13Kg/kFtk
	 MdDeBycYF2n6lEKE8Orbhy5icD69jRNysg9o94du2c9xrZRgMEU2lCgqOnns1ohNxk
	 5CNE1iRarixNZWS/YEwLz2gX4qF3s1Trc2QRxARpR++IizojkqGrOSDeJoHKNQ84BY
	 2uXUy0v5jNnrewNFVcueycqXAYcTH6wUBvDTpZ4D2KuVJyL5EEurXLtOmOgrBsBbJX
	 l0+FxIeNPirDQ==
Date: Tue, 30 Dec 2025 11:13:26 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] arm64: dts: freescale:
 imx8mp-(verdin|toradex-smarc): Add HDMI audio support
Message-ID: <aVNDVu0ELBsKR11J@dragon>
References: <20251209101754.54067-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209101754.54067-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_191332_564747_DA93136E 
X-CRM114-Status: UNSURE (   9.53  )
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

On Tue, Dec 09, 2025 at 11:17:48AM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add support for HDMI audio on Verdin and Toradex SMARC iMX8M Plus boards, as
> done in commit b21f87b8322f ("arm64: dts: imx8mp-evk: enable hdmi_pai device")
> on the NXP i.MX8MP EVK board.
> 
> In addition a small cleanup on spurious comments.
> 
> Francesco Dolcini (3):
>   arm64: dts: freescale: imx8mp-verdin: Remove obsolete TODO comments
>   arm64: dts: freescale: imx8mp-verdin: enable hdmi_pai device
>   arm64: dts: freescale: imx8mp-toradex-smarc: enable hdmi_pai device

Applied all, thanks!

