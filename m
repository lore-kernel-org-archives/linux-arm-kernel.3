Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE7CCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 20:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ex1enTg+DQBua1gZREEfvfAQRUl2BjPB0BnllSH7wY=; b=xmAl6rBv5uOYMbYagUCIJH0iGI
	6Q4SkCWU8KKu2oDUOjfwMG+uaq5FQ5utwgxaV6hz8G25EQMRMjuWNtMvqPqBiDZnv/Pm5Kvs2VD64
	9VQMibHg5xy5pSz2+uMpBTFCRti/4Iw2aBq+KdI3uDO+IE69NArujcsFR7aigoNG46aiUR/cH1YAu
	kCceoz1+5rPW2yR/F9i/+a9PfXTG/e0FtZo8t96H5NEMmUPw4jarqzby1bJKNRPF+7tH6Iimm1ko2
	6tTEXbUd5Z/P79J6AzwHYtPpMMvQRchDqBPDjbdvHXLaoA/8nFmHv2Q46TDXpD+CjhIbMXF4p3ALq
	621F1MlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3gvQ-00000006B0v-2Gy1;
	Tue, 30 Sep 2025 20:26:16 +0000
Received: from mail-pg1-x563.google.com ([2607:f8b0:4864:20::563])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3gvN-00000006B0S-0foZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 20:26:15 +0000
Received: by mail-pg1-x563.google.com with SMTP id 41be03b00d2f7-b5565f0488bso4356233a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 13:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759263972; x=1759868772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9ex1enTg+DQBua1gZREEfvfAQRUl2BjPB0BnllSH7wY=;
        b=ci3odQ5EA0lUNXXV6HKb2ldlVt556J1iV3ikDVjI7TCA6JtEV3Qcpnx2/ilVXEL32e
         /xGgt9vVfmDR2p9dK0ZInbejWk0nKMnIelON0fwhCde6UofshJtDAdO/4gdgiaL5y7nn
         PET5de8klb/VI85/dnDy61C5f4uKLncAZ2t3ypYQyXiklinumb7omgPdhiy0DEcrvbhQ
         l5/H5sPUhUuM8KcvpWQx4OEgVpjFtEUCOREE94Q3mea6tO7f75+vBW2OJQJVmU8Op6EG
         oLFRDxF+7lgnp3gRJeiQ1ElLXG29VeYpxDW1hGYOHNTAhGZqCus5EaZya6cI4xPMTFbf
         S2/g==
X-Forwarded-Encrypted: i=1; AJvYcCUlMyUjFf+1+9jwLmL1nuzpl7EQyB1nYfSx9bz2AReit1GgLJEJG7sbRbJBUucacah1WORJKaA6RRVgdrfXxy3y@lists.infradead.org
X-Gm-Message-State: AOJu0YxsM5FkPMi3yhFPoy4WAZnhvPfiLeyBKOhXgDJmzvOACquDEZxz
	Zaj3pLceM/8UZLtT1Jl2qkl8XmYGF0L/ywJqv1imZPrM8KTTt4SFSRzD10fe9e3TbUKu0uB8yVh
	DJ3Px9m5iaPVrtWVoYPGbgNUym130LIcjqrmjpKTqSzW4AV7mPappqhq/pn/juP4rXbefQ9kEQz
	n2GYFHTSW1QEZ4i3/x+OtmN5ag7onGFQWnwO79FSnMfJl6N3oLcY//p8g72ohpoBMHQXZCrrXWC
	JK9EcUuO1/kuWL7bx74SzLLNac=
X-Gm-Gg: ASbGnctnoIxFUTb4ZkU+NSHXFR9gktC/yvHsc8827/KyAB1ue8igAjUFbKdKucst84i
	GlQiPfe2cE8Oso+s/E+VcXMtFSv2RksirEK6i79lgrT8ot3dPqoeggG3vFCdHpcoBIrWd5xxyOg
	8yZLCMLSMEE3/jJHN0E6oi8OYZ2yTYgtOvI+wR1u35wm6QTMEd39dl7Dw9PnphWz0fmP9AiBun5
	DdhdFbWrD3wGGS1FQLZi/muMo1WoJV116mUHSw+pinZxLtpA/cWr9YIIw+afzAFzRb96dLQxnZS
	YgO3si70X8MtE4cP/xw1YtPdNRgW5Kk+tywqGnglPy5uRcblh4PKFTgC5q19UipjRze83xCTNaH
	0JEfH292pMUBmjAE0wKhlsXsfBxBHCM2De09db1Yuu873lP7iXIJ4usX9WiKoBW8Q0Db1NOHRdj
	v34+OF
