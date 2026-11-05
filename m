Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E994C606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PoNNigDr;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Ygj8Imd/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dusSPG9xdMmVsVmNbkzIpKIHdRS2NNRTzKzvSiReq7M=; b=PoNNigDrhwDAol5VC5Luu66hyi
	agVq86vToRhB7dwrVkeyLKMcpP1AZYz3GW0Ecg8kOsA2KoxA//OzfCvCfQB8y8sajZh3UImsPqJPc
	tsN1Gnw42y9ud3M5pvpoApXDcgTlgK9El1KtgHjXo6ZX0TdloPnO+iCRDNomgZ4BNsBuhzyVUsGpL
	ycjUdsbhhESIaPqC6JNjQd0gy25PwoDDAGheV9dfTPe4SM6GCP47af18LAlwcEGXXWCAGX5mEPoR2
	eapwfCMR3kCNFk1xd1gxTiNHKh3+o2U8CI0QzbRihG2sE+VRn2vAGWbypeOYHQ2BdSqj3i1GRWy7r
	oQZeLehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvoB-00000008gwl-3ErH;
	Thu, 05 Nov 2026 11:39:07 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvo9-00000008gvY-3zxK;
	Thu, 05 Nov 2026 11:39:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793878715; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ck6FNJp0Yxgxqt2iULMM3JNKRistkUhgh/gv6A2N87GaYoyWqdg4+jUoCPr1bsLBlYq6cIcTai28I+tLZWLoCWeKuDVv1iczbtGPtKO5KnS8kOkb2ml4iBvMgyViJlvZ42qbPBXGu1yp49sd2dMNty4Pp2uG+u+FxyLYrl9UumI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793878715; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dusSPG9xdMmVsVmNbkzIpKIHdRS2NNRTzKzvSiReq7M=; 
	b=lNIsr5k3EvhNllfZJkYwMfn5uAystXsC0cmmbJYIwhuXjJLSYJoddmAPLz/L7kfexdeKnmtsszaPd5/2AKelrcis9JKmI66YOXoIC8pkhoAfezcBW5vrcLa08T22sldBx7LazI2Jqwuse6LKcJ09ssXWrCDORzrMT9Hb1gzLgz8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=Ygj8Imd/JfamIY3R12XIvTLsdH2222RBVyS/4e2SHQPz1jUK37NgbnWhB2CFoSVMrbpgUNnO/8xMJuqZuFdUdbtJu0rgQ0HFu05P/c7pl1ET+VwvaWzrYM1G2/04EtnYkKLZ645YjjegQ+Whhca8kOk02PNjWqczgvvKTaAUQkg=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=dusSPG9xdMmVsVmNbkzIpKIHdRS2NNRTzKzvSiReq7M=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793878713458719.9402546907897;
	Thu, 5 Nov 2026 03:38:33 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 07AF8180350; Thu, 05 Nov 2026 12:38:28 +0100 (CET)
Date: Thu, 5 Nov 2026 12:38:28 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jingoo Han <jingoohan1@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Alexey Charkov <alchark@flipper.net>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH v8 7/9] PCI: dw-rockchip: Add pme_turn_off support
Message-ID: <auxpGArMuCJmdn-S@venus>
References: <20261105-rockchip-pcie-system-suspend-v8-0-0434b4f373bc@collabora.com>
 <20261105-rockchip-pcie-system-suspend-v8-7-0434b4f373bc@collabora.com>
 <f047dcbe-efa2-4c60-8436-6d001c936467@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kdkht52zgzkidek7"
Content-Disposition: inline
In-Reply-To: <f047dcbe-efa2-4c60-8436-6d001c936467@rock-chips.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/293.861.93
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_033906_044455_BB4C2C69 
X-CRM114-Status: GOOD (  22.94  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--kdkht52zgzkidek7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 7/9] PCI: dw-rockchip: Add pme_turn_off support
MIME-Version: 1.0

Hi,

