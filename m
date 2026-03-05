Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E0CF47CC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 20:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7AaR+feZM5r2+UFInGB9UfPdjsNdVV2tS9vYrPEuqc=; b=4a/4GJ0YfbpG61aRgCtqcZ0jU/
	Ui2dml41G8auGN514eIcvoGGnuHLpQ6lO5cgHwd6ZLjRMMUls4uWD3ahSOBntKPKSEzKNlQtylCaM
	IE3OGgOnf39yKslwidxHlkfq3aLD7foaynvb5WVbtVvCSN6srgFHxVZi4cvcVGuCBft8EuUenSdRe
	larYmWfkypaDdgKjOKe+8CXcdtWehALzW7i6NsNnkR8cLCHIHv1eNiMGcD2HvbvaOOMfV3Qhf1t+L
	Qemokzl/oT/8oj29S66B9CRUeW2UDiDKgr6Z2pV0u6Vb9Taal/Z3IcbrY5UsGeWtRFN5yYHD8KI+q
	mlTKTdIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyF0J-00000002VLK-47uh;
	Thu, 05 Mar 2026 20:09:03 +0000
Received: from mail-yw1-x1162.google.com ([2607:f8b0:4864:20::1162])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyF0H-00000002VKv-0AeN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 20:09:03 +0000
Received: by mail-yw1-x1162.google.com with SMTP id 00721157ae682-7986e0553bdso82847537b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 12:09:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772741339; x=1773346139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7AaR+feZM5r2+UFInGB9UfPdjsNdVV2tS9vYrPEuqc=;
        b=JPhoBjNE+NomVpPANp+fXuep+bjHFXQNoWYYNYQ9fvf3GP6PEI+7+YkfAthYWtAPhc
         WgE+/CBzfHBAI+m6Se0WJYmoqnO66Bb1NEzXTw1EAtA45eOk7dHPWoZLU8bdtM4ILfNX
         w4CyNLLCprkoPJbSLGExB4YVZq0fLXKnCllDqQKvMaci1OIuPuNIF/e6IL1W5+Zurs6r
         i/2ip4mSjS2QhQFtkeiBPoWgrnM4EbCXEzQC+IvshTNr0B+xmR3n1at2IAEgpWYxiblD
         fyRlpYKbe1xDUIbsBmhhB7Ztv4zT0VH3vp/yqYDib/Fo6Y7mFAty03c/GWDZBQqElaUo
         twRw==
X-Forwarded-Encrypted: i=2; AJvYcCVQgZMogBVq2VLMcJ8DVQTeHCw5DvIB2+NdUQdWTKRjgmKUB6Eh1mlBAzIv1D2163zR6M9YVVXui0OYMIFp9cHf@lists.infradead.org
X-Gm-Message-State: AOJu0YwDpMzNM5D4UswNo7I5jhKov9SO4845imekhDiXMJGw6ackLCMl
	yDf5g70WF8qg+Hb0yaJ5BDuKu3SJ3KV3b+F9pIFukY4ypWvXcTG3xZXb1GOOoe8BB7HWAF50YRE
	0TynUd9MEpnPuHVbRKm28qwr6+hXLIKFMoXnw81xyutMk6hPXBtytRq+5GE8093C6WQKN+abcSv
	qS1V5qJvStzUbHfoWCvJ8oEeCg3ZbEARN49zW22785cl0eQgTv7I8uXFRGI7eJOecixeDcEOzM+
	HD4owvjJT4tZ+egNcTo4Hd3rGA=
