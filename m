Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA999606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 04:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zZxcJRUE;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NHUWNiSx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vC8HOCnxy/lzUp+Ht8qxxa5+nf9vhpeFVa8uB5As2Lc=; b=zZxcJRUE1gU16G5MneaVymhS75
	kqs5GInezNgKOORNk2PgWNazE5e3tKsX28mLSklxIXdXqpIpL95bfc7AQ0pd/IFlGAXH8uyOGO6kx
	/WffYGmWcpi6P1RiRAbE4Zp2I+PWiR+UQ2drNlKI1D7sbcIhwlt0R14qhKGVqXnkH7Qvx0kgWvjW0
	IZRsxUoA8gNHxMfLiYwvfapN7Rmhki1fuzBIZwZSl9WnKEqtT8TOsm7R7VLAOx3fuIFhSCvqpFrX7
	aRPTDkNyIriPR99Kjazlpn7L/6cBKqYjMeC0pnag/qgqB0suE2YDCkPR0G9QVdVRd9eVbW7GNbAKw
	3C6Pja4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKTAH-0000000HPPh-3ENs;
	Sat, 24 Oct 2026 04:15:29 +0000
Received: from mail-pl1-x662.google.com ([2607:f8b0:4864:20::662])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKTAE-0000000HPPF-3VPC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 04:15:28 +0000
Received: by mail-pl1-x662.google.com with SMTP id d9443c01a7336-2e831e86ebfso8853995ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 21:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792815325; x=1793420125;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vC8HOCnxy/lzUp+Ht8qxxa5+nf9vhpeFVa8uB5As2Lc=;
        b=CAQCK+olspGxvA4c8HRjZ+YRttktVF6L+61O3TLjXBIEoE3HKr5z4K/g4LWhSsdiIT
         gr+oCw+pm85jeFXIU9QYrZ32vn/7NEfJq5CU3gZGjq+u4/AZ5Hkm2GBbxtb+jELxqsWh
         arGPhjGz5eA+x2O6OwmFHaAgVvpmq2t47fopC+k9rCqr+0mPfA4XOcONkKIMFMu35kw2
         nzB75inWwJjS/VZP0LecMlpj6IfNGGGyWsGhs3x4XrH8WgxQK2LEwo19dbvXYg/iErMd
         W+Gl9xl7jGzXgGWG67XzChCBUjPBNkddLMGCEdMA6aZ6V2r16jqoUQNwA/3U5nZgBex2
         AhLg==
X-Forwarded-Encrypted: i=1; AKwUvBzfPhAE2jfdWci7Bp8tsNIxEkCpBqG1pP1FujZE2E21VyGFgT9IcsXWOQQ9tXWB7yIKGUUOr2CkadrJtmRmkaMl@lists.infradead.org
X-Gm-Message-State: AFq9FYKHmY55yCAyeyV8guMJAY+CGKHvNLAT4FX/He2+1sIlZjuR7BXf
	+bjk9mDStcRabSnaoZduPvjmDjhpD7RYM39ozm9GA867Kc0PF16nZsDAHF25RMUDq47FqRdJW5W
	WOCA1CJHnCzriOUxkBsmmgBnVFT9BrIL3/sALmKo17jnMW50MNMcD9CK1Had6rETxQsFxEVHTgh
	JJkoeXuUwkFB9lDBozPST9qVTqxOHMevatPeZlrSvT1AkzJmI94Bnpm6y1fg1fo3Ia9E+SMUwfC
	mihtp/kKwC5vo8ngkx+HqkYMwxuryc=
X-Gm-Gg: AYBFou00ZuIuEyK6LL/McgPqm9Vie2S+kRasE8uAIAtUKoCJ0RnP26GsCCbC6eqerCD
	oUXjgcDzrOo2sbd03j9MjHOK7HXxUxn7h6JrjnEerJ5pY4QH7lRrgVMYKGyyueMKLKqNsS3zZdh
	roig93kAnvCisXOWkSYKLMv7XpUWuXafeN0DgH+++XG1Rpr1bLsJmIvXs4SElo5ZM6Sev4HBBZi
	Mvac4USzvcX65BiszOUPr8J7zfdSi2deV3W27HASwHjBlZyBGrMrT8tCCgXeDpD1HmX91urSVkN
	2pornUsdDvDs8JIWifOjOuIxT3G6/tKAChpRIpsZ6F3ZRSG4MSpc2NMdBRBkqgnHo5SHWfQhEoq
	8Bo/KLfc0k54i4GrbcpEU++vKQgJoYsHCkz8OVOpv49gJaILUE7H7HKD+DpwrnFk/Ikda9VaOoS
	6YoFOS6beWfYCjBoFeU066Hzh2CsOgljkbYz1a
