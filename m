Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDDAC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 07:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+V7ckF2m4/BIriwqb0AjVCF6OWt9xgPzTCDRup9l0es=; b=fVwb+eSz0XnXUPHB8HI/9h7H+7
	/BHF9J/qKavKReVWEzSYLf4w71rKuztBft+hv4phVFSITW8Csq7oirKXfyezb01eC+567JCJq+2HX
	kgGKw2r80/e0u3wWM51DFlas/XfbU4b5xuM8pKxXtpVByygUYkuQD1HC/SnpIR8WK8s6RHSfugp9d
	AcyTrsR+pjmr1zP0ngI+wfFuUS/CdCHUeifBwnWoBTxcHoF+4l1KT6RgGlYG0DarhfPlFYS2Kl7Cj
	dhUwV7qjE7eI1z4uFnMwrzIIIWHIXHpn5pgtOhDzK7GUomS16YtrA9aDhDxIQrYC706Zf/wuGsu95
	hoQuQhrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3CY-0000000DnHB-1jDt;
	Fri, 27 Jun 2025 07:08:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3AE-0000000Dmu6-3MbI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 07:06:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31E8C43CBF;
	Fri, 27 Jun 2025 07:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470CBC4CEE3;
	Fri, 27 Jun 2025 07:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751007982;
	bh=/EqmbAddrBe3sC3E4/NL8P/ElonLTvB2i50FUAlbfZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QlhhgT01QFwkK+tQ8E/QRH4IcSsZdRubxsCP2dZRJAySq3PluNhZIBqdISbYnAV1O
	 KtEOj3fJ++oUiRh/Z6elHNO1LIR/Vog1nwTgItuFfrnsjnB1gPcosJGal/MX++h7p4
	 Fin51fnxkHL1wDG36Iz7wt2kMmCGufkhRtx6aIJGuEXPH0qXEtgDFTiOacMpTw0XlE
	 be9IoyfQLpd8wwRMQtsvM9HyLxtWKYi7eZWrRBoWgJTjN32Uy739khE0dlnGH0xAHU
	 OceAXsyEsN+zMVuruFChe4FakDZgwMMBygplBSFx3fi4LAm+oBgnv8gOrTzJ5Eestl
	 XNPm502aEcGmA==
Date: Fri, 27 Jun 2025 09:06:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: remoteproc: fsl,imx-rproc: Add
 support for i.MX95
Message-ID: <20250627-black-skua-of-admiration-f6ccbb@krzk-bin>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-1-699031f5926d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250625-imx95-rproc-1-v3-1-699031f5926d@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_000622_859934_291F3179 
X-CRM114-Status: UNSURE (   9.39  )
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

On Wed, Jun 25, 2025 at 10:23:27AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add compatible string for the Cortex-M7 core in i.MX95
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


