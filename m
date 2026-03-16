Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9798DF53D98
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 20:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xkCY/6X+fi5zEh0/cOvXsrFKDtmT0WjtnCXtkQ4P3w=; b=wwVZSJ8pmf0SteaIXWWwOtxpVx
	wtZEK9cUF5zYs62ZiUFZ0x5PQlJHCnRTNl0FZOiLUwDCV3sZvF1SmJJY6HeYUxHXh8FiGMKnCljSq
	xoECjkAL3+LnP1zEaw4QKPsCRMahPSXY9IwUuk6K1vw7dPQZ/gUC6i17SX3xUVp399s1by0toFi4q
	9l5LZEKYqPUByE0hCPIImvPmmBsWk9TcXCUuDuFT+fy/9M04RudQzJSCdXVpfisw+lSLUyDfDXKhi
	ZpZPXFDAGpN5YpQdDYoYK7I2nfaTAluYDVThEd77vjZ9luWFFxBiF+ZkMrKtvQp050Rz04AOjqTIV
	A5MHJ36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Eeh-00000004op0-1HL1;
	Mon, 16 Mar 2026 20:35:15 +0000
Received: from mail-pl1-x663.google.com ([2607:f8b0:4864:20::663])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Eee-00000004oob-0aze
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 20:35:13 +0000
Received: by mail-pl1-x663.google.com with SMTP id d9443c01a7336-2b042533de1so14321465ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 13:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773693311; x=1774298111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xkCY/6X+fi5zEh0/cOvXsrFKDtmT0WjtnCXtkQ4P3w=;
        b=GK3hgVPVYywPDcwo+g53s2GbFZ2B9k4aVWnqqGLceYpf5kAFFwcbHxn+9bkgWtT6cW
         mcGFjoXrpHF91M/Q8IyGXdEh41kZCa32AlWza09iRtDfjdpK98UEXzF7pDpz8NaVC01f
         yz7AbjmWhiE/y9cUt6bu/gtP8YnV3EnJptnRxWaguI45s2n9xd6PIWUt313dyvV40O7u
         OLwkmFcwvcaVMyIwojHHWS46on0N4cpUtcEzrgLPl9aljTZSpinahMcyNEClF8jLUwVx
         Qwvsls0an/v0d+nYdaLaZd1Ry84imVJYe0gadwPO0YNXhNW4gA7IwA8lQsr47X2Ct73J
         it1Q==
X-Forwarded-Encrypted: i=2; AJvYcCUJ33ebxGBK7hXjlG5+zPb+o/ZsHA6dTbWgS3NjEdpR7aqw/UTmCqazuye8aHb25jg4WfgryUTEOXyZtrY7+lhC@lists.infradead.org
X-Gm-Message-State: AOJu0YxhbJm1aBMcR5lSwuvoqFr4Nmx1nAfA/0AMle/GktpOYpuospHf
	LsRqFu3zw2uN9EbhqcifbRTDz2lnC3Qdh81JB2zNDRYzrVlIx5RpBosSLahn7a37k1wxFtgVnhC
	8vAJB9egfJ1K7HhWqXiYg3g12D4K9OYRbGpMmsuMD+FFXXm9p89Rew/iGrSujQchuN5HE9ROxsy
	GfaLvLjN+WW/J14mpooaY8EhyS147+nc6Fm13fklneZqyHOOn9cSpKLiGdKRdqKa0n8kYH03fnl
	cPdhJYnYOvPmKvbqS/xvfncZGlhQX6uekww
X-Gm-Gg: ATEYQzz/oi6nI6Uo9VwvS1VU3HfMMjH2UPIUJEey+2A5LER9TYlGl6U+36UP6QLxhJU
	H4dilpSzj6UdNFWlS9JZqoNdYKBaaXE+aob5Qcxsv6BQtSOhoLJsWrCP87oLqXW4mmsiWVPy3fZ
	dnMVC8rv4vhiUDEIiqdMU0QUuyWo3712lF6UrtW3QbzWpMQbq/INKAZDdtD5OsjcwnXrIFEA9dG
	WBMTVBuLq8X8IG7YnLMmW7ujCh0V0OLxg7SgSjkRzOB4EGQ9z3VCx5Q3r7h9y0BwKMBWw6y5rfF
	GuYxejOoZqQLc5G5u73YNwx8yAHJcmMdeL5bh9ufhFM55EIl2akNTxUx/L6K1zQuLaBB3qGfb5M
	93wXRLsCFrueFxxVRf2/XtA+y7wf1GWYAPBnYp08UZO7WZmYIi7vhfcfTQ1FQsvCFJOT4nUcops
	xB9IjWadYN45waGGazJHvNsN874gv62ahfaNccZH/qvZ8Mm35uA3k1L8uwMnEP4yE=
