Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3B8CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hlaDSEXqp/H1Y2f/LgoZaHGer4iazID1ejkgcdqjhE=; b=ZTnbmfoA4Wf90rP2uCchhewoBi
	8ekW6xDr6mpE8OnONMwlRzGqnVEQr6FuLKmHYjvYonct2YJ+jueX6bYPw3Gjqsf2cSwE1Ujl9vIrW
	cYjt7ylDaRVl3CJLNE+LJq/EV51bzqPjCEq/i7ObX9043kQe189XQ33Mlac3ye2JejMxByjupI2uk
	I6su3kEArUZuIa5iXLGpgwKvrbrQKQPuIbb3vbg422AMbJlkQ5ggA8813K84HEQEYVGvq19ssidT5
	zmLrmq7USBeQYqZSGxi8XsUa9JtOhfaXofzqKzkzXPEPr7hWY7KDMHkVc3Oo1prUoNCRWXhMx9gko
	yyYWIy5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6slp-00000006WxD-1nxr;
	Thu, 09 Oct 2025 15:41:33 +0000
Received: from mail-pf1-x464.google.com ([2607:f8b0:4864:20::464])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6slm-00000006WvT-3DAn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:41:32 +0000
Received: by mail-pf1-x464.google.com with SMTP id d2e1a72fcca58-7841da939deso1045021b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 08:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760024490; x=1760629290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9hlaDSEXqp/H1Y2f/LgoZaHGer4iazID1ejkgcdqjhE=;
        b=ZxFIsC3EkuCsXsE1V8mEblCjbsJn/mcLVxCm+anR+JoZgr+5G9DqO4g8xPyUVI13ae
         07DEpKZl2SrsuIdAhb9SZ/iMPfBalJdf27cvyKJ40Tqeobz9c/B98CuxRCkSEYRWTjDl
         xIXizxw9+1MxYhGMkTN6HGNnQtrng1xyuFDEvUvCvmpsZk8upItqyL84LoPbOlxBp2DQ
         jlhb8ck9PCGizV1tkLthXaoEdkrpK5vp50dFAwliZTXlay6kkhWOD9vNF524OIfiX2h3
         zvZKl1UeC+zGl4HV6guDoyWKK6T0PZYyS/m/4IW9d5CawzwmdrEWoCvi2IERB4epZvAk
         ON6g==
X-Forwarded-Encrypted: i=1; AJvYcCWrrOmHp3R7SG7/FXe4NoTvJUW2+Gj/K/3wG1MiqJ5jamlJLaqbPiwApC3Q1tIHdzxMqqhrvp+AoHq917PUbRGt@lists.infradead.org
X-Gm-Message-State: AOJu0YyHc0Y7IVSsZZgYkowM/2jJlMC6N8VxtiSvWMdUJmPpkI7+WBqO
	jP6zI5fJQTDrEzMKVb4WjDJHjRzJwubb1FNH+T1r9dwhSRA1n0UNpcEa3Fz/Ztjui7X//nl4Kzh
	4itxyzLnjFSm7kWeG0LU8GjZnZDsZyMxSpqtRL5KBPjQnk8Oe6tME4+Mp/4iAdUOi2SheczBzC7
	HRa5lDtn00IIFVOeUKyz5tPHskTXaLF6ttCHQedlQ6gn95FH+3q6V4DZyVHCo9abydrG07AAMbo
	XgkB1EPp6Np6QYd/K+TvZdnFu8=
X-Gm-Gg: ASbGncve7hvt+xEDbnk9t3CtBqLz0RdzJ5RiZQg4OUiRvxHnQwAsZfQRgh4IgB1u+cF
	mzeiX7fsyg1UadyrJiyiLHVUILKhII5ZofSPXwcrCs3dliozSPPkBlZj6w3x8CzT1j8f4mVQsEo
	D7kWFI/6sng8Y15iAsXQAfTQKTtcijBC+B6K7PO9LqwKUdCHU8sxhXMljisJmo21vOi+sE9l/AI
	GuXIwNtT2fX8E83HsGnbOOMHvkvGCektnfWFa6a7yDYVH4N4EuucnX6BLe3zcHCfot7ktiv0YlV
	iJcD2dsyxedLD/5JJLb7uOv68dW0YK/eOJELxV9JkaqJvU+iEeOwKCTJ4VnUbtaH2QAspQtvLDG
	Xkd+ce5mDSwoQ1GLdACiZY9DBysOfnX7N9Nc8J/jF7ZNCxVp91UKzBjZSWsjKQkjT/NMzaCwwGv
	kciw==
X-Google-Smtp-Source: AGHT+IGXqiWm2GHM9rQvQeJngi46Wrzp+3u1e6Fh5WYVuaqoWh/jCJjG7CzyMoGo9mZR3YgkGvpHDVkd0YyL
X-Received: by 2002:a05:6a00:139e:b0:782:d4b6:f5e5 with SMTP id d2e1a72fcca58-793859f6658mr9972258b3a.13.1760024489283;
        Thu, 09 Oct 2025 08:41:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-799339df918sm343b3a.13.2025.10.09.08.41.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Oct 2025 08:41:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2699ed6d43dso17984265ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 08:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1760024487; x=1760629287; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9hlaDSEXqp/H1Y2f/LgoZaHGer4iazID1ejkgcdqjhE=;
        b=Ft+jdp12VRXfoDOVtJrYSSsG+DNUGx45ggKF0uRDTWL6ky3tT0hwzI64dDxiXrCQLw
         Zko89b2Nl6zYGo2BMae8UYe0Xmq+moz8A5/jz5xXiQ6/T1sU4nz3JnOpWMCSpTX1gPjR
         6VCl/d/JX20KA5fNDEvpRk3YRj8nwNP1TMxYo=