X-Gm-Gg: ATEYQzyGvy4UxG1CI0EAAv5435xTdM2uxpJwg2T1JXVz+vp3LZXN2eQGRcEKkjHVkHh
	lIZodBLnuHIG6d4SU4sOHTY/8USlfQmK8k6gZDEH2ddIZ1OBdl9hWoLfbAJ8HwcZbpfPr2aPneP
	QaLdtzrc2zhoiVUNb+TsUOCyh7OgwBM65cdliwkE3Ex+6q8WZJSoo4G8ZHNzvs+UUZf5O8xIISU
	mUzNLr9/EgCZax8HQvyVuO8UQNTSOYfEZQi4J/BEf67e9RKGuRFadA/NmBFG/NQnowO93vSq0eP
	X2Vg6lHtq0HxWZaic1ihdAjJ14hlOPWaETF7gcTdJbENB3e3wIg2nvRPFEZ7rZSYL1dbcvQ7a0q
	XX8fGYN7TKwvtDj5wALeqMtkyQDyWE5hKv+2stQwgVMPcnygi+1tkgWFB109i8TZFtO7a7M0i+U
	gpg7nSGJpbeUPTKKxMpMwG6PlJ3rHzKtqzQTpQ03ilLTQ/DJ1LNvsDngmn
X-Received: by 2002:a05:690c:dd5:b0:798:68c0:d9fc with SMTP id 00721157ae682-798da50bbf6mr12024927b3.49.1772741339271;
        Thu, 05 Mar 2026 12:08:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-79876c9b902sm29352857b3.29.2026.03.05.12.08.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2026 12:08:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12721cd1a2aso125745604c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 12:08:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772741338; cv=none;
        d=google.com; s=arc-20240605;
        b=egWkzROLk8iAk5wIO5N+yY0U8wSsf8W/1//CHaN3mESfn4+8Nu8RGlo/vN3B9ggCaT
         vEWScBVGr+a4fhIVcFWjzrd1KSN9758pBWs/5eX37AyMALkw2bY2yz6O1yZMA0wtZoOh
         txGZhem4Ii1aE26AApTDGgQNJ57vU828u2YYrcoS6mXjSoaRonenoxE/G9DtxBYcyP2l
         9gaqw7cbm7/XE6nl44YARJs8GR0L11fmKtZEKrgy5pscUtUD2nrjJsYUHdnqsUPyXr+F
         bIi1lzRa5zMG1MiRSRUAoxd/sOyIEYEEldQXqEymENpjtGrcz70zxrnX2lfAFebu6iFj
         aruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u7AaR+feZM5r2+UFInGB9UfPdjsNdVV2tS9vYrPEuqc=;
        fh=vMpjq1cV2SvhREPrjPM9026mMWDNWX7AVDoEnBT6MfM=;
        b=FY9uDE01CH6UaF3cdxoxOeOkdTsKu9TPK7qxEBPvBP/etjl+/In+4xidoEE/RTr7C1
         zCeSnRFkuKgKmQYCKGm2k3jE3mtruZa+CvzBiUZ05tcPbcHSG6Qel7OVfiFfrlOSr9xL
         Rz70gvjUwkpbPdL1N/wQDCXLyUr8SlxOifBCtQrjdtSEkU6vKAzzKjc3drTnL2T7RDsB
         eq6E4qOEQ6lTxrXm6+3BEpGYctzGMi+FKlKIEBDGbN/hRQcvgmdvd/HwUykv5HH0KiTq
         vRYHihrDTIfiG4Q8GAbGpTfdB3uFt+M7clA2EfJAzu7maBmIb3eXrdBeVf+Ld1t+yaUZ
         +CTg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772741338; x=1773346138; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u7AaR+feZM5r2+UFInGB9UfPdjsNdVV2tS9vYrPEuqc=;
        b=TGdeGC1VQ86LSpWMEz3ckg28HlkDmb9l1eX92auAYU2VTB/7z+LJPS8FnYj/Deiuuo
         zZtXpdU/4iCVJeLtSyt1SOJIVaZBaJ0gdQvBRL4hvIjfyLa4c7iDX3ckaxYBbcj88SX9
         7zsKloIQi2yC2z6Ey4AMiBkXf3ns8nSa2TZbw=
X-Forwarded-Encrypted: i=1; AJvYcCW65y+MKbRCCpbSJ15IMkuPZ3wPYlSsTRUaW7yEY0SeIDGXzYbOEsNGSCgtdOE5bzQ0M8HULcJ5Ju8gSFakRcpy@lists.infradead.org
X-Received: by 2002:a05:7022:b8c:b0:11b:88a7:e1ac with SMTP id a92af1059eb24-128c10c9716mr546668c88.19.1772741337895;
        Thu, 05 Mar 2026 12:08:57 -0800 (PST)
