Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200A4CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 12:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKXPvcbxAyAMhsZyBIqTadLJUeVql53VaL6WxHGA0QI=; b=xWkVd3OVTQ3KVXV0rhN9VD42ic
	cnWZLg1Lices/Q+xRcXpsLpVyZhfdMnJ4C+alJjt6XHA5U4GIfHV06ZwuHDd6c/421xQ/DtCo6480
	qyRY4Ki0tGcKG+CWLrLLSKNdMiakDe8KVANRh++pVCTflEBie+GLinlyedNzYTTGNXISfqoBdEtNP
	0YvuQXRHDO4lZfVmJHDAf6t9tc8iaLTSGFNJm0spFJndwRM60S+A7UG3wqPR54/3ZIOu6ZrXynfN5
	BcOb2n8uRsO2gEtwv1Ifjg39nH1ngS8/hHU4wfR+Z/9ETyG9iEzb+Jod4U7c0hnScceAeVw5cw+Vg
	GWGG4qyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGjx-00000009LJJ-45fB;
	Fri, 24 Oct 2025 12:17:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGju-00000009LH5-25I3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 12:17:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8BE3405E0;
	Fri, 24 Oct 2025 12:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B71FC4CEF1;
	Fri, 24 Oct 2025 12:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761308269;
	bh=xycYvgv55zjJ+/ptA/lKdbtAAXXDhPEaqEymo84QQzA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Torm9VM04gKI1mkDVARb43oL9vwvVx+JPTo8xSD36ka6LuxNYgyu7CKZZv1s82UBi
	 DSRtVFKSzTrbcvku9q9+b+Hf/Y3wy3WxH3xS+kRx3N/KPAy64deYm1F5chLTg0UecA
	 XszyIzo+bC2iP4ouJlYz5keD0PN1wNiAJfv5VXGnWZFbLe306TcPyHm8tLcpM0++Pq
	 YRwIH5E5Fp1ncITHAv1+rMnGWnHtqLA8RtVW4OWRhlqK8H9z7s1XEqzjh9uF/EhQ3f
	 6aUpNf0vNEquc+mx7nqV6knMiqzyejrBcuvn5+pGzHqvd6tqjUpstB53A2+oZxdvU/
	 inxEievyyauMw==
Date: Fri, 24 Oct 2025 07:17:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 linux-perf-users@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li <frank.li@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 Joakim Zhang <qiangqing.zhang@nxp.com>, Conor Dooley <conor+dt@kernel.org>, 
 Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20251023-qm_dts-v1-0-9830d6a45939@nxp.com>
References: <20251023-qm_dts-v1-0-9830d6a45939@nxp.com>
Message-Id: <176130816644.1464192.1518129756905015635.robh@kernel.org>
Subject: Re: [PATCH 0/6] perf/imx_ddr: Add i.MX8QM and pmu in DB (system
 interconnects)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_051751_092105_0BD99409 
X-CRM114-Status: GOOD (  17.80  )
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


On Thu, 23 Oct 2025 14:56:40 -0400, Frank Li wrote:
> dts: add soc specific compatible string for imx8qm, imx8qxp, imx8dxl in db.
> driver:
>  - did some cleanup
>  - add support for pmu in imx8dxl DB
> binding:
>  - add compatible string for imx8qm, imx8qxp, imx8dxl in db
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Frank Li (4):
>       dt-bindings: perf: fsl-imx-ddr: Add compatible string for i.MX8QM, i.MX8QXP and i.MX8DXL
>       perf/imx_ddr: Move ida_alloc() from ddr_perf_init() to ddr_perf_probe()
>       perf/imx_ddr: Get and enable optional clks
>       arm64: dts: imx8qm: add ddr perf device node
> 
> Jacky Bai (1):
>       arm64: dts: imx8dxl-ss-ddr: Add DB (system interconnects) pmu support for i.MX8DXL
> 
> Joakim Zhang (1):
>       perf/imx_ddr: Add support for PMU in DB (system interconnects)
> 
>  .../devicetree/bindings/perf/fsl-imx-ddr.yaml      | 26 +++++++
>  arch/arm64/boot/dts/freescale/imx8-ss-ddr.dtsi     |  2 +-
>  arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi  | 30 +++++++
>  arch/arm64/boot/dts/freescale/imx8qm-ss-ddr.dtsi   | 19 +++++
>  arch/arm64/boot/dts/freescale/imx8qm.dtsi          |  2 +
>  drivers/perf/fsl_imx8_ddr_perf.c                   | 91 ++++++++++++++++++----
>  6 files changed, 152 insertions(+), 18 deletions(-)
> ---
> base-commit: c31b21db1c04ba719c3889a57873f0f7eff54670
> change-id: 20251022-qm_dts-60145802537d
> 
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: base-commit c31b21db1c04ba719c3889a57873f0f7eff54670 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/v6.18-rc2-24-gfda2253ceb14 (exact match)
 Base: tags/v6.18-rc2-24-gfda2253ceb14 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20251023-qm_dts-v1-0-9830d6a45939@nxp.com:

arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: ddr-pmu@5c020000 (fsl,imx8qxp-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: ddr-pmu@5c020000 (fsl,imx8qxp-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: ddr-pmu@5c020000 (fsl,imx8qxp-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: ddr-pmu@5c020000 (fsl,imx8qm-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: ddr-pmu@5c120000 (fsl,imx8qm-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: ddr-pmu@5c020000 (fsl,imx8qxp-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: ddr-pmu@5c020000 (fsl,imx8qxp-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: ddr-pmu@5c020000 (fsl,imx8qxp-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: bus@5c000000 (simple-bus): clock-db-ipg: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: ddr-pmu@5c020000 (fsl,imx8dxl-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8dxl-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8dxl-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8dxl-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: db-pmu@5ca40000 (fsl,imx8dxl-db-pmu): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dtb: ddr-pmu@5c020000 (fsl,imx8qxp-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: ddr-pmu@5c020000 (fsl,imx8qxp-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.2.dtb: ddr-pmu@5c020000 (fsl,imx8qm-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.2.dtb: ddr-pmu@5c120000 (fsl,imx8qm-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: ddr-pmu@5c020000 (fsl,imx8qm-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: ddr-pmu@5c120000 (fsl,imx8qm-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: ddr-pmu@5c020000 (fsl,imx8qm-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: ddr-pmu@5c120000 (fsl,imx8qm-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dtb: ddr-pmu@5c020000 (fsl,imx8qxp-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: ddr-pmu@5c020000 (fsl,imx8qm-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: ddr-pmu@5c120000 (fsl,imx8qm-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: ddr-pmu@5c020000 (fsl,imx8qm-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: ddr-pmu@5c120000 (fsl,imx8qm-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: ddr-pmu@5c020000 (fsl,imx8qm-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: ddr-pmu@5c120000 (fsl,imx8qm-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: ddr-pmu@5c020000 (fsl,imx8qxp-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: ddr-pmu@5c020000 (fsl,imx8qm-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: ddr-pmu@5c120000 (fsl,imx8qm-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qm-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: ddr-pmu@5c020000 (fsl,imx8qxp-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: ddr-pmu@5c020000 (fsl,imx8qxp-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: ddr-pmu@5c020000 (fsl,imx8qxp-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml
arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: ddr-pmu@5c020000 (fsl,imx8qxp-ddr-pmu): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too long
	['fsl,imx8qxp-ddr-pmu', 'fsl,imx8-ddr-pmu'] is too short
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8dxl-db-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mp-ddr-pmu', 'fsl,imx93-ddr-pmu']
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx8mm-ddr-pmu', 'fsl,imx8mn-ddr-pmu', 'fsl,imx8mq-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
	'fsl,imx8dxl-ddr-pmu' was expected
	'fsl,imx8qxp-ddr-pmu' is not one of ['fsl,imx91-ddr-pmu', 'fsl,imx94-ddr-pmu', 'fsl,imx95-ddr-pmu']
	'fsl,imx8m-ddr-pmu' was expected
	'fsl,imx8qm-ddr-pmu' was expected
	'fsl,imx93-ddr-pmu' was expected
	from schema $id: http://devicetree.org/schemas/perf/fsl-imx-ddr.yaml






