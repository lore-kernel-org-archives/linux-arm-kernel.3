Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AD0CCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 05:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2RMho/NQQMZuTKGkng4ri6pAFi2VJEaYxWCgS38+Yw=; b=Lj8NfSUpABpvOvDk6VKwh/HIAE
	opZx+//3cLsl89PjGpxMUVkyDZeXOIFlvqiFWxYvuxnKdwfobG/7RYEzj0bJOCC6gRTSbmVTYgdeW
	xJTXRHNhu12ZLxZ5OOkI3sKGl5RIDavy0e8sUkVqV7ubqgTNaGEKFmD25ef+AjSWs5HmRA8PrSN7x
	q2ctFsZPrfIPcj7oBJEB+ZAD7Cf7bQaY/AkJXQSVxOgSBTVOnYDAuoylduVk0FTGcT2+rH7OL3vL8
	MZlLBgEfYJyI9mubIkt4BSz5L4Xxla6F5B07sBq+bzW6n+3dsNMbf2zR8A9Flj4EGTah6FEER7SUd
	Kzzk/Vmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgBZ-00000006eb6-1M9L;
	Mon, 19 Oct 2026 05:45:25 +0000
Received: from mail-pj1-x1063.google.com ([2607:f8b0:4864:20::1063])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgBV-00000006eaT-3kIK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 05:45:23 +0000
Received: by mail-pj1-x1063.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso973550a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 22:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792388719; x=1792993519;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U2RMho/NQQMZuTKGkng4ri6pAFi2VJEaYxWCgS38+Yw=;
        b=AVepDhl/H1spAO60AeydhCjIexlQxkQokwZJaycLYzHv+fGrk6Mo3UEhXnzJDR9pcr
         ahPUqQh1PaRS+/RxP2pPcAdCcb/8Ffk39/LXkpsZuO240zdv73QoO4lGshCytkTTjNXC
         Tri+B5SpHoqzhtkx9pZ23+kzZhHAztOlT0xpo1/CJu/6sH72NihNszqyI3b1a0v+bR7X
         1I7w3ASnrxx9HeUbMDsxi7cWR3cfYGsHPK5cchh9z9ggaF0aO01DlvRonYep+RaQfCBW
         TJbtm956oRjH6CO7vAh/hC8wGQsQRaHDXebrJZjn502TYH0KwwVYUaZlGSNDmn63NVxU
         OYfg==
X-Forwarded-Encrypted: i=1; AKwUvBy9WCWoJec44ukngcSJfY3xLPRqu9lYtbAE3CU+gntWovTeHVrEPoTZMZVQ0Qetegi7vWF47uIJi4E6yT/d+USZ@lists.infradead.org
X-Gm-Message-State: AFq9FYLfse0hEYcr4sWgQUkc1MSdIl9Tgb3X6GfMwl4M50SXTEaXC61y
	3e4tyfkOjjixtXTxj6XDZfve12lWZda3hsF6K7S1ZbhWOa6q+djwGDhrG08+iGxF6K91B5qBmO7
	nPB6RLl4KZ3AuSlRi+ZnGCPadspY8UhOqrVU8r1ewukeY6/HL+gN9/8GmnZzMoPNWAwP6mhrnou
	uyh6ZcEPgKcVMcQhEZB9td9WS4kB9/+bfjPZ8/ALawQem92pOoWLZLELvDh37X7YoCrv/QxfsrV
	LnzbfLe19z48oHbxElffW0EzD6+KNk=
