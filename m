Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0490CC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 03:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqDsWVFq6CmNz/0yFdKFX32jFAy7M6dtMt4P6N2Z6wA=; b=rc+9UIxavhVZpLgZLJIDNtOhSV
	65TVwD04AQejrOgEQxFozTFtwCeUmU+OohAddI+t0VPC3vZs9HwDhmoy8ix7kSuGPTQt3xRIGw7CE
	g3qMOWXG9dJYTvufgiUlMeSTLMMxyCC/cKqTMDrIPFS8C9YyYi/84NTHXIEZAB+dogJWtvszr6KpQ
	UbXn9YvQblffJytzsv4NkABWoAgKkoG07xNYwFZ0L1r3BvfN/Jcij2eEZGcNAsD20w/7Y5XWrh6Hv
	uoIG83quacwOZQM+4U/Yiwaoom6tC80H/etW5txMtsORXQoIW46lH5ujULtUJwVQNFEgveiIYFg4t
	ba+Sdarg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1czU-0000000GFgm-2Zox;
	Mon, 07 Apr 2025 03:17:40 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1cxi-0000000GFWA-31h2;
	Mon, 07 Apr 2025 03:15:51 +0000
Received: by mail-lf1-x142.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so4892057e87.2;
        Sun, 06 Apr 2025 20:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743995748; x=1744600548; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqDsWVFq6CmNz/0yFdKFX32jFAy7M6dtMt4P6N2Z6wA=;
        b=UAXZdw8WwigJVr01MC0l+RFinBJcZI/yV2jKh9eoA85QV+5p9/lrr6w1nznEJDnAV/
         tuHlZzEFgI+4aOd0QH8a6mb8K35rAVTH1YKE5i/+/cW31+1uT3rm/mnZlKyTVhvP0t2s
         Ht/0gi0R+qHttmlkoL1jnnXxd5iRau1W5lU/gj5nXikHNpEO0BGsFhk4Almf9XRBOXra
         pGZ9sE60/Iw5MUngE/p4UsEk1dw3BSGL7K3mQed643dDShHjrVpnSxROuEWzmf5rcso0
         o++/Jf4mRYAx92CsxbX1ZGA8ySbxw7xBTbuX+5aub5Pu9UXM8WIVnMnpLiAB4xuBnCC7
         Uc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743995748; x=1744600548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqDsWVFq6CmNz/0yFdKFX32jFAy7M6dtMt4P6N2Z6wA=;
        b=ZcGBs+3LAtxbgoGmptKfNMZibq0QSTlM0yzqCWMZq/sk0pDgvdJnxOOkyor1fwCE96
         yVy+T7xrErL+VTxXbzSh/HAfvHsDNlPpb7mfkIDrmCy593jaMaji/UA1w2BS4DpASi5R
         V4ylQv5Mom7WtPsKXRHfFBqGUtnGNPbOecdH6Im6/Ej9pf9yHnUuUcjTpy2kCDzR4G9S
         lD44UIjfqEAkJk5c554FOVcfjmVfOtW0xHiw4wPdESeKnhL2jXTeUwXRPANy9/Ed0gXC
         nauYFBeIF1uSlLNJXwXgqEVzYsapp7O1UGc8RjcWRtTeBllulyhkWOtywqg0jXqNcZX+
         4RqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYMHp7xXmDC/M2t92hqaKA4VFR2Yg29tqNavG8Xc4tu2QPJq5PyzhjRgxhnI1x8dC7B2kgM4EXKL9okYIYhCU=@lists.infradead.org, AJvYcCX6x8A2wj4xCGObMFtNcXHW+zx5UqJIF8GeJJY4ORzJ0rvZdegUb8KDFkXKSuUgi5grBYFfqCYarrGSCVkxhzTN@lists.infradead.org
X-Gm-Message-State: AOJu0YxC9G1XBMEUVQRJJECfmYXax5rqWJE0PAkwX3VBHyIhsSstcHjV
	q8S/y7FfDxYkQWL6vG2+OocykCQ5/1zUSI7rYMTqAObkz3LVekJ6n+/I/XrCQh1siWtbwdZHh/R
	pMZAPheme0TRcVilOI1NudYMvnQI=
X-Gm-Gg: ASbGnct+h7QVmYKMD8MinXfNWI0clQvWuZlpUTbEyBYcTOmoUHLmLUDklzHm1/xcCQA
	tRX+81Sb1b7pg38DJ/zKPQYz3aL3brDpzCdptzLTvT7NjMbMpFs/jfW0taC1DJv2Y4qeboMOzNQ
	xfQ9kA/T+bTgl1PpKF8buCH8pQldc=
X-Google-Smtp-Source: AGHT+IE1/krWBer5PlXlNstxZmEQ7m52OIfXmOpc5fR3+RwNHJcKV+9HLLyqwwgFSrjQDe5S5gtm8Yxvggz68q1KRMw=
X-Received: by 2002:a05:651c:1987:b0:30b:ecfc:78c6 with SMTP id
 38308e7fff4ca-30f0be0402fmr29433611fa.1.1743995747797; Sun, 06 Apr 2025
 20:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250403064344.64253-1-bsdhenrymartin@gmail.com> <db778d8c-0a56-4b01-b5b5-5610a68a4875@web.de>
In-Reply-To: <db778d8c-0a56-4b01-b5b5-5610a68a4875@web.de>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Mon, 7 Apr 2025 11:15:37 +0800
X-Gm-Features: ATxdqUGqt472XmSz_PMOlPioxTI8XhNNFObI4ZwjTYubgdvn8cZdtUxQubfAd08
Message-ID: <CAEnQdOox3XQnKVwefaT6p1rp=xEq1Ki4uD63nvwrjLCnVkZPmQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7996: Fix null-ptr-deref in mt7996_mmio_wed_init()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Peter Chiu <chui-hao.chiu@mediatek.com>, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rex Lu <rex.lu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
	Shengyu Qu <wiagn233@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_201550_758722_BBF17104 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

Ok, I will correct them in V2.

Regards,
Henry

Markus Elfring <Markus.Elfring@web.de> =E4=BA=8E2025=E5=B9=B44=E6=9C=883=E6=
=97=A5=E5=91=A8=E5=9B=9B 18:13=E5=86=99=E9=81=93=EF=BC=9A
>
> =E2=80=A6
> > Add NULL check after devm_ioremap() to prevent this issue.
>
> Can a summary phrase like =E2=80=9CPrevent null pointer dereference in mt=
7996_mmio_wed_init()=E2=80=9D
> be a bit nicer?
>
>
> =E2=80=A6
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
> > @@ -323,6 +323,8 @@ int mt7996_mmio_wed_init(struct mt7996_dev *dev, vo=
id *pdev_ptr,
> >       wed->wlan.base =3D devm_ioremap(dev->mt76.dev,
> >                                     pci_resource_start(pci_dev, 0),
> >                                     pci_resource_len(pci_dev, 0));
> > +     if (!wed->wlan.base)
> > +             return -ENOMEM;
>
> Can a blank line be desirable after such a statement?
>
> Regards,
> Markus