X-Received: by 2002:a05:7022:b8c:b0:11b:88a7:e1ac with SMTP id
 a92af1059eb24-128c10c9716mr546651c88.19.1772741337353; Thu, 05 Mar 2026
 12:08:57 -0800 (PST)
MIME-Version: 1.0
References: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
 <CAKekbevZQBdvH5CCGyCDhs7ND6y65C=S3k1Aop8eh4CV5r_4aQ@mail.gmail.com> <38c0a23e-88cc-4f26-9648-fdeb9e99160f@kernel.org>
In-Reply-To: <38c0a23e-88cc-4f26-9648-fdeb9e99160f@kernel.org>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Thu, 5 Mar 2026 15:08:20 -0500
X-Gm-Features: AaiRm53XZhNPPi96Ac0somFmO4m3j6WMSccVLybwlqQcDsC_RIXA2i9TzPTQmH4
Message-ID: <CAKekbesOEL5kTYEq=ibsiuDoY2MGxJ6oxAkGrR6v3yQLUsLcUA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Adding brcmstb-hwspinlock support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, baolin.wang@linux.alibaba.com, 
	florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000c1784a064c4c8116"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_120901_134753_64B9A63D 
X-CRM114-Status: GOOD (  17.73  )
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

--000000000000c1784a064c4c8116
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 2:59=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 05/03/2026 20:17, Kamal Dasu wrote:
> >>
> >>  .../brcm,bcm7038-sun-top-ctrl-semaphore.yaml  | 45 +++++++++
> >>  MAINTAINERS                                   |  8 ++
> >>  drivers/hwspinlock/Kconfig                    | 11 ++-
> >>  drivers/hwspinlock/Makefile                   |  1 +
> >>  drivers/hwspinlock/brcmstb_hwspinlock.c       | 96 ++++++++++++++++++=
+
> >>  5 files changed, 160 insertions(+), 1 deletion(-)
> >>  create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,bcm7=
038-sun-top-ctrl-semaphore.yaml
> >>  create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c
> >>
> >> --
> >> 2.34.1
> >>
> >
> > Hi Baolin, Rob,
> >
> > Gentle ping on this series. Patch 1/3 (dt-bindings) has been reviewed
> > by Krzysztof and all previous review comments have been addressed.
>
> Why pinging Rob? You got DT review. Or one review is not enough and you
> need multiple maintainers engaged?
>

I am good with the DT review. Rob commented on previous patches so I
added him. I just need the hwspinlock maintainer to review the other
two patches.

> Best regards,
> Krzysztof

Thanks,
Kamal

--000000000000c1784a064c4c8116
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
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
ZUGCu6d0oT1M+zANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgLSmWdQjIvYNUlNCQ
ggtvQWGDlj6QlPv+Nz0l57iApFcwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMjYwMzA1MjAwODU4WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgB
ZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEw
DQYJKoZIhvcNAQEBBQAEggEAWT0BrV5ljR7YdMHVKFUuX1zj+/luVKAc9MoEGj+28b4gmwiRUb6w
Hqu2PhOL+vAmOrHv6vpedAQY63IvX67WsuilJz+5D5qAAedRBuLDqps6FVFzb385cibdhpRxAvfH
VEuleE5s3dTNwD1zBU6dSkLjXDv0Or+v/m3Yn1iTa16P6nMZ/RmKZ5NBmU9Uemg96n0RYQ+2CrwO
k5eEZDk2THrxIXCb/s9XV9bg5l/6goxIomXiaFZ6zr6INIFyYsVAA5vwPIusWAQCarbPLl75PklV
UJ251kG4CwU8YSxl99LQtS6Yv+ymr/mMP+RTwQmo+Vnboboc2Iya8xIBfwvyhg==
--000000000000c1784a064c4c8116--

