Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EF6C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 17:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXX3RiSHyxRZ3GJS26GOwKv9fu0ynb9eNaJcwj7oJyc=; b=OieUjj9qgM/7r8dowu3vTwkKoh
	1RBLeOmmMfYKtRJvkqBuga2raF7FH1gF0paA08tfMe8izn+/ON6eGWYqGgoXsaltqxsxw6ruVM5Mm
	7uihc0F+CAfOkgfpzilsJ27WVk11aaaEWDdDYMLPIXHgz5xyyT3UsGNM6JiQT8l/WWtEzLfLcu9dW
	lE1zz94DbzUUk15kA6iGUeKffTO7/XqtZqYCZId+5Wm2k9uYcyey61FCps9LA2GT+8hOQpJ1XYfcm
	+08M3oSXwEU46xKv145N7BIG15TLNu7qFS3MVki/8UiXL7TitkNSnNURtUfQKqq6+San+HyckVgeW
	a/YH/PbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2BMw-00000000I6W-2ff1;
	Thu, 03 Sep 2026 17:36:58 +0000
Received: from mail-vk1-xa61.google.com ([2607:f8b0:4864:20::a61])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2BMt-00000000I4w-01Cu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 17:36:57 +0000
Received: by mail-vk1-xa61.google.com with SMTP id 71dfb90a1353d-5c7d1512dbfso106654e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 10:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788457013; x=1789061813;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AXX3RiSHyxRZ3GJS26GOwKv9fu0ynb9eNaJcwj7oJyc=;
        b=SMzJ6y+/D7BG9+IygXGK/tlJOdgy6zZO/zV2z0gQAg2UgRVXT0dUB2XzswLVGpfPlp
         X81vrG+8hDpMtM85W7vwcU+29QdHsmkyXu6595Tp5EZDN92ABeYVlR9S3DZ/aQWNcnj7
         K+BubcrsJMqq3XMkNHmrmDzcBevubMs5iOpiiGzEIcYBrUxBlHYAFaJ+MWRs1ZiwnYhM
         USM4bZrInp/wOM/Glx4wlgfzhBUbrjX6HKFi1epdGZiHz3xO6C2roM3Kp5PfRKRQXwyO
         2zwSFLNmsMKk487QGScSR1czxJ5e7CBvhjasnGgUlNFngoFB+ZMGTaDOIB1rOZn9oltd
         Uz+A==
X-Forwarded-Encrypted: i=1; AKwUvBypca3ZuoE1tW8d3HnlGFJLXgfaf422rbks71NT7ICr3nR1ndRELmrCWnrt8uhAvUIYsBLM+rPFdoddugNLg44l@lists.infradead.org
X-Gm-Message-State: AFuF++ntvspnXRE7i4F2DewsN3oXNmPQt8wOGSjnO+vqEL86TE9nFxvl
	iWxy4tS7++y6IK5iwCOYu0e167+iL5Qg2M3HhEuD4zBDGwhsMuuzRpmc4wLzUPZBPsu9kTyZ7/4
	vaUrIAxmYShZTQY+K4kLslv3uKfASvRabO+/nVMFRDAMjyAmfJ3mCEMZBEhpihoLJPCtj/+unOu
	DDY2oA5974LLEHK2OmhWE9dGdvXvK6FdI6RDEfBoTBWkwTG869pYaotkMOaJgotgWTPio0dH2po
	ItZaRgD+qRZSySWoPdRYpHFpdrisZQ=
