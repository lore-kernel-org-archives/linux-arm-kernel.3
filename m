Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AD5606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wCHqQEE3;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=YHGub1/H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dVyIeRQJHeB49FS4amSNOfxSQ+jsE+/JpXBqaJR89vk=; b=wCHqQEE3Rf7luIchTKcO/HT755
	mwDxyPWxGWr3xeV0xpfmFDFZv/BveD7bvsixXwP8hmmev6ID8YeYUKqQ53iQSpoWQRpUJ85281FZ3
	LI9GfPZJyPS9nJPqdfv9kHHbbXgyKN3VykY/Wc03l8yQAvEUK0kCrOIyM9xvLJq14fOCqiATef3Cl
	ZRPcX2ImGIqX64hyjaYmCHyNXEq6QjRY1IWotmDRRZQQeUlbqTL4HdyY4HY1QEkqsjWKNYwT26gD+
	uZRTy2lzudtX7D74GrMpWO+iqT50cFWJQp4+ujHwLl8c1NsiOI5N3b6hNc2r34+3qqtiCxvC8gzTU
	IiFzyStw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOI1a-00000003HEw-1TPF;
	Tue, 03 Nov 2026 17:10:18 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOI1W-00000003HDz-3oMg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 17:10:17 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso686651966b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 09:10:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793725811; cv=none;
        d=google.com; s=arc-20260327;
        b=ghJFHSCEFbpMZ97kP86mkqpkmzCJ5wa2t2Ag1xaZMUk3qzBjysQCtJQFZU4gbZOnDI
         Ywhiw0swb3tB7F/PZ1OI2vTNMKXco1+ZLXRJae/7tpK55O8X9WEbGNQMu1mXKSbRIYzE
         9dKgEhrsqs9TEanG92FSn3Qxa3z54GLh3XHPgx2tUtbcFhDkVeDuYUsL3s+TdXqT7adN
         /Hk5skhfWmM8LvrTYzt43BxtifGO2wpM3OwQGbuEEFracZSxOWmNRn4TXm9MKqEoVWz4
         aWIWO6BXlgaSCreel04lEKssBhopd1WSq7KTb+m/RQ8j+QuMBq53Ns0lC8KMoPbWx/5z
         9l6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dVyIeRQJHeB49FS4amSNOfxSQ+jsE+/JpXBqaJR89vk=;
        fh=yf7qUVwdZ4ceP4Gg/rAc9aUuuoIKj8y/HogzmiVV9kY=;
        b=Z//2ZkjDGlB64uRWZFcGRTXNaG6bKDa/givG5k9p81OOvM/enyMKWerLBb/TfilWkC
         otpMiuhWOOZR94WbRZL5yq8A/Ie5khuzEFvEEf3WYNc/xoz4UWsyzKpZAq/B/kUiLgVf
         Ral8aM8x3B1ohmb0QiUvXQkMagOBTkWkhTcemxBtwc9ZmfXHbkOw2eRKQ8skfEmjT5oM
         eGF4zY8RsmLHfvogeV5fs7g9rgL3dBqMzT5+uNBrekrXun0ZkFP/RcDiGsi+sU+8EfMV
         uAEP7hZQehIrlJdpKe/WTKJ8bVgbJB0c1DnYQiX2qF+82awudEk3m7d6H60rTzwEMStB
         DEsw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793725811; x=1794330611; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVyIeRQJHeB49FS4amSNOfxSQ+jsE+/JpXBqaJR89vk=;
        b=YHGub1/HzT6iVtX48ehvIFSWkMhR9e0XkChr6LI8xQ2zQqmciUx2MntL87N4ywYvKH
         6i+RiaiNUgMMKooK2r7g1kLv4PNv++ljAtt/8kQ94FVv/XVCj6enXUOUhGTYEsqiTexD
         19AqT2xGI3kXAmSwTzB8MZ9Ydw/MmleNGePec5SsiierseYERXvhKqh8kBJfPq4A4vKm
         S099TIxKTXk01FW7+IB2tVEaKWqp2NlnkzdQnijVlVjGCNxkasHvFQToSe/l43eg6lAP
         lTBUOpp6vVkDV/AOMJfDAeJUQjM2ME9nY/fVKvuFCHsUG02PTGMUdknD6LABzupDopIQ
         0Y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793725811; x=1794330611;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dVyIeRQJHeB49FS4amSNOfxSQ+jsE+/JpXBqaJR89vk=;
        b=BQ6nJxWtx9SALT/jbvuDWzh7A74QMqjDArP7SmU6p0d+F5NafFYm0PIJvFHNFNDvbK
         mb+x+tGzBTNE3EzJ+AvqhvcWyYtS7P9t+W9ELBrBDoaquw7+ch4NpC0kzyukhexFTA5w
         zVWN4slbcSPL1RQ/128vvgWYCxwLv+FkmrC6awqg7RSgurzu7JmvQUDI0pXmb0s/RdaW
         FEZXGvMqUpsHZq7cG0awKmPCUJJc6OmnL1sfqB7a/3N6RZVbws15va29TIlkw6MgWfK/
         COMMH2rT8hIwEgxZzuqSpeawjsw/PAh+bzUGj5yRP6xso2EgtH9ExsnzL6Dnspn0WDGA
         qstw==
