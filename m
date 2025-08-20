Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C59CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9takuupk6CPGVnfhLN7b/iB41a6Vzv8cIF2ka0+RuFc=; b=AVb93wpveRda2fRKhFKizV5pOx
	amk8NuFNtHf97jhBbJm2G4ibId0Z12iZy98/A56cxCJjcztCx6RZKHnEzPxuWroQCqkiGglEFJoQK
	EDeili4i/yAYv4tWySTJAaPHT4Os8YdA5NDbHgojP9uERfoq4U2TQAfIiZM6UWgX3QyPKRU3kDFMo
	iHFM2TxNVUTI3lRFzKHlmLxjF08hK6+ccp7GeosrWADCHHFw7p5WbJ0CMY36+Ydl7I2tMYRPJuO8r
	yU84sFHEWDn2Zwst6XKn7/ZAN5ql2rJD8exVTZcWaaoGWX7fZDSuFQ0EqMWEYgeWHnzEYvFbVyvAg
	93dRI3EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopsM-0000000EvvR-3j1n;
	Wed, 20 Aug 2025 20:57:42 +0000
Received: from mail-pj1-x1063.google.com ([2607:f8b0:4864:20::1063])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomIz-0000000EU7b-2lBX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 17:08:58 +0000
Received: by mail-pj1-x1063.google.com with SMTP id 98e67ed59e1d1-32326e71c31so138660a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 10:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755709737; x=1756314537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9takuupk6CPGVnfhLN7b/iB41a6Vzv8cIF2ka0+RuFc=;
        b=ACXp/Dz/ekzxJ+mZ5DB85hjjpJRtNbMU6IQOnVdgUtCVd1HeRFQAIs4D4zrULTY2Q5
         xTAXcktFoy1xj/ZS/yW8wHaTGN0FWYNgS0P2SwD180rT0dJTS4Jh+Vq00TpMLTUeDOxQ
         +3RnB7VbDOoy8f+0vk0PDe8lQyBm6oOjniheH/SPmH7hoWY85/9wQ0l4N9gu62kRn0pk
         oE0+mW1V819jcahYxrS6HRVa50eJU7oMRxh6d8XeYvd/hAeNt9DvhB/HfuLIlyl4xH6q
         29wCSB/xFQXof5pnXonXxWgGWGck6QDfzqTucC8Xl//xemZc93QUtfox1Cr4Z8AvWSVI
         Ktog==
X-Forwarded-Encrypted: i=1; AJvYcCU6UY5jJyvM0cHN++yvFfxgMMreX5h0pW4CvUrwhAORbZYVDAFyN7stwvUkeSMUUy4xUhoU3xdFr7YOxd4J2bsQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6eZVxy3zl7XeV0xPDDwoj23n/UHy2WqimEIdeuEsZ9HFMowhP
	y7lvy2DYVsQkjDc0zl1pX9o+jrewLTcgSgEHoOAkkobfLmN8UW3Gx/+iswNx9W09wdCg/COUYOz
	TECu9em2VomRnqKv7rXf6h5jVro/gUs0kv01aYpuxoodMFJG+qYVVenKgNngl1SZ3omTG2yhLmd
	13a9HlF6ZmKi1w/wyKT1y7l/TgqhKzYkMyshCXj8t+QJOMjaTq8U+pFytO2lNxJBO6mxAoaypqY
	gJOebjL5v0HJHXn4GL7aUp2tJzWxF0=
X-Gm-Gg: ASbGncsUmEGzGXABZWEv9qpQnbrR9RleeEuhhRNlbt30eIgDhJbyqELEgQk09uDsmsM
	W0Y8JXMbwNnB7/UvFMFO9S3ej4S8lZTedXypxSe+Z9jp8OpS3+uw8/DieTzRA6ZXcSusATJkFM5
	2rmxO7V2jmzM/F1Sn7tGVBJ7eVJ2a6AzVAO9NjGcd7tixgw9wjhxEjlrfiHFiLympkoO+s2tu4x
	PUgg571NIejPet8AQ59EIGNGpr+nFvOYCot1q3XqNjIjIgn2kx0zs56/Z45VGK/+s6BQPHnwiV1
	T9P1AFuXW9L6KVoylbbDtJrbZA5VKwfkoaWzUNohqK/HQ79mU+15xvAnEZtuSckRKp7rM3xeUwu
	evcHCABrdJ8vkiWRqWMxGLeJqULj6V7YFlIMod0WJ2MBGPZZgIlDBueTXqxVU+PTc8+LP77nOGy
	kghWA=
