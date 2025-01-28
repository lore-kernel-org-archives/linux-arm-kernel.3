Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B9EC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 09:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJNvHo2NLpxSZMecXCZK0Unv9rFVYJd3Dg2hgNRnp8w=; b=nylA/HHOahTrMz/AGmbY4yxRt8
	aXNSbRkRhd+FgqBcV1FRadwXFL66JcZWXQJ/jzddxtGxcXye8inpdMv5ttDzLrx9MpmM/dPTRiARi
	IdJocndBLddXANUE26lc1S0yOWAVFuKpvrKrFNgWxlkfxO9ly5wVrf08t32zj15joVBdE5gRBhH4N
	Py858NP4JYmobSvhhaLVdwON8qKFrX4zdry0A3PMVXQjtC3BRjgvjqI7H6Sd9WLOk9yksX+9AZIY4
	sK9RYeh1DmIaQejQnvXv2Gm1W8YTs/vfz5Ygsztq4YC0hn9i5UBdOu5LIaG9dsd+S+muO8mpTQDR8
	0QmeEAmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tchl4-00000004VjD-3xX5;
	Tue, 28 Jan 2025 09:19:46 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tchji-00000004VQM-03Lw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 09:18:24 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tchjI-0002II-Ly; Tue, 28 Jan 2025 10:17:56 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tchjH-002Gpb-1q;
	Tue, 28 Jan 2025 10:17:55 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tchjH-0001lT-1Y;
	Tue, 28 Jan 2025 10:17:55 +0100
Message-ID: <3d6cfb082ef8ee0fc66c885a84f64ae0a851234b.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/9] memory: Add STM32 Octo Memory Manager driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: patrice.chotard@foss.st.com, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
 christophe.kerello@foss.st.com
Date: Tue, 28 Jan 2025 10:17:55 +0100
In-Reply-To: <20250128081731.2284457-5-patrice.chotard@foss.st.com>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
	 <20250128081731.2284457-5-patrice.chotard@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_011822_051628_BE507EC4 
X-CRM114-Status: GOOD (  23.24  )
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

On Di, 2025-01-28 at 09:17 +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>=20
> Octo Memory Manager driver (OMM) manages:
>   - the muxing between 2 OSPI busses and 2 output ports.
>     There are 4 possible muxing configurations:
>       - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI=
2
>         output is on port 2
>       - OSPI1 and OSPI2 are multiplexed over the same output port 1
>       - swapped mode (no multiplexing), OSPI1 output is on port 2,
>         OSPI2 output is on port 1
>       - OSPI1 and OSPI2 are multiplexed over the same output port 2
>   - the split of the memory area shared between the 2 OSPI instances.
>   - chip select selection override.
>   - the time between 2 transactions in multiplexed mode.
>   - check firewall access.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
>  drivers/memory/Kconfig     |  17 ++
>  drivers/memory/Makefile    |   1 +
>  drivers/memory/stm32_omm.c | 509 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 527 insertions(+)
>  create mode 100644 drivers/memory/stm32_omm.c
>=20
[...]
> diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
> new file mode 100644
> index 000000000000..6f20fe0183ec
> --- /dev/null
> +++ b/drivers/memory/stm32_omm.c
> @@ -0,0 +1,509 @@
[...]
> +static int stm32_omm_configure(struct device *dev)
> +{
> +	struct stm32_omm *omm =3D dev_get_drvdata(dev);
> +	struct reset_control *rstc;
> +	unsigned long clk_rate, clk_rate_max =3D 0;
> +	int ret;
> +	u8 i;
> +	u32 mux =3D 0;
> +	u32 cssel_ovr =3D 0;
> +	u32 req2ack =3D 0;
> +
> +	omm->clk =3D devm_clk_get(dev, NULL);
> +	if (IS_ERR(omm->clk)) {
> +		dev_err(dev, "Failed to get OMM clock (%ld)\n",
> +			PTR_ERR(omm->clk));
> +
> +		return PTR_ERR(omm->clk);
> +	}
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* parse children's clock */
> +	for (i =3D 0; i < omm->nb_child; i++) {
> +		clk_rate =3D clk_get_rate(omm->child[i].clk);
> +		if (!clk_rate) {
> +			dev_err(dev, "Invalid clock rate\n");
> +			goto err_clk_disable;
> +		}
> +
> +		if (clk_rate > clk_rate_max)
> +			clk_rate_max =3D clk_rate;
> +	}
> +
> +	rstc =3D devm_reset_control_get_optional(dev, NULL);

Please use devm_reset_control_get_optional_exclusive() directly.

regards
Philipp

