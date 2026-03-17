Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A23FB5EA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 01:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8O4SwSqt1RkXk1QV/uMrhJGfohvWxKw1rD4xIP65+E=; b=V5SvYCGlIz2FYsAndcxB4H3DKQ
	vajVli27f3h0mM4gNZPrIPfA+XDXFTV0N+Ma9TXRFWqm8AJMxCT+1N4pVL9H9ZZxjDIV79005oFtB
	Tcn1jiyD/N31O+4w3i5zsBdudUFW4Ajuq3+gEFB0y4uJGCwiWdvdxFLV3vIrGUhD6lmqH7benJO0l
	yt45YNWZX70IJAPkU0UfHu+THG3GzfMo2fGsTW/6mCHCR0gXhT//RRNRMWPUqyWq1YUuwFA67vz1y
	TiFk53QiNdQe5mWj3QkKyQj8j3MYFshStynLSfz35a0yOp7ahtoFzSCSm4BHc88BRDYBdK/zqoaxg
	3mHRnFGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JM0-00000005C0T-3zQB;
	Tue, 17 Mar 2026 01:36:16 +0000
Received: from mail-pg1-x562.google.com ([2607:f8b0:4864:20::562])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JLy-00000005Bzt-1LGP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 01:36:15 +0000
Received: by mail-pg1-x562.google.com with SMTP id 41be03b00d2f7-c73bc3dd25fso1992807a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 18:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773711373; x=1774316173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8O4SwSqt1RkXk1QV/uMrhJGfohvWxKw1rD4xIP65+E=;
        b=FF8s/ZsMU2I1PkBXTsqXBXkT6fZ3cTUQKWSnd+5DdlxKBs4/2LLOcvDD/3pJtLQjtH
         rL4lhkoZn43Ko7fHtdEvHPvcBOIyzACF8W8uDHYZ7hXw13d5/lLJ6438MEEWFEkncMwe
         RBRkra6Zlo6EiXPjvzgqrAqZ9o33ZZFF/Mp+nikXU/BClKWjv69HP7jAvAJBYfNPvgQ4
         OcMVD6gkAk40z4r+PHWz7sV3i9Uy5m77vst7UlRqH8zWBaet1PCkBw4hyg4bxLPOUtqJ
         P0RvhWkdNr65DO6s5iMYAYHd7Uk3kZobbAw4+vxwb1pHW9CEXgKc84Cpyy1enk/Uw7Hz
         Lslg==
X-Forwarded-Encrypted: i=2; AJvYcCV+svw/nwz4RJCEbEwiy1xrj7pc3a4LJUAlC8XGnxRZr0n6obw61isvnNLcFHg+aX69bcc+ZysxJVPdTZP4ZWwZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxqRtuIgQu0bHiQ5yfdvFOjJ9FoxN+40tSxsLDVzT8oUWs+nnGC
	Co4BAYUZgOKks1fUcJZwtbzD3cUd0+viF0jQt9WKxk4J9Pa53UeuowBtraY15iXFF4P5qQRW9ou
	NbQKHrPVQ8sAlUKLQs9XEYdYMR0MBGHOrg2UHa2KSJVFKeg+yzAEzD5rRqfZzZniifYyOy23vUX
	wCUDj4qLOHX85v1zkkK1F28eZBrLf6o3IQQazFf2VhlopnBt8KkLSJPUP7arXq6MQkxadq6CMnx
	PpzZsXyy5fY75rqcBgQavyyt1yUeZw=
X-Gm-Gg: ATEYQzx5fVfoVcjGmmwEMNa/NZuWvU8vqyB8UFS/NArbl62vx5lxesSi6+IMvlI0XNc
	ZiPIl7W+jYd5XH86yuTj13QXtWBU7gtkKyEi5XQtvbWl8P9oJDylRx9czV4aVBH0Y5sZuxcl6Y3
	AUmpluBIzdHIOpabUFjWznaCIykBB0lMDMqk3HLE6C+Fqi5tR6a3gX5XOABMSnsozpF7WoQPR3j
	1FPrmQhnZkOI9V8OQYgwps/qdbFKcNlMPS7qwRrY5TOeeCIU+BgihL5rayEJyevlJJxBJwQjfr1
	bxusNQTN9sMJ/b4ZhUhaTaFCjO0QFJBQxjMEFjitbwP8gXTpzzOkmMauqha9ThtP+a36/Y7RaJf
	Anq3JlW9FetWHmI8XBJ9wRv2TJKhjl50Q6h/4x1ZmfJqQ5g7FcLbzE6VQlK4wztPDyEPAvLVrU1
	C2iGbWGgw4KDTA/2If62mygILLhBrnzl3v0fzuSzs9RwUiEYJAfyI4hDpNZEai
