Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FD8C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 18:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfXSvzDXEK2PwTU3AjwlPjarjl+mPyko733dLts40vo=; b=jN14Shl0i/oTs+tEDe3qnALVYW
	8JBq5Z5pOC0l7EgjS8sYkPFLMqN0oxLZaoKIA9a2k+oA7qR4XZk085A84sngXeHLMBJWnN9PAWB0m
	xx+zZCLJ1tf6l477IWRwF5xMPxwBVTCMJHnv2XFBKMf8mC9QvaTZBjWw43GfkqQWETAr6C5nv/9wn
	K6oG4xY4YJRFUpwH9Qlnfr+cChBlFCuJk/s0ZFqrYhpHNSR5Blx0Z87LExr/6nJ56tBkKYHza3z8c
	4sShg2rpnH2Zqt8bfR0CG4OZRzXBdJdbSZ+/Ddbx1CNeBFTTYYVJI6SyyNrMfkQdAxsCNpO1tAb9E
	A6SR1N3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Bk3-00000000KBD-3Urn;
	Thu, 03 Sep 2026 18:00:51 +0000
Received: from mail-pj1-x1063.google.com ([2607:f8b0:4864:20::1063])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Bk0-00000000KAU-0X4s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 18:00:50 +0000
Received: by mail-pj1-x1063.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso85287a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 11:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788458447; x=1789063247;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tfXSvzDXEK2PwTU3AjwlPjarjl+mPyko733dLts40vo=;
        b=r2Q96HpWq9I9QVPRa3Gv5kKl14yta6Ku/DZaXRDapkQAHyYP9JLnrr8XebaMdfU8qb
         LBJbGE48jA5nEpH9ogilt4Dd2NjunEUulL4t5IqpJMcUNd3yowOv2KzEmZYBxPT8Hej3
         DY7L75HoH0ESqTZ8sCI7k0q1KRgwsj2WXa8Ks8c5jCLmKj2I21+bCMw0vRdZb7FAm2dG
         9q5s7LWbMS6ImZgNHkjqP8cMtaPNzPs9iKecifcWO1YGvTXKGG7izv0svTBuR/wq6rba
         gnq747ofFAIw5ykaQPJ3HvHm5eRblnbeWnfloySvKgQQWlNqWMSh8OLXjkUneXlf+OuZ
         gKfQ==
X-Forwarded-Encrypted: i=1; AKwUvBy045K1InssBn2NNlTkTDhFODkjX5GdglwXdX/ZOSjBmqei1vP5qXL/kRWGGi0nVyEifB1L+Zgg7Ah/eF9/iNP+@lists.infradead.org
X-Gm-Message-State: AFuF++nF4ZyaohKfWb5H5U4xmQE0C6NRbKaS3BBWCcZpr1+9FLyXEgz8
	lnpMlKRvb6zmTSYJ5QAl48DcmcgJLfgv/rhgAHKHrFZfJ7QZP9JY1UqS3lOEfV1MeTSK+pU+FwG
	WbFmvA+5dZ5sT+5UdZsbjUQhSWE6Ap7fWpZQnHXr/u3/LMwEeZ0M0vidyzWPGAT7fogMXjvc96g
	EtjszpiSayoy5WSfvF+tMfQmbi7FREg5B51q9vbtEG3Hx4sTCS5eIk95k7569OMe7EWcWYZEmi1
	+0/oVYUPzM09TQmRftzBydQQ/9fyEU=
X-Gm-Gg: AYBFou2Umwnhxq08vWyRNQ/9fSxS4fYYkg4bMRb7mkmYb726NHPBE8LtPu76oljPpR1
	a6EE8sGNLX8p9umcuawFNms/uqwAyPHBnfkl+IUf6Vz5XIAGlNhhljf685bq6dR21rlOGlcaD5w
	jjh+idGdqmjAhJK8KJzXITc7JmRerCXA+JUX7WoE7sEBYSU4Y1A4MgSSAQMHnpkbClW09ylMvUL
	XltIHjBKYgXXbZ/2Y6wc/435OETgNNNqgoopMD0QYUsN0QpX5TBipM80wwCXxL7TNWfgV776GSq
	R54gXgncvQbX51UESkzYyHhJL/GQHl8G2CKECESOXXOVMbXONTb4G5WXpJRiccZ2lrEQZ9TIx45
	XQD98AoDBTEWyVFdhKgYhKGeytVeoHjk872tHFPeUC+FecIZHkbGy3TmEmI1KSwMbGmCh4LtGca
	eyyqcZoMQco9LK3DEsMZPAQ2aOj7NSZglZGkpWRGc=
