Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D493C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPbbNlZcZR+9nZoGn/94Zyh8I5FD9vmNNq7hTA5xe+k=; b=gzJSMKLb7gDXd5rw7pEJNB1CCC
	nom4qS37wUT4Kbk68ixij73mceTdMevDepNwF5P2nq/luc99NDyv4H8xScUPKuzVDXN244K9IX5Bd
	Ftokd2Ec9ffab9D57zZB4wI31dJSR16SyrlVqsefSLO9YdJY/W2Qc78MQhvInOV3u9+s+anUalqQT
	lznKEKXief0KF4hPPPG4knmFowjvNjhOgW2BA8yTSWIw5zUoNx8rrceS1ZlPhw2T8zLceOmdRezEn
	nZI0K2CgvgQHQT4ZjGGiuiFwoy7BTifMxVPkWgu+F/Unto7UKEqYkF7yESVgnTeG9d4rVadupcke7
	qDCk01tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLC6-0000000CgEG-0GAZ;
	Tue, 06 May 2025 16:30:58 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHsc-0000000Bzlv-1MHN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1746536316; x=1747141116; i=wahrenst@gmx.net;
	bh=SPbbNlZcZR+9nZoGn/94Zyh8I5FD9vmNNq7hTA5xe+k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=b11ZDuMHj/CY/hw0C8I1BUdT0jhEfpQoiECMjHvz5oXfKrVbuLnbvdyjx28ZIlKN
	 OKurbUf4Rcf3Gzv1qAG9wjIilT1IV3/rXQwhk6hIVqffUS/GCwyByq+6rc5chCaD6
	 XeJMxMaOgaD8Lhsq6LU6d17tScfXrtLmQ4J69EJk0tQoZLGaxt4P4SKSSCAna3bJK
	 CJSvEBZjt4rMTHPNp5jbd9OoFL/w0kWS0f++l7enfpYj/LjDwW80iv1hXcJeulMpU
	 SonpchjjsCMk9riGQELI6wzFjcFTaZwahXXHuHQPP19yOZBmupCHKPN+KNw8S4z5O
	 pkeE/UsbC1Vk/nBlvg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.101] ([91.41.216.208]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfHEP-1uelrk39AZ-00gG3q; Tue, 06
 May 2025 14:58:35 +0200
Message-ID: <3e325980-f07c-4290-ada1-ccb23d1f8c65@gmx.net>
Date: Tue, 6 May 2025 14:58:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] dmaengine: fsl-edma: Fix return code for unhandled
 interrupts
To: Frank Li <Frank.Li@nxp.com>, Joy Zou <joy.zou@nxp.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250424114829.9055-1-wahrenst@gmx.net>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250424114829.9055-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+miFVseaxfqWixfJZgh0qbsIbJ4rm9L95Oid/esKOn8vCM8wtpG
 CpSfnbjHQSI5/p+YDbtkBeWaZ6aClQFX8eBVu3aLjkKfxoHBKQKPMGjBxJNrHEgvBOedyX4
 8GwvFNsmSIb4Rl4M9kYjjx8oA6kMWAZRl/cwFkgzxzPnqOwgS4SQjgwdai2wV1hSCfV+ZkG
 EU4qOImE29GPTKzVKx0cA==
UI-OutboundReport: notjunk:1;M01:P0:WgTweoe2crc=;r6oM4PxymTM+jJl+AHjSZ5kzSUL
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_055838_662933_ED2266BA 
X-CRM114-Status: GOOD (  18.74  )
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

Hi Frank,
hi Joy,

Am 24.04.25 um 13:48 schrieb Stefan Wahren:
> For fsl,imx93-edma4 two DMA channels share the same interrupt.
> So in case fsl_edma3_tx_handler is called for the "wrong"
> channel, the return code must be IRQ_NONE. This signalize that
> the interrupt wasn't handled.
>
> Fixes: 72f5801a4e2b ("dmaengine: fsl-edma: integrate v3 support")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
any comments on this?

Thanks
> ---
>
> Hi,
> this issue was found on a custom i.MX93 board. This patch has been
> tested on the same platform.
>
>   drivers/dma/fsl-edma-main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> index 756d67325db5..66bfa28d984e 100644
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c
> @@ -57,7 +57,7 @@ static irqreturn_t fsl_edma3_tx_handler(int irq, void =
*dev_id)
>  =20
>   	intr =3D edma_readl_chreg(fsl_chan, ch_int);
>   	if (!intr)
> -		return IRQ_HANDLED;
> +		return IRQ_NONE;
>  =20
>   	edma_writel_chreg(fsl_chan, 1, ch_int);
>  =20