X-Gm-Gg: AYBFou03jDStgePa++Aq2Ea9GQyzay2Eb+28zKtwWK7UCMecRpyjdGmRMoKZLuswcTs
	hsqe8DqLJIW0SZbNufMUkY25NttLLdGIJReDDg/QgVnw4TfvhewLqQG6eHCoTFMe3SIO/iOLh+F
	mF5yc9ci9+lm+vfKI56r7WOkzbtYJRmZw4NWLEsZgL6tcKcOSzGOU7FV+z1GAqbGvvpChmilOe8
	zvFbfJeI0YpzjIGW31v9NZeetsw3KURchTGTSpdEJg+84wOkVY2l4G+r0PvSclhtv8QmgfadzNX
	xn5FW7Am7HsfuSXfoETqX/o9Jh4/dvICmhOiI3L6veUIFWNy6nqiCYrTeHUy+YkN0E4poqHGCNY
	9rtc7cMAPRDWrl+JWLcoO/Kj9JkZMyuBe+obhHgZZ6Ib5/u1nrGHKMIZRNVxINUKCcRZRdT9koQ
	ZO5py7YQlz7FGMQKuDCCUf4QHRQmq1FagwSPB6Ea8=
X-Received: by 2002:a05:6122:8b11:b0:5c7:a844:493 with SMTP id 71dfb90a1353d-5c7ed2f89e5mr37586e0c.0.1788457012606;
        Thu, 03 Sep 2026 10:36:52 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c7ec138a06sm118257e0c.2.2026.09.03.10.36.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 10:36:52 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c15ceb17a28so3331766b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 10:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788457011; x=1789061811; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AXX3RiSHyxRZ3GJS26GOwKv9fu0ynb9eNaJcwj7oJyc=;
        b=Ib/GaKimlreVmNrM2m5xe7oSINNM/5aaXpPN7kDII+aFQRSqjBlimHERgIhiaiCrE+
         TUiYHMjo//Q8ka/FgSJK7scf7KbINYaYdL0CEa1/d82Qr6PsADUNyhQ1hsauNVYpJXVa
         6GDpdtJL8ODQY3Wsh8SLS2/3IRiZDpGzg0/is=
X-Forwarded-Encrypted: i=1; AKwUvBzTeuzsI/JGZB65KYWJAklvV00B8gXpIGkisotQ1/T5DEbYBCbOOzNP8ab5T5F/mpHeZG5/+QNDql+5RzcHkIub@lists.infradead.org
X-Received: by 2002:a17:906:4fd0:b0:c25:1a5:62a4 with SMTP id a640c23a62f3a-c260ca1ed90mr19711866b.17.1788457010982;
        Thu, 03 Sep 2026 10:36:50 -0700 (PDT)
X-Received: by 2002:a17:906:4fd0:b0:c25:1a5:62a4 with SMTP id
 a640c23a62f3a-c260ca1ed90mr19708766b.17.1788457010559; Thu, 03 Sep 2026
 10:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260902-bcm2712-iommu-submit-v4-0-9dbb657578c1@reactivated.net> <20260902-bcm2712-iommu-submit-v4-2-9dbb657578c1@reactivated.net>
In-Reply-To: <20260902-bcm2712-iommu-submit-v4-2-9dbb657578c1@reactivated.net>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 3 Sep 2026 13:36:37 -0400
X-Gm-Features: AcwNN1WO37iCo5lJmw0oA9Ue67-E06_V_rh5wuozhzpJ0Sb09NLYr5P6ip9-VKo
Message-ID: <CA+-6iNyAU9uw1QyA8TaBWOvhWuxe=DdbeEzoHgM9Gk3TSsSccA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
To: Daniel Drake <dan@reactivated.net>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	nick.hollinghurst@raspberrypi.com, Jason Gunthorpe <jgg@ziepe.ca>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000db3c7f065a979835"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_103655_078027_9F1B9389 
X-CRM114-Status: GOOD (  25.32  )
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

