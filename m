Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB4DFD531B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6rQd2yO4irct4N0jZYa9mNmuzkvtEs3OqydAbpR8Hw=; b=BK1TE/5Vxv3alJO/VpuaJM6GpT
	V1aXL5nXZerddtlA20W3i7UiGkdjl27vOnfFkNoNZRVsOEELfBs47hiVoPfK39+3OaI/meib8V0bK
	igFHOItOcKMfeyQjPaO75/5WSvvh5/SgaceGlovXkEPiCQSLdzr4mV3FJ2c6BpfFvk4jC5XuUEV1Y
	usH2y8YnMkBmYqdaxWzQKDA3wuqwvIfe9Jn0c8G5kzVy5FPkoiurspcKZCpOlGUdGZFDwi13PLK/P
	p1e+LWqDet+95xlxxJJMLf0wCifbybU0ZAVCrdtcrNEBf2RFt64hjP/cZ9mDEVOL+KktCc51mqh2C
	+iibe+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuQv-00000008ATO-3FpU;
	Fri, 27 Feb 2026 09:46:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuQu-00000008AT5-0Pcv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:46:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8704461868;
	Fri, 27 Feb 2026 09:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6DFC116C6;
	Fri, 27 Feb 2026 09:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772185611;
	bh=MXPjEpEh5UIbHP8Pg4xiJO2M6gANbtTNoBWbrqKGywY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uh2J4es+wFxTo0g/cKTZ8V31uJv2RgkdA4NPxBatp/A3MsitaWlWDS+B6W0FcEhDq
	 ugm1iBzrlPSfcNmLHo8e0tYig3ijePY+Qfw5NN8oyS6Kr57NOik8wuaBGdNNFIhW3g
	 tX8wxkkaUN26KnBI8ZZGSwobG8z/As1nfoUrWbmkf+waj792hrbYuS4gYoQRzt0MNy
	 4u0LT2+eopOeP8lHvOJTmvCPZSld0o3hGkGyDV8X2oVix6v36ozbyFceMFSFh3Jlgi
	 0QQ1cgSXMiCnry0sqmIP3ytOXATCFevjAIMQA7nctMLTabMG1RmJ0hU+MoI8nMxNz3
	 yEsJAa5mJI6hA==
Date: Fri, 27 Feb 2026 10:46:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "A.s. Dong" <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: fsl: imx7ulp-smc1: Add #clock-cells
 property
Message-ID: <20260227-incredible-eggplant-lionfish-b3a5bf@quoll>
References: <20260227-imx7ulp-v2-0-1c7fa8862ebc@nxp.com>
 <20260227-imx7ulp-v2-1-1c7fa8862ebc@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260227-imx7ulp-v2-1-1c7fa8862ebc@nxp.com>
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

On Fri, Feb 27, 2026 at 02:30:43PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The SMC1 block on i.MX7ULP is already used as a clock provider in
> imx7ulp.dtsi, but the corresponding dt-binding schema does not define
> the required '#clock-cells' property. This results in CHECK_DTBS schema
> validation errors.
> 
> Functionally, SMC1 controls the CPU run mode configuration:
>   - 00b: Normal Run (RUN)
>   - 10b: Very-Low-Power Run (VLPR)
>   - 11b: High-Speed Run (HSRUN)
> 
> These run modes determine the effective CPU operating point, and their
> programming is tied to the OPP table.
> 
> Add the missing `#clock-cells` definition so the dt-binding schema is
> consistent with the DTS and validates correctly.
> 

This looks like a fix, especially that you make the cells required, so
missing Fixes tag.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