X-Received: by 2002:a17:903:1a8e:b0:2ae:c7dc:95a4 with SMTP id d9443c01a7336-2aeca9f8ee6mr162712115ad.20.1773693310873;
        Mon, 16 Mar 2026 13:35:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-63.dlp.protect.broadcom.com. [144.49.247.63])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2aece814a45sm14161615ad.44.2026.03.16.13.35.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2026 13:35:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-439ca4b3d0bso4191860f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 13:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773693309; cv=none;
        d=google.com; s=arc-20240605;
        b=LvtjfUzVJw31zkB/uRWd5t9z964JFaL4umE0OjyhpLDN6fuAU5qg9ji1t9ZuNrLJ/j
         417aEXe1dEUayjxqKM6V1bikBmdDZGnGbfae3Y+bj8AKOGRGIjcT5UnTOA5PHcrDyOKh
         LuuYh++zjxxzNhhq9vNeRaBY443W+/Az2ZWqH0P0m3LmGRGtZ+XDiFLYrUTtoONH31LS
         ISVGDnRjFE03Cmi0pkqKQKxi7H7h4k1xSSz/jGz/KNUYo3HDK9k1nAV1KQCmzsIB9zAR
         D9+qz5PKPO8H+x1/YEC1xKAy90Xioxp4A+P+A30hYK2e+rbsiHC2WLp9mCzZM+jXrx39
         kndQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7xkCY/6X+fi5zEh0/cOvXsrFKDtmT0WjtnCXtkQ4P3w=;
        fh=mOD7kJxXQxl/4pZ+ecDrjItjR14caqNj9NmQffSpBXk=;
        b=ZgwgScl/C7Ioiy/FGmfLrrX5TQ9Y4ooQBGyj97EO3uHkfbG1cMUGDkJzQ/dSR5CCwV
         UDT76HN9Xz8vlBtI7Z55t/7HbjY30c3+mZS6wigNGTFu8JjL4u8421u98wQlBCgVeIk2
         DwtKsjqHwZP5T+fnGhrlK8OWv+bZYvXW1UrKtLII0ieO57t4UumQDoGh18Oic8fIyxm2
         +qEBN7uZyx6/2yjow+PTuzzvMKWGn0VYc4ZxIZck1xExFLHV1gv9wGRIue4xxtjh2KpN
         CLndfC7NkFUYO/TRfnG8QqyMocBtnUACf9JbMwYioeosg4dWq4zgxBEPCuhnUXtkkRWC
         QEXA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773693309; x=1774298109; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7xkCY/6X+fi5zEh0/cOvXsrFKDtmT0WjtnCXtkQ4P3w=;
        b=WU6y1nNJHOojfol00ZiwmJBwsy+xuG8RjSZD/IiWtXIO4VZrS4cafNgn6zk0vHQINh
         2CJhtF7KCBtWTCC4l2vLugC341ymbjNcHifB/NWyWX/Nfk2BfdnHdDKFV2QiOy+bWV9l
         ssPCQEKZWKUa5FsCi7keMKEepY19wAE8mkT1A=
X-Forwarded-Encrypted: i=1; AJvYcCX2aTba0BJSfeHzqyf5lMDLV405r+jeU/cH+69c5gTy3TmjWwqMfIfABt1Rl+f2KrijKvxZ/1nKU9uHpLKdtR+i@lists.infradead.org
X-Received: by 2002:a05:6000:250d:b0:439:b440:b8a2 with SMTP id ffacd0b85a97d-43a04daf226mr25965194f8f.28.1773693308598;
        Mon, 16 Mar 2026 13:35:08 -0700 (PDT)
