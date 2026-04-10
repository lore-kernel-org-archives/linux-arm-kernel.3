Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533F5F45A0D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 21:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGc9Fy3MbUctsUnD1T4whw2Cq7xjZULbkFfHTMXPaAo=; b=M4p/PqRVqpmny/cn7aGOCRtVTs
	p0+puUh+UddjJ1mcminb8BAwz22g++VqyvPjBYnhMjhbUpXZ8QSDMXNkC8/m6sx2+NFDzS4jwHPS8
	MKzwja1aYS4dqdXojfFQuiUsXl+a50ncy0W0rM5mDee8RZgrjEMU32WS6YvxvCMZOE9RxJkeYK0Qw
	br3fBkDRaMKsfjEkI1BIOvDDyPfUiWgTS/jDllxUdFSUsAn7wadwZqWEvhHAQQYLlnADcLALdizZ0
	bQYYSaXARggEAwcWmWQr72QckLKOcQaiBRXriS7ZGlD4AWwr/8gCtGFoL46Igx0Q/R673lBtZd9lW
	Sf2oUTpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBJ22-0000000Cnow-3tHq;
	Fri, 10 Apr 2026 21:04:50 +0000
Received: from mail-yx1-xb162.google.com ([2607:f8b0:4864:20::b162])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBJ20-0000000CnoY-2Qim
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 21:04:50 +0000
Received: by mail-yx1-xb162.google.com with SMTP id 956f58d0204a3-64e87a81639so2467938d50.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 14:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775855087; x=1776459887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGc9Fy3MbUctsUnD1T4whw2Cq7xjZULbkFfHTMXPaAo=;
        b=WWr5tOpE217hHIXpdacVjamPv+N11judvTjEhkAcL9KQhuZNxMJl8JF3RFO0YZiGmj
         aQQCUcz7KScM0nyFJcukJ7bE9E+iMMbbuVEC7ez0WjKFa05BOez4Cbe70eDlTaeGo9XP
         MzFBYUDbIiGY7bUyuSv101X98HyE+f+dnSXjuCdNzf0KT/8v0Lpd7dsmFXR4qAlts7le
         ai+vC990ZdAEK8RtvplDrNtb09SaydvqjB4ALnwJdeJgPO2V9eQX/ZEys2+4/T+v+SmS
         +UEm6SP+ItSVctgeipH4gI77RemlOp14xQ9q2pmGwnt0HVeBbUEArK6mhRSHKFQUUeTO
         2TPw==
X-Forwarded-Encrypted: i=2; AJvYcCWx7WRaGtKtaD1KY+YI8ND+QZjwJhyCAX1xNsOkTi0Jyr6YiDQBltZ2MUd7OHVNKXoFb8MPQRBArjGfRgezeVsx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7Ni9x2bzSgxtn35zhe1g0pq0SFwHZ3evjBzMvVej7Xhh/DBRQ
	zdqfXgCM/Fqx7UsVY6qr6wTrIQOkgXzNr8cdNz6jYTeKErq++ZNXg8hUpfRbEq9ny6HCAoJ0p29
	GxP9HZPfRPZfOL34FHyxwOAb6f/VM8/RkrFkB3q2OiVoIsJKtk/U597m7rHtJHGfz9gj7j4guuN
	YdAIVuMQd/7JvDVh67xKpnARR4TqzkCulbaKA42O3MK1p5GkrSd9Z/BYmUm5Ak8ZaNnR/1OOBkW
	D3yQoEDch98HungOo56s2XEdy5fadjAg1ex
X-Gm-Gg: AeBDievZXqr/CT7Y6eKXx/eSz7q9/R9oIlFnmaHaWh16Rx528mfGkfCcYjcozX+QjP2
	W9cHiy6+pCB33uKQyvOKFpW74yxF3sROdfgn/lF2xuvfaZV/cfFTNXVdmmxMlkOkB7NeH9lLW/i
	dXmV04tL9TJo4ziM+QS3cneQ0g2TQurPP8HYnnOgscdjMZ4/M/pdUNesqh6qn4S3T3bg3Vi/jt0
	DAA34pVLLdIr+yoqpXNXmeTKLT2bUEWkBkI0YRMzC2h5+v7L9IKPO6lOC38Qpqpat9NTgHtp+sL
	JCYklV1Wg/2C25Bh6fV1peKWlzj+AdNNoaOLPn9wR/8vbReSprEDwTOnDw0xedliVp+XaTHBzPc
	e4lP7UGaGgAszUryuGMGE/D5as32ZcwjbxlgRgUPoUHJqGRRcDCUL8WCwnatFgSRbsfOqkpgLyN
	qmMgmBSOzeRU/w5I8seGhTduovdjrhzaoQDr7pkUpgInnk1OWqal+nsJdQqlEs0uE=
