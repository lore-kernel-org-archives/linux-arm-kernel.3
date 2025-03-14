Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE80C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 15:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:Subject:To:From:Cc:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+NrVsUlU9vdqAo1JusitnBgZ6CQRjkiMY5hj0uwdFA=; b=jlOQyQObZ/mjVzGdeD0GeRWSBc
	ihxDStqtA6KIXBD2XDL0F5tgtuapACu/1rSyyZwpnI3jSZvROvY8EKiLrsIF3pDvfATc9fTWWu1/2
	HEhV8uIrtyzqf1mMheuir8leNEhrw2ePGEX593HdvMVYjC6/Z+/jQqlllXlEvLm0USB3tkAnt5sXE
	HjfybV+hvI/DmZMvmHowtHLl3JfSGkf8QP+4giJvpr1W87/0Y/ogCwamSlKRGSRyrT+UmEUAqmijJ
	2nx7TQpI1z5vKMfw2/v8UKYpHPf1XUd1hkSfgZtpmVv2YCoAkrozIq0tXZfGOw9UizOguJZrv8CFb
	fhVSOJTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6mP-0000000EWs1-1W1Q;
	Fri, 14 Mar 2025 15:16:57 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6fm-0000000EVep-2eAB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 15:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:Subject:To:From:Cc:Message-Id:Date:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=z+NrVsUlU9vdqAo1JusitnBgZ6CQRjkiMY5hj0uwdFA=; b=GP3UtK10MKyITz4RJZcN9BOyCK
	DO+dM/MjsPWiJ5Ix1jpvb0JtRHL+eoC5onKhliPIdvU07MoJNA3cfN8QnHzvuJMIBQEfD0TfvnxKC
	aLXOMGV/5EWfPuqyE+Fn2jVJvm9woEINjlxI67UEmaB4AfmQ9BHMcj9hxPasoBwMKE7hj4XDJnQSC
	P/eVKQlYK10o4i927ESlwfnnWQA6ArngUcKa8k4v3B/1qOSFDwEV3+dSC29ICVzNfMYZr/9CA/UCP
	Sz6vyobp0ThhVKIZqZ60ki+EV580i+zf0IrQfSzBLsZ6pG8FldbYJzUzeQjr0KnRlRqYe3nSosFLj
	k9igvZCQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1tt6fl-000MxA-1e;
	Fri, 14 Mar 2025 16:10:05 +0100
Received: from [185.213.155.229] (helo=localhost)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1tt6fk-0005Uj-0b;
	Fri, 14 Mar 2025 16:10:05 +0100
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Mar 2025 15:10:04 +0000
Message-Id: <D8G323LHQBTV.5LVSPQ3DF2NQ@folker-schwesinger.de>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Michal Simek" <michal.simek@amd.com>,
 "Marek Vasut" <marex@denx.de>, "Radhey Shyam Pandey"
 <radhey.shyam.pandey@amd.com>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Thomas Gessler" <thomas.gessler@brueckmann-gmbh.de>,
 <dmaengine@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: xilinx_dma: Set max segment size
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-33-g75c6578986f4
References: <20250314134717.703287-1-thomas.gessler@brueckmann-gmbh.de>
In-Reply-To: <20250314134717.703287-1-thomas.gessler@brueckmann-gmbh.de>
X-Authenticated-Sender: dev@folker-schwesinger.de
X-Virus-Scanned: Clear (ClamAV 1.0.7/27577/Fri Mar 14 10:01:01 2025)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_081006_666242_B1F99E2E 
X-CRM114-Status: GOOD (  11.77  )
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

On Fri Mar 14, 2025 at 2:47 PM CET, Thomas Gessler wrote:
> Set the maximumg DMA segment size from the actual core configuration
> value. Without this setting, the default value of 64 KiB is reported,
> and larger sizes cannot be used for IIO DMAEngine buffers.
>
> Signed-off-by: Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>

Tested-by: Folker Schwesinger <dev@folker-schwesinger.de>

> ---
>  drivers/dma/xilinx/xilinx_dma.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index 108a7287f4cd..4b4a299e3807 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -3114,6 +3114,8 @@ static int xilinx_dma_probe(struct platform_device =
*pdev)
>  		}
>  	}
> =20
> +	dma_set_max_seg_size(xdev->dev, xdev->max_buffer_len);
> +
>  	if (xdev->dma_config->dmatype =3D=3D XDMA_TYPE_AXIDMA) {
>  		xdev->has_axistream_connected =3D
>  			of_property_read_bool(node, "xlnx,axistream-connected");