--000000000000db3c7f065a979835
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 1:58=E2=80=AFPM Daniel Drake <dan@reactivated.net> w=
rote:
>
> Add bindings for the Broadcom BCM2712 IOMMUs and their shared TLB cache.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Daniel Drake <dan@reactivated.net>
> ---
>  .../bindings/iommu/brcm,bcm2712-iommu.yaml         | 54 ++++++++++++++++=
++++++
>  .../bindings/iommu/brcm,bcm2712-iommuc.yaml        | 40 ++++++++++++++++
>  2 files changed, 94 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.y=
aml b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml
> new file mode 100644
> index 000000000000..5ca8ce469ec3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/brcm,bcm2712-iommu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM2712 IOMMU
> +
> +maintainers:
> +  - Daniel Drake <dan@reactivated.net>
> +  - Florian Fainelli <florian.fainelli@broadcom.com>
> +  - Jim Quinlan <james.quinlan@broadcom.com>
> +
> +description:
> +  The BCM2712 SoC features multiple independent IOMMU instances providin=
g
> +  address translation for multimedia hardware blocks, such as the VC6 di=
splay
> +  pipeline, camera receivers, and ISP. Each IOMMU has its own page table=
s,
> +  control registers, and local TLB, and is additionally linked to a cent=
ralized
> +  L2 TLB (IOMMUC).
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm2712-iommu
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#iommu-cells':
> +    const: 0
> +
> +  brcm,iommu-cache:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the shared IOMMU cache (IOMMUC). Each IOMMU instance ca=
ches
> +      translated descriptors in this centralized L2 TLB cache block and =
must
> +      trigger cache invalidation commands on it when updating or unmappi=
ng page
> +      table entries.
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#iommu-cells'
> +  - brcm,iommu-cache

Hello Daniel,
What are your thoughts on allowing the iommu work without the cache
property, ie having its presence be optional?  I work on the Broadcom
version of the Rpi4/5 SoCs,  and  (a) on certain workloads the cache
slightly degrades performance or (b) on some chips there is no cache
associated with a specific iommu.  This is probably on me to implement
these possibilities, but I just wanted to give you a heads-up.

LGTM

Regards,
Jim Quinlan
Broadcom WCC/CM/STB


> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    iommu@5200 {
> +        compatible =3D "brcm,bcm2712-iommu";
> +        reg =3D <0x5200 0x80>;
> +        brcm,iommu-cache =3D <&iommuc>;
> +        #iommu-cells =3D <0>;
> +    };
> diff --git a/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommuc.=
yaml b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommuc.yaml
> new file mode 100644
> index 000000000000..47c584ad667a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommuc.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iommu/brcm,bcm2712-iommuc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM2712 Shared IOMMU Cache (IOMMUC)
> +
> +maintainers:
> +  - Daniel Drake <dan@reactivated.net>
> +  - Florian Fainelli <florian.fainelli@broadcom.com>
> +  - Jim Quinlan <james.quinlan@broadcom.com>
> +
> +description:
> +  The BCM2712 IOMMUC is a centralized Translation Lookaside Buffer (TLB)=
 cache
> +  which accelerates address translation across the SoC's IOMMU devices. =
If an
> +  address mapping is not found in the IOMMU's local TLB cache, then this
> +  IOMMUC is consulted as a L2 TLB. The SoC includes a single IOMMUC whic=
h is
> +  shared between all IOMMUs, and it must be explicitly invalidated when
> +  modifying or unmapping IOMMU page tables.
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm2712-iommuc
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    iommuc@5b00 {
> +        compatible =3D "brcm,bcm2712-iommuc";
> +        reg =3D <0x5b00 0x80>;
> +    };
>
> --
> 2.55.0
>

