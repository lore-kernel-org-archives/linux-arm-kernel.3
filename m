Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482B710F2865
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 18:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uAWgmKNgAn08NNvGHmO+afmkcSce2LkECD7wKeYJdk=; b=QwWMpj2092OxjjBPwNBUeXGGp8
	Fk1d/Wz7kE7yUj9IixGp77O3eWr7s+EQ7IRV8w+pDULlZBaIWYW3Sodex5F2pyIceyZZ144uj/3hH
	4lhns9v8P+RtxTi2Q+jCsj38zkKfpchGz9ehLBHvCWIIKo7MmNkjYJhl/gh6vVStIfIaNbPgclTZT
	e8Wp18Xchm4GMD6QdKgeDlGX2u6H/7ikXOpsxt3bCRkjBQzbnJLR/4aqHgwJ14bDvUpAt9UFisHYj
	MvMsbsHres77I+6BPCGFXmS+tooonRLnR1evOb1U/YL8dbJOxeSksDl1jYzxkLT0P3omu22wOliTy
	AP7lKb2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BkQ-00000007vnl-39Eo;
	Fri, 27 Mar 2026 18:17:30 +0000
Received: from mail-qv1-xf64.google.com ([2607:f8b0:4864:20::f64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BkL-00000007vmU-3Qbc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 18:17:27 +0000
Received: by mail-qv1-xf64.google.com with SMTP id 6a1803df08f44-89c5446f3caso28599806d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 11:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774635443; x=1775240243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uAWgmKNgAn08NNvGHmO+afmkcSce2LkECD7wKeYJdk=;
        b=lTcWAAS2US43wMJOdLGFBNwjLQ0hu8sDaJB1mwsiOSYTfbgh7W3Dj5QiBGfehd0kqp
         dpKFdiQA56tveHgsiY8QYbA7nBr/UOaKLJ4XJSerMpAiH037t+GHg7k+u+EJsPItYnYs
         6dGQdnJOcMX54ux/DU7sSZCHJDrmy2fvbUthXGiK6Dw9PPqFpRWQbQTPbsutGcbTi+el
         v8TgLA9zkJOi5PQNGpY3Q2gFX1exbPGLtjJEbV0TM3vP8XYVVifbpU0YaPYJRdrB7WNT
         w4voWTur43RAl1l3Hd8RxreEneXNATAYZ8LaSVaOLCIqkM71O/DE/kTGrrU4z+kmdkeo
         Ezgg==
X-Forwarded-Encrypted: i=2; AJvYcCWoyEzWyAJambhHyyEPmR7/O4fntcXDH7tLXApT+6mBBlJDUsLmIDMEAb2SyI43NRDvUixpnznmsVMX/v62Vtop@lists.infradead.org
X-Gm-Message-State: AOJu0YyUgKGNddhuvNAM5QE2+avje7QKU5pMpVM5fweVqs7Klbh8jSuY
	64fdBt6/jV7wod3UkMwX8RngLw1lAm4w+ygUe5qQxMQQ82Y7PZ+usKWyQgIMxQhDPgribNW+2CZ
	q2sGRtfBcGqMz4E1Jxw36FSnUCa7nV0cpT4HeX8q0G17VmqabZ1HmLdSUz7Xgmpd5ZGCiMsd8K4
	0b8p855YHCUEcij4DWwVwvGe74bbKQOCUimQ75tCXXKu5ds9LI+ws+Aq/rr5XBtIChjB+W8Ui40
	b96BG3fr/WB4bZaHGRvdimzE3omu7IE7SiJ
X-Gm-Gg: ATEYQzz5UHALbmvRxX8qJtWPn73xhd6jAMRvcJ08QztQ86VE4QQVrV49CN5nYlP1huq
	F9SWyl5Z6vdlSZq5Q0CsThCA12exo3YBvbr3s8h/j0FAtyQhlJKyeFLxEVbGKNOnbz5bjxsFjJf
	ji/7CosBya/kNzvjkcOkbPPeZNZ46VvxhaXZYi+hCfIUfEDvdvsV53ic4zHEiACctOfiNk8VoPM
	2F6GJmjYaVLFhq5rPIfKFQBtq+lr82hVRb2jBK+BaiOAqeaICPjofJXHCtI227tK5SRekuHrnI3
	MclKzUzUmcIYCVhAk/STKIV+MNPEm56YVvwO8A+83DSRS77EgOSeRE51ckBPrxfXiHKN74+e33J
	T4qO/q1VmA3MJejXEX0ED6hzjkDWtbKfVTAX0UbJ3LUs/7iXu06QcKdOAqFdFZOp6tHbUx8PmmX
	0m5RyO/lZtqxZGJLqrFXvPwl7jYh0Db8+y7SRGThTZYnVaacgOF2/5K09LcD7b2cQ=
X-Received: by 2002:a05:6214:2a8b:b0:89c:a2c8:9432 with SMTP id 6a1803df08f44-89ce8b57c65mr46190836d6.0.1774635443005;
        Fri, 27 Mar 2026 11:17:23 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-15.dlp.protect.broadcom.com. [144.49.247.15])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89cd5873f32sm7534376d6.8.2026.03.27.11.17.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Mar 2026 11:17:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-486fa07f2bbso15730475e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 11:17:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774635440; cv=none;
        d=google.com; s=arc-20240605;
        b=RgWRjT3W7BFGhnqtzZc15J/MwOwuQ8S43jT/YjqfXcyX8pZV+YKcIOY5ES87Z+K148
         /Gs/qs4LCIveFTAS4A9+KCf3OkGfgPVNphLL4iDpg3gWSok+iNofqKSaUsQzF5iOYVNd
         9JOqsnEWmnFwfC1qhgxHKbXGtd1g7TXkthGGPisj+VKI95M0GH8sNj2wCvpkgSZcVJ68
         8XKQkBfzO/p7aDAQWpWVeYLrhAcXvNIKbN8/eqOu+vCTvelIp+Z/+et3KRCAPUIpdzZ5
         7lNktCeyJ8Tq4AjX9twZbVjzYhCTHEuyFyKN+cesd2XlgV0oB3TMpp2IhLpLQKx1t1J4
         MsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8uAWgmKNgAn08NNvGHmO+afmkcSce2LkECD7wKeYJdk=;
        fh=RP9ghiY8TeYCO4DrPx8loIIKcKd4mR7F+0LlvfBHP5Y=;
        b=Lpjto9DfUF0UjnFy5QOy6jdBz6LRhVEa+WprbhqIAzEH/J4VMddksaKy2goAitk+f6
         Ygbnf2e9fpjRNewnfY+YCMfpTTuLmLwoWFIamXcvXBSSEzPVBvzl/yJGlicrxuaVDG3c
         0JuE+iPXgBsjziDSPIH01eWqskAw0qrfwqVzSDlnpVbyhwlqVz+qAMeXHOtqmQQEpW8T
         lgkRLpVtt4uSstt+KmzES0FH4W3veJCTc/6IP6Bx5dGqJDFBSGkrfwB4q4NlJHckmoFK
         SqRhzOw6TNv99guIYYJ6r1rfuTOIzW79IN/geu4AZXeVjtkynvTVq31YHRllyu/QMEv7
         ZxEg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774635440; x=1775240240; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8uAWgmKNgAn08NNvGHmO+afmkcSce2LkECD7wKeYJdk=;
        b=MeIyA1hHuHcqDCpLL+dpX8P0GD7hFsqLde4/B/fed6LXAdXH9iXMU6mpW0w26O31by
         VhpkgGYLUw8JrzYFGETHHN1L9fIpYr2RMfcLe/Etb5HHM/AGOLbM5Y+IJFBKVDFcAEb0
         81WfZZpo2HAN/P7IAjuxQeaEnuBcMufqI83Yc=
X-Forwarded-Encrypted: i=1; AJvYcCUxw+zXuarzJ2nZ5szMkoKULOh2QorC9FYRlTO6yeJTsKaUflnpz+aPvpeiFP4j7mIw1K9oL54KZBcsYYTXePoX@lists.infradead.org
X-Received: by 2002:a05:600c:a408:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-48727d735a7mr47046435e9.8.1774635439666;
        Fri, 27 Mar 2026 11:17:19 -0700 (PDT)
X-Received: by 2002:a05:600c:a408:b0:485:9a50:3370 with SMTP id
 5b1f17b1804b1-48727d735a7mr47045795e9.8.1774635438989; Fri, 27 Mar 2026
 11:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260320211921.1202058-1-jitendra.vegiraju@broadcom.com>
 <20260320211921.1202058-6-jitendra.vegiraju@broadcom.com> <acVleH7_kh7kAAZR@shell.armlinux.org.uk>
In-Reply-To: <acVleH7_kh7kAAZR@shell.armlinux.org.uk>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Fri, 27 Mar 2026 11:17:06 -0700
X-Gm-Features: AQROBzDOeqJbNa9mCtRKtZ-IFiNPO_lpzfpzaY_mAFy_J0BCDBOc15lDtCnVYpY
Message-ID: <CAMdnO-Ko9FX2MG0q=sSK9foXLwtNW-QxDpgz8oUH3VmA3K0EfA@mail.gmail.com>
Subject: Re: [PATCH net-next v8 5/6] Fix error handling in probe function.
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
	boundary="00000000000003b270064e0583af"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_111725_927041_0E5B563D 
X-CRM114-Status: GOOD (  17.79  )
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

--00000000000003b270064e0583af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell

On Thu, Mar 26, 2026 at 9:57=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Fri, Mar 20, 2026 at 02:19:20PM -0700, Jitendra Vegiraju wrote:
> > From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> >
> > Software node created in probe function is not being cleaned up if
> > the probe function returns an error.
> > The stmmac core provides mechanism to handle this error condition
> > with plat->init, plat->exit helper functions.
> > Move glue driver's initialization code to plat->init function.
> > If the probe function returns an error, plat->exit function is
> > called. Handle any glue driver level cleanup in the plat->exit
> > handler.
> > Use devm_add_action_or_reset() to register a callback to free
> > irq vectors automatically, simplifying error handling in probe().
> >
> > Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
> > Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
>
> Oh, you did fix it. Please merge this into patch 4, there is no need
> to have this fix seperate.
Sure, I will merge this into patch 4.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

--00000000000003b270064e0583af
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
gccwLwYJKoZIhvcNAQkEMSIEIK7K1B0+upDb2Rg1K3KbRZGMl9LrhHVqxjWjk3jOneLUMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDMyNzE4MTcyMFowXAYJKoZI
hvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAFug4/589hgT
a7KFCR3X2g25dGVuv7mZZbwJy4GxiaZs/2B7+kwAp1GiY+vpYIbMDtFFeKeg1+OyR172byWlriHj
VxdSCGyYiX6c2ChkqVPzOWPmpYkGC4E078aNXZ+Lu0ulIcd1wz5KfLQ9gJ++XNW5yHa7/yyLuDzg
5Wf0N3iO/PL/CVB4IIYxLewzoAj2+kleif+09SrL7EHc7E5RvpYQKon79kxGjRSPwn30+35for9J
nd8vjZgK9rFr8jxOsSWdzQ+eBId4W6P8OkJHYqqghlVN4X3QM4o8PVG6/ONUYhVAUjemzG/kZ1s6
Kup9j4Ig9SADdlkwyNwuylJe4tY=
--00000000000003b270064e0583af--

