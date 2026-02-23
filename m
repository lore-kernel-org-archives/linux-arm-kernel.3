Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A1AE909BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 02:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NytkxjJIYXHptjLJRydHz4ru1LX/FGARXUDe3Elk1S4=; b=GQn5y0Lh3ss4DSEsn8hEZKfCla
	u22AkGTLHs1jD4y+/H70sW9EMEEcYXe6cE6uh03W+TEfCfOFpIJ1sgt7njBr+W/scZ0DO1W2fhwrq
	mUemPmdDVA7hgkQorKOF9iNvdWs520QaID0WkhwmPLzjwZePHHJxT2+0vB4GN/oPoGfTMX8gBdBxb
	U/QGtFUuq682MyA4ai8Z4tqat4V+SCiEJxisGvSV6dWd9+DSNCgH9gJndhn6xIZ6oVwLubjOPVQi0
	w3u3Nb45/IqmzbFi8DddVZPf0o+O1ApcIyYniIgWcUo7e81fOjyoIKWXJ71kpxlBFLLFnPdd/5Ue3
	p1i3q8EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuLiv-0000000H94M-0xrQ;
	Mon, 23 Feb 2026 02:31:01 +0000
Received: from mail-pf1-x461.google.com ([2607:f8b0:4864:20::461])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuLir-0000000H93n-28gI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 02:30:59 +0000
Received: by mail-pf1-x461.google.com with SMTP id d2e1a72fcca58-8230f8f27cfso1959135b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 18:30:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771813855; x=1772418655;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NytkxjJIYXHptjLJRydHz4ru1LX/FGARXUDe3Elk1S4=;
        b=ILy+Y7/W8ni+F7dS25d8T3RFIxh3VojmASHs/4YCUVhcX6dqMio898ZyASkzkJ/MVQ
         orBfGzfSgQwPVbiqk2/DXDiCDhvh6lkLj/ACO/41fy25ZS08hcAwUzqKX65GnU+jxTNx
         46aC6M/W6qjHdLCP68lVTT1DGVnNg4DPHdb8fecloChUxC4zKx8ssRL2x1Mwr8pqzzI3
         v2vAeB/oKAFShE5Ns943XOFOjOOQdNuMucfD1Pbq0kpI+sZGDnfgqC5WJcgYNSfaf4Mr
         7Z+95TWtJrmiv7kxcRmuzt4V5INuGpxa0R3fuoRMMruJpyvNsAmFpxFy1g41CrFJ7NHx
         tP+Q==
X-Gm-Message-State: AOJu0YziOQEWtv7F7YowMd3Cmy5RilbAEuNk0JU1jWmtcTvwQjxBYF/o
	c1TFc4bNFNmmcGCvkQPlYeErnqbDGMIC2VjBDKWFJX52udAbYr10AqFMVZoux4deIpiORKGtsLW
	d7BxfSGuOYzDO3+OlWzbITTI4z7jfrfgLsggDhqHv6AE7oH48gWF3Zo61GHGccbGc0e5srswBVi
	YH7rwjGI1qVbHTxRsrQqkY5HaddY4TY6QyIF3NEuot6a8MYe0DL4NBSdyHmUoLgIhBdoGL74S3I
	jMEuQdZ7ohFwU9+EQbRxyESust1Pew=
X-Gm-Gg: ATEYQzwbiR9qwjYBIRe7wSX6gtFP8ST8b+1RdemZljBK4y9XIoipXoKVwm8ow21Wc0J
	y0UNTV4nwcjG6TutHYLql9mgAH6gSKgVO7r8FZW4BNgEOKcS8lpzikgKOpdSfks6VX10Athhe02
	1cZ29MumHsTbG7AFlZFvJ2hzqQLd4JsVnIXtY1eDcuggx5aUIG70BXobKtA+qzwR1XfpINpqQXg
	A++PMzkYhnJi0jglIevNmQvC12fv54wGzTn6gt92ZPEU8m0O06Vjvgb4DF5qorV39tBlTN+d0AB
	ZFTMM+8leNo4SwiNn5ED+YTGlO8P8rQlbsygJjG6AZW0lg3uT5t3u3IxB7yddUfk778xfU1OVQ1
	kVQVxGuGG5IlFhdmxGTYVjhwJL+aDeSvDCHDlS3DRCUS04oH655S23rFzF7IXHEx1f6OLtzmfhh
	oG4HTKt9t+A3loQfwZrTjKszVxLICpUvpqL1kozX2+Hby3ncWBY83Mi0vpd9V+
