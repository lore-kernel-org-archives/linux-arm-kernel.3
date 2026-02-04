Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE43E83EF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 17:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDWdbgsefPCJlEyIssUx4GE65Ji7JIoueJq8RukDhIo=; b=LhXtKO+sMbqZ+EovyUqjJBjUri
	WYd/ZLiUfEu96TxOEj7eNu+ax1bmfPk/29UIx7fSgQX+sFFz3SB4182pAWfU+7Kv+H+jhoS/lz5xT
	6AT5a+v3DKg8kd6cUcb4tu57rQVqzMSVPZcSHjEWwsY/5gBWynqpjUYv0dEcZjpnbUQFEywxygVwx
	uPDYbLyJWOaLmiO9LqYqnbwP5DMb8JQwGPTa0WF3g+i5Zb1V2Sloe+FBxl6Jh/yCEDmqS1NCAeuSb
	B3I6uhc8aVu8h+uQ55W8ZYi2mWRcLkJ46eqh6z5vjq8E6cBeRnSEzRSr9noQqtjxFzTJUtJYo8wQ3
	K6s3tc3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngoQ-00000008rP9-0zAa;
	Wed, 04 Feb 2026 17:37:10 +0000
Received: from mail-pf1-x463.google.com ([2607:f8b0:4864:20::463])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngoN-00000008rOl-0PA9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 17:37:09 +0000
Received: by mail-pf1-x463.google.com with SMTP id d2e1a72fcca58-82361bcbd8fso110766b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 09:37:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770226626; x=1770831426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDWdbgsefPCJlEyIssUx4GE65Ji7JIoueJq8RukDhIo=;
        b=QjFcgJjqDy3ZsW1qIzokmXYPM3kaGzipc2C/wXvbDllNHZiiZa54JdO66RuG0SE7yX
         D3zIEBAk5aed/GFglXTXp7o4kutRHX2ZqP8lfxLaNC4MmrmCzuwahu/G1sukvDkbzfVs
         g9bTkA1Vd/+z3Of2YV6U/2+iOdC7re6Y1EV2l0ZSBSF0mUF74SnGUxd5eHpaFUwuG/fG
         JyxqEVFTwMZGz7591Vg98xnRGwVS9M92e+l+2gjo83dm2NnsAaK2F/LALMCJa2AfL4xA
         G7XCnbH8q2apSMnkA+QIiPGBmKokgxF+lu1dwMb8AXbhSSguHB4h7ZeusaA//eClo1wX
         j/dg==
X-Forwarded-Encrypted: i=2; AJvYcCURaXpY8Yh/zZf6S+Msge7GZBMPjrpk8XqX3/xgK3pVLwygTGcAQcjAsJTOnoxgikYn+3qaicjzNM+wklbCOjvf@lists.infradead.org
X-Gm-Message-State: AOJu0YxGqgc1vi6MZrWuth7RUKOuPpmn7ukm13IFkGgzwo+7GRm54Nu2
	nqjjNxhf1cICJ7Td+jNoUnq/DOObxI91I5Not8ecQooOR8cGFQ6bc785/PS4JX+7CZOUOdLyjBf
	KioQMDmLh5TPkGhB0Nx6sMVOD07wklJ78cBIhJvi5H9YJ7/LHObusBxyL/eynWbWqLS2fQyjzpY
	QNrF7FsK7WL2/aQ09O1JH7nb0ez354wPzVvZthDUHcyD4CwfzxkV96wFcNOSIOj1R/PYMgl386G
	vQrhZn63SA6z+TqYRM5HYlg/Bfuu7E=
