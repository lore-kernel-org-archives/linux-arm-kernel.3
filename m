Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C594C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 11:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhwO7wLTH/K/5GSA2EVin0uPDNi3jJUhbxwZYDa0Rfk=; b=swREfKgAkXGClKM4/PkN5R55Vi
	7iK2JNrYRC4cOrnd+g8KB6M233Ck440FbQj9DcV6PPGqwWZnwwsBjqKa+oqPq4R/s+z1V6+la5CjH
	yl1BnutKuxHR2dSxb5i8k4Uz5O4uU09fgCk/plI9pz2usmGzTFemSC9RAGiCgv/NFyIBPmClmCJiv
	rxxbDBALIOUq/1T07MBNKvU6eKyur2ca5E6L+wmxckj11zDDY0bSkU0z845wiPWDPscOulE8ulSbg
	Lwgdu/wKa9CTEDqw7wrijw0w1KO/8Ga/uTpSg74TQqOMBRddciItXqaSvSOUmCS61AHhOjs02DZiH
	PZ5g/D7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMBp-00000003Tak-2PvJ;
	Fri, 09 May 2025 11:46:53 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLKW-00000003LVg-163y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 10:51:49 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uDLKA-0002Si-2x; Fri, 09 May 2025 12:51:26 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uDLK8-001sIP-2c;
	Fri, 09 May 2025 12:51:24 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uDLK8-0006Lv-2I;
	Fri, 09 May 2025 12:51:24 +0200
Message-ID: <42a5119e547685f171be6f91e476a9b595599cf9.camel@pengutronix.de>
Subject: Re: [PATCH 5/8] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Claudiu <claudiu.beznea@tuxon.dev>, bhelgaas@google.com, 
 lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be,  magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org,  saravanak@google.com
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Claudiu
 Beznea <claudiu.beznea.uj@bp.renesas.com>
Date: Fri, 09 May 2025 12:51:24 +0200
In-Reply-To: <20250430103236.3511989-6-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
	 <20250430103236.3511989-6-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_035148_296383_2E23CC89 
X-CRM114-Status: GOOD (  19.51  )
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

Hi Claudiu,

On Mi, 2025-04-30 at 13:32 +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
> only as a root complex, with a single-lane (x1) configuration. The
> controller includes Type 1 configuration registers, as well as IP
> specific registers (called AXI registers) required for various adjustment=
s.
>=20
> Other Renesas RZ SoCs (e.g., RZ/G3E, RZ/V2H) share the same AXI registers
> but have both Root Complex and Endpoint capabilities. As a result, the PC=
Ie
> host driver can be reused for these variants with minimal adjustments.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  MAINTAINERS                              |    8 +
>  drivers/pci/controller/Kconfig           |    7 +
>  drivers/pci/controller/Makefile          |    1 +
>  drivers/pci/controller/pcie-rzg3s-host.c | 1561 ++++++++++++++++++++++
>  4 files changed, 1577 insertions(+)
>  create mode 100644 drivers/pci/controller/pcie-rzg3s-host.c
>=20
[...]
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/contr=
oller/pcie-rzg3s-host.c
> new file mode 100644
> index 000000000000..c3bce0acd57e
> --- /dev/null
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -0,0 +1,1561 @@
[...]
> +static int rzg3s_pcie_resets_bulk_set(int (*action)(int num, struct rese=
t_control_bulk_data *rstcs),
> +				      struct reset_control **resets, u8 num_resets)
> +{
> +	struct reset_control_bulk_data *data __free(kfree) =3D
> +		kcalloc(num_resets, sizeof(*data), GFP_KERNEL);
> +
> +	if (!data)
> +		return -ENOMEM;
> +
> +	for (u8 i =3D 0; i < num_resets; i++)
> +		data[i].rstc =3D resets[i];
> +
> +	return action(num_resets, data);
> +}

What is the purpose of this? Can't you just store struct
reset_control_bulk_data in struct rzg3s_pcie_host and call
reset_control_bulk_assert/deassert() directly?

> +static int
> +rzg3s_pcie_resets_init(struct device *dev, struct reset_control ***reset=
s,
> +		       struct reset_control *(*action)(struct device *dev, const char =
*id),
> +		       const char * const *reset_names, u8 num_resets)
> +{
> +	*resets =3D devm_kcalloc(dev, num_resets, sizeof(struct reset_control *=
), GFP_KERNEL);
> +	if (!*resets)
> +		return -ENOMEM;
> +
> +	for (u8 i =3D 0; i < num_resets; i++) {
> +		(*resets)[i] =3D action(dev, reset_names[i]);
> +		if (IS_ERR((*resets)[i]))
> +			return PTR_ERR((*resets)[i]);
> +	}
> +
> +	return 0;
> +}

Why not use devm_reset_control_bulk_get_exclusive() directly?


regards
Philipp