X-Forwarded-Encrypted: i=1; AKwUvBxNhkklxgVbGP4JxknK8efgnVRMBj5GnFk579MigZNDrIR/b0cgmPfDiVZvb0tcK+KHKlOqwOd4//yxEgRpkVbe@lists.infradead.org
X-Gm-Message-State: APuU4Z8Iq7PCgXB0eVibucwXbj4jXBUVKt+uNVlZFmTJM2bVwL4Zn+Mi
	LNzDpZtVUp9YVu/Z/o+GQ74enBUx8YP7VY2jPgvMo8c9joFFvi1Q3EpqGiaz1xuY4dVDGgU93zh
	pXh1mhIyB8MViV4+DvBrp8KUnS1nohB9RAowh8ZqAUQ==
X-Gm-Gg: AYBFou0aiBcyBw68pmyrz2f4gL9geeC1Bian/yKVu3iA9T0hf2mG9HdNdKqbTnnL7JD
	AwzUYeRnRhf2Pxqs9NeZpCiBhT+Wm7nBD/C8H9n5Zf3RwAb+JNkcodUPc/t6HvAK4j+dz1hyx0B
	T2hyoY6PH+46mkPaaDKw/vz62ws27fkfH1I60MlnSxoa3HKUxJsdQVDZQoxUpPemU9TK9R++XCu
	9cr1doIrQeGK1JV2g/5bKh7LqvHDeFFDnXABoFFH0eLKBPBiGtjvCzOOCfEnsf4L8M708pBOQoA
	6/mocP84y2VYCtaOSB2pCcZhV+naliYgaElB1/FqldTluiScBXGv7D26VOcPwc6wLDJDcOv302L
	zVQg2mXZSch4CGgJ6EODqxHGT8vZGhyZ148/W20VSEoTFow0rsiLOTCbViDcT1RI9VNlV
X-Received: by 2002:a17:907:9811:b0:c25:2688:8212 with SMTP id
 a640c23a62f3a-c4ca74209fcmr1138335066b.0.1793725810499; Tue, 03 Nov 2026
 09:10:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102090713.896324-1-pbrobinson@gmail.com> <CAPY8ntCZgp4_aaYim__XrmfL=gW-e1dnu2CjBG3n-VzbghYgNQ@mail.gmail.com>
In-Reply-To: <CAPY8ntCZgp4_aaYim__XrmfL=gW-e1dnu2CjBG3n-VzbghYgNQ@mail.gmail.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Tue, 3 Nov 2026 17:09:33 +0000
X-Gm-Features: AclHuK8tMj1QOQ1uafVmUFnYp2xZaTUAkPNNAv0ydPYWKPLq44x8qXFWk7k_EBs
Message-ID: <CAMEGJJ2ro0s0ZvQRgNneZZKTictbQcWzfLAT9fc9d62uA1cS3g@mail.gmail.com>
Subject: Re: [PATCH 0/9] dma: Add BCM2711 and BCM2712 support to bcm2835-dma
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Peter Robinson <pbrobinson@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_091015_116570_3EF94107 
X-CRM114-Status: GOOD (  20.97  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 3 Nov 2026 at 16:49, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Peter
>
> On Mon, 2 Nov 2026 at 09:07, Peter Robinson <pbrobinson@gmail.com> wrote:
> >
> > The upstream bcm2835-dma driver only handles the older BCM2835 SoCs
> > up to the Raspberry Pi 3. The later BCM2711/BCM2712 add extra channels
> > that support 40-bit DMA4 channels so add support so this works upstream.
> >
> > The first patch updates the bindings, them patches 2-5 do some
> > refactoring and add the support for the newer SoCs.
> >
> > Finally patches 6 and 7 add the nodes to the base device tree and
> > patches 8 and 9 enable it and configure HDMI audio to use them as
> > per the down stream device trees.
> >
> > The series was assisted considerably by Claude Opus 5.5 based on the
> > various downstream Raspberry Pi patches and tested on a number of
> > RPi5B revC/D, RPi4B and a RPi3B+ all running Fedora 45. Checkpatch
> > and dtbs_check pass clean.
>
> cc Phil Elwell as he knows far more about DMA on the Pi than I do.

Let me answer some of the questions that have arisen:

1. The downstream bcm2711 dtsi has 2 nodes for the DMA channels for 2 reasons:
   i. It is an accurate reflection of the hardware, and which bus the
DMA controller's bus master interface appears on.
   ii. It allows us to use the address translation provided by the
dma-ranges property - we do no explicit address munging in the
downstream driver.

2. This driver does know about each channel's capabilities - see how
is_lite_channel and is_40bit_channel are initialised independently of
the DT node where it is declared.

I hope that clears things up a bit.

Phil