X-Forwarded-Encrypted: i=1; AJvYcCVdU35ccm6qVAoKqRaDXYjtFGkBZGtVyEdxCieXwbOQB2RENJhWZtwPA4ATrmG5Vnc+I8Vpoykqn2vremOjMz1H@lists.infradead.org
X-Received: by 2002:a17:903:38cf:b0:267:87be:505e with SMTP id d9443c01a7336-2902737c68bmr89776585ad.23.1760024487403;
        Thu, 09 Oct 2025 08:41:27 -0700 (PDT)
X-Received: by 2002:a17:903:38cf:b0:267:87be:505e with SMTP id
 d9443c01a7336-2902737c68bmr89776305ad.23.1760024486978; Thu, 09 Oct 2025
 08:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251001181641.1561472-1-kamal.dasu@broadcom.com>
 <20251001181641.1561472-2-kamal.dasu@broadcom.com> <20251008155639.GA3512742-robh@kernel.org>
 <7d96e604-e485-47c8-a0fe-64201f30eaa1@broadcom.com> <248d0898-2eca-4ba8-9669-cd3d1cd8ad1b@kernel.org>
In-Reply-To: <248d0898-2eca-4ba8-9669-cd3d1cd8ad1b@kernel.org>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Thu, 9 Oct 2025 11:40:50 -0400
X-Gm-Features: AS18NWCOssCw7IteD2OuF2RPMcPlJQudhAAfNtYjHkJlAud1l44gWSuyO8OBSHA
Message-ID: <CAKekbesFvxD_=UKcDyTPmZGUmU3d_RXvjY6RMVRkcKCNz_g+Cg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Rob Herring <robh@kernel.org>, peng.fan@oss.nxp.com, 
	andersson@kernel.org, baolin.wang@linux.alibaba.com, krzk+dt@kernel.org, 
	conor+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000064983c0640bba286"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_084131_099537_7E61D857 
X-CRM114-Status: GOOD (  24.28  )
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

--00000000000064983c0640bba286
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok I will send a v3 with the explanation in the commit message for
both the patches.

On Wed, Oct 8, 2025 at 8:40=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 09/10/2025 01:39, Florian Fainelli wrote:
> >
> >
> > On 10/8/2025 8:56 AM, Rob Herring wrote:
> >> On Wed, Oct 01, 2025 at 02:16:39PM -0400, Kamal Dasu wrote:
> >>> Adding brcmstb-hwspinlock bindings.
> >>
> >> That's obvious from the diff. Tell us something about the h/w and
> >> convince me we don't need per SoC compatible which is standard practic=
e.
> >>
> >>>
> >>> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> >>> ---
> >>>   .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 ++++++++++++++++=
+++
> >>>   1 file changed, 36 insertions(+)
> >>>   create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,br=
cmstb-hwspinlock.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hw=
spinlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspi=
nlock.yaml
> >>> new file mode 100644
> >>> index 000000000000..f45399b4fe0b
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinloc=
k.yaml
> >>> @@ -0,0 +1,36 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/hwlock/brcm,brcmstb-hwspinlock.ya=
ml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Broadcom settop Hardware Spinlock
> >>> +
> >>> +maintainers:
> >>> +  - Kamal Dasu <kamal.dasu@broadcom.com>
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: brcm,brcmstb-hwspinlock
> >>
> >> hwspinlock is the name of the h/w block? Use the name of the h/w, not
> >> linux subsystem names.
> >>
> >>> +
> >>> +  "#hwlock-cells":
> >>> +    const: 1
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - "#hwlock-cells"
> >>> +
> >>> +additionalProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    hwlock@8404038 {
> >>> +        compatible =3D "brcm,brcmstb-hwspinlock";
> >>> +        reg =3D <0x8404038 0x40>;
> >>
> >> h/w blocks rarely start at an offset like that. Is this part of some
> >> other h/w block? If so, then just add '#hwlock-cells' to *that* node.
> >
> > We've answered that in the previous review:
> >
> > The block is part of a "sundry" IP which has lots of controls that did
> > not belong anywhere else, for better or for worse (pin/mux controls, So=
C
> > identification, drive strength, reset controls, and other misc bits).
>
>
> And every time above explanation will not reach description or commit
> msg we will ask the same.
>
>
>
> Best regards,
> Krzysztof

--00000000000064983c0640bba286
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
ZUGCu6d0oT1M+zANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgtSx301wUKFdhp+nN
egMZAc3XfRpt+3PGSOz/MHPfIC8wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMjUxMDA5MTU0MTI3WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgB
ZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEw
DQYJKoZIhvcNAQEBBQAEggEAYwaVZa9Biad3m8cLEw2HTxAK3j8q3kyf/XsHildvsyq8emU9Upyr
2+yS4d3sQHPMjypMbBDwKvgCNtH3cZTv5SlicZ4VwGI+CG/o5+S8t1wfAB56fYGoMwAUoSCIXc8H
xLF3s+VPkADbce1x7I/jlFho0K7VgiFqVXJsAXjv0jLCdA1I9QLYeiyLTHCbZv1LYONXrWymR8V1
mjt8ip2/QrKP+y6eMv1vYhf2XANNZjLBhrGeIalLFAwo0/6l36QEWkPUZUpZrUqbP7PjfPAXkp6S
KLlhbZeuEtB8OBvzHfiQo2uYyv9T8VNlcbivkiOJaEThvN7+T/2GF2LhJ9B0EA==
--00000000000064983c0640bba286--

