Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84EDC9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 12:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2vdG/ru8rw1Y5ayEWt8P3IH0H9UUvdg+EVu0ifmHCE=; b=uGIxlYTvyHzu4VOnReURIyUZpz
	rnpLznXkzdfDFqIrnB0Yhyrc/CQqg7lvyyIicym0C1B8/+z0ThS4O1z0JLxninJaVtJr5KfIVJySE
	ZUREzeEjwTObORFMzZSTT7sgUrb4zLU94IH3bhSt8+EeFHNGt+W8g740lvFrvvSSHP2F7CO7OJMjv
	X5ujla++3J5x5ER28VFlbHXuRDEkKnRMUadjdjnObWyUYRKO9OzDjVjQjhFpklqg36myNBAfZm3Iy
	5KvT9eB0R95rhFwpKsdVSAMFNPvGpsMLHp3C+lHWU+nq0mS7AP+iRBzRs6t9E8rFYAFsp9WNyutro
	GF0h29Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9nj-00000000UoL-3dtt;
	Mon, 28 Sep 2026 11:45:43 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9nh-00000000Unk-304p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 11:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=z2vdG/ru8rw1Y5ayEWt8P3IH0H9UUvdg+EVu0ifmHCE=; b=l05XfVCOFvsk9DdwzUCAsnavXx
	PJO1n1k0F9xm4SEFbbmjUhhQK63SKyApZsdpzEY5RB+fpBBNxTJwzqESP6kTSv5J6N66COgaDQcfZ
	o0vlA5aRL2RjNSwftywHozraCEogY9FOGiCmHQPbXjrbk9P73Qb+mHtufFr9AaJyUtvVcvVuPl+oF
	QCL4awUXjwwGTDj8p4pR78dQo8TTXtkgvNaFRnNGezTpeQTJSftzaaE4mbq6mGC2fq9L1xID+ApWD
	amIGNKryYAeC+JWIMu68jQ/jx1AqpLDyEYf8vsE+VRZpZqeabfFmHLR35EJOperLZyUQEOk2RJl91
	HnYeO3hQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xB9ne-000M8U-33;
	Mon, 28 Sep 2026 13:45:39 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xB9nd-0007Qc-1D;
	Mon, 28 Sep 2026 13:45:38 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] PCI: imx6: Use dev_err_probe
Date: Mon, 28 Sep 2026 13:45:36 +0200
Message-ID: <3441664.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260619112535.1127850-1-alexander.stein@ew.tq-group.com>
References: <20260619112535.1127850-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28137/Mon Sep 28 08:24:12 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_044541_866788_C442C7C1 
X-CRM114-Status: GOOD (  13.54  )
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

Hi,

Am Freitag, 19. Juni 2026, 13:25:33 CEST schrieb Alexander Stein:
> pci_pwrctrl_power_on_devices() might return -EPROBE_DEFER resulting in
> an error message. Use dev_err_probe to silence this non-error message.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Is there anything missing after receiving Frank's r-b?

Thanks and best regards
Alexander

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controll=
er/dwc/pci-imx6.c
> index 98e1db751132a..b7a502e9a1c59 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1381,7 +1381,7 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
> =20
>  	ret =3D pci_pwrctrl_power_on_devices(dev);
>  	if (ret) {
> -		dev_err(dev, "failed to power on pwrctrl devices\n");
> +		dev_err_probe(dev, ret, "failed to power on pwrctrl devices\n");
>  		goto err_pwrctrl_destroy;
>  	}
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