X-Received: by 2002:a17:903:124e:b0:29f:301a:f6cf with SMTP id d9443c01a7336-2aecaa952cdmr163556415ad.35.1773711373124;
        Mon, 16 Mar 2026 18:36:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-c73ebbaad20sm984821a12.7.2026.03.16.18.36.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2026 18:36:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-79a670a6032so760187b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 18:36:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773711371; cv=none;
        d=google.com; s=arc-20240605;
        b=J/aQIglOydgzQLrcQR+IKDioDlsXerSbkanmS1n4TBUhJjdQNUx78W7TZ8IkSKJBr4
         rIsvOx++GK3kFg2WU8ZSbYjdXkRxoy5l9tJCbwxz4jsn5lyUocha6/C/lTh65xSvcRsH
         pKFCE7AVspQw9/YyiZBHs//tYHFd+utbqQLMWS1wsM+6TFmOGlebHyTm0aCAgjIKYv03
         iQ5iCbO6Q7smB7hTubl7CIFbgCJKa2m5IcBSvWutxroZTPw0khVhiKezSAjOsRCD0hzw
         +VS39ff8E4ap+58d+KOXOJrKYAl41Ycoj9pzwAOAf0w7uvIWq4dY3xSIszF98U/dS/OG
         gdLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o8O4SwSqt1RkXk1QV/uMrhJGfohvWxKw1rD4xIP65+E=;
        fh=g+48obFN8LxhFfDYlFhcGPFIrR53GvtCc3yjNb5cYDA=;
        b=d0uWwyNQZnrUMG7Mm2630me3pAEKBDFzv+/0FQJ5TgzizUJntxTdAPatOOnKnWLevU
         qyW+Q2DO45LT1g5OewgDWrhkQvjinvqjBCoolEx9vh0QduxRfe0IDfOkg9WtbfoUD/mf
         jFlpztqf5+aIOcZHjuPpaJ/davOM2Wy4OW8CqRq6WSEkO73g8petu08yoSuliJgsXM3y
         0NikCGv6nY378mw1kIj8j6hFTtTzutFP3Zmu4u00yxEcVdqRKAJWiPs8RgK53FgZT29Y
         5OQcdzLd0n2jq7a2XLHUCMq3uoqSQORxeexP1t2GGTxZ7a9orqdEGdBR8EKL+rexivyi
         agpw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773711371; x=1774316171; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o8O4SwSqt1RkXk1QV/uMrhJGfohvWxKw1rD4xIP65+E=;
        b=Euiq3npT/HBKrE/ICR/rdjLoQb9Zpj7dKgO7UFvBo+voi+6iuNbSbADnTB1T8n3ZoI
         8htM/o/lRXCMhXVu2m/f3jCoqZPC7Q6dTfEw4PTozSrY3hAD2A4b6a0Pgkk0xGtFne5g
         KNDGsScEwwh239jUMNkRTVr+agqcL7/17OEJY=
X-Forwarded-Encrypted: i=1; AJvYcCU7qMrhAbmyVc0BiTeP+IjqG+xyKu5NPBm+NlTX1S421iaFP2DqASCKOMa9P1p9Gdtdw2yEQ1Ze+Qr0NURDGkwP@lists.infradead.org
X-Received: by 2002:a05:690e:4089:b0:64e:751b:a9a2 with SMTP id 956f58d0204a3-64e751baa3cmr9729425d50.75.1773711371663;
        Mon, 16 Mar 2026 18:36:11 -0700 (PDT)
X-Received: by 2002:a05:690e:4089:b0:64e:751b:a9a2 with SMTP id
 956f58d0204a3-64e751baa3cmr9729410d50.75.1773711371277; Mon, 16 Mar 2026
 18:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org> <20260218-bcmbca-i2c-dts-v2-5-5373ef82c50c@kernel.org>
In-Reply-To: <20260218-bcmbca-i2c-dts-v2-5-5373ef82c50c@kernel.org>
From: William Zhang <william.zhang@broadcom.com>
Date: Mon, 16 Mar 2026 18:36:00 -0700
X-Gm-Features: AaiRm51PtO8Qb1OxNbhdJvPH2EkaDYPLcyh7ZjxRZHLzRGlGTob1n-K6w3IedI0
Message-ID: <CAHi4H7E3-xHB555yyTReqOtCA4rpoFS9=HD8s_vm7xrJPn49kA@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] ARM: dts: bcm6878: Add I2C bus block
To: Linus Walleij <linusw@kernel.org>
Cc: Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000430130064d2e5c61"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_183614_368945_E5967361 
X-CRM114-Status: GOOD (  15.36  )
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

