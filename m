Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4830107BCD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 17:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDjv6lj0xs4XAnUT9GLFnTkZ2gh6Ra2uKalbK9P5GpA=; b=Ewcs1rTFJssNpXtbPaS0Cg213p
	HU+DOYSfv7C0DaDD3Ul+Of6smuyI9ZdAedxZd05+Fh9vVL7Ni3o0C82ncd/bIJV/b7p/tCL3TrIOu
	aqVKN8zXhcl0UsToMZjF1nVwYbUEkEXohV36ZGKW//qxBREqyvlPAfudLkxsQwncAP5QoNF+ufWNb
	hkirTtOtDsK4kEcPcX+lr8eOtUx5Aogp9cn7oep03H5a+wQMY2ZN62Ujjwm4AstuosmMKmPCvwsDr
	bBiBYzibRGRvv5e+XwkN02fExBhNA/Q6NxopyrC3LD1amIp19fnQUPGTkW233MQfxs+TyJi5tbshT
	LRjrSLLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16Ua-00000000mDr-3YYi;
	Fri, 13 Mar 2026 17:40:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16UY-00000000mDT-2hZV;
	Fri, 13 Mar 2026 17:40:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3628943F15;
	Fri, 13 Mar 2026 17:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7FEC19421;
	Fri, 13 Mar 2026 17:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773423606;
	bh=PDjv6lj0xs4XAnUT9GLFnTkZ2gh6Ra2uKalbK9P5GpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z7jDdA5hNBdPqR6CluugKTJvOAnuiKRttDzV9aIbeiuNP5DlzDXBzKdsTdJi+0UOJ
	 +YSaSYoQudfpgl87Hl6hzQGq+hUuzqE82xnmxpGi6/YF3zd0Ft8RQePkPSOWweGjb/
	 vYKmi1DRJ6IutTjJYn/8Cy8OpE/GA4Ye/H9t6xbBzAycQgr+4HWS/6asI5GPBmgoy0
	 j3OQIJ1MLXpDrNkyVq6GAJIp1aJ0ax4IqRZTI6N+XaikwIW4jfiWAGTKlgTqUPgzJY
	 pzyOlmuEm6Fw6jsnKv6PcNRAaMTNsLBj9t+dnoztdJV/tQHWBoqCrYndLxySPrvYkO
	 AdwLJTL5rNcRg==
Date: Fri, 13 Mar 2026 17:39:58 +0000
From: Conor Dooley <conor@kernel.org>
To: lizhi2@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	wens@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
	weishangjuan@eswincomputing.com
Subject: Re: [PATCH net-next v4 1/3] dt-bindings: ethernet: eswin: add clock
 sampling control
Message-ID: <20260313-stiffness-item-c451eaef970d@spud>
References: <20260313075234.1567-1-lizhi2@eswincomputing.com>
 <20260313075351.1584-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7F9kwIhbyHy1RjqW"
Content-Disposition: inline
In-Reply-To: <20260313075351.1584-1-lizhi2@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_104006_721982_20CE9A58 
X-CRM114-Status: GOOD (  19.90  )
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


--7F9kwIhbyHy1RjqW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 03:53:51PM +0800, lizhi2@eswincomputing.com wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
>=20
> Due to chip backend reasons, there is already an approximately 4-5 ns
> skew between the RX clock and data of the eth1 MAC controller inside
> the silicon.
>=20
> For 1000M, the RX clock must be inverted since it is not possible to
> meet the RGMII timing requirements using only rx-internal-delay-ps on
> the MAC together with the standard 2 ns delay on the PHY. Therefore,
> even on a properly designed board, eth1 still requires RX clock
> inversion.
>=20
> This behaviour effectively breaks the RGMII timing assumptions at the
> SoC level.
>=20
> For the TX path of eth1, there is also a skew between the TX clock
> and data on the MAC controller inside the silicon. This skew happens
> to be approximately 2 ns. Therefore, it can be considered that the
> 2 ns delay of TX is provided by the MAC, so the TX is compliant with
> the RGMII standard.
>=20
> For 10/100 operation, the approximately 4-5 ns skew in the chip does
> not break the standard. The RGMII timing table (Section 3.3) specifies
> that for 10/100 operation the maximum value is unspecified:
> https://community.nxp.com/pwmxy87654/attachments/pwmxy87654/imx-processor=
s/20655/1/RGMIIv2_0_final_hp.pdf
>=20
> Due to the eth1 silicon behavior described above, a new compatible
> string "eswin,eic7700-qos-eth-clk-inversion" is added to the device
> tree. This allows the driver to handle the differences between eth1
> and eth0 through dedicated logic.
>=20
> The rx-internal-delay-ps and tx-internal-delay-ps properties now use
> minimum and maximum constraints to reflect the actual hardware delay
> range (0-2540 ps) applied in 20 ps steps. This relaxes the binding
> validation compared to the previous enum-based definition and avoids
> regressions for existing DTBs while keeping the same hardware limits.
>=20
> Treat the RX/TX internal delay properties as optional, board-specific
> tuning knobs and remove them from the example to avoid encouraging
> their use.
>=20
> In addition, the binding now includes additional background information
> about the HSP CSR registers accessed by the MAC. The TXD and RXD delay
> control registers are included so the driver can explicitly clear any
> residual configuration left by the bootloader.
>=20
> Background reference for the High-Speed Subsystem and HSP CSR block is
> available in Chapter 10 ("High-Speed Interface") of the EIC7700X SoC
> Technical Reference Manual, Part 4
> (EIC7700X_SoC_Technical_Reference_Manual_Part4.pdf):
> https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual=
/releases
>=20
> There are currently no in-tree users of the EIC7700 Ethernet driver, so
> these changes are safe.
>=20
> Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC7700 =
SoC")
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>

Krzysztof might not yet be happy with the compatible naming, but from my
pov:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--7F9kwIhbyHy1RjqW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabRL7gAKCRB4tDGHoIJi
0qJLAP0c1yh00ld+1PBzXG2QWRzTWLz4Bu2S3D1IL4VcXwRdmAD8D13YNNMzL8Jb
WJXhFrH1ZO+pCsRM64k+gar0NbK4lwc=
=pXlI
-----END PGP SIGNATURE-----

--7F9kwIhbyHy1RjqW--

