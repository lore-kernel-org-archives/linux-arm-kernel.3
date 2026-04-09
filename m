Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12CAF364CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 22:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sx3quEHRTLXsfaLn7s7k8/WFHH7u29qvTEWsscdLuCY=; b=mhw43SO/i8rArvPE0bLGQBOEWY
	mEd0bdFZ2EiemuGbVcMuN07/OYhb3Rn+76Q9z6sZOL48SpkYtZ/PCcZuBfXMU6FanQrmRS1kqy3iL
	jkHH4cO7EThtiz1cUpkzpCjwJBNj1Bqkoi+d+WwbeLwP7QoENEYryW/qyOQu37nbEDEGqZthDclcq
	7AcCT+OvUOq9h631j085XpdChIJmyFuAx9nbrOy9bFafOgf96zOT40No1e20gIJfe1fAGtVVXupBH
	5ZwZFDubGjatuwNRomqnIeaKrR6bGFsbGYQF/DJJhliABVShrFGwEqiLGdkxIcjmlb9whE8SAZZ6W
	IPXEst0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAxYW-0000000BGYS-2A7u;
	Thu, 09 Apr 2026 22:08:56 +0000
Received: from mail-vs1-xe64.google.com ([2607:f8b0:4864:20::e64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAxYT-0000000BGXO-0p9j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 22:08:54 +0000
Received: by mail-vs1-xe64.google.com with SMTP id ada2fe7eead31-60603a45a23so427111137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 15:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775772531; x=1776377331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sx3quEHRTLXsfaLn7s7k8/WFHH7u29qvTEWsscdLuCY=;
        b=kIvHJ4HWfHeyPIhhrTHOCS7MntuspZTJ+qWUFYbfbOxzi+dJa7ETXi2VbNu/hoFbmC
         puykyTqHARYuSTb8gRtrZkbwxs4RG68ae1BbLeWv+35o9u0l9CQe2ZTfV8nXDaTRyiEx
         ftA9W3wrhh5SgoINxyG+H6/yPz9DeoPIpm7p2zhl7fjVuat6JyWNHX4OBxPTF2pkC4bO
         dFRO/n8HZ7txglL0W3YUPcLx/rs0GbTgzxl7TqvdOOEku33ws9zZA66Zk3YHcyzR5LTa
         k6Ttu3gOwXFFO2RqZ9CnvdOq7uBAaJo1Gpwk0Dhs9xP52MYSV85GPdHN7JlwM9jo+lsi
         ergA==
X-Forwarded-Encrypted: i=2; AJvYcCWWO6uu9SPERUNhSJkTWDSyt+xEm842Npjx9kpvCOlyhEUL/ZXx9SvfCj+lsl9rqKeSQ17khaq9WCouFI4L798v@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+sgqHdjsmQVETndCbRL58YafAf+uCLGa5Nub27RXX3wHalji/
	OgVq54yft+jRZAk1WmLDgMdH4YFtA6PI6wmXUN3bSXDIwYGXie8BV7ASDvwTzdbUwI+Tw9aFjBC
	RtQ/xIfYXfHAt8tos5mxQa3mS/y922HAJXEKl84d6gsw9hlK/QsS8V8Ci51Txenx4knoPwdHNeD
	8GHaolXMbQzTllfWiakAfpdiFWqwkK5YouiKSK1ajav+Y4SYlXpq1gGibx9RJt1ZRXEZ1hoeMam
	g59jIc1HfSNrXhEwVnItWZKxvJqbV03r0Vj
X-Gm-Gg: AeBDieuxNfcomTITs/RbqarqDp4OH9uECf8K46OMpAH1Fm3bEO1sa8i/OWBLbeyLeUp
	BtKcSb1QVIYDQqYaxipMm13f8RFgU2bmiLzujynf5mx85sQ5c+mPpKDJAj8nSm39ymoXZrpvXJR
	5M0gkDe5WP5M2waNZOaABeojJc6MD02gN9xRgYVF10LT1kRu1xQNtxPGm5Jhi4Lf43xv8nBY/9q
	NOzbC8XWDYg4fPCv81BzWCwMx6AWTfILpB+0xNmTms3ZjbaQs1NyAh6y/Ec+Vsksfmalyg4MnGR
	+3GSq1rdStujgci35a1UTRuw5ww45yQbjsAbG9eyKDfHtLcOhI9h87F49sWwIeo0/Dw7poainOY
	8sStVzLkplY1Z4XKgmKg2MoX47KPfnzCAMCuo0A/2NC70azA74wA3wt1oRNmPDdYRClQp6G+sfo
	0MyWlqk3pYxJf0Bwe64FeXr1WEePhYkLEJMb4LMams1Xrdb2zChoibsPZz+0medJM=
X-Received: by 2002:a05:6102:5045:b0:5ff:17bd:9e83 with SMTP id ada2fe7eead31-609fefc059bmr350601137.14.1775772530752;
        Thu, 09 Apr 2026 15:08:50 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-15.dlp.protect.broadcom.com. [144.49.247.15])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-954bed2e167sm47670241.0.2026.04.09.15.08.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Apr 2026 15:08:50 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43d03ae4f2aso986197f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 15:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775772529; cv=none;
        d=google.com; s=arc-20240605;
        b=KVNzUjtOUGuxXURKVV9ASHYwH/SL7nAt/t7d54upxSO8SWBZno7geGvxWkurfEj2WW
         HuEhkiOR1O/Q2NUufH+pV/2qRBd9rIW9Z8yYaSn2MbtaAtmoonMZCMJPPMt1wtbgyOAG
         6cLtVxKBZq+xvC02bWH/Fb/qvqsNCCtC7DcvHNPDJaF7JcStFZ6tyBtHkuIx2lcNkPjG
         JyxVW2k3928O3sq4/dzLUxwNhEN8rnVoL/eH1BQl8nQxQiqIjQZpj5vXGcMX6WA2P1cm
         0rHZWLheOCm+jJg7VKNx6MnjiCSSWrP7j586vKmu9XdyxrsXDJAAoSYsJW/PNmsogGq0
         rUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Sx3quEHRTLXsfaLn7s7k8/WFHH7u29qvTEWsscdLuCY=;
        fh=NTNQ8KgtBOxVswTGBb4KomVEO5C6F1mfxBDNSOuTvp4=;
        b=JnM1vJaaMTx2OMGpL0hONrwbDVQRYulJy1YjtmBFbQGHxREEmg9PpRBWiIGD0n1ez4
         yP5euwCbJhJDynmbOyRQ5+iRV260A31DcZ0exgCTSa8Qn+fyHwkAdLRq/8wLhq/bmi7Z
         /gevjl11XvntvIkkT24Y/iNyjZxnWVPDUdBHssdqs1t0mhdBpJXJEc7B6lIwBgiI71FX
         DZipKk2XEvjqm3c/Bg2uQejD7aFmtoUhPPeur9SOulBKYLGnK3OGvidDf4e9lZUODY8t
         ylVO1kqdXOT4jT+z3pbsOlrYN/uMOv0OiAGLrLeUTv36oEQxYzS3+dg7GB1iG99B/lyi
         wmxw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1775772529; x=1776377329; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sx3quEHRTLXsfaLn7s7k8/WFHH7u29qvTEWsscdLuCY=;
        b=BrcBEHCSLioo52OOmK4ZtE7w2QOO+1mAI5u1jU9opL0lqK6zUwvvTYJv5h5YypSfWy
         ONHcIXOIAgVsCVcw0mZsxJPt1QcZGVfIX2aGePBk3AHVAQCFLpbMuu9YBll4OG5nPx/O
         oMB0kaVw/VbuAkPTXKOUx9RADqSiJb2raWBy0=
X-Forwarded-Encrypted: i=1; AJvYcCV0+zs9xMFKO7ivLIGEiFd6O8Kjn52kXgsnUzosWeohrpf6JdNy6RLyBqxpy+fDZ3I8rIZyKMrBz4Mq0Ox24D+r@lists.infradead.org
X-Received: by 2002:a5d:5f87:0:b0:43b:4703:9de5 with SMTP id ffacd0b85a97d-43d642dccc3mr1022170f8f.44.1775772529193;
        Thu, 09 Apr 2026 15:08:49 -0700 (PDT)
X-Received: by 2002:a5d:5f87:0:b0:43b:4703:9de5 with SMTP id
 ffacd0b85a97d-43d642dccc3mr1022125f8f.44.1775772528655; Thu, 09 Apr 2026
 15:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260402213629.1996133-1-jitendra.vegiraju@broadcom.com> <adSxQpAE0nY0ulfU@shell.armlinux.org.uk>
In-Reply-To: <adSxQpAE0nY0ulfU@shell.armlinux.org.uk>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Thu, 9 Apr 2026 15:08:35 -0700
X-Gm-Features: AQROBzArt3I8bemRMGDxmah0OqjGLcvGglqY0L8HZtuxxXqb_QYUkXgoucoT5Fg
Message-ID: <CAMdnO-J0Ss=+sp+aJA2TOiNPvzAv37MN05gwVZTGJmh3L4n7sQ@mail.gmail.com>
Subject: Re: [PATCH net-next v9 0/4] net: stmmac: Add PCI driver support for BCM8958x
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, bcm-kernel-feedback-list@broadcom.com, 
	richardcochran@gmail.com, ast@kernel.org, daniel@iogearbox.net, 
	hawk@kernel.org, john.fastabend@gmail.com, rohan.g.thomas@altera.com, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	andrew+netdev@lunn.ch, horms@kernel.org, sdf@fomichev.me, 
	siyanteng@cqsoftware.com.cn, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	weishangjuan@eswincomputing.com, wens@kernel.org, vladimir.oltean@nxp.com, 
	lizhi2@eswincomputing.com, boon.khai.ng@altera.com, 
	maxime.chevallier@bootlin.com, chenchuangyu@xiaomi.com, 
	yangtiezhu@loongson.cn, ovidiu.panait.rb@renesas.com, chenhuacai@kernel.org, 
	florian.fainelli@broadcom.com, quic_abchauha@quicinc.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000d372c8064f0e425b"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_150853_301937_89DB1E06 
X-CRM114-Status: GOOD (  19.27  )
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

--000000000000d372c8064f0e425b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Tue, Apr 7, 2026 at 12:25=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Apr 02, 2026 at 02:36:25PM -0700, Jitendra Vegiraju wrote:
> > From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> >
> > This patchset adds basic PCI ethernet device driver support for Broadco=
m
> > BCM8958x Automotive Ethernet switch SoC devices.
> >
> > The MAC block on BCM8958x is based on Synopsis XGMAC 4.00a core. This
> > MAC IP introduces new DMA architecture called Hyper-DMA for virtualizat=
ion
> > scalability.
> >
> > Driver functionality specific to new MAC (DW25GMAC) is implemented in
> > new file dw25gmac.c.
>
> Sorry for suggesting this rather late, but I recently came across
> another stmmac driver in the kernel - drivers/net/ethernet/synopsys.
> This is for XLGMAC, but I wonder whether it may be a better bet for
> this core. Have you looked at it?
>
I wasn't aware of this driver earlier. We are looking into this driver now.
Thanks
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

--000000000000d372c8064f0e425b
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
gccwLwYJKoZIhvcNAQkEMSIEILuLmSSO4fRKTPTuCUL9ZTZdoL2rS4KMUF6rJInr/XkbMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDQwOTIyMDg0OVowXAYJKoZI
hvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAJjVU0MvI29h
uY7bvx9vWk/zixT5OP5qh07gQ9ZF9enzeLyx+PJ+FN8nDKF6+sRt2oK57Z/N+zupzhJ8rkQLg/ga
Vae5b8gm1TEdtKWoKjlVg15ODGKq0Yl9xpoE8z1FXc7jtzlszLRjxfDG9kpPtIV+fESaJ948mWM+
Dj+3E9D7GwmUERU4IRcd16s26H3vlHeIzlccQqYyitsy+gq8lArA1S1Xoub06MRPb1oGEnuzt2iV
DfacCXZyQpO1r7f6dLyk0DQdGseZS1qZBL+mvF8voTPWMvQCJcUgxDeBMBgRaIYCqiKAaf2M7jY7
PdVbSt7f6/FRFOnIQM6hwwFig08=
--000000000000d372c8064f0e425b--