X-Gm-Gg: AZuq6aLU23MgI6wAndh5r43C4ho+bmM8c1ZlLMFDpdR5WjpbfiMtkdN3PYjLxtku40N
	TeA4q4yHzej5V8FRwf5RCs1UyP8lfjph7mb0C2l/PHW1xHfkwDu9c1IijaX9rq8AQHGMmQPXC1K
	9FVC25BwkjhI3iR3lBRKyTQFcjj7puQndJTYrqazmi2e8gzgc+nGBqdm8bz4EIQh+A4MIuGOHm8
	f1gqJyG7+ngJvHEzc0xEH3RWOwF5Auzwqk69W2xRKsPD4B6j42FkhMHNCpiiEnATsev+sUidTMp
	cMNXFazoYFjXwi3I2oKFOv38STCxmX04v0s9EscUup8KiHA6edfRKQoJ+5P1ghncXxSm0Nl57FX
	TBu6+CKEMqGY+H7YfOnPFErcjhzgz7jitze25AAV0oMZSNd0j9ULK6NFBsRWWybXva6XT8jvqG2
	l+wp872ZfpArSmw0JnfyxWvixevGuQJWoCP+hEM+C5Bno=
X-Received: by 2002:a05:6a20:43a2:b0:366:1de8:62dc with SMTP id adf61e73a8af0-3937208ff3cmr3359772637.8.1770226625594;
        Wed, 04 Feb 2026 09:37:05 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2a93381664csm4053905ad.18.2026.02.04.09.37.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:37:05 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-79510494b2eso8747b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 09:37:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770226624; cv=none;
        d=google.com; s=arc-20240605;
        b=buPI4IR7Y+PWnZPAqR4vmHiypNSso1+j0bIFUx5xEyFMIZk3ORpuXncbnrRIfs6ucx
         tFJJBw2UHF9fU9qM/V/gYUKHZ01vAcEExeYJP8AEixFV1DBIf3DF4vgscqx7lokj4cF/
         x9Q7W/ub2uLPzUCOypo+oRCORMhuAr9bbeNV5za7fjfhhug7gH+PA8/sv4f80am7jXNR
         G73sBQJZ+I+KCDDtFD3TPHae52uxwb/2buwJ84/gPSxBaus6EVIefqawas4DOQn8AyFK
         zmBe4HNl+Y6pxyJ5g/KMMR+nqkpSTo6t79fExe0kLFe4a0jZa8Qu4IVn2Y8gWqfyhRVM
         B1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oDWdbgsefPCJlEyIssUx4GE65Ji7JIoueJq8RukDhIo=;
        fh=mYW1SaWgHA2mnMX53Y7Ku+R48hZDSH7AiBfnIHiFYPY=;
        b=S1o28KFTsPOni1vk9ZeQ9tj7fGJY9cqjnJAEqB7HlZeUmOyZ7q0gudzdkwC1CIoZoH
         GcWV20WQl+HwNMA7+qGYtQQXOeNai4bAOgRee+U9qHt1gQpSyMjnTncQrhw9Vz3po9eB
         JWbQ0nYpVOwhBFIDwJGpPmXsY8chQWm2vTLwO1EPQsnb+PQoZ1nVywA1ic2SVRKy/pZL
         fcNMtxooeWZx+GzwN+ODrlktHwhjCIUTTCa0vSkQm7ZJsszN/f8U5DKtpSZ1sJIdM+dd
         5XwZJNIXxTSfmaZbLBibo+OJlJQooW4X31ezT2sEIV8y9A7DpI//bhdbCk6g8wk+0xQ+
         tFtg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1770226624; x=1770831424; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oDWdbgsefPCJlEyIssUx4GE65Ji7JIoueJq8RukDhIo=;
        b=Mf3+GhjdGsvLrkk6+QMusYqik/ScVLMilLX0us7rfCmbo0be8KPAi6O3sHkNJHe0AP
         aMbZXEl8V1QdFE6Stj9e/aIgTsZsR15wtxmZeK6m843sA+nMjXeAHG3089pRv7k5TOZM
         Zj2r30KEbyvObrtBrr+/kchZDkmgnn6bACgv8=