X-Received: by 2002:a05:6a00:3906:b0:7e8:4398:b34f with SMTP id d2e1a72fcca58-826da9f150amr7111774b3a.34.1771813855277;
        Sun, 22 Feb 2026 18:30:55 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-826dd689466sm721419b3a.3.2026.02.22.18.30.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Feb 2026 18:30:55 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-649eac42878so5910003d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 18:30:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771813853; cv=none;
        d=google.com; s=arc-20240605;
        b=eIVX734KWULun3PNALT8hsVg53VDLPpitqUo4yYFfoCgoLUqInOperVZjNektwQ+wG
         gEhLg+yF6U8r5UUYqcFgFuKmCNij9Tb9HXvIyn6ti44d40YFbAV3GWWGhI4s1FuMeMHF
         qZwlw8EJP7wYkn/OXJ1HZTBJ+dE2dQ4rM2MKVSdP192aeApwoLLAukyr0z2tDwS5YboQ
         qrvKi/RMtLIn8c6RCE0DOV2jMaoja9bHdOnGZr0X02MzzCJqCUlPc6Aa3DS6W2VzH/hY
         OtgbyxSjJrz3gND4mCclmjxrJZgxcTeZjLvAVqgkOWbyGjhIr8Er0fn7iwHu+nk/RlxS
         NQ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NytkxjJIYXHptjLJRydHz4ru1LX/FGARXUDe3Elk1S4=;
        fh=75FkGdBf/SynPs9CwSFPRPSWwEfE6wPXTN4m1oHI0KI=;
        b=YUw7KWI9+rGBNrGX62aqx7hbOy2UIJrB+da0W2/+yBGncc/m2RY5QFuIysJl/Si7gK
         PSgz+yIKf01aYSzdT0Us6RAGwxwQ49uP6Wqm71YpYHadFHJAzpcIlBjUqlGaKhbQQ9W8
         tKnxH7mt5CWb8H47BLAX4MZ9mRn2AjkpWTAd8wxLEX6LL2l0C35sG2BTkvqej4q6kzit
         G6nyZLDvSgEgaq+K146m23YIdfF0BfYWhttjgJ25OLU1OCwSm6xX1dRxOgXN1fxrCkC0
         j9pLl/m7EUxejlmG6Vu0V2VO15GxMKye3MeMGq1JkvDA2VoBzxSbwbdqCCGEE/vzAU5M
         DXGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771813853; x=1772418653; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NytkxjJIYXHptjLJRydHz4ru1LX/FGARXUDe3Elk1S4=;
        b=Su90b1LqVX+8J6zfk8gNIgZPqv4AYIHYZT+8awQlEteU206S5gA7t+5rNx7eMb7Qtq
         qufvRydYSWv8kdIaI5KHlPpUv5hcz06WvUOaZIhuVDSutzBPEP3k9nMMaeHW+d92x/ec
         6pCgV8TorPxXfJabOZHvRdrY53cZf4vAWUlnQ=
X-Received: by 2002:a05:690e:1447:b0:64a:d7c5:f28e with SMTP id 956f58d0204a3-64c78f570d7mr6353570d50.75.1771813853698;
        Sun, 22 Feb 2026 18:30:53 -0800 (PST)
X-Received: by 2002:a05:690e:1447:b0:64a:d7c5:f28e with SMTP id
 956f58d0204a3-64c78f570d7mr6353563d50.75.1771813853256; Sun, 22 Feb 2026
 18:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20250922202438.496433-1-william.zhang@broadcom.com>
In-Reply-To: <20250922202438.496433-1-william.zhang@broadcom.com>
From: William Zhang <william.zhang@broadcom.com>
Date: Sun, 22 Feb 2026 18:30:40 -0800
X-Gm-Features: AaiRm53JBTgrSyMvxLpFY49fAhP-DTr0yc6HzEaSGw6c-R7_vE_StkRbzKFIN1c
Message-ID: <CAHi4H7EC9+7yBofXE=AabeHtHFsrzOQA9kAq4of8Eu0CG2dfnA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: module: fix unwind section relocation out of
 range error
