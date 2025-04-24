Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6588C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 03:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lm6fgchcfVrIoTbYF8HjVQc55WI83UqWvrYwf6Qmcoo=; b=xzApZyxjo4pNAoxh6qUZ/7cjo8
	2v5qh5AhGrentITJxqRY/M1HW8HPSHwc6QWtwIZG0L7uQIevScumdo96a+QpafSYISB5lTxqG/4na
	GY64pK7PyD9suY4KpcGU1UartAlbynlki5MW1KvJU2+Ghd5V1TvAvbgTPFR/s0JOUOpL6I/UHaBYM
	ZRMhV1GmJedbqvSDjgl4VlvuacgVCBimpJ7roti8O1p55xKgLLQackvnA2pTy21y5Mdpo/YErYfop
	BUUbSPzZqeoTUCNifjYNUU3VfsPt+ZCBvaxh9PczeXhR29HPHD3IK0wH9idA35+SGibv365cUa7m5
	FUdfWnWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7nDn-0000000CjQC-0WhV;
	Thu, 24 Apr 2025 03:25:55 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7nBn-0000000Cj6v-1Jvp;
	Thu, 24 Apr 2025 03:23:53 +0000
Received: by mail-lj1-x243.google.com with SMTP id 38308e7fff4ca-317f68d0dffso973351fa.2;
        Wed, 23 Apr 2025 20:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745465029; x=1746069829; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lm6fgchcfVrIoTbYF8HjVQc55WI83UqWvrYwf6Qmcoo=;
        b=OD19lP+DvCWdBrr6zGMwpE0ObL7+z73i/Ibtqmc1FUGI6QW8smvjveJ5hZXIClZTMu
         pwyN3nFF+4bE2Atx5EQP+1u7Eya29Lm5UOzDHkcfWr4p7BkQhqLgoePHDmflKEzNko5U
         c3DAlBmSlxDhs8jXBfS09Yxaaqiv88mIRUQGF63Ne8cY5hYqAkUYjVOomu/xO6dYC2LK
         5446x2H3vDZ6Vmogg+h7aaaXEhqOWeyKvtORGB8Vg/ADWPkwedkq5F3rvI/egFq8GPls
         mbO6CURRVCbX4c1aLV19tGaSrJKFCat5CapPBdlaiv9CO09/QWXUa/ILE/Bliekf5ArJ
         DMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745465029; x=1746069829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lm6fgchcfVrIoTbYF8HjVQc55WI83UqWvrYwf6Qmcoo=;
        b=c9JHxTlD8AY5U+7FiccLoAp3V4PXIyppMfvNEZmI7Up7N7aSKrabdo5OazgEcXI3hK
         Uqb0RjQE/2dHSDYsdoQ7h+L0/YdIJSX0moPihGVFGmFQAub6QW2dTBTy4kWla6gF23dB
         X5hZ+fSkzLu4QQxVmKkDc5f4+uLSrB5ByS0gBLGmpeA/kX227UmCkf5o7tR5Adt378kH
         DNHNzby4/JSvW/uPaMu7T9hw6nHaT/sHThd9cYa+L0kHPHJfSpH/nGvoo0KPIKX5dsqI
         jtxHYT8CsbBBF9JJJUk/lPGSsi52P3pr8sksVxH+pV2visrxW9nbnST5JgahoZXpc5aV
         73mw==
X-Forwarded-Encrypted: i=1; AJvYcCWPkkhzqMwK/u9/j6kDy0jcBzNjs9apOUxLamk4gAdVHKNeRcmvodIQTp5/XdSXKeCvRJIKmJ0o5R2SIpWDZ78=@lists.infradead.org, AJvYcCXuOd1Bkdj8W5/CqKlk0Xg9Ew5VekOFL/f+dA8llpLjIRkR7HhIbSDDpP1sxxXeZLkmxpG8upjF42s3tJyXj05e@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4w5N7HDqM2cVvy372SDM+1t7G8jKSsD0adQE77dhEJt1firdR
	VR23NU2tMyI+qpMEBimtKyWKQ/Galvw2e140zihmyneYt8018dqhss20mo8ByVJIUPDHBouKyjN
	k6yAfYGZBJ4yK5BgmJuztjDYFXA0=
