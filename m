Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4542EF47CB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 19:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i21Zk7pSpEQrfxbPYnv6N1Jns7Ad5K1iAuEL4/25vtg=; b=ur2MoRMKaa8a5WnEXxHLD9u/Fd
	pFWqa2QUem4gqRbamsVSkcORfq9DGkoVBp2EoxqFoIZUrFYGxI/2pg1jVcjshpzLOmIci2NXlsMee
	c+DGaT43+XER5+a8DSiPQ7uMcU48ehEYN+Q0l3PGNQMhw4JQ7Cf8Ovo83dAunFaWqZPDpMnIfbowY
	H3iiY4kIjtVa9F9OHF/TdOdDgi1kcRxTSl2bOt5wkpDzYtLir0+z8IfipOAYPWF3JQNTy8wO0fRJq
	fr6l0O82sGVqGBcWbiZWhKmyYZP7maai3b2AOeEmF2YqR0rpDdKgA0UxdV8Xkhmjv/KjSnuPwpcQN
	ozBbfNug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEDB-00000002R8r-1swp;
	Thu, 05 Mar 2026 19:18:17 +0000
Received: from mail-qt1-x861.google.com ([2607:f8b0:4864:20::861])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyED8-00000002R8Q-3IiO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 19:18:16 +0000
Received: by mail-qt1-x861.google.com with SMTP id d75a77b69052e-5069df1dea8so67886871cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 11:18:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772738292; x=1773343092;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i21Zk7pSpEQrfxbPYnv6N1Jns7Ad5K1iAuEL4/25vtg=;
        b=IHrem5PnfDn5/9sxCbyoge/rPkO02mndEPip2PnC2PUO6G0tvmGGK3Ih6vaDRs0+Pc
         XHThCUD1GYp6PcxjG24sWmy0oKEdgDXsYbnb1q4KsGB+skAHc8tr2EYKYGTzgiKMW/Vw
         fgmXFCtslxVAwY8QjEiR16AJMpU1ZQB6UJYdggy3AaG4ImtQPSoE4/IQAsExDOceNX9d
         NEx9VD05sZx2HtAQMRyd3/386PPo1CR3XBuiIc0EJUtxwheZL+1durl/BpyPPNEA/TFe
         nckKoNqZ7SDRFY7P/+NG4csPoPsyXCXC9BoegGydi5THwnjubmEfDh04hVR34/Zbmkmk
         dKqg==
X-Forwarded-Encrypted: i=2; AJvYcCXzkRWcXWiQ0ZqB0Xpal7zs9utsa21d1NYSWzednCv8SNYPJQ6dI0WFtgqorUMVDqIzYQySrd+1OLRJ1qQijjXS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5Zg/xy2iLqRz3mhhe7Bb+GkT7Yyh8SFJxHUJzDZcnCIyz6bOc
	WWv86R9eEFzVZsXl8S4VGFc+1iYKGKkkqfz4W9abOJTU67IuH+HWfCO4utQumhBt7j5QViPWvvx
	mNtoj32aNrPwITXB+K6aNPUsdi35+yZNu1bESoCRy7fw233BqXnp91bYvbaMDZ8K87rC4PWQyWC
	hodCsCAkzdlPhxCmyb4MGj/tYB/Zn20rciguEdvXPQUijDXLCco9M5G1/bsZ/hz3yETSRUjma7U
	Yq0xu9X+WIwCaVYX+JEnwF1iVg=
X-Gm-Gg: ATEYQzy0JWBMdMMi+ityn9w6ZnmYPstAVTBqtkPQWvoNHyVEyTrvGbrfnISDSJVaesD
	Sz4+LGjdLYHclmqgCU82ksvzIVS8JiYVROyz44aZevEyoc/+o7TF4oyZLa7tZG7bvQkISXH1n1q
	k3UfGG93aItznUldywJa3Np0QyyXMjmaZLzfxgjdtbzrbvjexr8uSAGeHW0058KiEplJfVgWb8y
	aFfOf5Wy/nUpCWY171N5iPwvBHJGVjZBMspJQjlp0QFbnMFCKhROHWgqBg9fuR4wdPxYIMBxfkw
	XyDYPX3FDaYDLXW2uAH70Lut8weP0yl05tazDwaIUMEJpt7TUFzHJzfhKygaf92M6khbBWGN4KN
	+MRZ62Fw8SLlw75cb7hkm9ZABOYJB+KhxP4wiDM0M6wWy/X1e0WOWD1MUlujMM/5vPpU54SSehe
	d9PHyH57lVXE2FTDJJYzbwX1uTqiEtqBoAfQW/Dj6mjLhz3vJ98UcfEA==
