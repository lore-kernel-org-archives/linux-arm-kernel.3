Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87961099B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7aicG4Zd+UDZ7jZ6qIrQU+o/nNJh/5pl18KHRSctfo=; b=kejoQKllKoiqiwkIcywJtaqdy4
	jYiDCsXZK3Th01eSjbSv4Y9Ec9b1HFNA6Ar7tNp82hh8LuUzsr/0D7U9tn+WxWPQ7W7oEsp4TWkJ2
	xfXgscZ9kz3pCbMCBE8eXW3GXZvMI5Pg+sRonjeSoCav4lTwGq8k13vA5LxnNs+C9ZPDkpJiQ2zmE
	Zvvj7b5a6P0Lvha4qbUAtIf0U0DLovpfYXRxF0enwpQSOwJ1vCGAXyLiyWcUjgz6tdoTBm1zckJrC
	o7ArAp+li5E+GkA3tlBvhh/4F/H4WuZrtC76aq2GrnKcEpLfUSU5uJdgve6ECd1sWkSz5ib1c+5se
	7UJgh+Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dpc-0000000DHTC-2TWL;
	Fri, 20 Mar 2026 17:40:20 +0000
Received: from mail-pl1-x662.google.com ([2607:f8b0:4864:20::662])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dpY-0000000DHSF-1Rkh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:40:19 +0000
Received: by mail-pl1-x662.google.com with SMTP id d9443c01a7336-2b04fc8851cso22336575ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 10:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774028415; x=1774633215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7aicG4Zd+UDZ7jZ6qIrQU+o/nNJh/5pl18KHRSctfo=;
        b=sGpVJX2mNugQQUFZg2Y6lH1SZ7pc+CRp8o5WuHClHdAj5yntKTFEpGBGWKwTu26h2U
         aHYT/5EgTCiffCrtV+j/MlBT8YoId5LxNJyvaz427rfTcoKT8NgRLpPlnTxsipSmeWR3
         L3r1ozoAYe181MG0qOYZC4m5YbCT//wKpqGM/fCb29le85FaDU8ftLqYUb3rWzretcZB
         NIl4XN2zumbSG3xTi5T74NKQv820wA32WKc2bEWzQt384jPRbRiOx9R6CKwczwjDo3LO
         VlfiVYaZQxBdKBGXOKBqfay25rMQWucuN4CnxWyCLNb95V8o2ORH58FJm8dHZphEcbVj
         FTSA==
X-Forwarded-Encrypted: i=2; AJvYcCVJifNRnYnAo9YJJtrZ9z893Uc8DU/2wdV6NYw+t985l8nYjIZsUUHQmLqT4sPxB4OA1cA6prI8TcE/g9XR+kiI@lists.infradead.org
X-Gm-Message-State: AOJu0YwYKiPxo/ke1zwB0h7VIhUWNtcrTTPGya4FtKp+eZU+xkt/QsSC
	zNT4bWnAPjQISq3AUwVvPWDEn0v/gr8rYe4oUkQEkNpHeZoJE2B88kx6Q/8WUbr+qssBWSkxrzo
	Uu22Rws8C0i/h9rkk16+yZwikFkcAY/9wmqUryGhNAaL/41LaHwUaehagcj22q6kOlFU3igUvj5
	ydC9rISpEPt6V/cHgsjPIUwjMdIQrfbdJBwaQaJb9BS3prNm9/PVbAy9L6VaWjko1PV1VmDwPBZ
	HzXn9IY0aIPHqlPjxVpaNJNAgPNESUtebBt
X-Gm-Gg: ATEYQzx73s81NsVYpaI+94gmopQU3GZk/P1quX0xKmeXAKXIRvMNwFN8LP1I4qag/LJ
	AK+W6lm+cvdnoP1oh/zOtqIaFn+a9NtrFbyHdI0qthG7YiPAgz9NceWj/LgaqHoKtlBe9ZZ1l3H
	EpU1mP/wBhSSLwcCs5jeTXnr8oS0bNrkuH5OGdxZfNWfDTM55jETM1Hfj+ZZRB0U5ShU5So7ilQ
	KwyXM0dW5cWv9WNXTpXubDOLq8yZb19YZc8IXcowJwPbYCRM6Uv4TThAHgmDP782bI9/HYbkOLW
	1XonLOLJVXcFwI02s//FeVYeCiapnHMnd4dFgDuvR/DGMPB5Rfv3lhLJ48Lbpk/8YC6K8REN2Lg
	mpNeaJuHcHxkgpzxoevjgcaccozk/Wiwg9LGb+DDOcNaPXI6GxaO8tQ8FwazCp+Py0o5ceuJ6Vz
	tvZYqNJdoUyyIo2SS31YDquXRBjXY+yu4GjrFswiV8d25mJyMEAipus1n1pyDsWOs+QQ==