On Thu, Nov 05, 2026 at 08:51:14AM +0800, Shawn Lin wrote:
> [...]
> > +static void rockchip_pcie_pme_turn_off(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
> > +	struct rockchip_pcie *rockchip =3D to_rockchip_pcie(pci);
> > +	struct device *dev =3D rockchip->pci.dev;
> > +	u32 status;
> > +	int ret;
> > +
> > +	/* 1. Broadcast PME_Turn_Off Message, bit 4 self-clear once done */
> > +	rockchip_pcie_writel_apb(rockchip, PME_TURN_OFF, PCIE_CLIENT_MSG_GEN);
> > +	ret =3D readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_MSG_GEN,
> > +				 status, !(status & BIT(4)), PCIE_PME_TO_L2_TIMEOUT_US / 10,
> > +				 PCIE_PME_TO_L2_TIMEOUT_US);
> > +	if (ret) {
> > +		dev_warn(dev, "Failed to send PME_Turn_Off\n");
> > +		return;
> > +	}
> > +
> > +	/* 2. Wait for PME_TO_Ack, bit 9 will be set once received */
> > +	ret =3D readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_INTR_STAT=
US_MSG_RX,
> > +				 status, status & BIT(9), PCIE_PME_TO_L2_TIMEOUT_US / 10,
> > +				 PCIE_PME_TO_L2_TIMEOUT_US);
> > +	if (ret) {
> > +		dev_warn(dev, "Failed to receive PME_TO_Ack\n");
> > +		return;
> > +	}
> > +
> > +	/* 3. Clear PME_TO_Ack and Wait for ready to enter L23 message */
> > +	rockchip_pcie_writel_apb(rockchip, PME_TO_ACK, PCIE_CLIENT_INTR_STATU=
S_MSG_RX);
> > +	ret =3D readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_POWER_CON,
> > +				 status, status & PME_READY_ENTER_L23,
> > +				 PCIE_PME_TO_L2_TIMEOUT_US / 10,
> > +				 PCIE_PME_TO_L2_TIMEOUT_US);
> > +	if (ret)
> > +		dev_err(dev, "Failed to get ready to enter L23 message\n");
> > +}
>=20
> This is a question for the DWC core: should we change
> dw_pcie_host_ops::pme_turn_off() to return a value instead of silently
> ignoring a failure?
>=20
> Looking at pcie-designware-host.c, we have:
>=20
> if (pci->pp.ops->pme_turn_off) {
>     pci->pp.ops->pme_turn_off(&pci->pp);
> } else {
>     ret =3D dw_pcie_pme_turn_off(pci);
>     if (ret)
>         return ret;
> }
>=20
> The handling feels asymmetric. If ->pme_turn_off fails, shouldn't we abort
> dw_pcie_suspend_noirq as well?

That sounds sensible to me. I had a look and apart from Rockchip,
Layescape can run into an error. Most platforms cannot produce any
errors in that function, which explains why this was void to begin
with.

> Other than that, this patch looks good to me in current shape,
> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

Thanks, taken over for v9.

> We can further discuss the callback's return value issue on top.

Agreed. This will touch all the glue drivers to add a return 0. I
think its better to do that in a separate series.

Greetings,

-- Sebastian

--kdkht52zgzkidek7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrsaqkACgkQ2O7X88g7
+ppOQQ//WoZHIiRbMmXqisCxBjqzqieSnrTn+4gdKBb5ipuBqtBM3YnhR5D9z8vj
qxkO9v5mR2ykXKTUTN0b/IgpGwxVnC5ccoYNQWNzpIttV4i/e1Tj7V+4KyGnxfo9
ZI+qDp3y2jGlsh7j89VTZmHoH78j8CLDDGZqUAIhW+sFNvqyJ69abnG8c6ozO6Yu
R4yjEHkEdan4+RJJufB+9hCzbLAJs3OgZkJMbUf1DkVgLxtJGmRp91M+ZcNqlmo1
H9ri2ur38nBzAhcgQqAIl3FbqdS42WI8EIbB0nUT+u6P9UGw3Run7NyNmSl9SZO9
cimqFBsGEJP19fcWYsaY52FpYHapPlkTvL961G74cIZaXeHhgOU+np3vlKu6L9Nj
CYVktU59FVlyL2AjLNxPPz7Nj0ApJwWqeHduV5iv6mPXwZKsgfBlljKKmt9ENEV4
3aXWLthxSTXn8EbUJaDhbCEuSAckZ6Q0jBLLm1jxI6Xl91BXLugGeHrxHLg7Ot/W
eItpBHYxgVmFYdqWIOEnwEvNosQ5AAGuiaxxpbtiijQ1Ry2cgD2WwQ3eIxPRhI8X
mSmeonaUh1lDbY6pJlb+R8O1lADwOTreUVYahV3BleF6YiVCqe18qJPXu+Vw/Oul
lElhNe92o+6baSESkxZHh9syJgR8/81Pz8CGQ+SjICYIzN+M+iA=
=4x0q
-----END PGP SIGNATURE-----

--kdkht52zgzkidek7--