X-Gm-Gg: ASbGncvq/qB560VdEDJu+64g7zXWFuAwpiwQOnIB+gtA3FRKFsQKJfELjiilgCr9Ur+
	yt8sL0mRsL3I5qs2fjx39wXjHNfxKgrSLR8jzRhH/f2zzyHT4obQDCZ9WOlfVepROk0CKwvo5og
	StY0gbfH/PBO7kQYQ6UWqJtiYYf7GeiJm4
X-Google-Smtp-Source: AGHT+IHpA2IlBQgHwPHIfvZ0vrqa0XeHqBHX/F/8jy+/sFcXwLmevs5nk9hDPwg0SpLGxpuTEIuCYu/XuIPdjNdHMlE=
X-Received: by 2002:a05:651c:1603:b0:30b:c96a:775 with SMTP id
 38308e7fff4ca-3179e5e3f4amr2733571fa.14.1745465029230; Wed, 23 Apr 2025
 20:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250407032349.83360-1-bsdhenrymartin@gmail.com>
In-Reply-To: <20250407032349.83360-1-bsdhenrymartin@gmail.com>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Thu, 24 Apr 2025 11:23:39 +0800
X-Gm-Features: ATxdqUEHu3299Lh20GzTqgUT9Pu1Hxw92kjaOjVxuPDzebfVP7Ppk-ZRHXIQRRQ
Message-ID: <CAEnQdOrroDzrz+Y4ch8EGTP6T798-zwLpMJi5eNaW_S+Ew+BtQ@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: mt76: mt7996: Fix null-ptr-deref in mt7996_mmio_wed_init()
To: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, chui-hao.chiu@mediatek.com, 
	bsdhenrymartin@gmail.com, rex.lu@mediatek.com
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_202351_357976_4D9EF46D 
X-CRM114-Status: GOOD (  16.43  )
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

Hi all,

I=E2=80=99d like to kindly follow up on my previous patch submission to che=
ck if there
are any additional feedback or suggestions for improvement. If there are
further changes needed, I=E2=80=99ll be happy to address them and send a v3=
.

Please let me know if you have any comments. Thanks for your time and revie=
w!

Best regards,

Henry Martin <bsdhenrymartin@gmail.com> =E4=BA=8E2025=E5=B9=B44=E6=9C=887=
=E6=97=A5=E5=91=A8=E4=B8=80 11:24=E5=86=99=E9=81=93=EF=BC=9A
>
> devm_ioremap() returns NULL on error. Currently, mt7996_mmio_wed_init()
> does not check for this case, which results in a NULL pointer
> dereference.
>
> Prevent null pointer dereference in mt7996_mmio_wed_init()
>
> Fixes: 83eafc9251d6 ("wifi: mt76: mt7996: add wed tx support")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
> V1 -> V2: Add a blank after the check and correct the summary.
>
>  drivers/net/wireless/mediatek/mt76/mt7996/mmio.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c b/drivers/n=
et/wireless/mediatek/mt76/mt7996/mmio.c
> index 13b188e281bd..af9169030bad 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
> @@ -323,6 +323,9 @@ int mt7996_mmio_wed_init(struct mt7996_dev *dev, void=
 *pdev_ptr,
>         wed->wlan.base =3D devm_ioremap(dev->mt76.dev,
>                                       pci_resource_start(pci_dev, 0),
>                                       pci_resource_len(pci_dev, 0));
> +       if (!wed->wlan.base)
> +               return -ENOMEM;
> +
>         wed->wlan.phy_base =3D pci_resource_start(pci_dev, 0);
>
>         if (hif2) {
> --
> 2.34.1
>