X-Received: by 2002:a17:90b:4ac9:b0:3a7:db88:3491 with SMTP id 98e67ed59e1d1-3adeabe4324mr923700a91.33.1792815324452;
        Fri, 23 Oct 2026 21:15:24 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adebd531f0sm989246a91.4.2026.10.23.21.15.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Oct 2026 21:15:24 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8ab3dc2a7adso25148267b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 21:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792815323; x=1793420123; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vC8HOCnxy/lzUp+Ht8qxxa5+nf9vhpeFVa8uB5As2Lc=;
        b=NHUWNiSx/wOEHv4QmpfaO2rYyai+RKr1s8S6xC+uWp5UxB7x3qIGlvYGQWChDpxrf2
         y8bTZRHZdyvIL879gNxPfibnu9lHBwVa2vU4BlBp6XwVugo0fMG6eAQznIQmtoEWEn/C
         r/mTPw6UmTmXKHhkCa+0P/5q4TO3MHkui+xro=
X-Forwarded-Encrypted: i=1; AKwUvByGS0xgauwI6a1yHbalq/Ws+C7xEd5QBzYAuYS8kQyDy2mmCUIjajvS100uBqYYuv7FDv20TJHqPjqsR4BAXFGD@lists.infradead.org
X-Received: by 2002:a05:690c:e0d2:10b0:8b0:e238:2716 with SMTP id 00721157ae682-8b1669e4693mr5708747b3.2.1792815323015;
        Fri, 23 Oct 2026 21:15:23 -0700 (PDT)
X-Received: by 2002:a05:690c:e0d2:10b0:8b0:e238:2716 with SMTP id
 00721157ae682-8b1669e4693mr5708687b3.2.1792815322635; Fri, 23 Oct 2026
 21:15:22 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
 <20261021-genexis-xg6846-smp-v7-3-rc1-v3-2-7c871f1755db@kernel.org>
In-Reply-To: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-2-7c871f1755db@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Fri, 23 Oct 2026 21:15:10 -0700
X-Gm-Features: AclHuK-gGJpSwkg-29bJjBMoh3mShMyyFMuIMm4hsVsfGjBF1BHx2Sk3mGmLrfc
Message-ID: <CAHi4H7FLByZDW2QjwFUfzm=E2Kiq_igQMZS-7smgLrLWwM0Lmg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ARM: bcm: Add CFE SMP support for BCMBCA
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000007dcbf9065e8e58ab"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_211526_943311_1C670169 
X-CRM114-Status: GOOD (  33.01  )
X-Spam-Score: -2.4 (--)
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