X-Forwarded-Encrypted: i=1; AJvYcCXxtrEMrM9FYEHGCWZCYiC7ERTFAqOGWAWNhk53KT4cfJAmo8+bFftlL6UDpDSYmX71soKxeO4y8JSN/Ef1TRMy@lists.infradead.org
X-Received: by 2002:a05:690c:f83:b0:795:616:434e with SMTP id 00721157ae682-79506165481mr21364627b3.16.1770226624049;
        Wed, 04 Feb 2026 09:37:04 -0800 (PST)
X-Received: by 2002:a05:690c:f83:b0:795:616:434e with SMTP id
 00721157ae682-79506165481mr21364367b3.16.1770226623690; Wed, 04 Feb 2026
 09:37:03 -0800 (PST)
MIME-Version: 1.0
References: <20260204091530.624230-1-miquel.raynal@bootlin.com>
In-Reply-To: <20260204091530.624230-1-miquel.raynal@bootlin.com>
From: William Zhang <william.zhang@broadcom.com>
Date: Wed, 4 Feb 2026 09:36:51 -0800
X-Gm-Features: AZwV_QiU3tpcZ48uU6A_orwOiMfRqg8-zqTOfE1LPWcodOns4JrZyntSGsmujYQ
Message-ID: <CAHi4H7EVLsgVL5KCERTX5XBNTMvZDNxePzo48Zp5dsfDdoCV1Q@mail.gmail.com>
Subject: Re: [PATCH -next] ARM: dts: BCM5301X: Drop extra NAND controller compatible
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, zajec5@gmail.com, 
	bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000206aa5064a030171"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_093707_193393_3B825268 
X-CRM114-Status: GOOD (  18.41  )
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

--000000000000206aa5064a030171
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 1:15=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> Fix the dtbs_check warning introduced when the brcm,brcmnand fallback
> compatible got removed for iProc machines.
>
> Fixes: 4db35366d6dc ("dt-bindings: mtd: brcm,brcmnand: Drop "brcm,brcmnan=
d" compatible for iProc")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>
> The above commit is in mtd/next and will be part of the opening merge win=
dow.
>
> ---
>  arch/arm/boot/dts/broadcom/bcm-ns.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dts/b=
roadcom/bcm-ns.dtsi
> index d0d5f7e52a91..46b650abdb90 100644
> --- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
> @@ -479,7 +479,7 @@ thermal: thermal@2c0 {
>         };
>
>         nand_controller: nand-controller@18028000 {
> -               compatible =3D "brcm,nand-iproc", "brcm,brcmnand-v6.1", "=
brcm,brcmnand";
> +               compatible =3D "brcm,nand-iproc", "brcm,brcmnand-v6.1";
>                 reg =3D <0x18028000 0x600>, <0x1811a408 0x600>, <0x18028f=
00 0x20>;
>                 reg-names =3D "nand", "iproc-idm", "iproc-ext";
>                 interrupts =3D <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;

Acked-by: William Zhang <william.zhang@broadcom.com>
> --
> 2.51.1
>

--000000000000206aa5064a030171
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
LAfEIO6TitoCgvq9eGfWzrHGIe3NRaAZeo1i9+CVLrEwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwMjA0MTczNzA0WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAHpLeJX1oOmxmUuPSNT1VEN8ebED7UcN+EUOX
MFknZHLvXs69NX/D01bPZlWNznINq/8yeJYFHShVIEYmOEdeZl/bmC0crhX6TGslpuDo8DQL5nAY
XSk4soAj5A+1PWS6csPwt/aZZJ4kbENhGEmXeElE9KBqN5ekRc9VPYIKpNUSpkaKGSOCdUfUvdHZ
04bYb73I5gtgTmtzPTpbUZp/yHJQxJpupbq7zUreX6EZ5cLWPriKWS/OtZqOkVPlmQeQ0Xx6EIht
oiKYTmC6fiAIM7W2eZ1SQR72zXnCgiqMbDGPhhguEUZWs/2oF3Y+5lj0JiFvqg7GKl67hcw105eX
2A==
--000000000000206aa5064a030171--