X-Google-Smtp-Source: AGHT+IH6QEl8QLKoKG4SYmNzIVrCoKIfjzJffia4syTxvo4UQc7kgoWv1kTQoZ4DaoaEXGqFCgt4JWYCZFZJ
X-Received: by 2002:a17:90b:3e8d:b0:31f:5ebe:fa1c with SMTP id 98e67ed59e1d1-339a6d38b5bmr1041339a91.0.1759263971843;
        Tue, 30 Sep 2025 13:26:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3399cc4860bsm48248a91.1.2025.09.30.13.26.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Sep 2025 13:26:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2699ebc0319so63765435ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 13:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759263970; x=1759868770; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9ex1enTg+DQBua1gZREEfvfAQRUl2BjPB0BnllSH7wY=;
        b=BBOQJoZxxeClbrI3WqGQniCwPoDLuJOU3AQD4ZRnHWN2FMkkndsCtMCfASgBgSY7dl
         7A+RWZQDhwCW+/R9x/dx8UjHdcYRZ157D0G/0n3ABe0zHS/3iig1wioFd9P+22SsyG9p
         ajSAVGs16lWV3lDQdhTcgYAY0WP9k8SW5uk0Y=
X-Forwarded-Encrypted: i=1; AJvYcCV1UZiNuQxX6eYloX7qCS0CklrIytErjK3c0DOrwqKfVwqQJiLD68FUQHiIQjEtE7Gb3xLnER4JPpncKMjqPeHO@lists.infradead.org
X-Received: by 2002:a17:903:2312:b0:246:cfc4:9a30 with SMTP id d9443c01a7336-28e7f2f7571mr12276755ad.35.1759263969903;
        Tue, 30 Sep 2025 13:26:09 -0700 (PDT)
X-Received: by 2002:a17:903:2312:b0:246:cfc4:9a30 with SMTP id
 d9443c01a7336-28e7f2f7571mr12276495ad.35.1759263969470; Tue, 30 Sep 2025
 13:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
 <20250929200628.3699525-3-kamal.dasu@broadcom.com> <20250930-showoff-herring-4b2a04611e9d@spud>
In-Reply-To: <20250930-showoff-herring-4b2a04611e9d@spud>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Tue, 30 Sep 2025 16:25:32 -0400
X-Gm-Features: AS18NWAN-yFZ2bY5cM00IsAvE7Uc7Icl5B-nxgrp2fPcv35GHNkd-ojL24YikcU
Message-ID: <CAKekbeuQqoo856Hg7dsucPkgwc-g9qbuBApSDwFeMN38yj=T_w@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: hwlock: support for brcmstb-hwspinlock
To: Conor Dooley <conor@kernel.org>
Cc: bcm-kernel-feedback-list@broadcom.com, andersson@kernel.org, 
	baolin.wang@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, florian.fainelli@broadcom.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000004669a06400a9088"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_132613_243459_BCA795B2 
X-CRM114-Status: GOOD (  18.88  )
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

--00000000000004669a06400a9088
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I see that, do you want me to send a v2 of the entire series ?.

On Tue, Sep 30, 2025 at 3:04=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Sep 29, 2025 at 04:06:25PM -0400, Kamal Dasu wrote:
> > Adding brcmstb-hwspinlock bindings.
> >
> > Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
>
> You have two 1/3 patches in this series.
>
> > ---
> >  .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcms=
tb-hwspinlock.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwsp=
inlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinl=
ock.yaml
> > new file mode 100644
> > index 000000000000..f45399b4fe0b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.=
yaml
> > @@ -0,0 +1,36 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwlock/brcm,brcmstb-hwspinlock.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Broadcom settop Hardware Spinlock
> > +
> > +maintainers:
> > +  - Kamal Dasu <kamal.dasu@broadcom.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: brcm,brcmstb-hwspinlock
> > +
> > +  "#hwlock-cells":
> > +    const: 1
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#hwlock-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    hwlock@8404038 {
> > +        compatible =3D "brcm,brcmstb-hwspinlock";
> > +        reg =3D <0x8404038 0x40>;
> > +        #hwlock-cells =3D <1>;
> > +    };
> > +
> > --
> > 2.34.1
> >

