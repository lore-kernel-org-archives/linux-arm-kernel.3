Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0364AC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 05:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Cc:Subject:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdBEsgjaYAHtmN5VFRdLlmlYJA177/Rj1RK0UPmSt4Y=; b=j7Ht0AVgWi0Hg7i+kcsRxev8T7
	qvsf8/9D3VCyjWXR3aK7d+pcutvlhGj8rMJYsyWa7c7fORx2gHuapa7MqFm39ubuS33qhbxhN65Jw
	h2dn6tILrOVLsEKzSlWvpStiJ4QYfrUmBWgefW3sJUGtWGZCDg9OujYn/baz1twtvjwqgOnyAj1xq
	La2AJ1fEwLjEJ4ex/t9Axn0PvBtzbxU8C3VrMiUeGyUp+QIr2uhgqpQmCUlYRcBsl2N7RjBX8clUQ
	Yf/P7sIdX1V/VmHwH0wfd6wl7UJgYBd1KpQkOH85tENWeMrfmeDDCEWbo8bDyEwW007sdF41PVC9M
	gJ/hJJCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDG38-00000002Uzy-3j2y;
	Fri, 09 May 2025 05:13:30 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDG17-00000002Utk-1ddj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 05:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:From:Cc:
	Subject:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=GdBEsgjaYAHtmN5VFRdLlmlYJA177/Rj1RK0UPmSt4Y=; b=OLcejcwOZnCrKB8JNabEUvO+O/
	kglaxXVzJVvQkvxDIhm/gk6Txh8HjJ0pGth6dqK4JLAl8VbnWS6Y4qanAlv+WJqoMTCstEEZzRs4d
	EFIG500ZEBD53ELrMvG5y9atipiO+gqHJ9bBzf/5c0nq3Bz90sKIUMXHZThCLbuXTGQM9Lyp3FRXW
	E/Lt9/CPfI+q3eIywmZooO/XTXHDpSj05l/BQXoSMTc63QlmmSJSQnojZ5/5r7/TlKQiFMLWOjJ13
	1ljkesG2lLN3BWteghn1wCGdcTSKMjRl+bPX6UQ+Y9xvi03Vm9czbjSyHAqPjYpPy4SDdo2KC4j7/
	2QiS2kYQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1uDG0y-0008tp-2e;
	Fri, 09 May 2025 07:11:17 +0200
Received: from [170.62.100.137] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1uDG0y-0007zr-1G;
	Fri, 09 May 2025 07:11:16 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 May 2025 05:11:14 +0000
Message-Id: <D9RDE3X5FIWG.BUFCOXYYAW1U@folker-schwesinger.de>
To: "Thomas Gessler" <thomas.gessler@brueckmann-gmbh.de>,
 <dmaengine@vger.kernel.org>
Subject: Re: [PATCH v2] dmaengine: xilinx_dma: Set dma_device directions
Cc: <linux-kernel@vger.kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Michal
 Simek" <michal.simek@amd.com>, "Manivannan Sadhasivam"
 <manivannan.sadhasivam@linaro.org>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, "Radhey Shyam Pandey"
 <radhey.shyam.pandey@amd.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Marek Vasut" <marex@denx.de>,
 <linux-arm-kernel@lists.infradead.org>, "Suraj Gupta"
 <Suraj.Gupta2@amd.com>, "Harini Katakam" <harini.katakam@amd.com>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
X-Mailer: aerc 0.20.1-74-g1b72b76797b9
References: <20250507182101.909010-1-thomas.gessler@brueckmann-gmbh.de>
In-Reply-To: <20250507182101.909010-1-thomas.gessler@brueckmann-gmbh.de>
X-Authenticated-Sender: dev@folker-schwesinger.de
X-Virus-Scanned: Clear (ClamAV 1.0.7/27631/Thu May  8 10:35:15 2025)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_221125_739082_C5D83824 
X-CRM114-Status: GOOD (  12.13  )
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

On Wed May 7, 2025 at 8:21 PM CEST, Thomas Gessler wrote:
> Coalesce the direction bits from the enabled TX and/or RX channels into
> the directions bit mask of dma_device. Without this mask set,
> dma_get_slave_caps() in the DMAEngine fails, which prevents the driver
> from being used with an IIO DMAEngine buffer.
>
> Signed-off-by: Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>

Tested-by: Folker Schwesinger <dev@folker-schwesinger.de>

> ---
> Changes in v2:
>   - Change to Suraj's simpler version as per Radhey's request
>
>  drivers/dma/xilinx/xilinx_dma.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index 3ad44afd0e74..8f26b6eff3f3 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -2909,6 +2909,8 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_=
device *xdev,
>  		return -EINVAL;
>  	}
> =20
> +	xdev->common.directions |=3D chan->direction;
> +
>  	/* Request the interrupt */
>  	chan->irq =3D of_irq_get(node, chan->tdest);
>  	if (chan->irq < 0)