--000000000000db3c7f065a979835
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIVWwYJKoZIhvcNAQcCoIIVTDCCFUgCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghLIMIIGqDCCBJCgAwIBAgIQfofDCS7XZu8vIeKo0KeY9DANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNTNaFw0yOTA0MTkwMDAwMDBaMFIxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBS
NiBTTUlNRSBDQSAyMDIzMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAwjAEbSkPcSyn
26Zn9VtoE/xBvzYmNW29bW1pJZ7jrzKwPJm/GakCvy0IIgObMsx9bpFaq30X1kEJZnLUzuE1/hlc
hatYqyORVBeHlv5V0QRSXY4faR0dCkIhXhoGknZ2O0bUJithcN1IsEADNizZ1AJIaWsWbQ4tYEYj
ytEdvfkxz1WtX3SjtecZR+9wLJLt6HNa4sC//QKdjyfr/NhDCzYrdIzAssoXFnp4t+HcMyQTrj0r
pD8KkPj96sy9axzegLbzte7wgTHbWBeJGp0sKg7BAu+G0Rk6teO1yPd75arbCvfY/NaRRQHk6tmG
71gpLdB1ZhP9IcNYyeTKXIgfMh2tVK9DnXGaksYCyi6WisJa1Oa+poUroX2ESXO6o03lVxiA1xyf
G8lUzpUNZonGVrUjhG5+MdY16/6b0uKejZCLbgu6HLPvIyqdTb9XqF4XWWKu+OMDs/rWyQ64v3mv
Sa0te5Q5tchm4m9K0Pe9LlIKBk/gsgfaOHJDp4hYx4wocDr8DeCZe5d5wCFkxoGc1ckM8ZoMgpUc
4pgkQE5ShxYMmKbPvNRPa5YFzbFtcFn5RMr1Mju8gt8J0c+dxYco2hi7dEW391KKxGhv7MJBcc+0
x3FFTnmhU+5t6+CnkKMlrmzyaoeVryRTvOiH4FnTNHtVKUYDsCM0CLDdMNgoxgkCAwEAAaOCAX4w
ggF6MA4GA1UdDwEB/wQEAwIBhjBMBgNVHSUERTBDBggrBgEFBQcDAgYIKwYBBQUHAwQGCisGAQQB
gjcUAgIGCisGAQQBgjcKAwwGCisGAQQBgjcKAwQGCSsGAQQBgjcVBjASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBQAKTaeXHq6D68tUC3boCOFGLCgkjAfBgNVHSMEGDAWgBSubAWjkxPioufi
1xzWx/B/yGdToDB7BggrBgEFBQcBAQRvMG0wLgYIKwYBBQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9i
YWxzaWduLmNvbS9yb290cjYwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjYuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yNi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUAA4IC
AQCRkUdr1aIDRmkNI5jx5ggapGUThq0KcM2dzpMu314mJne8yKVXwzfKBtqbBjbUNMODnBkhvZcn
bHUStur2/nt1tP3ee8KyNhYxzv4DkI0NbV93JChXipfsan7YjdfEk5vI2Fq+wpbGALyyWBgfy79Y
IgbYWATB158tvEh5UO8kpGpjY95xv+070X3FYuGyeZyIvao26mN872FuxRxYhNLwGHIy38N9ASa1
Q3BTNKSrHrZngadofHglG5W3TMFR11JOEOAUHhUgpbVVvgCYgGA6dSX0y5z7k3rXVyjFOs7KBSXr
dJPKadpl4vqYphH7+P40nzBRcxJHrv5FeXlTrb+drjyXNjZSCmzfkOuCqPspBuJ7vab0/9oeNERg
nz6SLCjLKcDXbMbKcRXgNhFBlzN4OUBqieSBXk80w2Nzx12KvNj758WavxOsXIbX0Zxwo1h3uw75
AI2v8qwFWXNclO8qW2VXoq6kihWpeiuvDmFfSAwRLxwwIjgUuzG9SaQ+pOomuaC7QTKWMI0hL0b4
mEPq9GsPPQq1UmwkcYFJ/Z4I93DZuKcXmKMmuANTS6wxwIEw8Q5MQ6y9fbJxGEOgOgYL4QIqNULb
5CYPnt2LeiIiEnh8Uuh8tawqSjnR0h7Bv5q4mgo3L1Z9QQuexUntWD96t4o0q1jXWLyrpgP7Zcnu
CzCCBYMwggNroAMCAQICDkXmuwODM8OFZUjm/0VRMA0GCSqGSIb3DQEBDAUAMEwxIDAeBgNVBAsT
F0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpH
bG9iYWxTaWduMB4XDTE0MTIxMDAwMDAwMFoXDTM0MTIxMDAwMDAwMFowTDEgMB4GA1UECxMXR2xv
YmFsU2lnbiBSb290IENBIC0gUjYxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2Jh
bFNpZ24wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCVB+hzymb57BTKezz3DQjxtEUL
LIK0SMbrWzyug7hBkjMUpG9/6SrMxrCIa8W2idHGsv8UzlEUIexK3RtaxtaH7k06FQbtZGYLkoDK
RN5zlE7zp4l/T3hjCMgSUG1CZi9NuXkoTVIaihqAtxmBDn7EirxkTCEcQ2jXPTyKxbJm1ZCatzEG
xb7ibTIGph75ueuqo7i/voJjUNDwGInf5A959eqiHyrScC5757yTu21T4kh8jBAHOP9msndhfuDq
jDyqtKT285VKEgdt/Yyyic/QoGF3yFh0sNQjOvddOsqi250J3l1ELZDxgc1Xkvp+vFAEYzTfa5MY
vms2sjnkrCQ2t/DvthwTV5O23rL44oW3c6K4NapF8uCdNqFvVIrxclZuLojFUUJEFZTuo8U4lptO
TloLR/MGNkl3MLxxN+Wm7CEIdfzmYRY/d9XZkZeECmzUAk10wBTt/Tn7g/JeFKEEsAvp/u6P4W4L
sgizYWYJarEGOmWWWcDwNf3J2iiNGhGHcIEKqJp1HZ46hgUAntuA1iX53AWeJ1lMdjlb6vmlodiD
D9H/3zAR+YXPM0j1ym1kFCx6WE/TSwhJxZVkGmMOeT31s4zKWK2cQkV5bg6HGVxUsWW2v4yb3BPp
DW+4LtxnbsmLEbWEFIoAGXCDeZGXkdQaJ783HjIH2BRjPChMrwIDAQABo2MwYTAOBgNVHQ8BAf8E
BAMCAQYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUrmwFo5MT4qLn4tcc1sfwf8hnU6AwHwYD
VR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwDQYJKoZIhvcNAQEMBQADggIBAIMl7ejR/ZVS
zZ7ABKCRaeZc0ITe3K2iT+hHeNZlmKlbqDyHfAKK0W63FnPmX8BUmNV0vsHN4hGRrSMYPd3hckSW
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGkTCCBHmg
AwIBAgIMBzO6R+cO6O0G+8l1MA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYxOTA4NDUzMVoXDTI3MDYyMDA4NDUzMVowgdgxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEQMA4GA1UEBBMHUXVpbmxhbjEMMAoGA1UEKhMDSmltMRYwFAYDVQQKEw1CUk9BRENPTSBJ
TkMuMSMwIQYDVQQDDBpqYW1lcy5xdWlubGFuQGJyb2FkY29tLmNvbTEpMCcGCSqGSIb3DQEJARYa
amFtZXMucXVpbmxhbkBicm9hZGNvbS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
AQC8AmhbPVfLI9wqrMBL/9KxGsC+34dY1TTZOQyoill5MnWSx1ZB+JjNsva/GPK27JShDX9J/9vZ
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
QSAyMDIzAgwHM7pH5w7o7Qb7yXUwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIFMV
o5hS0DDcFFymAnqwogOvaV9pgIoyUXi5QGwpHtP3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDkwMzE3MzY1MVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAIzWmrBxBmtqvJ5fvCTDX/aWzJ6BL5gam9b2hTUZ
9nJipfJH7zY0ySmtLtTH68YaRM6qBrQrK26GOie4J25KBfJdB0TNg76LvAqJTuVmmxmJYrHYR9NG
JXykSfh2rK1tzyAiUgMqUoucRvGIcqj8MnIszqG9zSfv+dA0sqflE0PxNpUltusbCI0YtqfW5kW3
XrKMCVHj3XYikNzEaBQY5EpTkXmmH7T6T83xNLf78cSosCvv0wNdn/PAuG1l1ylqrXVZZgqGcauD
rlxsl+KQrXq/YDZWi0bW9lFXg1ax2y1KM4LN7ac4E54UFP8pZuV+pLlpgbFvI/6RRHnpT5Uu+N8=
--000000000000db3c7f065a979835--