X-Received: by 2002:a05:690e:1a88:b0:64e:c506:6fb4 with SMTP id 956f58d0204a3-65198a6caffmr3576048d50.9.1775855087170;
        Fri, 10 Apr 2026 14:04:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-15.dlp.protect.broadcom.com. [144.49.247.15])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-65197a7026fsm264541d50.10.2026.04.10.14.04.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Apr 2026 14:04:47 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43d03ae4f2aso1804271f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 14:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775855085; cv=none;
        d=google.com; s=arc-20240605;
        b=S32fkIMMI0ZCC0a58XvG1EqRL4VcR/iBYvbOODpD9g6cIhpDGUooGB9pN3dB3gWjS/
         cRvRCSJE67wLVp0JLbwbK5XYdlBruQ3+Sgx0mRmHo1vrsO4GjOEOO7kweNjPWW9e29Yb
         pEt2rJEZvZ/ZBmXgX4f3zOcOsMnUWF+1V1VzgCA7LSBxuSIdGA2lCwno2SW6C4cj80tY
         gItBidqrEzdVlAEODG7SJ6e0dquQFDABPI/kPYhzuDI2t3ohAENojl0uiZJBQ8oRerf/
         3eRZ/G1Rz3e2VvEWvHJRJ6OAI93n0FdNNj/XxCQksZmbRE54TX6C+u1YQuf1mswKfiKl
         EP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PGc9Fy3MbUctsUnD1T4whw2Cq7xjZULbkFfHTMXPaAo=;
        fh=moqiHTihJR6vQ1xBuco0lsxZSvIZStY/zG72xvgGIt0=;
        b=DTSWJPJ25dWH7sxJugXoeP53QywaLJqnNfgCvrJK2QB8Eq20Q2wAl8O0smFrYBFQvZ
         W7ksgNorzAYkknjP8DoCgyhRE6OHu6QBxSjFVYLt0PaM44EyuktWBfszLgTbjGZaN2I0
         vMahZhdWrgpAsJgZvIeuPxgGUyryjJ9o4dcElwwLxYijpxgvH8I5k/iOzRDLiB5UURZu
         Ajg6spjlh/ZdUZxN9ecYfi+MKtT1gw6z7C+HzRvqeSVGZb0/2WjNzsmpsCqeaGb3OFfW
         cmSgbmurClHY6NgfS7rvriNxSYpQFibQms9ifsrYW+ft9KjJbssDIiW0H3o/edun3CiT
         Qkfg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1775855085; x=1776459885; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PGc9Fy3MbUctsUnD1T4whw2Cq7xjZULbkFfHTMXPaAo=;
        b=CglP9jbd6gWVUa2nAEPA/fVUabYD0TRjaKig9/XKbZ5on179/z+UjggvYI7BZz8gjr
         1tKfQtJNBeS47ykWsvHo9TihI72/tPUdOccHivM9M265FqrWfK8ifBwv1KF/sh54KyxO
         0gIZ4hpmZ/tOx5ABPOfWNxa9kjH4o3du4Vegg=
X-Forwarded-Encrypted: i=1; AJvYcCXqQ7d8kPRQG2NLPyQ8o0dVS5pDYZakDWMOuY2Xaajh9mSbnRw42YNP3/JOtQAH7jlzWhOaOCZkwK73kX2kZjpZ@lists.infradead.org
X-Received: by 2002:a05:6000:2906:b0:439:fbbc:d593 with SMTP id ffacd0b85a97d-43d642c7a90mr6978474f8f.27.1775855085561;
        Fri, 10 Apr 2026 14:04:45 -0700 (PDT)