X-Received: by 2002:a17:90b:2687:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-39b2609f768mr384247a91.5.1788458444240;
        Thu, 03 Sep 2026 11:00:44 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-33398958384sm9028eec.3.2026.09.03.11.00.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 11:00:44 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c252c2ffeb8so6862666b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 11:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788458442; x=1789063242; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfXSvzDXEK2PwTU3AjwlPjarjl+mPyko733dLts40vo=;
        b=LU74bMl1Dp7RLVJ6Yf3GdqM+zN9LTeK2ouYQSCzkmD0ubGEA4HM72D9TwF/Yp5Wc5p
         q+Ts9He3MqZTh+HPsm+JIDwS8i2cqfpgfdnGyu/vuYTL4esZIK6tj84scPm7XklMhVKK
         Ou4eWVFBkKoh+w5UdErzuCFqV1WpfPIXq4Hrg=
X-Forwarded-Encrypted: i=1; AKwUvBy+VcYADAAOTKZ/W1Q8JtQfEMeUNN4jxHOvN/VREs9r4CK8tTtEVslKob7xzktqeb2bENMKyRBx9QW9c5MQnCIb@lists.infradead.org
X-Received: by 2002:a17:907:3ccc:b0:c20:f4ee:7c97 with SMTP id a640c23a62f3a-c260c7b0d7dmr26732266b.5.1788458441658;
        Thu, 03 Sep 2026 11:00:41 -0700 (PDT)
X-Received: by 2002:a17:907:3ccc:b0:c20:f4ee:7c97 with SMTP id
 a640c23a62f3a-c260c7b0d7dmr26727066b.5.1788458441097; Thu, 03 Sep 2026
 11:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260902-bcm2712-iommu-submit-v4-0-9dbb657578c1@reactivated.net>
 <20260902-bcm2712-iommu-submit-v4-4-9dbb657578c1@reactivated.net> <9bb0ee66-d313-4a07-af4c-ffd002b55dee@reactivated.net>
In-Reply-To: <9bb0ee66-d313-4a07-af4c-ffd002b55dee@reactivated.net>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 3 Sep 2026 14:00:26 -0400
X-Gm-Features: AcwNN1VMo-0BYjVu68L0XfVw7bX-kJ59Q0HCAFBRY1zIeWvOzLTYqbeos_EFI-4
Message-ID: <CA+-6iNxksLtrYPMSMYxeFGfDPh+ZVKANQSUtWNC9CZO-0OMpig@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
To: Daniel Drake <dan@reactivated.net>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	nick.hollinghurst@raspberrypi.com, Jason Gunthorpe <jgg@ziepe.ca>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000228d63065a97ee7e"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_110048_168917_9AD8AA7D 
X-CRM114-Status: GOOD (  26.29  )
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