X-Gm-Gg: AYBFou1alJ5q5hCSoPoSU/l4XYmUToyPVg2t4iz8KJdbMY8GmTeA5O7b7wqaERtagKK
	74fgJ4OSars8VhmXPvFW/xkhMmGfF4B97ZCFW3b4gCjV5EWvl9GLXRb9OCrIRURyMCzHFdsACBo
	5hG+TCjzLbu48uJr8TOkrSVqtrlAbMcIkuRcOz9DhWZ2q9cTUi2pCfUa3oX9pDru3qyx8vlXwDb
	BiKSiG7/qJiqEnQDzqeLMiNLpr7EWDIfT02NdnSjudmH8xRZBfzu77kNzFovhRObsy5u82jQn+P
	Sf7nfDFvDyUbeRl44F95mrfuhNIXXFiZ8ZKXv1Z9qdtvWHZ4qnuHj4d5vlcttrP4KoSTk0UHy3X
	9m8ycG6E+IvyzAQVrLQTO0Dwf57UgvJT3E5Ghob3pcrhSBzDeC5K91Fs5Z8WKsFNOupWzytCUJ2
	Mnkt4dknMkcpVq91qCajHClJZPu499gUwZ3fDE
X-Received: by 2002:a17:90b:4b92:b0:3ac:4e18:238c with SMTP id 98e67ed59e1d1-3acef52acdbmr5801386a91.49.1792388719287;
        Sun, 18 Oct 2026 22:45:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ac944757efsm8663540a91.2.2026.10.18.22.45.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 Oct 2026 22:45:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-88322409239so21823177b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 22:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792388716; x=1792993516; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2RMho/NQQMZuTKGkng4ri6pAFi2VJEaYxWCgS38+Yw=;
        b=Rc6RWUBW0Z+38Yk2vZSwZ2a2xqSBxeHxLCXUCWp+J3dhZkuVH9V8HuhcWl9clUIKN8
         JBqvKYg2VG4w8vpUNH1QBWszxz0gIwFpwTZ93XS8qh90rRJ5A0W8f86yaWCYa/Kdh2if
         D0cPAtFRRGr2X6KxitAp1WVIwcMjLTlte2ZA0=
X-Forwarded-Encrypted: i=1; AKwUvBzj6sM2tBcQnGYHdBj3Q6XpxAtmBfllS2Hqy8LAGhC8PH+ds48dGRdrKAc9fHiinqwIpR8Mn2YZzVCFJdfOxffw@lists.infradead.org
X-Received: by 2002:a05:690c:dd5:b0:87d:b776:c659 with SMTP id 00721157ae682-8b0f214022emr20240607b3.11.1792388716178;
        Sun, 18 Oct 2026 22:45:16 -0700 (PDT)
X-Received: by 2002:a05:690c:dd5:b0:87d:b776:c659 with SMTP id
 00721157ae682-8b0f214022emr20240587b3.11.1792388715736; Sun, 18 Oct 2026
 22:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20261017-genexis-xg6846-smp-v7-3-rc1-v2-0-bf6b4b374b6e@kernel.org>
 <20261017-genexis-xg6846-smp-v7-3-rc1-v2-2-bf6b4b374b6e@kernel.org>
In-Reply-To: <20261017-genexis-xg6846-smp-v7-3-rc1-v2-2-bf6b4b374b6e@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Sun, 18 Oct 2026 22:45:03 -0700
X-Gm-Features: AclHuK-Y3Lrf6m3-w51TihCt5t27vKfFiPdpNhnEjASIXPBVnWgFrdy907Wwzyw
Message-ID: <CAHi4H7ErO32iYjVWH-4zza9ydFbBgfQAMdmFO0vMsSssf4=Sew@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ARM: bcm: Add CFE SMP support for the Genexis XG6846B
To: Linus Walleij <linusw@kernel.org>
Cc: Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000c1b425065e2b04ed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_224522_008113_7C38655D 
X-CRM114-Status: GOOD (  37.19  )
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

