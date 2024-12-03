Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62FAE74AC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 16:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOhY8jeRBSer7J7Prj80AyHiQQ91tR2gojVb1JCeY+Q=; b=XWg2UEz/YpGsmS0r2/OA7qljWS
	iBFc6tsuzA/qpa0kCxGExsXKFHCjyDBoCG0i7bFsN03o7W7vD0zpH59aWbWGdK7gS/CGmPYbijXyb
	CjR8l8xvziDMHNRmZyuLjz9Wh0XLyRCAg9IXiZ/iP7x6Z2ffRx0WzJpVRmKrutJVYzM/1yZ5Ae9L2
	CsM2zlu8oBA/C/W8ki8i7MROjDc9iHw7lf+5WrscUO6tvnyznV9eV7mq6mf52RPZxgVOGsRqlmPhS
	O0iecHVW7Kjfx5y01DYaVR3kW1YmQXpz+D5NFCpVBhMyrJFGTxgiZ12qzJ8zcXvPbn8NDDS9x0PIU
	/Q1u7T/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVox-0000000A6b3-3qYS;
	Tue, 03 Dec 2024 16:32:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVnN-0000000A6BO-0Cy9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 16:30:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 166C0A41791;
	Tue,  3 Dec 2024 16:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7560C4CECF;
	Tue,  3 Dec 2024 16:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733243440;
	bh=5aIILQ8vCEEGstfEFANtW97dEOQ5+Qqnq6GpbrG84H0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aO6U0f0C5Jmf7qtIRKeyVWbTtWiKYvLUuTbF9FMNH16onz16c2xljQ49DWqe2dB6+
	 kFbLRXJab/K14ap/xiSC5dSI3rudg0Inn76ZEycolGZRcBbhfvIgjfeaNuVWir3tco
	 SP2q5nfgHTCo39cn3X80LPzsTJlpXRWHr588rjubTdibD3C9gQZL5s3VmKRvRtS+s6
	 DsiP/8e9Dj2gJRHoF7fYg21DiLI52lrDW222WInSQ64E/6/3Zgx+7pJUP3g2MJfKRA
	 BrCGBFAo+AjJywbPFtaf8Mczy47uJuvPK9poujreDdQaAWbqPlpwvrmE4WEEl2an27
	 Y8TfEqI3yHW8w==
Date: Tue, 3 Dec 2024 10:30:37 -0600
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, tglx@linutronix.de,
	daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RESEND 1/2] dt-bindings: timer: fsl,imxgpt: Fix the
 fsl,imx7d-gpt fallback
Message-ID: <20241203163037.GA1916867-robh@kernel.org>
References: <20241202132147.587799-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202132147.587799-1-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_083041_148112_E405B1CB 
X-CRM114-Status: GOOD (  16.65  )
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

On Mon, Dec 02, 2024 at 10:21:46AM -0300, Fabio Estevam wrote:
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

I'm assuming Daniel will apply, but I'll keep these in my queue until 
that happens.

> 
> diff --git a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> index e2607377cbae..a2fcb1e8e74e 100644
> --- a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> +++ b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> @@ -31,6 +31,7 @@ properties:
>            - enum:
>                - fsl,imx6sl-gpt
>                - fsl,imx6sx-gpt
> +              - fsl,imx7d-gpt
>                - fsl,imx8mp-gpt
>                - fsl,imxrt1050-gpt
>                - fsl,imxrt1170-gpt
> @@ -38,7 +39,6 @@ properties:
>        - items:
>            - enum:
>                - fsl,imx6ul-gpt
> -              - fsl,imx7d-gpt
>            - const: fsl,imx6sx-gpt
>  
>    reg:
> -- 
> 2.34.1
> 