--0000000000007dcbf9065e8e58ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 8:10=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> The XG6846B CFE bootloader powers up CPU1 and leaves it in a holding pen
> waiting for an interrupt. After waking, the stub reads the GPIO
> GeneralPurpose register at 0xff800568 and branches to the stored address
> in ARM state. The vendor kernel uses this mailbox and a wakeup IPI.
>
> Implement the brcm,bca-smp CPU enable-method for BCMBCA systems
> booted through CFE.
> Read the mailbox address from the secondary CPU's cpu-release-addr
> property. Map it as device memory, write secondary_startup_arm and
> complete the write before sending the wakeup IPI. CPU1 is already
> running, so no power or reset sequence is needed. Using the ARM entry
> also supports kernels built in Thumb-2 mode. Clear any Thumb function
> pointer tag before programming this ARM entry address.
>
> Register the operations with CPU_METHOD_OF_DECLARE() so the CPU
> nodes select CFE bring-up explicitly. Build the BCMBCA machine
> description independently of DEBUG_BCMBCA, keeping the debug UART
> mapping conditional. The generic ARM startup code retains PSCI priority.
>
> Suggested-by: William Zhang <william.zhang@broadcom.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm/mach-bcm/Makefile       |  2 +-
>  arch/arm/mach-bcm/board_bcmbca.c | 56 ++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 57 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
> index 6baedf4c6304..fcc4e0174adc 100644
> --- a/arch/arm/mach-bcm/Makefile
> +++ b/arch/arm/mach-bcm/Makefile
> @@ -58,6 +58,6 @@ endif
>
>  # BCMBCA
>  ifeq ($(CONFIG_ARCH_BCMBCA),y)
> -obj-$(CONFIG_DEBUG_BCMBCA)     +=3D board_bcmbca.o
> +obj-y                          +=3D board_bcmbca.o
>  obj-$(CONFIG_SMP)              +=3D bcm63xx_smp.o bcm63xx_pmb.o
>  endif
> diff --git a/arch/arm/mach-bcm/board_bcmbca.c b/arch/arm/mach-bcm/board_b=
cmbca.c
> index b510d959870a..248b8bd77645 100644
> --- a/arch/arm/mach-bcm/board_bcmbca.c
> +++ b/arch/arm/mach-bcm/board_bcmbca.c
> @@ -1,9 +1,15 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  // Copyright (C) 2024 Linus Walleij <linus.walleij@linaro.org>
>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/smp.h>
> +
>  #include <asm/mach/arch.h>
>  #include <asm/mach/map.h>
> +#include <asm/smp_plat.h>
>
> +#ifdef CONFIG_DEBUG_BCMBCA
>  /* This is needed for LL-debug/earlyprintk/debug-macro.S */
>  static struct map_desc bcmbca_io_desc[] __initdata =3D {
>         {
> @@ -13,12 +19,62 @@ static struct map_desc bcmbca_io_desc[] __initdata =
=3D {
>                 .type =3D MT_DEVICE,
>         },
>  };
> +#endif
>
>  static void __init bcmbca_map_io(void)
>  {
> +#ifdef CONFIG_DEBUG_BCMBCA
>         iotable_init(bcmbca_io_desc, ARRAY_SIZE(bcmbca_io_desc));
> +#endif
>  }
>
> +#ifdef CONFIG_SMP
> +static int bcmbca_boot_secondary(unsigned int cpu, struct task_struct *i=
dle)
> +{
> +       struct device_node *np;
> +       void __iomem *mailbox;
> +       u32 release_addr;
> +       int ret;
> +
> +       /* CFE has already powered up CPU1 and left it waiting in WFI. */
> +       if (cpu_logical_map(cpu) !=3D 1)
> +               return -EINVAL;
> +
> +       np =3D of_get_cpu_node(cpu, NULL);
> +       if (!np)
> +               return -ENODEV;
> +
> +       ret =3D of_property_read_u32(np, "cpu-release-addr", &release_add=
r);
> +       of_node_put(np);
> +       if (ret) {
> +               pr_err("CPU%u: missing or invalid cpu-release-addr proper=
ty\n", cpu);
> +               return ret;
> +       }
> +
> +       mailbox =3D ioremap(release_addr, sizeof(u32));
> +       if (!mailbox)
> +               return -ENOMEM;
> +
> +       /*
> +        * The CFE stub reads GPIO GeneralPurpose after an interrupt and
> +        * branches to it in ARM state. Clear any Thumb function pointer
> +        * tag and complete the MMIO write before sending the wakeup IPI.
> +        */
> +       writel(__pa_symbol(secondary_startup_arm) & ~1, mailbox);
> +       dsb(sy);
> +       arch_send_wakeup_ipi_mask(cpumask_of(cpu));
> +       iounmap(mailbox);
> +
> +       return 0;
> +}
> +
> +static const struct smp_operations bcmbca_smp_ops __initconst =3D {
> +       .smp_boot_secondary =3D bcmbca_boot_secondary,
> +};
> +
> +CPU_METHOD_OF_DECLARE(bcmbca_smp, "brcm,bca-smp", &bcmbca_smp_ops);
> +#endif
> +
>  static const char * const bcmbca_dt_compat[] =3D {
>         /* TODO: Add other BCMBCA SoCs here to get debug UART support */
>         "brcm,bcm6846",
>
> --
> 2.56.0
>

Reviewed-by: William Zhang <william.zhang@broadcom.com>

--0000000000007dcbf9065e8e58ab
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
PRi27wH/XHTDMdyL0Org+kxniXue6MSNJvcQwaLO/UQrmgTygBlVGa+Qg9ZFfS00xvuqeYH7tImO
48WiXeu9rgn5KTH0IWP1+R74KIgxJQ+65la+caZvxwC9V3ik5p/LOGA2qS4GEjGuaYF8QKhRTR4h
/QBSktqZLbzVxpjJXrqFTA2BLlYRp9hPhqNxbn46WuLufpMWhFtjUoQi/8fRRWRsMAY0o1J0f+kB
6EI8FoxPTOpvuLRonqHIWMHk5YRnDdqJ3G5Oc8zmV+UCAwEAAaOCAd4wggHaMA4GA1UdDwEB/wQE
AwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5Bggr
BgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUG
A1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUF
BwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDag
NKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJQYD
VR0RBB4wHIEad2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQw
HwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFHjI7pbQZurVKsSRE/a9
7gUEyVCkMA0GCSqGSIb3DQEBCwUAA4ICAQCFA4fU1GnG8sY7kyUXp5tle+VeWveoWb272jPauU5R
w+udkhVXmnR0Kg7RgkCD00PLTKHNRyegXXDMArs3N9NhO3s9eSp9KjDh+h3WuQWCJH3QBHLGW0qE
fyV87wUtBIy/QsHwO4S8OlOZiXECR7V1EGIF6t3s0W+3UzgYeHL+Ttuhda+2wIVY0EbS0eNH9Vob
4YG17VTBBe7hyobXFpd9d1JGENFzIWncPUshOE0Wv7KlkrRc6aBOpL4p5xO1pHi9h9w8utyHkMoV
nefXixkn5YVHnuV/jbSF/IM4Mlqt0E+n/TRp2c0eR+1AauZKENV2syNBo4aMa0BkmikBjLSnDjt/
TYQdwHNWdV495n71idvueWwTFUhUsnudYcnh42eZENopBOYjVu2WhsffyrNz0hsuR85LriqSuBbf
drd9DMo3DgtfJ7hh4sEAhSw/x/Br86rfLBftZMU02htlnkOI9Tp1QuDsr9+MsqY6AjKeXAy67m7H
TVAZ9uyO9N20yU0p7igESOWKR1ccL1TPA1jrSHK18Y75ot5199FNWeE/UKoDKSML39iPZho9XPh/
/RlsfRFiVOPrI5Gwi4YfIfi0jjEWf310/CYEmA5jrp5gUQSdo/+FgfXLKDFiEHCf5b3B1l70r6bR
WkDCNNacYJWZtSp87i6jmw+l5xx7OkEJ9DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAX
BgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1F
IENBIDIwMjMCDD2ooFIye/WiO3KgZTANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg
z3ZQpoCrl/7Hn0Esg0FnwFQWKp/lYw9RnsTOEA2nYHcwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMDI0MDQxNTIzWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEACXqBYSMNIf2CAYP66jG5CSOkBcftdzrU5zYj
FxIH6wkmu9BroTvGqup968Wno6rfyJ6Ptu4VcgV/gQOMNg6IpRemerWM93bFok/XTfMeTEpdGH0W
5jqfg3Uz2sOP66FZjP17X5fQlG+jwVUHIJJVGhyc48ZQa5axLRlXx+j+GOUHQXP9FGYmEC2whMNW
4LlubvhGb6kajQsUPiNyt9uyAwXD5V3bIPoEuwbMNW7A+9ecRAmQWd2Y1XiM7iBSx0BBZQ7ow2Q1
NA59rLpxGg8TzBBZ3xZxCAb2xvfLNv2tnKFJX0smLSQ8iEPAS/jaT/LQ6BGKxb17un9BxYC1ziYy
pA==
--0000000000007dcbf9065e8e58ab--

