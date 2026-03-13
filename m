Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4166C106FD9B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnQ2XOWvQ9JXG8gouYqogvAfibJxfT/GIewN6zcN060=; b=A3H/9IUsmZ5pYGudpFDpZP5xHE
	748PGduq1Ytp6mfUKpjF4BGhnQXf4eEfL8VsF1nn/gv3M6VpcXwsPYFfHYkVJgw6oD8KsoGz8v5BM
	ajGDtNQkUGqmwEPjIDF8q2GfHqaOIxc1tnKHCYu3r8cCOJ5PEXqL6xRo1NIAWFcad7Zfa5GOfVX3C
	Zfrd3mJaF6Fbe8p6oHuib0TWn0UJJZ9bFmHrJd8BikqyihLsyIXGh2cTJ4tP4bD8kd/hXWbUhUi2V
	t3ehtZcS5rSd5rrw0QuGLTHb/ejYdv7jhjk/CzP6gCQHtZ+vLH3v7+iQEVSZcDRPhrEF2AHkGcDKD
	oPTaikeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0x19-0000000H3ud-1prB;
	Fri, 13 Mar 2026 07:33:08 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0x16-0000000H3tm-2Vhy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=SnQ2XOWvQ9JXG8gouYqogvAfibJxfT/GIewN6zcN060=; b=iYwdsIAkhKolwmTtfsWnILEo97
	Y0bo8zzcQOTtgoT10cW2R7MBnUO/gK3bi5MIAhvv3fR3iBwG8bs6V16tTBHgSgL46LCIA5MXJC7OD
	0AyChA/mxoVx5a+k4uA74/giYEoNgGzlIoHB7mQcg6t/6+P2mdLy10taaQYg5Cxw/HQqBxZbhBn2K
	CLD6+IdK6EdioOb+b8Y5EDPHlbcwRSN+vjIWg2x++iQfvaRvTk0L2+zhEtfRxurNUNlWbzA2BXd23
	cH2QdBQZk6ejKQCb4yF/6ucP+skHR77xtcJ5lCGdV6w22ygxJp8Mmx1Hgo1uiTuOUUC0mrJMdOTYf
	0Hg4N7rQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0x13-000IPf-1M;
	Fri, 13 Mar 2026 08:33:01 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0x12-0001B3-2l;
	Fri, 13 Mar 2026 08:33:00 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
 bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 Richard Zhu <hongxing.zhu@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v1] PCI: imx6: Don't remove MSI capability For i.MX7D/i.MX8M
Date: Fri, 13 Mar 2026 08:32:59 +0100
Message-ID: <9435951.EvYhyI6sBW@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260313064927.2092800-1-hongxing.zhu@nxp.com>
References: <20260313064927.2092800-1-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_003304_771061_4FE3C92B 
X-CRM114-Status: GOOD (  19.52  )
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

Am Freitag, 13. M=E4rz 2026, 07:49:27 CET schrieb Richard Zhu:
> The MSI trigger mechanism for endpoint devices connected to i.MX7D,
> i.MX8MM, and i.MX8MQ PCIe root complex ports depends on the MSI
> capability register settings in the root complex. Removing the MSI
> capability breaks MSI functionality for these endpoints.
>=20
> Preserve the MSI capability for i.MX7D/i.MX8M PCIe root complex to
> maintain MSI functionality.

Does this apply to i.MX8MP as well?

Best regards,
Alexander

>=20
> Fixes: f5cd8a929c825 ("PCI: dwc: Remove MSI/MSIX capability for Root Port=
 if iMSI-RX is used as MSI controller")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controll=
er/dwc/pci-imx6.c
> index 81a7093494c8..b86d22db4a13 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -41,6 +41,7 @@
>  #define IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE	BIT(11)
>  #define IMX8MQ_GPR_PCIE_VREG_BYPASS		BIT(12)
>  #define IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE	GENMASK(11, 8)
> +#define IMX8MM_PCIE_MSI_CAP_OFFSET		0x50
> =20
>  #define IMX95_PCIE_PHY_GEN_CTRL			0x0
>  #define IMX95_PCIE_REF_USE_PAD			BIT(17)
> @@ -117,6 +118,7 @@ enum imx_pcie_variants {
>  #define IMX_PCIE_FLAG_HAS_LUT			BIT(10)
>  #define IMX_PCIE_FLAG_8GT_ECN_ERR051586		BIT(11)
>  #define IMX_PCIE_FLAG_SKIP_L23_READY		BIT(12)
> +#define IMX_PCIE_FLAG_KEEP_MSI_CAP		BIT(13)
> =20
>  #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
> =20
> @@ -976,10 +978,17 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  {
>  	struct imx_pcie *imx_pcie =3D to_imx_pcie(pci);
>  	struct device *dev =3D pci->dev;
> -	u8 offset =3D dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +	u8 offset;
>  	u32 tmp;
>  	int ret;
> =20
> +	if (imx_pcie->drvdata->flags & IMX_PCIE_FLAG_KEEP_MSI_CAP) {
> +		offset =3D dw_pcie_find_capability(pci, PCI_CAP_ID_PM);
> +		dw_pcie_dbi_ro_wr_en(pci);
> +		dw_pcie_writeb_dbi(pci, offset + 1, IMX8MM_PCIE_MSI_CAP_OFFSET);
> +		dw_pcie_dbi_ro_wr_dis(pci);
> +	}
> +
>  	if (!(imx_pcie->drvdata->flags &
>  	    IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND)) {
>  		imx_pcie_ltssm_enable(dev);
> @@ -991,6 +1000,7 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  	 * started in Gen2 mode, there is a possibility the devices on the
>  	 * bus will not be detected at all.  This happens with PCIe switches.
>  	 */
> +	offset =3D dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>  	dw_pcie_dbi_ro_wr_en(pci);
>  	tmp =3D dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
>  	tmp &=3D ~PCI_EXP_LNKCAP_SLS;
> @@ -1907,6 +1917,7 @@ static const struct imx_pcie_drvdata drvdata[] =3D {
>  	[IMX7D] =3D {
>  		.variant =3D IMX7D,
>  		.flags =3D IMX_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX_PCIE_FLAG_KEEP_MSI_CAP |
>  			 IMX_PCIE_FLAG_HAS_APP_RESET |
>  			 IMX_PCIE_FLAG_SKIP_L23_READY |
>  			 IMX_PCIE_FLAG_HAS_PHY_RESET,
> @@ -1919,6 +1930,7 @@ static const struct imx_pcie_drvdata drvdata[] =3D {
>  	[IMX8MQ] =3D {
>  		.variant =3D IMX8MQ,
>  		.flags =3D IMX_PCIE_FLAG_HAS_APP_RESET |
> +			 IMX_PCIE_FLAG_KEEP_MSI_CAP |
>  			 IMX_PCIE_FLAG_HAS_PHY_RESET |
>  			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
>  		.gpr =3D "fsl,imx8mq-iomuxc-gpr",
> @@ -1933,6 +1945,7 @@ static const struct imx_pcie_drvdata drvdata[] =3D {
>  	[IMX8MM] =3D {
>  		.variant =3D IMX8MM,
>  		.flags =3D IMX_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX_PCIE_FLAG_KEEP_MSI_CAP |
>  			 IMX_PCIE_FLAG_HAS_PHYDRV |
>  			 IMX_PCIE_FLAG_HAS_APP_RESET,
>  		.gpr =3D "fsl,imx8mm-iomuxc-gpr",
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