--000000000000228d63065a97ee7e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 6:15=E2=80=AFPM Daniel Drake <dan@reactivated.net> w=
rote:
>
> On 02/09/2026 18:57, Daniel Drake wrote:
> > +static int bcm2712_iommu_blocking_attach(struct iommu_domain *blocking=
_domain,
> > +                                      struct device *dev,
> > +                                      struct iommu_domain *old)
> > +{
> > +     struct bcm2712_iommu *mmu =3D dev_iommu_priv_get(dev);
> > +     int ret =3D 0;
> > +
> > +     scoped_guard(spinlock_irqsave, &mmu->hw_lock) {
> > +             /*
> > +              * Completely block DMA by disabling both the bypass wind=
ow
> > +              * and the translation aperture.
> > +              */
> > +             bcm2712_iommu_writel(mmu, MMMU_BYPASS_START_OFFSET, 0);
> > +             bcm2712_iommu_writel(mmu, MMMU_BYPASS_END_OFFSET, 0);
> > +             bcm2712_iommu_writel(mmu, MMMU_ADDR_CAP_OFFSET,
> > +                                  MMMU_ADDR_CAP_ENABLE);
> > +             bcm2712_iommu_writel(mmu, MMMU_ILLEGAL_ADR_OFFSET, 0);
> > +             ret =3D bcm2712_iommu_clear_and_enable(mmu);
> > +             mmu->domain =3D NULL;
> > +     }
>
> My understanding is that when the IOMMU is enabled, the address cap
> represents the highest permittable memory address; requests for anything
> higher would abort. So I had hoped to achieve blocking mode by setting
> ENABLE | 0 in ADDR_CAP, thinking that would set a cap of 0, and hence
> memory accesses would fail.
>
> But a Sashiko review pointed out that actually this value would produce
> a translation aperture of 256MB, because of the way the register works.
> And I confirmed this experimentally, Sashiko is right.
>
> I also confirmed experimentally that setting value 0 to ADDR_CAP (i.e.
> dropping the enable bit too), with the IOMMU enabled, results in a full
> unrestricted bypass/identity mode.
>
> So unless someone from RPi/Broadcom can inform otherwise, I'm going to
> conclude that the hardware doesn't support blocking mode and remove the
> blocking domain implementation.

Hi Daniel,
IIRC, the value in this register field -- let's call it X -- is in
256M-sized pages.  An access is blocked/capped if  iova[39:28] > X.
So it still passes some accesses even if X=3D=3D0.
Regards,

Jim Quinlan
Broadcom
>
> This will cause the iommu layer to fall back to creating an empty paging
> domain when blocking mode is requested, which seems appropriate if the
> hardware doesn't offer a more direct way of blocking all memory access.
>
> Daniel
>

--000000000000228d63065a97ee7e
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
P6nIShznyqOL2EoCa0IXujxvXUo0pANFYsDhrCVF5JOVPeEL3Y2m+4flRtOI+YlRQoepb+TEVdkY
/g1rlWG7GIYrtHxrFFRvn2/Iqqpv/x5kzJgoTYFOyTTGlXIqGkKTqCWFrN09kJWzhhmxhxtJprJs
KveDLF8yhHSbqmXfKTkT+CIrynXXDro+80qXEXC8CM9W9d+2lDDM+hWTlC6Pt/ikMYf/ZB4K2Nr8
VFruDYGZfAHhh9/lqK3SpS2Z/8cB88K62U+Eb1yNAgMBAAGjggHeMIIB2jAOBgNVHQ8BAf8EBAMC
BaAwDAYDVR0TAQH/BAIwADCBkwYIKwYBBQUHAQEEgYYwgYMwRgYIKwYBBQUHMAKGOmh0dHA6Ly9z
ZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZzbWltZWNhMjAyMy5jcnQwOQYIKwYB
BQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMzBlBgNV
HSAEXjBcMAkGB2eBDAEFAwMwCwYJKwYBBAGgMgEoMEIGCisGAQQBoDIKAwIwNDAyBggrBgEFBQcC
ARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wQQYDVR0fBDowODA2oDSg
MoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCUGA1Ud
EQQeMByBGmphbWVzLnF1aW5sYW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQiuRLoBkhIaas+1j3yf23P
ffVFcjANBgkqhkiG9w0BAQsFAAOCAgEAp1y0fznw9Uo7UzExANVpYjj+OG1c3C7MhWOvAd7LvfPX
BSFisMaabop5Pyfc/sWzb/jCNfVkkDW5Ij2mzpUsUca2qpILoFhOUT9b0d+nc48MCZ4/Wj6vX5QJ
i9VdYeuv3DYASZsQdH8iYnV5X5YCYo1AO/pyW+M4gG022Nsji9+3A9zkx8JRPDIXkPaDLrzcGD9L
rEVIYnnSK9b/4VHzITVgEmSsUTAIzOD6M6TzgrSoJZFmKNMXlAqo+m1nlNyJkM4OyOvaDx5y+2hA
mp4tzD9gJNU9TzQpQRZFz53+c8BkCpzvcHqT8lMluRlCrIYWqaSOUDHX9HPYvzbtO4iYV+irMdGN
2PBz6Wtfaoi1xTfFSKK9ON1mvxACK+E4B5gycSoZcOBADTbGXLDMqiygl7Wz0oooAPqZpUnaD1nc
x/pX7N8Ff6YK+iN3vVah34vLkE1CMFyDQMtyTCzQPW+7XCTxCL9ML3LBAF+eNAtKpPOsrGIdRHy5
6oQr+2ZquSMvWj447q4v3sk1LHs7ata+sP8/kmcPKn3WPXQ/4xMevqFVyv2VIFrBK9ZnOZ//fz8R
7SjJ7t2kOITvbWcMkizMc33S9hfmYiXaVTjIi89NiO3EXCJouYShpptgGNG6mpYHcddnfdKiILOS
06KlKNuHO4IpRmaGrzcDjsUQQSn8amMxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgwHM7pH5w7o7Qb7yXUwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEINnR
r7YiwGU2VYIXJLqv4AwmE2KugyjQ6M/RVaH+rb9wMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDkwMzE4MDA0MlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAI5nJWcQpf24EgwefaYf/p+TaNJ4TEBzw82038/3
6Yj2qoZU5Mj40+Q1u+lEaneVqo5vP86hILSF9BFFWH3zxuQUCKH4TBTod0kqqhVRrZnD3bIuLZij
for1YRrhPd1XjxF72hDWz3hNVxv1zAb1ZJLR8dYZIv4yto/6p4sWu4ndw1xbqKYC2OwO3/+CJxun
rfpum/OxQ+pAwnk7NzzwNhaAsB7ItZG0qRhIyteJWUmBXJP2rXpin6VfiYlZ7jcm9+WzSlZM/cNj
k9ALOf7DWDl954q5CsvJ0aGoO2Ft8Stsy0SVhUKsWB+0NjnVVObMmAxMHKf7zOWXjuG9h29oMjs=
--000000000000228d63065a97ee7e--