To: linux-arm-kernel@lists.infradead.org
Cc: song@kernel.org, linus.walleij@linaro.org, florian.fainelli@broadcom.com, 
	ardb@kernel.org, anand.gore@broadcom.com, 
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>, kursad.oney@broadcom.com, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Petr Pavlu <petr.pavlu@suse.com>, Russell King <linux@armlinux.org.uk>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000005ff832064b748f0f"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_183057_652782_E5E87DF1 
X-CRM114-Status: GOOD (  25.82  )
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

--0000000000005ff832064b748f0f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 22, 2025 at 1:24=E2=80=AFPM William Zhang
<william.zhang@broadcom.com> wrote:
>
> In an armv7 system that uses non-3G/1G split and with more than 512MB
> physical memory, driver load may fail with following error:
>    section 29 reloc 0 sym '': relocation 42 out of range (0xc2ab9be8 ->
> 0x7fad5998)
>
> This happens when relocation R_ARM_PREL31 from the unwind section
> .ARM.extab and .ARM.exidx are allocated from the VMALLOC space while
> .text section is from MODULES_VADDR space. It exceeds the +/-1GB
> relocation requirement of R_ARM_PREL31 hence triggers the error.
>
> The fix is to mark .ARM.extab and .ARM.exidx sections as executable so
> they can be allocated along with .text section and always meet range
> requirement.
>
> Fixes: ac3b43283923 ("module: replace module_layout with module_memory")
>
> Co-developed-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
>
> ---
>
> Changes in v2:
> - Fix the comment in code and commit message regarding the unwind
> section location
> - Add fix tag for more visibility
>
>  arch/arm/kernel/module-plts.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/kernel/module-plts.c b/arch/arm/kernel/module-plts.=
c
> index 354ce16d83cb..b5338fe59706 100644
> --- a/arch/arm/kernel/module-plts.c
> +++ b/arch/arm/kernel/module-plts.c
> @@ -225,6 +225,18 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Sh=
dr *sechdrs,
>                         mod->arch.init.plt =3D s;
>                 else if (s->sh_type =3D=3D SHT_SYMTAB)
>                         syms =3D (Elf32_Sym *)s->sh_addr;
> +#if defined(CONFIG_ARM_UNWIND) && !defined(CONFIG_VMSPLIT_3G)
> +               else if (s->sh_type =3D=3D ELF_SECTION_UNWIND ||
> +                        (strncmp(".ARM.extab", secstrings + s->sh_name, =
10) =3D=3D 0)) {
> +                       /*
> +                        * To avoid the possible relocation out of range =
issue for
> +                        * R_ARM_PREL31, mark unwind section .ARM.extab a=
nd .ARM.exidx as
> +                        * executable so they will be allocated along wit=
h .text section to
> +                        * meet +/-1GB range requirement of the R_ARM_PRE=
L31 relocation
> +                        */
> +                       s->sh_flags |=3D SHF_EXECINSTR;
> +               }
> +#endif
>         }
>
>         if (!mod->arch.core.plt || !mod->arch.init.plt) {
> --
> 2.43.7
>

Is this version okay to be accepted?

--0000000000005ff832064b748f0f
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
C86Lc3tey0aKc7QJVhsGUKIBj0CjDWGv0r/5HFVpEngwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwMjIzMDIzMDUzWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAfls2cWL7MGqxJOBsSXR5VWEeUmzJnB2dKkm1
MFpEKMViNkEkaUuknTd4fwhrH0SCYz0qkFXTIivENvT/AH02r34WwmkHQsfi1N4aGZTFgt7I9dp9
QU6OQG4ty8Vs/VrgbigR5P8DjrXAd9F0Jq87Pu0cvFUoqlPqsmwkzjeeknv3kRjMzh9KZS572dg5
p8URDbbAhy9MIt50smZ75W+4YZ2xxPmrszYBTgIq9Q2+c2452oKNfdPfyhUd+gcUrQzbEQ4FfgfB
Q7MiZN96+GoD7vE6IBIfApET3wg2pN2H1nTTMBcOdIaMp6fPyNPKC3sq9OMWq/qEg3eqaP+Xnzba
Ow==
--0000000000005ff832064b748f0f--