X-Received: by 2002:a17:902:ea02:b0:2b0:8106:f3ae with SMTP id d9443c01a7336-2b082726f28mr34786785ad.20.1774028414755;
        Fri, 20 Mar 2026 10:40:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2b0835d8dbcsm3491415ad.33.2026.03.20.10.40.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Mar 2026 10:40:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-485397788b3so17099845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 10:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774028412; cv=none;
        d=google.com; s=arc-20240605;
        b=CxOq+a7G6rZmBiuRvntL3I76Zk/lpYHTJvWDfxUeRBpT+eibL/AqNcP5t7VYtCFZif
         6AO76IMFICTWw8rjUqXnGEOI+34p1e+jvM+f4SFHOsrgBp5ztirNeINHtTOr0VKYSukW
         qYwIJip/6elZrUCQE62L53LqmmkMJUPYTjLKxcD7hTJxesAulHmiYSS0oZHvaYGyn0et
         aalk5WY7PQmrPiGlnzpvaHTQFiVPZg/5oDJrCMDP1joRL7FAD//aMHTNhyszkNwGSg+T
         XIHjs+LY78hdHXvkhqv8y/9wNkNMz9Oy/YhpJvVbQ8j1MB660JLu1CKSeNlg2aopyAz7
         Y7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k7aicG4Zd+UDZ7jZ6qIrQU+o/nNJh/5pl18KHRSctfo=;
        fh=mLVZi9eT64spt1UDaY3TJOsCnNotqJvBjzKnHXlds9E=;
        b=btMYz1KxdTRY3lzHIZGu4Y4hD+I6RF3IS/TS+VsSPyN5wCh8oFkDDDEYUBjLGUJ7q1
         j/DsX1xfgQj/QjihshsQsg6VSn71yTJPxWfCluvA56HfXcg8BalznLqmQxINakIu9qX4
         LOagoN7JwgUMi4sDmlP8T2NiVx7ro9MSIBHTMHhozGGNjsg1cG+p8O6oFjytocQPZ/KZ
         VGqSmcbp0GvASOLpY+RKW3XwC/GxCEEDbziOJ95skRSbuuKBjg1WMgr9FJPoJJxcJ3fn
         EwM41vDreNPIdmrZZZKtKwVziIVDde+obvt+/Wo2VuAErCuU5Y0JeYqMjbY/bOf9Wo73
         Th2g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774028412; x=1774633212; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k7aicG4Zd+UDZ7jZ6qIrQU+o/nNJh/5pl18KHRSctfo=;
        b=a8cFJJLQ+cVYL2bEOU/uojCHhY49SRguP1vosR8XFc+jHcBjzmYAdJuCe3OrkINDII
         PWDWIZzOkQ/UKadFUPyaJ4PRghyIKTiIphtZM33G41musNzN0a+oi2dqmzmzyfJqN4R/
         +R9ekzZrbKtBP+plkejE88eytxZxUIP3mmJEg=
X-Forwarded-Encrypted: i=1; AJvYcCWSe/pnYCmoOpDLnYFrOGMBUhS+ZgCXLCGnRH00tRIk2iLoqvEr2k8vFstrCLEcpiLn6D90EKbnTXWxvXbUBzlL@lists.infradead.org
X-Received: by 2002:a05:600c:608c:b0:485:4135:5c92 with SMTP id 5b1f17b1804b1-486feb5a653mr57923375e9.0.1774028412513;
        Fri, 20 Mar 2026 10:40:12 -0700 (PDT)
X-Received: by 2002:a05:600c:608c:b0:485:4135:5c92 with SMTP id
 5b1f17b1804b1-486feb5a653mr57922905e9.0.1774028411896; Fri, 20 Mar 2026
 10:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260313222206.778760-1-jitendra.vegiraju@broadcom.com>
 <20260313222206.778760-5-jitendra.vegiraju@broadcom.com> <abSXP3gMFQEiC5Lm@shell.armlinux.org.uk>
 <CAMdnO-LYAPfyvM4vgmGcZgy-aagHSkP+VDmpRskNU-414j3gnQ@mail.gmail.com>
 <CAMdnO-+YWowCDh4iB9EZ=eqUidE6Mu4TOqjwyoMgyEaG=pBLBg@mail.gmail.com> <abuwcYH791D_oJp_@shell.armlinux.org.uk>
