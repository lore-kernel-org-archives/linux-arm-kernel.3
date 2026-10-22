Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04378606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JRDoj50A;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=Fjvp4tRY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YAcKsa+N22qMYtLETYzF0/wBbwZ/VrpjV+7wi9PY8jc=; b=JRDoj50AuFrvy8ovfFivi+EK+F
	/NPYRUgPQ+6dSC3DGjnVBhN4XcHfs2kw7QAIWBpIyWycanQ6TeJD1SWewKcJC0vsnmbHgL4OxC+Ky
	rs1HMvfU3gETTF8NyHfTtNEfakM7BauBzH0gf2ElahMIMLLweHa1wUTR9X+iyPr/Y7K9QgLSbbjtk
	ahEqtcnnKoR5eqPCerWlJczNbQY2ILMn5tCVfE9sFzas5ucENeIJJITrtCQ5onbrHir+mZEm5FzkA
	nQwjFOoR/nJtfurOQQhED8sHP1hZGKatx1emuCzPgulFMoECWEdGPBRo/Yjkc4Xb8j7kx6OJs4opq
	8egW7J1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoV8-0000000DlDN-1cJQ;
	Thu, 22 Oct 2026 08:50:18 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoV5-0000000DlBS-49WK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=YAcKsa+N22qMYtLETYzF0/wBbwZ/VrpjV+7wi9PY8jc=; b=Fjvp4tRYs+w2onr2DddcI/RLjM
	RM9Vkh66VbyHCLExBUIFMhI74h9LVKaDhmCmzUO3tuZL/wAVmNBSL89ficrYac6ppFtsgfRj0l+hU
	/mRwNe6vHvo1bzs/fdzI+ZxWZvu4S8yJyv0C2atQjvxYU9n8KX2VKTW7iMCrDAGwYapvIK4RspQEX
	7mE9YejleLQttF6qj7q1gcDByK11TgyihDPrbc518mGkLVJIVM4m0+wT6zp3vm65OtAAr8+yf/SRJ
	WBn8R63OjO9wRsdtm/hjReE0zFgmajM4n8dW+fVvIv5g1vl0sk+96FwPBm3emEMikgtWKu7CciAob
	hNS7aK1g==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xJoUx-000EsD-2E;
	Thu, 22 Oct 2026 10:50:07 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xJoUx-000Pxn-0U;
	Thu, 22 Oct 2026 10:50:07 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx8qm-tqma8qm: Re-enable A72 cluster after
 ERR050104 workaround
Date: Thu, 22 Oct 2026 10:50:05 +0200
Message-ID: <16849484.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20261022-8qm-v1-2-2a597cb3debd@nxp.com>
References: <20261022-8qm-v1-0-2a597cb3debd@nxp.com>
 <20261022-8qm-v1-2-2a597cb3debd@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28161/Thu Oct 22 08:24:11 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_015016_144230_DBB52E5E 
X-CRM114-Status: GOOD (  16.09  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Peng,

thanks for the patch.

Am Donnerstag, 22. Oktober 2026, 03:50:02 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Peng Fan (OSS):
> From: Peng Fan <peng.fan@nxp.com>
>=20
> The ERR050104 cache coherency workaround for i.MX8QM/8QP has been
> merged upstream (d44e08dab27d). The workaround addresses the incorrect
> wiring of upper address bits in the A53 subsystem that corrupts TLBI and
> IC maintenance operations between A53 and A72 clusters.
>=20
> Previously the A72 CPUs (cpu@100, cpu@101) and cpu-map were removed
> from the TQMa8QM DTSI with an explicit comment "Due to missing
> workaround for ERR050104". With the software workaround is in place,
> remove the workaround-comment block and restore the full SMP topology.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi b/arch/arm=
64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
> index f0e398eb2aad7..8cd6e75eb87a9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
> @@ -15,13 +15,6 @@ / {
>  	model =3D "TQ-Systems i.MX8QM TQMa8QM";
>  	compatible =3D "tq,imx8qm-tqma8qm", "fsl,imx8qm";
> =20
> -	/* Due to missing workaround for ERR050104 */
> -	cpus {
> -		/delete-node/ cpu-map;
> -		/delete-node/ cpu@100;
> -		/delete-node/ cpu@101;
> -	};
> -

While the patch itself is correct, it is not sufficient. Instead please
revert commit 5d20f1ccb3393 ("arm64: dts: imx8qm-tqma8qm-mba8x: Disable
Cortex-A72 cluster"). This will restore the thermal zone for cpu1-cluster.
This commit was created with the intention to be reverted, once the
errata has been dealt with.
With the revert:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Thanks and best regards,
Alexander

>  	memory@80000000 {
>  		device_type =3D "memory";
>  		/*
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/



