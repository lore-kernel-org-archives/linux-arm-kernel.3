Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6524F109E54B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 06:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOXu1h7wNBU0MwKwR9KWxa8v2aRV0Z0aQ49i9AHsRjA=; b=OUKqjjMhusRFQeKErptvDoyDKQ
	lphZqnwZczuzhGFPjjncxFjXr1DKzRbOSzqOPxjxpvFO5BuZif6LKYS7P8o+DpVzuvorf0+LROETb
	OqiA+0r9lNsHt3W0p9X3tuQIs10KU8EpyYfp1iv2KyFwlRZwtWDKO1UPqC7amJoFQF3ZSxCdAFaPt
	jKuGQ9egPpcmi070M/w6vfJAq3qiYp9/WrjiClBQmqSOD4o9NCkJWTKwLDRyRixViFyY6qudKXFOH
	SS8wR0jtZOs5RUEs4179NjdBxNL/w5YvhNJ3RoUhxQsecoFU4YZfF2MyLc4tMgO5zAx6XQ4NjwTfl
	m1OVmiMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eRm-00000004rhO-25ya;
	Thu, 26 Mar 2026 06:44:02 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eRj-00000004rh2-2HGx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 06:44:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774507435;
	bh=vOXu1h7wNBU0MwKwR9KWxa8v2aRV0Z0aQ49i9AHsRjA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Bf9/ogWGTOWi9NWWT9MjUL9Xb1gjCktDc22xDsaivLJwvaS7q8h5C23xkT/LuqKDP
	 zNantjz4ge2Q6oLy8byxuFDXcu/NCMtwp4sAargNiSXUILCWq24o5O1afnUOF2tz9g
	 4Eb2KvSzTpfv6o6z+ft7X7JK6I0Cnx6pElqB+66gZJ4QkVZcG7FsmBQ+El9evKu9vd
	 z9F6EoHHNrxdBxTfVf8XLOwmRtbYtX4fl3ZoTChx7FgNE+TG4I+qC7b8Fur1FBNv9E
	 R42CYgLOWyulFYM1cwKjq2Jw2NLAsxRmtW0/pfR+9z9sLcYRPyRoUJQGqoTyOXt87a
	 PBtgDQ3v6mJVw==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B68C46597C;
	Thu, 26 Mar 2026 14:43:54 +0800 (AWST)
Message-ID: <47adfd499195738bd5539c4e438af5dc1ae75559.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/3] ARM: dts: aspeed: anacapa: update SGPIO mappings
 for DFT integration
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Colin Huang <u8813345@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Colin.Huang2@amd.com, Carl.Lee@amd.com, Peter.Shen@amd.com
Date: Thu, 26 Mar 2026 17:13:54 +1030
In-Reply-To: <20260310-anacapa-dts-sgpio-v3-2-12d9b7f1202e@gmail.com>
References: <20260310-anacapa-dts-sgpio-v3-0-12d9b7f1202e@gmail.com>
	 <20260310-anacapa-dts-sgpio-v3-2-12d9b7f1202e@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_234359_803631_5C34914D 
X-CRM114-Status: GOOD (  13.07  )
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

Hi Colin,

On Tue, 2026-03-10 at 17:49 +0800, Colin Huang wrote:
> Update SGPIOM0 GPIO line names and signal mappings to align with the
> latest DFT (Design For Tooling) integration requirements.
>=20
> This change reworks SGPIO input/output assignments, replaces legacy
> or reserved placeholders, and updates signal naming to match the
> definitions provided by the CPLD on 2026-03-03.=C2=A0
>=20

I feel this statement isn't super helpful, but no matter.

> The update improves
> signal clarity and correctness across leakage detection, presence,
> fault, power-good, and debug-related GPIOs.

I prefer you drop this assessment.

