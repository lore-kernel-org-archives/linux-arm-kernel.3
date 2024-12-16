Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21393E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 16:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhQCa+Ms0C0+PMQvOzFXqlbsNAtPnva+g55+fNurJ4Q=; b=fSVWWwT+O/ZJg/fldgZW4ruVxl
	oJLdiAo8Yp+pKyhvoI68tt0ovsYd7+jggGIAV/0TI6GXHDkaeJ9tjmZjZSHpTDr5I5gL8qEYrblpz
	HgUBfA2C+XrWUkTeeM/tLiFWLzAYewBiKkkQKCrt8OzrZpf3eeh8XSAE7KpW4HWst7NioyHTObMeb
	hUaGQXZmx3YNoAeVmXdLaQZXCTGZ9re3ESBLSP+XF7U0GJwXhVfYmAIR4UYAhcJFB2N0Eo1K6sBpR
	otQ9aQanFI3vA4PSJv8IrfPekYKYyuA4aOFlbwUo2yw/xs9YhJPMLFmzGqTzmAItkbIZcmSIHwrCB
	qmc2zBNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNE2f-0000000Ac4a-0x6f;
	Mon, 16 Dec 2024 16:33:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDzo-0000000AbMB-44l5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 16:31:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B6B45C6353;
	Mon, 16 Dec 2024 16:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A12C4CED0;
	Mon, 16 Dec 2024 16:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734366660;
	bh=Pv7IJ8msyWy4Ei0z80xvFm2f+U4unlwXTQBC4xMc2xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JjvtiYaRuhpiPWjVb3DIuGSud6N+mMj7ZuzUr8y4+krm/oFiYtZYf80/2lm3l+sTK
	 cw6rLR1wTypwxOLEUocvQck/RF4xL3x68bkRm7vJUFZcbBiwjjrwwFM4IodhzVAgcq
	 O3dUvLeeREZcrCjujOBwIi1cbbGtmhHHmdclwChUwhU8sPMvuOJhSGPHQv06lQRPTT
	 pJUUi89Ps1rVzdNBvdsn4J62vWRgm3rLyMGMgGaTMHUOE60umFhev+aqmoaqKPAS1O
	 liSVZtaxeBhr7oSItwEFjMX56H8FE2bNeOQPTVnQ6/bWLHvKwQS0Ws89Tft4vHo3Ed
	 c8XTxVfGjQVPw==
Date: Mon, 16 Dec 2024 10:30:55 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, tglx@linutronix.de,
	daniel.lezcano@linaro.org, conor+dt@kernel.org,
	Fabio Estevam <festevam@denx.de>,
	linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RESEND 1/2] dt-bindings: timer: fsl,imxgpt: Fix the
 fsl,imx7d-gpt fallback
Message-ID: <173436661185.273479.1114801374109487075.robh@kernel.org>
References: <20241202132147.587799-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202132147.587799-1-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_083101_052785_6C63BE19 
X-CRM114-Status: GOOD (  11.79  )
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


On Mon, 02 Dec 2024 10:21:46 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> imx7s.dtsi correctly describes the GPT node as:
> 
> compatible = "fsl,imx7d-gpt", "fsl,imx6dl-gpt";
> 
> Document the fallback compatible to be "fsl,imx6dl-gpt" in the bindings.
> 
> This fixes the following dt-schema warnings:
> 
> timer@302f0000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl,imx7d-gpt', 'fsl,imx6dl-gpt'] is too long
> 	'fsl,imx1-gpt' was expected
> 	'fsl,imx21-gpt' was expected
> 	'fsl,imx27-gpt' was expected
> 	'fsl,imx31-gpt' was expected
> 	'fsl,imx7d-gpt' is not one of ['fsl,imx25-gpt', 'fsl,imx50-gpt', 'fsl,imx51-gpt', 'fsl,imx53-gpt', 'fsl,imx6q-gpt']
> 	'fsl,imx6dl-gpt' was expected
> 	'fsl,imx7d-gpt' is not one of ['fsl,imx6sl-gpt', 'fsl,imx6sx-gpt', 'fsl,imx8mp-gpt', 'fsl,imxrt1050-gpt', 'fsl,imxrt1170-gpt']
> 	'fsl,imx6sx-gpt' was expected
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


