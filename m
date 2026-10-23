Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F01C606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 05:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wIiSLAS+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=chN7L5kR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iGuLewHE4DgB3b0yCkKQ6+E+7LwsYzeCtRN/Tj5GI20=; b=wIiSLAS+wEfyTRwaEBn1FC0PLF
	sH+qQPSXC9TcaMWiFz1k9QJBRl+7mpO4uiqnvh24LR8BaK9bjFGIn31578Ahp5FRpIHBhRK4pPzaW
	Aajr63jEsFD3r5NmyWW6dH4nXbOqMezDB1mjYnO1EsGURS8XDpecpxposVDKDZs0qXVxpFtXDE1ZJ
	MV8K3xbcbPEt/rhlACIxjAOcI7GGh9jruFIwxVbVFMEO9/AVE18+iDnqEFfeO0RW7R0ArbKTf8knp
	RYYdyPCxcsgdMrHj0PfYCaRR98GequHmdQZ1mQ2zaa74I2fwMrGAGjrc24Y8qB7841NUMn/IxL2UW
	jtrCgWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8F4-0000000FYAF-0f8D;
	Fri, 23 Oct 2026 05:55:02 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8F0-0000000FY9W-2Sq0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 05:55:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=iGuLewHE4DgB3b0yCkKQ6+E+7LwsYzeCtRN/Tj5GI20=; b=chN7L5kRYkPn6rpcuAsbRekVm3
	R9qd4xqn/8AEWZClWMq2ZCh2XK0r/d3eeHMOYIpaYFcx1bUwvb0fR2WEHWs8QWZyy4leMoYT99UhF
	qV4XeL7j9rnyEqjot2zk4ll8tOUB6luN+3PrNoNK8gx505idtX0+OyIYdv3CScJn6Af6JvAt85zxD
	aLfEjWobfE3rL6OguZwIU+q+n08KHGXjErSTm7zbmpN/0ZuUOShn4wC1dKM7R0EekcAtggZel7SRR
	PINNMVNG09D0KRz+bac1kJVblhELRfAIHSd1do+bwhrxIvBvmRUWCEds6jA6+Hq6nxvS6YS4mopdB
	/hTZ4/Tw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xK8Ew-000IXG-10;
	Fri, 23 Oct 2026 07:54:54 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xK8Ew-000J59-19;
	Fri, 23 Oct 2026 07:54:53 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com, Peng Fan <peng.fan@nxp.com>,
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8qm-mek: Re-enable A72 cluster after
 ERR050104 workaround
Date: Fri, 23 Oct 2026 07:54:52 +0200
Message-ID: <6424356.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20261023-8qm-v2-1-a8812a888e3c@nxp.com>
References: <20261023-8qm-v2-0-a8812a888e3c@nxp.com>
 <20261023-8qm-v2-1-a8812a888e3c@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28161/Thu Oct 22 08:24:11 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_225458_763271_E0BD04DB 
X-CRM114-Status: GOOD (  14.85  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Peng,

Am Freitag, 23. Oktober 2026, 04:56:59 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Peng Fan (OSS):
> From: Peng Fan <peng.fan@nxp.com>
>=20
> The ERR050104 cache coherency workaround for i.MX8QM/8QP has been
> merged upstream (d44e08dab27d). The workaround addresses the incorrect
> wiring of upper address bits in the A53 subsystem that corrupts TLBI and
> IC maintenance operations between A53 and A72 clusters.
>=20
> Previously the A72 CPUs (cpu@100, cpu@101), the cpu-map, and the
> cpu1-thermal zone were removed from the MEK board DT to avoid incorrect
> cross-cluster coherency maintenance. With the software workaround in
> place, restore all deleted nodes and add A72_0/A72_1 to the PMIC thermal
> cooling-device map so both clusters are properly managed.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Maybe it's woth mentioning you are essentially also reverting commit
bce07345481cd ("arm64: dts: imx8qm-mek: delete A72 thermal zone").

But either way:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Best regards
Alexander

> ---
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/bo=
ot/dts/freescale/imx8qm-mek.dts
> index 9e49ac377162b..d346958965026 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> @@ -17,16 +17,6 @@ chosen {
>  		stdout-path =3D &lpuart0;
>  	};
> =20
> -	cpus {
> -		/delete-node/ cpu-map;
> -		/delete-node/ cpu@100;
> -		/delete-node/ cpu@101;
> -	};
> -
> -	thermal-zones {
> -		/delete-node/ cpu1-thermal;
> -	};
> -
>  	memory@80000000 {
>  		device_type =3D "memory";
>  		reg =3D <0x00000000 0x80000000 0 0x40000000>;
> @@ -995,7 +985,9 @@ map0 {
>  				cooling-device =3D <&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>  						 <&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>  						 <&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> -						 <&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +						 <&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&A72_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&A72_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>  			};
>  		};
>  	};
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/