--000000000000430130064d2e5c61
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 1:31=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> The BCM6878 has an brcmper I2C block.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/boot/dts/broadcom/bcm6878.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm6878.dtsi b/arch/arm/boot/dts/=
broadcom/bcm6878.dtsi
> index 5a37bfd7f53f..e7fb45ae1d49 100644
> --- a/arch/arm/boot/dts/broadcom/bcm6878.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
> @@ -239,6 +239,15 @@ nandcs: nand@0 {
>                         };
>                 };
>
> +               i2c0: i2c@2100 {
> +                       compatible =3D "brcm,brcmper-i2c";
> +                       reg =3D <0x2100 0x60>;
> +                       interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       status =3D "disabled";
> +               };
> +
>                 pl081_dma: dma-controller@11000 {
>                         compatible =3D "arm,pl081", "arm,primecell";
>                         // The magic B105F00D info is missing
>
> --
> 2.53.0
>
Reviewed-by: William Zhang <william.zhang@broadcom.com>

--000000000000430130064d2e5c61
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIVXQYJKoZIhvcNAQcCoIIVTjCCFUoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghLKMIIGqDCCBJCgAwIBAgIQfofDCS7XZu8vIeKo0KeY9DANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNTNaFw0yOTA0MTkwMDAwMDBaMFIxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBS
NiBTTUlNRSBDQSAyMDIzMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAwjAEbSkPcSyn
26Zn9VtoE/xBvzYmNW29bW1pJZ7jrzKwPJm/GakCvy0IIgObMsx9bpFaq30X1kEJZnLUzuE1/hlc
hatYqyORVBeHlv5V0QRSXY4faR0dCkIhXhoGknZ2O0bUJithcN1IsEADNizZ1AJIaWsWbQ4tYEYj
ytEdvfkxz1WtX3SjtecZR+9wLJLt6HNa4sC//QKdjyfr/NhDCzYrdIzAssoXFnp4t+HcMyQTrj0r
pD8KkPj96sy9axzegLbzte7wgTHbWBeJGp0sKg7BAu+G0Rk6teO1yPd75arbCvfY/NaRRQHk6tmG
71gpLdB1ZhP9IcNYyeTKXIgfMh2tVK9DnXGaksYCyi6WisJa1Oa+poUroX2ESXO6o03lVxiA1xyf
G8lUzpUNZonGVrUjhG5+MdY16/6b0uKejZCLbgu6HLPvIyqdTb9XqF4XWWKu+OMDs/rWyQ64v3mv
Sa0te5Q5tchm4m9K0Pe9LlIKBk/gsgfaOHJDp4hYx4wocDr8DeCZe5d5wCFkxoGc1ckM8ZoMgpUc
4pgkQE5ShxYMmKbPvNRPa5YFzbFtcFn5RMr1Mju8gt8J0c+dxYco2hi7dEW391KKxGhv7MJBcc+0
x3FFTnmhU+5t6+CnkKMlrmzyaoeVryRTvOiH4FnTNHtVKUYDsCM0CLDdMNgoxgkCAwEAAaOCAX4w
ggF6MA4GA1UdDwEB/wQEAwIBhjBMBgNVHSUERTBDBggrBgEFBQcDAgYIKwYBBQUHAwQGCisGAQQB
gjcUAgIGCisGAQQBgjcKAwwGCisGAQQBgjcKAwQGCSsGAQQBgjcVBjASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBQAKTaeXHq6D68tUC3boCOFGLCgkjAfBgNVHSMEGDAWgBSubAWjkxPioufi
1xzWx/B/yGdToDB7BggrBgEFBQcBAQRvMG0wLgYIKwYBBQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9i
YWxzaWduLmNvbS9yb290cjYwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjYuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yNi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUAA4IC
AQCRkUdr1aIDRmkNI5jx5ggapGUThq0KcM2dzpMu314mJne8yKVXwzfKBtqbBjbUNMODnBkhvZcn
bHUStur2/nt1tP3ee8KyNhYxzv4DkI0NbV93JChXipfsan7YjdfEk5vI2Fq+wpbGALyyWBgfy79Y
IgbYWATB158tvEh5UO8kpGpjY95xv+070X3FYuGyeZyIvao26mN872FuxRxYhNLwGHIy38N9ASa1
Q3BTNKSrHrZngadofHglG5W3TMFR11JOEOAUHhUgpbVVvgCYgGA6dSX0y5z7k3rXVyjFOs7KBSXr
dJPKadpl4vqYphH7+P40nzBRcxJHrv5FeXlTrb+drjyXNjZSCmzfkOuCqPspBuJ7vab0/9oeNERg
nz6SLCjLKcDXbMbKcRXgNhFBlzN4OUBqieSBXk80w2Nzx12KvNj758WavxOsXIbX0Zxwo1h3uw75
AI2v8qwFWXNclO8qW2VXoq6kihWpeiuvDmFfSAwRLxwwIjgUuzG9SaQ+pOomuaC7QTKWMI0hL0b4
mEPq9GsPPQq1UmwkcYFJ/Z4I93DZuKcXmKMmuANTS6wxwIEw8Q5MQ6y9fbJxGEOgOgYL4QIqNULb
5CYPnt2LeiIiEnh8Uuh8tawqSjnR0h7Bv5q4mgo3L1Z9QQuexUntWD96t4o0q1jXWLyrpgP7Zcnu
CzCCBYMwggNroAMCAQICDkXmuwODM8OFZUjm/0VRMA0GCSqGSIb3DQEBDAUAMEwxIDAeBgNVBAsT
F0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpH
bG9iYWxTaWduMB4XDTE0MTIxMDAwMDAwMFoXDTM0MTIxMDAwMDAwMFowTDEgMB4GA1UECxMXR2xv
YmFsU2lnbiBSb290IENBIC0gUjYxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2Jh
bFNpZ24wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCVB+hzymb57BTKezz3DQjxtEUL
LIK0SMbrWzyug7hBkjMUpG9/6SrMxrCIa8W2idHGsv8UzlEUIexK3RtaxtaH7k06FQbtZGYLkoDK
RN5zlE7zp4l/T3hjCMgSUG1CZi9NuXkoTVIaihqAtxmBDn7EirxkTCEcQ2jXPTyKxbJm1ZCatzEG
xb7ibTIGph75ueuqo7i/voJjUNDwGInf5A959eqiHyrScC5757yTu21T4kh8jBAHOP9msndhfuDq
jDyqtKT285VKEgdt/Yyyic/QoGF3yFh0sNQjOvddOsqi250J3l1ELZDxgc1Xkvp+vFAEYzTfa5MY
vms2sjnkrCQ2t/DvthwTV5O23rL44oW3c6K4NapF8uCdNqFvVIrxclZuLojFUUJEFZTuo8U4lptO
TloLR/MGNkl3MLxxN+Wm7CEIdfzmYRY/d9XZkZeECmzUAk10wBTt/Tn7g/JeFKEEsAvp/u6P4W4L
sgizYWYJarEGOmWWWcDwNf3J2iiNGhGHcIEKqJp1HZ46hgUAntuA1iX53AWeJ1lMdjlb6vmlodiD
D9H/3zAR+YXPM0j1ym1kFCx6WE/TSwhJxZVkGmMOeT31s4zKWK2cQkV5bg6HGVxUsWW2v4yb3BPp
DW+4LtxnbsmLEbWEFIoAGXCDeZGXkdQaJ783HjIH2BRjPChMrwIDAQABo2MwYTAOBgNVHQ8BAf8E
BAMCAQYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUrmwFo5MT4qLn4tcc1sfwf8hnU6AwHwYD
VR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwDQYJKoZIhvcNAQEMBQADggIBAIMl7ejR/ZVS
zZ7ABKCRaeZc0ITe3K2iT+hHeNZlmKlbqDyHfAKK0W63FnPmX8BUmNV0vsHN4hGRrSMYPd3hckSW
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGkzCCBHug
AwIBAgIMPaigUjJ79aI7cqBlMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYxOTEzNTIwOVoXDTI3MDYyMDEzNTIwOVowgdoxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEOMAwGA1UEBBMFWmhhbmcxEDAOBgNVBCoTB1dpbGxpYW0xFjAUBgNVBAoTDUJST0FEQ09N
IElOQy4xIzAhBgNVBAMMGndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tMSkwJwYJKoZIhvcNAQkB
Fhp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBALBa4WsRxbnpowbqT9/K1B0+Fmm/xDtPPHKbcdL+yvZ2PemlfcBwapeHvbu53TO6TTBCtmSi
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
zpARV9snYdljDeANjuiwn94m7Ku/0tf0Owxs0gEbQ6wwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwMzE3MDEzNjExWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEABhTkFIPJMFXliZmME0oc/llyLeE2Ndl69dPU
ucFO+N2XwqiVO3PU0HQmIveqcq65YTCCGJG/Y7P2WaUAlxBPJ8N92Ioyntz7D8gDZUTssCe9MDeI
ga9HbzDQjSia4f9qA94jUv4U8njd+REchMyqM15QUH8cY+i11KN9TD3ONu4GGDhXttwggJVXOjLW
pHnhS8NbZQ5ZzeWmlNBfEhudVTaNF6YfZh4LfVyZXc+B3bnhzV1y+LbNunZ4lOhCr7Ru50Ab4Nvb
kpLmKHZ4u5n3BPv0A2RCTymFfkGJGO1L0c/8WFtYJRTd5OD2wRHg7jokwyCn8ulVeXJyJ24znjm8
Wg==
--000000000000430130064d2e5c61--