X-Received: by 2002:a05:6000:250d:b0:439:b440:b8a2 with SMTP id
 ffacd0b85a97d-43a04daf226mr25965158f8f.28.1773693308039; Mon, 16 Mar 2026
 13:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260313222206.778760-1-jitendra.vegiraju@broadcom.com>
 <20260313222206.778760-5-jitendra.vegiraju@broadcom.com> <abSXP3gMFQEiC5Lm@shell.armlinux.org.uk>
In-Reply-To: <abSXP3gMFQEiC5Lm@shell.armlinux.org.uk>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Mon, 16 Mar 2026 13:34:55 -0700
X-Gm-Features: AaiRm50w76AAv0tqrNyqbBxs9zisrjJFbvYKHonV6ktQNKEkvqexn7CcgoG0Gu4
Message-ID: <CAMdnO-LYAPfyvM4vgmGcZgy-aagHSkP+VDmpRskNU-414j3gnQ@mail.gmail.com>
Subject: Re: [PATCH net-next v7 4/5] net: stmmac: Add PCI driver support for BCM8958x
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, bcm-kernel-feedback-list@broadcom.com, 
	richardcochran@gmail.com, ast@kernel.org, daniel@iogearbox.net, 
	hawk@kernel.org, john.fastabend@gmail.com, rohan.g.thomas@altera.com, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	andrew+netdev@lunn.ch, horms@kernel.org, sdf@fomichev.me, me@ziyao.cc, 
	siyanteng@cqsoftware.com.cn, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	weishangjuan@eswincomputing.com, wens@kernel.org, vladimir.oltean@nxp.com, 
	lizhi2@eswincomputing.com, boon.khai.ng@altera.com, 
	maxime.chevallier@bootlin.com, chenchuangyu@xiaomi.com, 
	yangtiezhu@loongson.cn, ovidiu.panait.rb@renesas.com, chenhuacai@kernel.org, 
	florian.fainelli@broadcom.com, quic_abchauha@quicinc.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000a00315064d2a279c"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_133512_195748_A4E3ACFF 
X-CRM114-Status: GOOD (  16.97  )
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

--000000000000a00315064d2a279c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 4:01=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Fri, Mar 13, 2026 at 03:22:05PM -0700, \Jitendra Vegiraju wrote:
> > +     plat =3D devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
> > +     if (!plat)
> > +             return -ENOMEM;
> > +
> > +     plat->dma_cfg =3D devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg)=
,
> > +                                  GFP_KERNEL);
> > +     if (!plat->dma_cfg)
> > +             return -ENOMEM;
>
> Please use stmmac_plat_dat_alloc() - this will allocate and initialise
> struct plat_stmmacenet_data, and as of commit 7a6387dec8ce in net-next,
> will also avoid the need to allocate  dma_cfg.
Ack, will incorporate stmmac_plat_dat_alloc() and further cleanup in v8.
>
> > +
> > +     plat->suspend           =3D stmmac_pci_plat_suspend;
> > +     plat->resume            =3D brcm_pci_resume;
> > +     plat->bsp_priv =3D brcm_priv;
>
> Populating suspend/resume means that plat->init and plat->exit
> will only be called on driver probe (former), probe failure (latter)
> or remove (latter). Please consider using these to ensure that
> all appropriate resources are properly cleaned up in all cases.
>

Thanks for pointing this out. I will check resource cleanup more closely.

> Thanks.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