X-Received: by 2002:a05:6000:2906:b0:439:fbbc:d593 with SMTP id
 ffacd0b85a97d-43d642c7a90mr6978440f8f.27.1775855085044; Fri, 10 Apr 2026
 14:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk> <E1wAPBR-0000000F7ju-1fD9@rmk-PC.armlinux.org.uk>
 <CAMdnO-+TK65AxjTsDd017Mhop+VC3Xf8jtfaTXYpE6wBNZOt4g@mail.gmail.com> <adi3Vks-N0a83ylE@shell.armlinux.org.uk>
In-Reply-To: <adi3Vks-N0a83ylE@shell.armlinux.org.uk>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Fri, 10 Apr 2026 14:04:32 -0700
X-Gm-Features: AQROBzA8eu5WjtBEGnB0inAkAMz407HE65PW9MMqp4ETiWDYykwhH2trVnWL8Yg
Message-ID: <CAMdnO-KLJrbTxaXrfs_s1G=rn0PjSrQ3cdYHjrnmvXdPJ7=B9Q@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 02/10] net: stmmac: rename dev_id to userver
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Samuel Holland <samuel@sholland.org>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000922ff2064f217b5e"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_140448_683494_5853D66E 
X-CRM114-Status: GOOD (  27.27  )
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

--000000000000922ff2064f217b5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 1:39=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Apr 09, 2026 at 04:07:42PM -0700, Jitendra Vegiraju wrote:
> > Hi Russell,
> >
> > On Wed, Apr 8, 2026 at 2:27=E2=80=AFAM Russell King (Oracle)
> > <rmk+kernel@armlinux.org.uk> wrote:
> > >
> > > The Synopsys Databook and several implementation TRMs identify bits
> > > 15:8 of the version register in dwmac v3.xx and v4.xx as "userver".
> > > We even print its value with "User ID". Rather than using "dev_id",
> > > use "userver" instead.
> > >
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/hwif.c | 18 +++++++++---------
> > >  1 file changed, 9 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net=
/ethernet/stmicro/stmmac/hwif.c
> > > index 3774af66db48..830ff816ab4f 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> > > @@ -15,7 +15,7 @@
> > >
> > >  struct stmmac_version {
> > >         u8 snpsver;
> > > -       u8 dev_id;
> > > +       u8 userver;
> > >  };
> > From the XGMAC databook that I have access to bits(15:8) identify the
> > DEVID field of MAC_version register.
> > The userver field is from bits(23:16) of the same register. This is a
> > customer defined field (configured with coreConsultant).
> > Currently stmmac doesn't care about bits(23:16).
>
> Thanks for the additional information.
>
> I don't have any XGMAC documentation, but this indicates that it differs
> between XGMAC and previous cores - GMAC and GMAC4 cores, 15:8 are
> documented as userver, and 31:16 are marked as reserved.
>
> Note that the dev_info() also prints 15:8 as "User ID" not "Device ID".
>
> To confirm, is the XGMAC version register at offset 0x20 ? Later GMAC
> cores moved it to 0x110.
The XGMAC version register is at offset 0x110.

>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

--000000000000922ff2064f217b5e
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
gccwLwYJKoZIhvcNAQkEMSIEIKxBtT0XlPEv1PRsOCxZHhJYg42Fs8dobavsL5g3SDEOMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDQxMDIxMDQ0NVowXAYJKoZI
hvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAILUmmdUnbCi
svOMN5GzRsAnnHC/ePzlXygRZO+Zdm7EmvwRDvIpqiEeUfmUntSdzpTaJGxv3FbR2YKwjStGOc/h
UOEMNsUETQ7SLyax3C3l7eCgP1DgiRyvU7cSB7mazCeT/J+OfR5EG8oYqH4yRg5P6VMcQgsxV7KC
wO95XWDE5HZNl4/EYGa5fafsCCFtio7ufT3jwkODFBEyDZN0/2pI2QXQWsa1nTmzhjGeErpSy30i
T6imGNcUTh1wowtePiB1rNMMDfU/OpfAV6FCxAopCR7Y8YiRvZAz0e0rwYyhfKny6dhnhWMIQ3a4
W2YQBOq/VgBhMd1VqWCwkU067y0=
--000000000000922ff2064f217b5e--

