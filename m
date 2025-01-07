Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC93E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 06:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fw7HaXL3HLoknAgJLghzaE7VQQmwSuKBy+1Spem4qPk=; b=coK5+dGrLlXbp4ksmWX/OGvstt
	izkuNGjYlz8h01u5Bd8PVzNQ9YuWcTgEx0Wy2i6916qcuZSoJ6fWitXuf4CiTvhtcUsG4aYBye1ux
	1bhPQsmY5gMk0XbHMn+kmNGNm5xxkapgijZL7eWbWzbWaBZE39AvUT/vzy+BvdmQKvl5rx9d6hPg/
	s5iuQLYwR8774hbSm1CDMfc/avQloheLc6yjTFt3XRT4LPnyl78rrcic28QKhuwKr6ZvRiQTPE9kl
	V4yfy/GpNwT/SZAepVHZX/wdAaX5sb+HXOFz2UR2EsClGwmL2xiOBVlUMbBRzjvau0FBU/2OTUMUM
	7vTt3OwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV3TS-00000003guR-2c97;
	Tue, 07 Jan 2025 06:53:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV3SE-00000003gnK-303Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 06:52:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E0EB45C5B60;
	Tue,  7 Jan 2025 06:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 147DCC4CED6;
	Tue,  7 Jan 2025 06:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736232761;
	bh=P+4Vdcv2PTSFgQ5JtdbNFF89reAzUITv5xfcuQZtnXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WrBw8Ygo1I8dAK8B9Ulvr8UYUeMvCTWIdIXHWfNwAQmyS+WeDqWdJk5dYfqoM6QXj
	 /nHViJl3IdofYKz08GIZQP/sZXpe3OrUS4rFrNbphL72QfS/1S3QlV2PdAdDaEIMJR
	 3uPo5NjOlvCSIbu8Ap62Wb46LCEXEad96PdL48XxLR597WImLMhHjwEaGsRX6bcWMe
	 DvB2TydOf/cJUv65ieAmyXawf71zo1yBBdY1a+t5eYGx6UsgziytoBqh++74J2Ol6Q
	 mYynyehIKNypNgA7IOrEK2aW0q8HzhpbaeG5ZtLS3ZHjjYjzzy9bsTUVtMUB27ohlK
	 YrQOPh+PR0NzQ==
Date: Tue, 7 Jan 2025 07:52:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Frank Li <Frank.li@nxp.com>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abel.vesa@linaro.org>, Marek Vasut <marex@denx.de>, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: imx8m: document
 nominal/overdrive properties
Message-ID: <ismbe2ne65ew2jkcoa2tmbjz2eajvuz5bxuwef3wptj7tkvqhn@norm5p52aygr>
References: <20250106-imx8m-clk-v2-0-6aaeadac65fe@pengutronix.de>
 <20250106-imx8m-clk-v2-1-6aaeadac65fe@pengutronix.de>
 <Z3wHp6eLQuV9GGvh@lizhi-Precision-Tower-5810>
 <957ad153-17f3-4cb8-8878-73093a9a2724@pengutronix.de>
 <Z3wyG61QEzgCJFh+@lizhi-Precision-Tower-5810>
 <6fddfd9a-8a8c-4dae-9f74-e8019b7ed404@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6fddfd9a-8a8c-4dae-9f74-e8019b7ed404@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_225242_802570_7484A510 
X-CRM114-Status: GOOD (  18.07  )
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

On Mon, Jan 06, 2025 at 08:55:08PM +0100, Ahmad Fatoum wrote:
> >>> why need two flags? suppose "not set fsl,overdrive-mode" is equal to
> >>> fsl,nominal-mode
> >>
> >> Conor had the same question on v1[1] and I have addressed this in the commit
> >> message of v2, see above.
> >>
> >> In short, there is unfortunately no universally applicable default.
> >>
> >> [1]: https://lore.kernel.org/all/4e2250b3-5170-4e88-aa0a-dd796b81e78b@pengutronix.de/
> >>
> > 
> > But there are problem if use dts overlay because dts overlay can't support
> > delete property.
> > 
> > If one dts file use "fsl,overdrive-mode", dts overlay file can't delete
> > this property. "mutually exclusive optional properties" was not preferred.
> > 
> > mode = ["normal" | "overdrive"]
> 
> I don't see myself setting this via overlay, but if you say it's useful, we can
> adjust the binding.
> 
> I am not sure what's the preference is though, should we have
> 
>   fsl,operating-mode = "normal" / "overdrive"
> 
> or 
> 
>   fsl,operating-mode = <IMX_OPMODE_NORMAL> / <IMX_OPMODE_OVERDRIVE>
> 
> 
> Any idea? Conor?

If these are two exclusive modes (plus default), then as Frank
suggested: use enum of strings. Imagine encoding enum of 10 values with
bools as you did: that would be enourmous oneOf condition or if:then:.

Preferred is strings, but numerical values are also accepted.

Best regards,
Krzysztof