--000000000000c1b425065e2b04ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Sat, Oct 17, 2026 at 12:47=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> The XG6846B CFE bootloader powers up CPU1 and leaves it in a holding pen
> waiting for an interrupt. After waking, the stub reads the GPIO
> GeneralPurpose register at 0xff800568 and branches to the stored address
> in ARM state. The vendor kernel uses this mailbox and a wakeup IPI.
>
> Add a machine SMP fallback for the XG6846B when PSCI is unavailable.
> Read the mailbox address from the secondary CPU's cpu-release-addr
> property. Map it as device memory, write secondary_startup_arm and
> complete the write before sending the wakeup IPI. CPU1 is already
> running, so no power or reset sequence is needed. Using the ARM entry
> also supports kernels built in Thumb-2 mode. Clear any Thumb function
> pointer tag before programming this ARM entry address.
>
> Build the BCMBCA machine description independently of DEBUG_BCMBCA,
> keeping the debug UART mapping conditional. Restrict the fallback to
> the XG6846B and retain the generic PSCI path when firmware provides it.
>
> Suggested-by: William Zhang <william.zhang@broadcom.com>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm/mach-bcm/Makefile       |  2 +-
>  arch/arm/mach-bcm/board_bcmbca.c | 65 ++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 66 insertions(+), 1 deletion(-)
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
> index b510d959870a..1c2e3ce71a82 100644
> --- a/arch/arm/mach-bcm/board_bcmbca.c
> +++ b/arch/arm/mach-bcm/board_bcmbca.c
> @@ -1,9 +1,16 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  // Copyright (C) 2024 Linus Walleij <linus.walleij@linaro.org>
>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/smp.h>
> +
>  #include <asm/mach/arch.h>
>  #include <asm/mach/map.h>
> +#include <asm/psci.h>
> +#include <asm/smp_plat.h>
>
> +#ifdef CONFIG_DEBUG_BCMBCA
>  /* This is needed for LL-debug/earlyprintk/debug-macro.S */
>  static struct map_desc bcmbca_io_desc[] __initdata =3D {
>         {
> @@ -13,11 +20,68 @@ static struct map_desc bcmbca_io_desc[] __initdata =
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
> +}
> +
> +#ifdef CONFIG_SMP
> +static int bcm6846_boot_secondary(unsigned int cpu, struct task_struct *=
idle)
Can you please make this generic (bcmbca instead of bcm6846) because
this smp method works for all the bcmbca v7 cpu?

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
> +static const struct smp_operations bcm6846_smp_ops __initconst =3D {
> +       .smp_boot_secondary =3D bcm6846_boot_secondary,
> +};
> +
> +static bool __init bcm6846_smp_init(void)
> +{
> +       if (!of_machine_is_compatible("genexis,xg6846b") || psci_smp_avai=
lable())
Let's not check a specific board name since this method is generic and
it should be dependent
on the enable method from the board dts.

> +               return false;
> +
> +       smp_set_ops(&bcm6846_smp_ops);
> +       return true;
>  }
> +#endif
>
>  static const char * const bcmbca_dt_compat[] =3D {
>         /* TODO: Add other BCMBCA SoCs here to get debug UART support */
> @@ -27,5 +91,6 @@ static const char * const bcmbca_dt_compat[] =3D {
>
>  DT_MACHINE_START(BCMBCA_DT, "BCMBCA Broadband Access Processors")
>         .map_io =3D bcmbca_map_io,
> +       .smp_init =3D smp_init_ops(bcm6846_smp_init),
>         .dt_compat =3D bcmbca_dt_compat,
>  MACHINE_END
>
> --
> 2.56.0
>

--000000000000c1b425065e2b04ed
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
A5qMARDrB75B2OMf2VXIZobs+PaLCyadcYMRdQivFNEwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMDE5MDU0NTE2WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEABeSS52+TCJnnouhE/5V4P46gt3y/LbKkc0nf
gmD4YV93+C1m2aB+Ade5uVTb51uB5Ig1KWsetq2TF75HlN2PD0tMO9WdxAdZKJdKxXoW5avYxMtb
VL8c8g1PkASFfW/ELrVFzC/tyidpeIporsY9/pZGtavLuRzSIymipDuFh86O1ddSrf7DvErZTkxv
bW+3mjzd9d1v6Xu9M4Q8rZdIUy7A1BOJ8wcQMOyzPB/Ec3EgkyAs670tNMmi9QQzEZ7c0A6wVNWP
m4J4oC4IBX+6lO9q7N+CIcsHyBo6hOJ5c3u+oUf0bpk4DuXfPYazuLqQhAexsJtcsS6Vh4cnMTh8
GA==
--000000000000c1b425065e2b04ed--

