Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90475EF0713
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 06:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3h399uqdq25x5hxIFW7zZwuybkzAN1xO/8T0xQ5AjvU=; b=AmdDLHWowKOc1kMLhmX68Gk/Lh
	WWmJPRib6YPvKpdrT0r0ryLdIbgNpUR0WHeCSzAoRZcswKDD6fEZlIAhYXHwbH5zC5kmgkX1CHflB
	a6o5eYjfUak1UNajOJlUYDlp4zL76m2YKER4+boG09keyjQnJTKtZfnR+XJr4L73Pab7O+joAibyT
	EzExypkgS+B01/OAQr+6jnewRpwjQkvRDBx2IqBVB6PpXCskO73qwh5qJ6Z+Dy96eLsQy1qBePrtH
	RPUAmp5GsSsbkPTuWuoxd1CeQXbGKr8zfb+JQuHWVMzDIQ1Q7IKHW009cp8IN3OtAtf6PEaT50S5A
	ovTMrCmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpL4q-0000000EvHr-1Hir;
	Mon, 09 Feb 2026 06:48:56 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpL4n-0000000EvHL-1HqD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 06:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770619728;
	bh=3h399uqdq25x5hxIFW7zZwuybkzAN1xO/8T0xQ5AjvU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aMKEZF13ngPb4ltFbv/7dlAQBi3w4hNbKatvSU5ni0L+HP2hn04pPNZ1PJxJbfe3J
	 hKKj/z4yG30GvmWiAqpk6YDtSYVA7lFSerKA++iT12J0tJAygkO/h8lhOmfjNXqNSw
	 cuaQ0gks35WQRpAtTmmtEnva/ojY0qR03anUlUqYnyaoOEShsmfG28l7dpqUGQ12Ns
	 HdBBYHBeH2elUrmDYLKdNaxCBKkOZVZiphXzp4I9EBi68D8NtHAfjV4Xpr4FyBaUAX
	 K/AJ8/8Y0fPSMlVaXTSNj2R6H6GKs7KwI9edm4MZgugxZ+LjAto2okRuM3HWnfrwD+
	 uwM19bR/jynpQ==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6D38A602DE;
	Mon,  9 Feb 2026 14:48:46 +0800 (AWST)
Message-ID: <505227cc664cf309eede2640442bad45af1dcf37.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: anacapa: add new sgpio line names
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Colin Huang <u8813345@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Colin.Huang2@amd.com, Carl.Lee@amd.com, Peter.Shen@amd.com
Date: Mon, 09 Feb 2026 17:18:45 +1030
In-Reply-To: <20260202-anacapa-dts-sgpio-v1-1-a3a7b0b087f0@gmail.com>
References: <20260202-anacapa-dts-sgpio-v1-1-a3a7b0b087f0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_224853_559640_C723B081 
X-CRM114-Status: GOOD (  18.14  )
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

On Mon, 2026-02-02 at 14:31 +0800, Colin Huang wrote:
> Updated items:

What's below repeats what the diff tells us, and as such isn't useful
information. The useful information is missing: The motivation for
these changes.

Why are you adding these now? Why were they not added previously? Are
they all in support of the same high-level feature? Or are multiple
features driving the addition of each of these line names? If there are
multiple motivations, why should these all be added in one patch and
not several?

Generally, please try to take onboard the suggestions here:

https://docs.kernel.org/process/submitting-patches.html#describe-your-chang=
es

> - Add BMC_AINIC0_WP_R2_L and BMC_AINIC1_WP_R2_L
> - Place LEAK_DETECT_RMC_N in the correct slot

... for instance, why did it end up being described for the incorrect
slot? Was it just a mistake in the documentation? A mistake by the
original DTS author? Or a new (and incompatible) revision of the
hardware design?

Answering these kinds of questions tends to motivate making such
changes their own patch.

> - Add PRSNT_NFC_BOARD_R
> - Add IRQ_NFC_BOARD_R and RSMRST_N
> - Add DC_OFF, EAM_MOD_PWR_GD_TIMEOUT, CPLD_AMC_STBY_PWR_EN
> - Add FM_MAIN_PWREN_RMC_EN_ISO


>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
> The following changes are included:
> - Add BMC_AINIC0_WP_R2_L and BMC_AINIC1_WP_R2_L
> - Correct placement of LEAK_DETECT_RMC_N
> - Add PRSNT_NFC_BOARD_R
> - Add IRQ_NFC_BOARD_R and RSMRST_N
> - Add DC_OFF, EAM_MOD_PWR_GD_TIMEOUT, CPLD_AMC_STBY_PWR_EN
> - Add FM_MAIN_PWREN_RMC_EN_ISO

