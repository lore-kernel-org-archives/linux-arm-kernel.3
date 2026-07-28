Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24E3C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 06:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lz3PR9OcYlfCk4wufRdu6End12F1+kNjFYW/Bo2K5NA=; b=Emi0Pk6ajYsqm70IXswR1DZrtz
	3Yg+Uvan7Z9NqqHyewMnCr+YV7Mjl7IrHJxc4qzLdvLGoONbzvhVaOBZo27mqatsrnXlUM/2DoM7B
	IFGBm0DV5/qIFVFaJ8uteSXtlVuDf1RapbxoegHRXGYr9/+aeoYWzdSdpMzjpjaN5kbqyyb5KgqeD
	O3Ab6ScuB7/oQiFVGBoZXCmNU2ycTeGBOKgzsQKJPTPfznRIsloYZoiEUnsgkX+77lcKtX4rWilqT
	YQW5q31j4I7DGWkJixPt6fWYti6bM5txR685f0SXmpg+jpvmiHRK5gbq1lQQYfNQLCC2LfRb7MT9p
	eMNvEjGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobLT-00000004Xth-35fB;
	Tue, 28 Jul 2026 06:31:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobLS-00000004XtT-3EZ4;
	Tue, 28 Jul 2026 06:31:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8613A43931;
	Tue, 28 Jul 2026 06:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8461F000E9;
	Tue, 28 Jul 2026 06:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785220278;
	bh=lz3PR9OcYlfCk4wufRdu6End12F1+kNjFYW/Bo2K5NA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=epOvkjoI39bU5dVaYF3juBfYrce8bDlMCDRW1i4/Md+FEqQDazDLDGioiFYuV6u7/
	 CPB+wKqyxPCTti2nMXwLBiFnr6TOuiPz5a7vDO5tipOKFvhlH/Bk4rtuMMuh8yRLKM
	 8oGFpEOK+3AflIwKbliRCBkNJGjSIPYtA9m5LALQ/9kLZ39+2sflTNV97HB1Gm6zMU
	 oPAd57sitVOiptbs7NlzqWfpEpZuK14bzauV1Sis/g5HrdK/zOMWwXrHLNPFkVHDgs
	 ubFSjwpSOMRztYMsBNtkpIkJhuZbqaeXI/vqJU+VvO3MG3c3KJD8r6FxVf+4wbjkny
	 Pjv49DrGtOiRg==
Date: Tue, 28 Jul 2026 08:31:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v8 02/12] dt-bindings: clk: zte: Add zx297520v3 matrix
 clock and reset controller
Message-ID: <20260728-wealthy-raspberry-lobster-bcfc8f@quoll>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-2-7a107b00f1dd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260727-zx29clk-v8-2-7a107b00f1dd@gmail.com>
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

On Mon, Jul 27, 2026 at 09:24:17PM +0300, Stefan D=C3=B6singer wrote:
> This controller contains clocks and resets for high speed devices on the
> zx297520v3 board and hardware spinlocks that I expect will be necessary
> to communicate correctly with the LTE DSP firmware blob.
>=20
> I don't know much about the hwlocks yet other than that they exist, so
> there is no header yet adding meaning to their indices. Presumably that
> meaning doesn't exist in hardware and is de facto defined by ZTE's
> firmware blobs running on the rprocs.
>=20
> The zte-zx297520v3-crm driver will instantiate separate MFD children for
> clocks and resets, which are handled by separate clock and reset
> drivers.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>=20
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