>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
> =C2=A0.../dts/aspeed/aspeed-bmc-facebook-anacapa.dts=C2=A0=C2=A0=C2=A0=C2=
=A0 | 143 ++++++++++++---------
> =C2=A01 file changed, 83 insertions(+), 60 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> index 3e297abc5ba4..85b7e027daef 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> @@ -862,89 +862,106 @@ &sgpiom0 {
> =C2=A0	ngpios =3D <128>;
> =C2=A0	bus-frequency =3D <2000000>;
> =C2=A0	gpio-line-names =3D
> -	/*in - out - in - out */
> +	/*in - out */
> =C2=A0	/* A0-A7 line 0-15 */
> -	"", "FM_CPU0_SYS_RESET_N", "", "CPU0_KBRST_N",
> -	"", "FM_CPU0_PROCHOT_trigger_N", "", "FM_CLR_CMOS_R_P0",
> -	"", "Force_I3C_SEL", "", "SYSTEM_Force_Run_AC_Cycle",
> -	"", "", "", "",
> +	"L_FNIC_FLT", "FM_CPU0_SYS_RESET_N",
> +	"L_BNIC0_FLT", "CPU0_KBRST_N",
> +	"L_BNIC1_FLT", "FM_CPU0_PROCHOT_trigger_N",
> +	"L_BNIC2_FLT", "FM_CLR_CMOS_R_P0",
> +	"L_BNIC3_FLT", "Force_I3C_SEL",
> +	"L_RTM_SW_FLT", "SYSTEM_Force_Run_AC_Cycle",
> +	"", "",
> +	"", "",
> =C2=A0
> =C2=A0	/* B0-B7 line 16-31 */
> =C2=A0	"Channel0_leakage_EAM3", "FM_CPU_FPGA_JTAG_MUX_SEL",
> =C2=A0	"Channel1_leakage_EAM0", "FM_SCM_JTAG_MUX_SEL",
> =C2=A0	"Channel2_leakage_Manifold1", "FM_BRIDGE_JTAG_MUX_SEL",
> =C2=A0	"Channel3_leakage", "FM_CPU0_NMI_SYNC_FLOOD_N",
> -	"Channel4_leakage_Manifold2", "",
> -	"Channel5_leakage_EAM1", "",
> -	"Channel6_leakage_CPU_DIMM", "",
> -	"Channel7_leakage_EAM2", "",
> +	"Channel4_leakage_Manifold2", "BMC_AINIC0_WP_R2_L",
> +	"Channel5_leakage_EAM1", "BMC_AINIC1_WP_R2_L",
> +	"Channel6_leakage_CPU_DIMM", "CPLD_BUF_R_AGPIO330",
> +	"Channel7_leakage_EAM2", "CPLD_BUF_R_AGPIO331",
> =C2=A0
> =C2=A0	/* C0-C7 line 32-47 */
> -	"RSVD_RMC_GPIO3", "", "LEAK_DETECT_RMC_N", "",
> -	"", "", "", "",
> -	"", "", "", "",
> -	"", "", "", "",
> +	"RSVD_RMC_GPIO3", "RTM_MUX_L",
> +	"LEAK_DETECT_RMC_N", "RTM_MUX_R",
> +	"HDR_P0_NMI_BTN_BUF_R_N", "FPGA_JTAG_SCM_DBREQ_N",
> +	"No_Leak_Sensor_flag", "whdt_sel",
> +	"", "",
> +	"", "",
> +	"", "",
> +	"", "",
> =C2=A0
> =C2=A0	/* D0-D7 line 48-63 */
> -	"PWRGD_PDB_EAMHSC0_CPLD_PG_R", "",
> -	"PWRGD_PDB_EAMHSC1_CPLD_PG_R", "",
> -	"PWRGD_PDB_EAMHSC2_CPLD_PG_R", "",
> -	"PWRGD_PDB_EAMHSC3_CPLD_PG_R", "",
> -	"AMC_BRD_PRSNT_CPLD_L", "", "", "",
> -	"", "", "", "",
> +	"PWRGD_CHAD_CPU0_FPGA", "",
> +	"PWRGD_CHEH_CPU0_FPGA", "",
> +	"PWRGD_CHIL_CPU0_FPGA", "",
> +	"PWRGD_CHMP_CPU0_FPGA", "",
> +	"AMC_BRD_PRSNT_CPLD_L", "",

Can you discuss this patch in the context of my other replies to both
yourself and Kevin?

https://lore.kernel.org/all/d7794f74b26bbc1ee0a70e39c5671acc018f80eb.camel@=
codeconstruct.com.au/

Andrew