This repeats what's in the commit message and also isn't useful, though
at least it's not ultimately included in the commit itself.

> ---
> =C2=A0.../boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts=C2=A0=C2=A0 | 1=
9 +++++++++++--------
> =C2=A01 file changed, 11 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> index 221af858cb6b..37bccf64c77b 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> @@ -852,15 +852,15 @@ &sgpiom0 {
> =C2=A0	"Channel1_leakage_EAM0", "FM_SCM_JTAG_MUX_SEL",
> =C2=A0	"Channel2_leakage_Manifold1", "FM_BRIDGE_JTAG_MUX_SEL",
> =C2=A0	"Channel3_leakage", "FM_CPU0_NMI_SYNC_FLOOD_N",
> -	"Channel4_leakage_Manifold2", "",
> -	"Channel5_leakage_EAM1", "",
> +	"Channel4_leakage_Manifold2", "BMC_AINIC0_WP_R2_L",
> +	"Channel5_leakage_EAM1", "BMC_AINIC1_WP_R2_L",
> =C2=A0	"Channel6_leakage_CPU_DIMM", "",
> =C2=A0	"Channel7_leakage_EAM2", "",
> =C2=A0
> =C2=A0	/* C0-C7 line 32-47 */
> -	"RSVD_RMC_GPIO3", "", "", "",
> +	"RSVD_RMC_GPIO3", "", "LEAK_DETECT_RMC_N", "",
> +	"", "", "", "",
> =C2=A0	"", "", "", "",
> -	"LEAK_DETECT_RMC_N", "", "", "",
> =C2=A0	"", "", "", "",
> =C2=A0
> =C2=A0	/* D0-D7 line 48-63 */
> @@ -893,7 +893,7 @@ &sgpiom0 {
> =C2=A0	"PWRGD_CHIL_CPU0_FPGA", "",
> =C2=A0	"PWRGD_CHEH_CPU0_FPGA", "",
> =C2=A0	"PWRGD_CHAD_CPU0_FPGA", "FM_BMC_READY_PLD",
> -	"", "",
> +	"PRSNT_NFC_BOARD_R", "",
> =C2=A0
> =C2=A0	/* H0-H7 line 112-127 */
> =C2=A0	"PWRGD_P3V3", "",
> @@ -922,7 +922,8 @@ &sgpiom0 {
> =C2=A0	"BRIDGE_R_MAIN_PG_R", "",
> =C2=A0	"BRIDGE_L_STBY_PG_R", "",
> =C2=A0	"BRIDGE_R_STBY_PG_R", "",
> -	"", "", "", "",
> +	"IRQ_NFC_BOARD_R", "",
> +	"RSMRST_N", "",
> =C2=A0
> =C2=A0	/* K0-K7 line 160-175 */
> =C2=A0	"ADC_I2C_ALERT_N", "",
> @@ -956,7 +957,9 @@ &sgpiom0 {
> =C2=A0	"AMC_STBY_PGOOD_R", "",
> =C2=A0	"CPU_AMC_SLP_S5_R_L", "",
> =C2=A0	"AMC_CPU_EAMPG_R", "",
> -	"", "", "", "",
> +	"DC_OFF", "",
> +	"EAM_MOD_PWR_GD_TIMEOUT", "",
> +	"CPLD_AMC_STBY_PWR_EN", "",
> =C2=A0
> =C2=A0	/* O0-O7 line 224-239 */
> =C2=A0	"HPM_PWR_FAIL", "Port80_b0",
> @@ -966,7 +969,7 @@ &sgpiom0 {
> =C2=A0	"FM_CPU0_THERMTRIP_N", "Port80_b4",
> =C2=A0	"PVDDCR_SOC_P0_OCP_L", "Port80_b5",
> =C2=A0	"CPLD_SGPIO_RDY", "Port80_b6",
> -	"", "Port80_b7",
> +	"FM_MAIN_PWREN_RMC_EN_ISO", "Port80_b7",
> =C2=A0
> =C2=A0	/* P0-P7 line 240-255 */
> =C2=A0	"CPU0_SLP_S5_N_R", "NFC_VEN",
>=20
> ---
> base-commit: 26705fad17bd111f062f4208df2dd60e7a9c2ecd
> change-id: 20260202-anacapa-dts-sgpio-e4e0ba5c2cd5
>=20
> Best regards,