X-Received: by 2002:a05:622a:1811:b0:506:6cfc:157d with SMTP id d75a77b69052e-508f1e24b16mr10725541cf.67.1772738292258;
        Thu, 05 Mar 2026 11:18:12 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-50744a78567sm31011611cf.6.2026.03.05.11.18.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2026 11:18:12 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso5862730eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 11:18:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772738291; cv=none;
        d=google.com; s=arc-20240605;
        b=WlkqG/HXCzxVbucUbb8gYqWsBr906vV7Q+lVZtqx3D7sZeNKLvsYegb74Qvx6ulKTo
         WA4XumZ2+hjFGhtzyqFUVVu9LTaRvCwQ9wcUraSweEce3oSgwPrksEZ69TeidwMwGwBO
         JCU9PDrIp/+5ik/qFXmS10PtTdya05zzR5mDLw9u4CCDP8sRNX2agh/8Tc9aMqsh2FoQ
         I8Cmm7LbLi7YAcae2YrbGhHqH09zk3/JN0F9D47OiNUNfcjCIh1t92tOQpEjd5yWj9mW
         UKt1C5zN6D6IzNstbmAP7SQyy3Kf7SxqXER8OLmprZnI2eNSCdtEHTqHh4rDsXymQR+k
         QFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i21Zk7pSpEQrfxbPYnv6N1Jns7Ad5K1iAuEL4/25vtg=;
        fh=IpyWjxcXNfjOiUtGywclNJ+tjfdG0T7jdln9NvVf6pQ=;
        b=Nx65/yaeSUH2MsKRjJL82AlOag+RGauXkN1aSSVE6Q7M2VVGP1jfo49r0eDypJg3Oy
         NTHXjqSEEPf8wxJUTfI2yJEE1Z07ty86e8jQTUs73PiQohayk7j0rmnIS5Pjrtbg6olj
         z/n8nz5fBrw30KYR9Qz3KBcFeRZmER65vGHtHUbzCWJ6O7QnPaGc376qXP1ZzcgNPNY0
         jbCybNxlhuLKWeW5+cadqD29XSm6VK/X5Jxj6Ts9tY/f96e5qR35QtoDMonVynEd3bLm
         EmDqHL5dp1k69VTeK/mXg0JGIWUv8E625Efu3oiMJY8pAvFqL9iL5IqMydBTHWm0EudV
         urdg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772738291; x=1773343091; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i21Zk7pSpEQrfxbPYnv6N1Jns7Ad5K1iAuEL4/25vtg=;
        b=NfpL1CEpDPQKpyki1WYJiABgXn9tEmdaLeletz0MDDANnLyWAmPiQVycg3MPvbteER
         IfTNSw6qu5pli6bRIolLyxSeQBqamFF3dDsQ1nUtu8nlrIiQsWkBniNvYSH/5MeBZ9C1
         urBnExVpdU5dh7zU+G2CfJFcc7Y5Ho4DSpcKs=
X-Forwarded-Encrypted: i=1; AJvYcCXfNUMDAmqrJlb8/cMqnoG4KYeyC1Bp3sPqAJxzPlcs8TmG1ZdFeEKQdfQH/W4vNWCtRansx1xsFS89w3A3+0vd@lists.infradead.org
X-Received: by 2002:a05:7022:eacd:b0:119:e55a:9c04 with SMTP id a92af1059eb24-128c112d499mr451541c88.32.1772738290609;
        Thu, 05 Mar 2026 11:18:10 -0800 (PST)
X-Received: by 2002:a05:7022:eacd:b0:119:e55a:9c04 with SMTP id
 a92af1059eb24-128c112d499mr451521c88.32.1772738289981; Thu, 05 Mar 2026
 11:18:09 -0800 (PST)
MIME-Version: 1.0
References: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
In-Reply-To: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Thu, 5 Mar 2026 14:17:32 -0500
X-Gm-Features: AaiRm536QDB2rICv_Un4lGUCb33AgOKdF-jto1AIVIu78d96cSbF2iwIKJyPXZU
Message-ID: <CAKekbevZQBdvH5CCGyCDhs7ND6y65C=S3k1Aop8eh4CV5r_4aQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Adding brcmstb-hwspinlock support
To: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Cc: baolin.wang@linux.alibaba.com, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000022fc42064c4bccfa"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_111814_919152_F90D6DF7 
X-CRM114-Status: GOOD (  27.65  )
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