--00000000000004669a06400a9088
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIVUQYJKoZIhvcNAQcCoIIVQjCCFT4CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghK+MIIGqDCCBJCgAwIBAgIQfofDCS7XZu8vIeKo0KeY9DANBgkqhkiG9w0BAQwFADBMMSAwHgYD
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
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGhzCCBG+g
AwIBAgIMRxplQYK7p3ShPUz7MA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYxOTA4NDAzN1oXDTI3MDYyMDA4NDAzN1owgdExCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzENMAsGA1UEBBMERGFzdTEOMAwGA1UEKhMFS2FtYWwxFjAUBgNVBAoTDUJST0FEQ09NIElO
Qy4xIDAeBgNVBAMMF2thbWFsLmRhc3VAYnJvYWRjb20uY29tMSYwJAYJKoZIhvcNAQkBFhdrYW1h
bC5kYXN1QGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANYnWmzR
GGguz2PH40SpHaw/tESF4nlf3YYuxXpp0U9KEiIPEDcrxS6lcojBW16h3RppkY+lAbs0mzfPKysT
H0K0rs+X8O45xZIUJlxzf5UZex3BLi1f/H+08rSQULWEtO/ECwkFod2DIzSX7fZdz5RQ1PpziEOp
goo/JZPYIeCmgt3rIyvMuupj8Ymb0J/velhpXfQuYUM52viw2nmqVcxCwBqyM3Iq7eI4xtEOFRmR
wxSizd3MSQMf6GCHA4/B/6ttnxhGAr3utaOU+x/RnzG0gPLTW1XRAQ0+GVc/tGFdI864OG1cyrRl
GvBnHJQSAFOIKwYrUk2oFpgMbafQ6osCAwEAAaOCAdswggHXMA4GA1UdDwEB/wQEAwIFoDAMBgNV
HRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYt
aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFww
CQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRw
czovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIgYDVR0RBBswGYEX
a2FtYWwuZGFzdUBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAU
ACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFOV9h+N/T9ZsJ40qRxh7NYYD+N6MMA0GCSqG
SIb3DQEBCwUAA4ICAQAKtKh30wv1/30230mCimgUjMWQE/LImRmyfDgrp2IhBVS6mDun+wH8thEB
WhBHQMz3gsGixU4ZBJG72eWi39IzQ7CGnisJwA0+hsGaGg03AVtFtqo1rXYRZ81MEDOb6BPYLigJ
RsHbNmrUGR+LsGeUwOWUeRXqBrYaYFrkgHKvVK1NEewv+vUY08n4tsezO3jq0HKhVDY46bMbf8vL
oQqqhtcQvu2+5FK2jpUayeubpzPwobjEG61RIhBvM0KivY4CB2s9A7qgjL1XBycAybIvG03BbFoT
t282FqXwk9JU6YihLlt+hpzO9UF7E8GZYlQlVIZOLOvytqilhua+2h77Yy8Jz/FJyIXKuaLPtvb2
SC2shL7jF28kQbP3QUKwAig+cxwbpngnUkd9D9cXSHVq9PPwYm0A4eAO0YQ/80Uq20+gXF++g0sy
NKrrV3i0T1dbCd86miGDKvarGzjh7pdsdwNY15liGP6Orib1tnWkJcbtP1rJty4r/mbbxcK8ILO4
IvTGFG6BfjJ+La0aRt69i1fQmjUWHLwzkLNpw9cJH8/MONZcEJeDkq9WELSyy29bagStk5KHu7NO
TH65sZg+i/4qmj3DEeEGTr/Shzp4YWSNn4W7NEelr0VgDlwa7xqlwZjXxG4MIJqy0SsQlAwEXtqd
nH2FpJfzgAetkuyU6DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2Jh
bFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1FIENBIDIwMjMCDEca
ZUGCu6d0oT1M+zANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgZVEgXXCq7nBIhG+b
TF0gX9RDE+YTsIKqMZdgZf8A684wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMjUwOTMwMjAyNjEwWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgB
ZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEw
DQYJKoZIhvcNAQEBBQAEggEArSYDyu493yKzmc/r8u6cFGXhs+jSmxnDjY7F37DiiOhQr7q0PtuV
XaiaD5l8pmCd9ktTrp57WfuV2Jdu3AISGV+sMczkgQWXRJn5wHg/UTL1O1AHC8iq8rzkZJauToMo
YDiM2ShqE70rIiY1U7xZRCoUHCQHi2lB52zsZSQlszGRJTGlYVErGQuE+PP9lKqZ9jrPpu2+3c6Q
av2HPVm0yAfhxnekidHyg/xIlkROhOtQZhT8z9O6uc/ncS5A1+iNB0MlEslff7BvMa+ZINRV/P1b
JPwlSwIjZK4o9YKGGsYet8/eNCAYO5NxlKCqGyl4DRkA37pv4RouVtdzQnYTnA==
--00000000000004669a06400a9088--