X-Google-Smtp-Source: AGHT+IEEDgI1ipBaRmKos88wEfJADfFeiE0+A7OdLiTsJtzITvJ0X3K+1AyNfg1GAi0tv7SkbcCPrHPACmzx
X-Received: by 2002:a17:90b:560e:b0:31e:cdfb:5f1f with SMTP id 98e67ed59e1d1-324e12e1e12mr4864316a91.14.1755709736579;
        Wed, 20 Aug 2025 10:08:56 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-126.dlp.protect.broadcom.com. [144.49.247.126])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-b47706c29a1sm40950a12.14.2025.08.20.10.08.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Aug 2025 10:08:56 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-55ce520e01eso12637e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1755709734; x=1756314534; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9takuupk6CPGVnfhLN7b/iB41a6Vzv8cIF2ka0+RuFc=;
        b=eW+dhLlbKIqr7L5V2XWOKTHkQob6AkrttKfbCNjmWEZ0dp5KBinvDZYI+oevh9LTrq
         acBdubjy5gUzSaxvMaqZx7kMmOs64WBJUdOknXg08mnDxcGh7yNri6K5fDEkv1Koi73H
         1V2uSOPY+ZWpq/3Vo0LNtZfwhcdYPIm5kCfuE=
X-Forwarded-Encrypted: i=1; AJvYcCXa/Xbh3qkajyFNfeeYnRthP+5IqcmPQsUhcfeuOXF/VYn/PECBuwmBYFf75kJM2MAHKCBxyvejbngcNrBBPsa4@lists.infradead.org
X-Received: by 2002:a19:6a07:0:b0:55c:c9d5:d32a with SMTP id 2adb3069b0e04-55e06b2c9admr985646e87.3.1755709733645;
        Wed, 20 Aug 2025 10:08:53 -0700 (PDT)
X-Received: by 2002:a19:6a07:0:b0:55c:c9d5:d32a with SMTP id
 2adb3069b0e04-55e06b2c9admr985630e87.3.1755709733113; Wed, 20 Aug 2025
 10:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250703215314.3971473-1-james.quinlan@broadcom.com> <wxrnpfu7ofpvrwxxiyj4am73xcruooc4kaii2zgziqs4qbwhgj@7t3txfwl24tu>
In-Reply-To: <wxrnpfu7ofpvrwxxiyj4am73xcruooc4kaii2zgziqs4qbwhgj@7t3txfwl24tu>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Wed, 20 Aug 2025 13:08:41 -0400
X-Gm-Features: Ac12FXxEAltzz83t9Vo30BMgxvMUR3R3Gcl6u1hUhsD-lsob_1vGPSB8mZn1q2I
Message-ID: <CA+-6iNw6t36LogOroyQ8wNLOrSYPOJB0nxijbzcs2UWjwFkMXQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] PCI: brcmstb: Add 74110a0 SoC configuration
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com, 
	jim2101024@gmail.com, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000083b29063ccf0785"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_100857_692644_22A7A05B 
X-CRM114-Status: GOOD (  19.02  )
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

--000000000000083b29063ccf0785
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 10:51=E2=80=AFAM Manivannan Sadhasivam <mani@kernel=
.org> wrote:
>
> On Thu, Jul 03, 2025 at 05:53:10PM GMT, Jim Quinlan wrote:
> > This series enables a new SoC to run with the existing Brcm STB PCIe
> > driver.  Previous chips all required that an inbound window have a size
> > that is a power of two; this chip, and next generations chips like it, =
can
> > have windows of any reasonable size.
> >
> > Note: This series must follow the commits of two previous and pending
> >       series [1,2].
> >
> > [1] https://lore.kernel.org/linux-pci/20250613220843.698227-1-james.qui=
nlan@broadcom.com/
> > [2] https://lore.kernel.org/linux-pci/20250609221710.10315-1-james.quin=
lan@broadcom.com/
>
> Have you considered my comment on this series?
> https://lore.kernel.org/linux-pci/a2ebnh3hmcbd5zr545cwu7bcbv6xbhvv7qnsjzo=
vqbkar5apak@kviufeyk5ssr/