--000000000000a00315064d2a279c
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGbTCCBFWg
AwIBAgIMGHX6KxYK3WW2YyprMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI0MDkyNTEzNTAzMVoXDTI2MDkyNjEzNTAzMVowgbMxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEWMBQGA1UEChMNQlJPQURDT00gSU5DLjEaMBgGA1UEAxMRSml0ZW5kcmEgVmVnaXJhanUx
LTArBgkqhkiG9w0BCQEWHmppdGVuZHJhLnZlZ2lyYWp1QGJyb2FkY29tLmNvbTCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBAKWV+9PYvG4njqRsbQas79f8Q46VL7b1ZxvWT6ik6VMbdRZx
tfpfZalVXksqcb02/N1H7UA9V04cV2q97FkSr/KxeFLMetPb3cVJZICg23IRO2NTPdmgPFzwkPTo
35h9h/OYLgh3/9a1nTsC2xqJa8GtohD5+42rsskGcI57U4n1r1L4R5IL9ypSqDxX/xVEAdGI5FTj
VgvoZC6iuEbnez+yO8TT3wun9b/PQowOB5P0CwIFv7ERW0S1s6B8yrbsoaTrz0vQaEA786k1pZkg
ykC1+zXq/iTyZuPP4B4RkzFd43Pw+GAH0Tt2nx5V4rNisJHeAVNU92Gj01cEg0I+FnsCAwEAAaOC
Ad8wggHbMA4GA1UdDwEB/wQEAwIFoDCBkwYIKwYBBQUHAQEEgYYwgYMwRgYIKwYBBQUHMAKGOmh0
dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZzbWltZWNhMjAyMy5jcnQw
OQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAy
MzBlBgNVHSAEXjBcMAkGB2eBDAEFAwEwCwYJKwYBBAGgMgEoMEIGCisGAQQBoDIKAwIwNDAyBggr
BgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIw
ADBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWlt
ZWNhMjAyMy5jcmwwKQYDVR0RBCIwIIEeaml0ZW5kcmEudmVnaXJhanVAYnJvYWRjb20uY29tMBMG
A1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1Ud
DgQWBBRq5Jlxz3MqC+zEgUxK566xEc2g3DANBgkqhkiG9w0BAQsFAAOCAgEARXrmeeWA31pp9Tr0
M6mOlMv+Pr2raES4GzPSyftvxf6tBQCBNaqi6LSbyusDYOj3mG9bp6VeVn+68OxNY9iNAk+ujtId
f3+30BlZOQ1v8z9u2peUOUtWI60y2MxhdH0X0n2H+BCGvUOFqs5z440jqqy1HsscZTXHB7FEZmVP
fyD+0Z6cxyh7WNC6+BgLiFwf8iqmAbu7Yb1sGTUGyS5gfYEjJbF2PJfwNUcJDd7eS4w5Ju5mK5y7
spgjH2/JmDgbkpSk9JyuWfjGZIg4ah/q2nb6UMd1XJb6gLQZuzPOI3SgXPvd8MHGjKZrX2BHOBSC
bJJ8rp4w4a9QMS6dde2MFObusxkZAft4tUnwo+ProchHs7iA85sL7sWEZhAmjmKKCpECpEfZm0+/
hpvKQV3AZp5vBstb4IVL8QmLj8beDVHYnNhEicsSiG1wW7zSYyBnmGbFRrFQIJnJDWPjTZOlVEyp
T1ShrXRCtqJpOt6rgg+rFEY3D8j6/bAkJXnmKnE2LZ0YyrrKk7eC6UfNNimx38w3NWchtcGY8zJn
Y/1/C9Jv/mWm/2lK8nvusOFxhKmbG83Hx8toQdZ5F1kYk6zAWjfB7lwXr/En9mCmLieJ18hen9EK
qbYyUkmCmuoLi5GXFMJy+iQv6DgMVQ7CACagybU6FUrmL9lVa+A6caBEEh4xggJXMIICUwIBATBi
MFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9i
YWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIzAgwYdforFgrdZbZjKmswDQYJYIZIAWUDBAIBBQCg
gccwLwYJKoZIhvcNAQkEMSIEIEVXcjSjz56AI0w+HsGXeUxkTOKzBC+efQ7f15h8z9swMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDMxNjIwMzUwOVowXAYJKoZI
hvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAFKLRiMUO18y
a0BAKLhgr2qjeDHvAmd7g/MkO4V2joJ7Uuw+71a0lK2str1PnrliHtxBtcnLjEkypr9kg8UJsCXk
jJkEVaYOBV21HU+6NjLpaxLFWdVA76lEX7ev06oQvqaHpUDAMdErV4fUZ0OLgcb5ZZVnlRkfp5Qt
tBw9JYgUu3eQjGnW4E2Ky90xy347h7IiE9GMB4aMLmrOHxH7lH9n7aOCGWse//hCGmx+Ndz6ZRf+
HLg7aqfN8icTZ/FsoHMnuHAoL1dABftDygbJYMVJxOFss7ozIsk9pVrqN4RME28/iwXspEonsqN1
suZE6y05oullO+na7hNowFV6sMk=
--000000000000a00315064d2a279c--

