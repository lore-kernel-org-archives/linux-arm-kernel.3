Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9E8606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mMRxxidX;
	dkim=pass (2048-bit key, unprotected) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=d3dYfp1A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsrfJy/ey4fDpT1tLiGBQkd5nhrqessg78qrhYlxuN8=; b=mMRxxidX1RAQbRGEXNyIu45w0g
	MxDWDqQR3gvEh8HT09ClvaRDFHSPSdMrmwaGJc6nNPq5w//upxfWHVJqPL6m3QYYFyxRkyRHsGWQS
	tIJ+SMWjWw8gj2mT7gIopGuEChpd0ELCIswEZ/F+DKovdlz6SLHVNsa/d9ldTd3o5r+nV8va+REvp
	FoNRSpSQwT7l3WnoRwwJ3I3VPUzBLLzdxHYCrfzJ2yx4t/0LDO8or7nUCt3BpdIE+KCffmwVUvmWA
	CtACpzCo1+GoDm/1k36HSf7P9AX1SgIrVUljW0Ko6799nUHF21VeiFHdJWDneZHAU8/79iMuzlC+A
	FDux/R5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7gA-00000009V9d-1ZBq;
	Tue, 20 Oct 2026 11:06:50 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7g6-00000009V8q-48xz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:06:48 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id E5404D2328;
	Tue, 20 Oct 2026 14:06:37 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro E5404D2328
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1792494399;
	bh=nsrfJy/ey4fDpT1tLiGBQkd5nhrqessg78qrhYlxuN8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=d3dYfp1AEenlAqAJAsf1d1H8SA57AMYvrFbObQbVxMBs5fiEzwYZdlpXE0Q92jZ/3
	 yKlRMJnDXYTUEyPCvdyiUDPBFtFulR4AiQtLFpKJe1aFTL2ghqh6OuktMBYbXEthqx
	 a+E5upFPrQKIPjxk3mB+tjir8IWPFbDVakxVsLzUUXRCAxYICEPsN3ulPaIwNt8SnN
	 je2YOes+Z45PDuJWot4+LBy306Nho3uw239mXQKqW+PvAHTLjVYN+wf92ttqFeffX9
	 Mcd+GeeysGd/6kW23kdiV6meWXGAyT1bEc+4AKycBs6eWzSdjYOGfK+y4ky4cq/q1k
	 XCK/rIOoMLNlw==
Message-ID: <c01c5b7ceaef8fbdee2af384f2286f3a89350f46.camel@rendec.net>
Subject: Re: [PATCH v6 8/9] genirq/irqdomain: Add
 devm_irq_domain_create_linear()
From: Radu Rendec <radu@rendec.net>
To: Zhipeng.wang_1@oss.nxp.com, Thomas Gleixner <tglx@kernel.org>, Marc
 Zyngier	 <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
	 <jindong.yue@nxp.com>, xuegang.liu@nxp.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date: Tue, 20 Oct 2026 07:06:36 -0400
In-Reply-To: <20261008090231.796511-9-Zhipeng.wang_1@oss.nxp.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
	 <20261008090231.796511-9-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_040647_359338_38E0B75A 
X-CRM114-Status: GOOD (  17.90  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 2026-10-08 at 18:02 +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>=20
> irq_domain_create_linear() has no devres-managed counterpart, so a
> driver that wants a linear revmap domain tied to the device lifetime has
> to open-code an irq_domain_info and call devm_irq_domain_instantiate()
> directly.
>=20
> Add devm_irq_domain_create_linear() as the devres-managed sibling of
> irq_domain_create_linear(): it builds the same linear-revmap
> irq_domain_info and hands it to devm_irq_domain_instantiate(), so the
> domain is removed when the owning device is unbound. The return
> convention matches irq_domain_create_linear() (NULL on failure).
>=20
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> =C2=A0include/linux/irqdomain.h | 30 ++++++++++++++++++++++++++++++
> =C2=A01 file changed, 30 insertions(+)
>=20
> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> index 73c25d40846c..b6b360cb6525 100644
> --- a/include/linux/irqdomain.h
> +++ b/include/linux/irqdomain.h
> @@ -457,6 +457,36 @@ static inline struct irq_domain *irq_domain_create_l=
inear(struct fwnode_handle *
> =C2=A0	return IS_ERR(d) ? NULL : d;
> =C2=A0}
> =C2=A0
> +/**
> + * devm_irq_domain_create_linear - Allocate and register a linear revmap
> + *				=C2=A0=C2=A0 irq_domain tied to the device lifetime.
> + * @dev:	Device that owns the domain. The domain is removed via devres
> + *		when the device is unbound.
> + * @fwnode:	pointer to interrupt controller's FW node.
> + * @size:	Number of interrupts in the domain.
> + * @ops:	map/unmap domain callbacks
> + * @host_data:	Controller private data pointer
> + *
> + * Returns: Newly created irq_domain, or NULL on failure.
> + */
> +static inline struct irq_domain *devm_irq_domain_create_linear(struct de=
vice *dev,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct fwnode_handle *fwnode=
,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int size,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct irq_domain_ops =
*ops,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *host_data)
> +{
> +	const struct irq_domain_info info =3D {
> +		.fwnode		=3D fwnode,
> +		.size		=3D size,
> +		.hwirq_max	=3D size,
> +		.ops		=3D ops,
> +		.host_data	=3D host_data,
> +	};
> +	struct irq_domain *d =3D devm_irq_domain_instantiate(dev, &info);
> +
> +	return IS_ERR(d) ? NULL : d;
> +}
> +
> =C2=A0static inline struct irq_domain *irq_domain_create_tree(struct fwno=
de_handle *fwnode,
> =C2=A0							const struct irq_domain_ops *ops,
> =C2=A0							void *host_data)

Reviewed-by: Radu Rendec <radu@rendec.net>