--00000000000022fc42064c4bccfa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 5:04=E2=80=AFPM Kamal Dasu <kamal.dasu@broadcom.com=
> wrote:
>
> This is a standalone patch for the hardware semaphore feature for
> all brcmstb SoCs that have the same hardware semaphore registers.
>
> The semaphore registers belong to the sundry hardware block. The
> node describes only the semaphore register range carved out of the
> larger sundry block address space.
>
> The compatible string uses "brcm,bcm7038-sun-top-ctrl-semaphore"
> based on the BCM7038 SoC where the semaphore registers were first
> introduced in settop chips.
>
> The patch has been tested to work as builtin as well as a module.
>
> v6 changes:
> Addressed review comments from Krzysztof Kozlowski:
>  - Renamed DT binding YAML file from "brcm,brcmstb-hwspinlock.yaml"
>    to "brcm,bcm7038-sun-top-ctrl-semaphore.yaml" to match the
>    compatible string
>  - Updated $id in the YAML to match the new filename
>  - Updated MAINTAINERS F: entry to match the new filename
>
> v5 changes:
> Addressed review comments from Krzysztof Kozlowski:
>  - Changed compatible to "brcm,bcm7038-sun-top-ctrl-semaphore"
>    using the SoC where the semaphore hardware was first introduced,
>    following the brcm,bcm7038-l1-intc convention
>
> v4 changes:
> Addressed review comments from Krzysztof Kozlowski and Rob Herring:
>  - Renamed compatible from "brcm,brcmstb-hwspinlock" to
>    "brcm,brcmstb-sun-top-ctrl-semaphore" to use the hardware name
>  - Added description block to the DT binding YAML explaining what
>    the semaphore registers are and their relationship to the sundry
>    block
>  - Fixed typo in Kconfig "Setttop" -> "Settop"
>  - Fixed email typo in MODULE_AUTHOR
>
> v3 changes:
> Added detailed explanation in the all commit messages as per review
> comments
>  - Added description of 'sundry' ip block that the hardware semaphore
>    belongs to
>  - Added reasoning for using common compatible string
>
> v2 changes:
> Addressed following review comments:
>  - fixed ordering of obj brcmstb_hwspinlock.o in Makefile
>  - fixed ordering of 'config HWSPINLOCK_BRCMSTB' block in Kconfig
>  - Renamed BRCMSTB_MAX_SEMAPHORES to BRCMSTB_NUM_SEMAPHORES
>  - Removed unnecessary platform_set_drvdata(pdev, bank);
>
> Also addressing duplicate PATCH 1/3 sent in error as part of v1 change.
>
> v1 changes:
> based on fixes made to Initial patch:
> Link: https://github.com/intel-lab-lkp/linux/commits/
>   Kamal-Dasu/dt-bindings-brcmstb-hwspinlock-support-
>   for-hwspinlock/20250712-034624
> Link: https://lore.kernel.org/r/20250711154221.928164-
>   4-kamal.dasu%40broadcom.com
>   [PATCH 2/4] hwspinlock: brcmstb hardware semaphore support
>
> All the review comments and build warning have been fixed.
>
> Kamal Dasu (3):
>   dt-bindings: hwlock: Adding brcmstb-hwspinlock support
>   hwspinlock: brcmstb hardware semaphore support
>   MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver
>
>  .../brcm,bcm7038-sun-top-ctrl-semaphore.yaml  | 45 +++++++++
>  MAINTAINERS                                   |  8 ++
>  drivers/hwspinlock/Kconfig                    | 11 ++-
>  drivers/hwspinlock/Makefile                   |  1 +
>  drivers/hwspinlock/brcmstb_hwspinlock.c       | 96 +++++++++++++++++++
>  5 files changed, 160 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,bcm7038=
-sun-top-ctrl-semaphore.yaml
>  create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c
>
> --
> 2.34.1
>

Hi Baolin, Rob,

Gentle ping on this series. Patch 1/3 (dt-bindings) has been reviewed
by Krzysztof and all previous review comments have been addressed.

[PATCH v6 2/3]  hwspinlock: brcmstb hardware semaphore support
[PATCH v6 3/3] MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver

Haven't received any feedback yet. Could you please take a look when
you get a chance?

Link: https://lore.kernel.org/linux-remoteproc/20260224220407.2351692-1-kam=
al.dasu@broadcom.com/


Thanks,
Kamal

--00000000000022fc42064c4bccfa
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
ZUGCu6d0oT1M+zANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg0jF7kkCJeO6HCfzy
seYILafFajwCB9QmfD3bu/6RT/EwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMjYwMzA1MTkxODExWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgB
ZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEw
DQYJKoZIhvcNAQEBBQAEggEAGZ6aQqg88rKpQ7A2LYdXh7Y8pKStwHjAOgnWooyaQ9g76HSV85hA
WNuW8S2901BS64g9fV4/TFbglMn6z0vhqD8aI9chyEWoydbR4B9alM9CMJ/T/ND3iuNy2C3Tlt0Y
qHu+Oby1i1T2qMQoxK9Woz6yLBdJ7sKwbgyZZcppNymEr9j1NWw1uGpZ+fhYSsmRPxBww2dZ7+UJ
+Kwz8608fC6t6oL/jMLwVielEOOq66g27zgJkomG64rMb9eZ6VTbG8ZBjhgyjWZI74i+zMn0Ws+b
RardHeqKKoUA/p5xva8roqvN7tG7nwUuSnTjAnG2mbjOqMbn9hP1CQni8oB2RA==
--00000000000022fc42064c4bccfa--

