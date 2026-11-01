Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CBA606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FXBGekdE;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=f3h37cP4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Pb2tgUvSCnXik9d7e+k7c23WDjV6nr8u+NYxLcvKygc=; b=FXBGekdEUuT57g5zP47ttgKEdr
	GMAc+586ZsH3bl3E098YCJAeXuPkH+gYmPRdizW5tzO477hwm8pH6XV1wfGO6DAn6MsYxuRZlTOmh
	VvL/jW6Suf8ECcCsLhPL/s3peWJghpGWWGq+wsWHbUQe5norkGRzWAQ+c3V9PUsq+x58jdKANptbN
	lRcmwR3pj5KiSYfqulRrx3woT407Uw+EzVonKO6viWPMtroCmPGNVQjLPmGUucwlbaA+cEdzbPaPS
	K7vH5hlgmrnXVL+cvKW2l2vbJ4UUTjUNXeKvtgktqwKzatkc12777ws5jp98DNDwc3KcJv7FbJEfG
	nyEv0Qlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNWC9-0000000EZCP-10L5;
	Sun, 01 Nov 2026 14:06:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNWC6-0000000EZBn-3YRN;
	Sun, 01 Nov 2026 14:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Pb2tgUvSCnXik9d7e+k7c23WDjV6nr8u+NYxLcvKygc=; b=f3h37cP4p7Is2X4TRLMrgHrtFy
	8sv5yL/fdmgiuWxyCUNn/Q2YIlV4y8NA0atk/aDivmvAyaVqAp7XH7aAkA5zqfOO+dSrACQRF3XsZ
	qGGMuYBkVlCejDDQYEJUWR51EmubT57Ehstj+sLN8/Jj1m32JRG1PQoXarqjjOrkKW0DcyEVHtkIv
	tqKvrVkZCnt4c32AYEV3eTYZ9LI04N+DCAflaTg6OY7z8BlckXcpiBwcyVYVt/o7/RbMcBUqq0Dyn
	/r0RtfZyuvu51bg2EEm6VqYQC0kHQy0aQCFBFCQE1XyW8R6zgyMSs9w5ZgHR29ToiocQUs5AfiJJ/
	TQxYC2dw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Coia Prant <coiaprant@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Coia Prant <coiaprant@gmail.com>
Subject: Re: [PATCH v12 1/3] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock
 nodes
Date: Sun, 01 Nov 2026 15:05:43 +0100
Message-ID: <2977688.AiC22s8V5E@phil>
In-Reply-To: <20261023053548.1595033-2-coiaprant@gmail.com>
References: <20261023053548.1595033-1-coiaprant@gmail.com>
 <20261023053548.1595033-2-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_060559_049320_5AF0F05C 
X-CRM114-Status: GOOD (  21.02  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Am Freitag, 23. Oktober 2026, 07:35:46 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Coia Prant:
> The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
> the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
> interfaces via its four MII ports.  Add the XPCS device node to the
> SoC device tree.
>=20
> The XPCS device is accessed via the APB3 bus at 0xfda00000 and
> requires the CSR clock (PCLK_XPCS) for register access and the EEE
> clock (CLK_XPCS_EEE) for Energy Efficient Ethernet operation.  The
> PD_PIPE power domain must be enabled before any register access.
>=20
> Also add two fixed-clock nodes (clock-xpcs-gmac0 and clock-xpcs-gmac1,
> labelled clk_gmac0_xpcs_mii and clk_gmac1_xpcs_mii) providing the
> 125 MHz reference clock for the GMACs when operating with XPCS.  Their
> clock-output-names match the CRU mux parent names in clk-rk3568.c, so
> boards can reparent SCLK_GMAC0_RX_TX / SCLK_GMAC1_RX_TX through
> assigned-clock-parents.
>=20
> The XPCS node is disabled by default and must be enabled at the board
> level when 1000BASE-X/SGMII/QSGMII is in use.  The fixed-clock nodes
> are always present and do not have a status property, as they are
> static clock sources.
>=20
> The XPCS node requires a reference to the appropriate Naneng Combo PHY
> via the phys property.  dtbs_check only validates required properties
> for enabled nodes, so the SoC dtsi does not provide phys: boards that
> enable the XPCS must supply it, since the SerDes link is a board-level
> design choice (combphy1 on some boards, combphy2 on others).
>=20
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3568.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3568.dtsi
> index 3bc653f027f1f..20a72785adbc2 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> @@ -8,6 +8,20 @@
>  / {
>  	compatible =3D "rockchip,rk3568";
> =20
> +	clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <125000000>;
> +		clock-output-names =3D "clk_gmac0_xpcs_mii";
> +		#clock-cells =3D <0>;
> +	};
> +
> +	clk_gmac1_xpcs_mii: clock-xpcs-gmac1 {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <125000000>;
> +		clock-output-names =3D "clk_gmac1_xpcs_mii";
> +		#clock-cells =3D <0>;
> +	};
> +

these clocks don't belong here.

When you place these nodes in the main, they seem to come out of
thin air, while that might be true for some boards, that they
have dedicated oscillators for that, this will likely not be true
for all.

So these should be defined in the board dts, to match the actual
hardware.


Heiko