In-Reply-To: <abuwcYH791D_oJp_@shell.armlinux.org.uk>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Fri, 20 Mar 2026 10:39:59 -0700
X-Gm-Features: AaiRm51daUnGzokEEKCgv3bQbjbYDVOMLsocPZLljrnpxo0gYhLkY9qweCsnxyA
Message-ID: <CAMdnO-Jx+z7ZVFyuS-MhcaPr+jDEJ6sLiAL15Q2pYsphaXcEFg@mail.gmail.com>
Subject: Re: [PATCH net-next v7 4/5] net: stmmac: Add PCI driver support for BCM8958x
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
	boundary="0000000000005ecb0b064d782d55"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_104016_421579_AEFB05A1 
X-CRM114-Status: GOOD (  31.71  )
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

--0000000000005ecb0b064d782d55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 1:15=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Wed, Mar 18, 2026 at 11:12:23PM -0700, Jitendra Vegiraju wrote:
> > Hi Russell,
> > On Mon, Mar 16, 2026 at 1:34=E2=80=AFPM Jitendra Vegiraju
> > <jitendra.vegiraju@broadcom.com> wrote:
> > >
> > > On Fri, Mar 13, 2026 at 4:01=E2=80=AFPM Russell King (Oracle)
> > > <linux@armlinux.org.uk> wrote:
> > > >
> > > > > +
> > > > > +     plat->suspend           =3D stmmac_pci_plat_suspend;
> > > > > +     plat->resume            =3D brcm_pci_resume;
> > > > > +     plat->bsp_priv =3D brcm_priv;
> > > >
> > > > Populating suspend/resume means that plat->init and plat->exit
> > > > will only be called on driver probe (former), probe failure (latter=
)
> > > > or remove (latter). Please consider using these to ensure that
> > > > all appropriate resources are properly cleaned up in all cases.
> > > >
> > >
> > > Thanks for pointing this out. I will check resource cleanup more clos=
ely.
> > After reviewing the need for  plat->init and plat-exit, I don't think w=
e need
> > these handlers as this driver with fixed-link doesn't need to restore a=
ny device
> > specific state such as clocks.
>
> Huh?
>
> plat->init and plat->exit have nothing to do with "restoring" anything.
>
> plat->init is for platform specific initialisation.
>
> plat->exit is for reversing the effects of plat->init once plat->init
> has suceeded, and will be called should the probe fail or on device
> removal.
>
> So, where you have:
>
> static int foo_probe()
> {
>         do init stuff();
>
>         ret =3D stmmac_dvr_probe();
>         if (ret)
>                 goto cleanup;
>
>         return 0;
>
> cleanup:
>         do cleanup stuff();
>
>         return ret;
> }
>
> static void foo_remove()
> {
>         stmmac_dvr_remove();
>         do cleanup stuff();
> }
>
> Using ->init for "do init stuff()" and ->exit for "do cleanup stuff()"
> will simplify the code, and actually make things more correct.
>
> Currently, you have this in your remove path:
>
> +       pci_free_irq_vectors(pdev);
> +       device_set_node(&pdev->dev, NULL);
> +       software_node_unregister_node_group(brcm_swnodes);
>
> but in your probe error path, you have failure paths that leave
> the swnode connected to the device, and you don't call
> software_node_unregister_node_group(). Thus, it seems to me that
> your cleanup path is buggy.
>
> My suggestion of using ->init and ->exit means you have slightly
> less to think about when stmmac_dvr_probe() fails - although if
> you still have to do appropriate cleanup within ->init if it
> partially fails.
>
Sorry, I missed the resource leak with software node on probe error path.
Your suggestion to use make use of ->init, ->exit makes the code
look cleaner. I will make the changes in v8.
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

--0000000000005ecb0b064d782d55
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
gccwLwYJKoZIhvcNAQkEMSIEIOjDrFYUtizxQa+Umj9q17p/hPIJ1PoQph346uqBvFJGMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDMyMDE3NDAxMlowXAYJKoZI
hvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBADRewii5RHsf
ibILKSz9PSvvaZkgQJUIMEAg/gXysZSPaCCYgeWGc1Puh9bQiW5ol29xIwwW50CJbNtRR6CBF6Gm
qS92udIowQxTHsZX327AE1fGVpUbLFiTQwUxZ8t00+wT36OYnfw9q2Mhg2dsJ7iu+KDNZ9hoQXi/
Fa9QrpPoVQ8YQH4uOwyT4y9vCSK3zHp/HZpm2bleu6982evMw9zz1CcjP6OlP0SbNjtts3yFG0Xh
nAQ8ETe5ekOvXqIYA3TtA/pVDwCoGXPt+yLCmzc33271cBHmcFCqu101U8aoTeR1D8PJViJ9+C+N
0TzMVdmSHKgJrO/BYI+ZRokmfhk=
--0000000000005ecb0b064d782d55--