Hi Mani,
I'm sorry, I thought I replied to this but obviously I did not.

Your points are valid.  Our PCIe HW block keeps on mutating, and each
time it does we add new code that is triggered off of the soc_base
config setting.  The end result is not easy on the eyes.

I  also have submitted the series "PCI: brcmstb: Include cable-modem
SoCs".  I don't think it has review comments yet, but I am guessing
that you will make the same points.

So it looks like what you are asking for is a refactoring of the
driver and, AFAICT, I need to first submit separate series that does
this before submitting the this and the cable modem submission.  Do
you agree with that?

Regards,
Jim Quinlan
Broadcom STB/CM


>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

--000000000000083b29063ccf0785
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQYQYJKoZIhvcNAQcCoIIQUjCCEE4CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg3FMIIFDTCCA/WgAwIBAgIQeEqpED+lv77edQixNJMdADANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA5MTYwMDAwMDBaFw0yODA5MTYwMDAwMDBaMFsxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBS
MyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
vbCmXCcsbZ/a0fRIQMBxp4gJnnyeneFYpEtNydrZZ+GeKSMdHiDgXD1UnRSIudKo+moQ6YlCOu4t
rVWO/EiXfYnK7zeop26ry1RpKtogB7/O115zultAz64ydQYLe+a1e/czkALg3sgTcOOcFZTXk38e
aqsXsipoX1vsNurqPtnC27TWsA7pk4uKXscFjkeUE8JZu9BDKaswZygxBOPBQBwrA5+20Wxlk6k1
e6EKaaNaNZUy30q3ArEf30ZDpXyfCtiXnupjSK8WU2cK4qsEtj09JS4+mhi0CTCrCnXAzum3tgcH
cHRg0prcSzzEUDQWoFxyuqwiwhHu3sPQNmFOMwIDAQABo4IB2jCCAdYwDgYDVR0PAQH/BAQDAgGG
MGAGA1UdJQRZMFcGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQCAgYKKwYBBAGCNwoDBAYJ
KwYBBAGCNxUGBgorBgEEAYI3CgMMBggrBgEFBQcDBwYIKwYBBQUHAxEwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHQ4EFgQUljPR5lgXWzR1ioFWZNW+SN6hj88wHwYDVR0jBBgwFoAUj/BLf6guRSSu
TVD6Y5qL3uLdG7wwegYIKwYBBQUHAQEEbjBsMC0GCCsGAQUFBzABhiFodHRwOi8vb2NzcC5nbG9i
YWxzaWduLmNvbS9yb290cjMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjMuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yMy5jcmwwWgYDVR0gBFMwUTALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgEo
CjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAN
BgkqhkiG9w0BAQsFAAOCAQEAdAXk/XCnDeAOd9nNEUvWPxblOQ/5o/q6OIeTYvoEvUUi2qHUOtbf
jBGdTptFsXXe4RgjVF9b6DuizgYfy+cILmvi5hfk3Iq8MAZsgtW+A/otQsJvK2wRatLE61RbzkX8
9/OXEZ1zT7t/q2RiJqzpvV8NChxIj+P7WTtepPm9AIj0Keue+gS2qvzAZAY34ZZeRHgA7g5O4TPJ
/oTd+4rgiU++wLDlcZYd/slFkaT3xg4qWDepEMjT4T1qFOQIL+ijUArYS4owpPg9NISTKa1qqKWJ
jFoyms0d0GwOniIIbBvhI2MJ7BSY9MYtWVT5jJO3tsVHwj4cp92CSFuGwunFMzCCA18wggJHoAMC
AQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5
MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENB
IC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0E
XyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+J
J5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8u
nPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTv
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBU0wggQ1oAMCAQICDEjuN1Vuw+TT9V/ygzANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAxMjE3MTNaFw0yNTA5MTAxMjE3MTNaMIGO
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xFDASBgNVBAMTC0ppbSBRdWlubGFuMSkwJwYJKoZIhvcNAQkB
FhpqYW1lcy5xdWlubGFuQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBAKtQZbH0dDsCEixB9shqHxmN7R0Tywh2HUGagri/LzbKgXsvGH/LjKUjwFOQwFe4EIVds/0S
hNqJNn6Z/DzcMdIAfbMJ7juijAJCzZSg8m164K+7ipfhk7SFmnv71spEVlo7tr41/DT2HvUCo93M
7Hu+D3IWHBqIg9YYs3tZzxhxXKtJW6SH7jKRz1Y94pEYplGQLM+uuPCZaARbh+i0auVCQNnxgfQ/
mOAplh6h3nMZUZxBguxG3g2p3iD4EgibUYneEzqOQafIQB/naf2uetKb8y9jKgWJxq2Y4y8Jqg2u
uVIO1AyOJjWwqdgN+QhuIlat+qZd03P48Gim9ZPEMDUCAwEAAaOCAdswggHXMA4GA1UdDwEB/wQE
AwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUuZ2xvYmFs
c2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggrBgEFBQcw
AYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAw
TQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2Jh
bHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4aHR0cDov
L2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmwwJQYDVR0R
BB4wHIEaamFtZXMucXVpbmxhbkBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYD
VR0jBBgwFoAUljPR5lgXWzR1ioFWZNW+SN6hj88wHQYDVR0OBBYEFGx/E27aeGBP2eJktrILxlhK
z8f6MA0GCSqGSIb3DQEBCwUAA4IBAQBdQQukiELsPfse49X4QNy/UN43dPUw0I1asiQ8wye3nAuD
b3GFmf3SZKlgxBTdWJoaNmmUFW2H3HWOoQBnTeedLtV9M2Tb9vOKMncQD1f9hvWZR6LnZpjBIlKe
+R+v6CLF07qYmBI6olvOY/Rsv9QpW9W8qZYk+2RkWHz/fR5N5YldKlJHP0NDT4Wjc5fEzV+mZC8A
AlT80qiuCVv+IQP08ovEVSLPhUp8i1pwsHT9atbWOfXQjbq1B/ditFIbPzwmwJPuGUc7n7vpmtxB
75sSFMj27j4JXl5W9vORgHR2YzuPBzfzDJU1ul0DIofSWVF6E1dx4tZohRED1Yl/T/ZGMYICYDCC
AlwCAQEwazBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UE
AxMoR2xvYmFsU2lnbiBHQ0MgUjMgUGVyc29uYWxTaWduIDIgQ0EgMjAyMAIMSO43VW7D5NP1X/KD
MA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCCT4guGG458k9kmyct6iUtbPGQtSYOg
+Xy+OmyIBwk72TAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNTA4
MjAxNzA4NTRaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglg
hkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0B
AQEFAASCAQAk6pbT1CycczRqPZOeR3xK9p48qFnaLMXA4Rrjj8/BMR+OcQijl9ScUNvGKv/tqibU
DlOs0mMSOSc75kVh797/yWH4XZOkJUtx1mQk/nHXlfDZt8Dn6R37GTAa4EolyVJuMT7kh6yZdS51
CaAKLe/la79DSEzLxUhpC6yjdbLl5dtCJq8Ew9PYoXzJU88+nlj1icmHft/fQLVSyW9W/IjoRURE
irgOJv1b2pG//VZqaYIsn0UshyBRhBXd1y+hSUdVFxbBm3xvWbz2NxD1DZGdrr4Y1II27kAuNJE+
8oWuyCcfNBGW8yP3faOKXttJ/dDXryUGSq+Y9q+w7rsynNQG
--000000000000083b29063ccf0785--

