Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5694DCA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+SUkVruI2YCcUMa+FcC5+QPx3okcUg5cMFby/7ouv4=; b=mInlY/sI9raIThsj/bncZfFI1y
	GPQzcaOQEX07Ziem/2E8WioxLiXK98SvncD35skTOkiBJque5BZAwzhaaCK2ug26NiDT+MwWzhbhU
	iL45Ejgn1gu2Xl9MV1r/J8eSPlQHO9v5kfFaqUS/NVWVLvSBPXybfDWbp2DJbYIveYEm6MeWz2PZf
	pesy6o8FTP29aliEsPjsxdVRQKH27ELQVv9JTsDie+gBa5rCuXzNfHmbTN8sDOfF7TXRsTKPZDdys
	liFy4eStMqDpZDapSvFSp0NKyhWZHp4rDUbOtulnJFtZwF++nkXJsQVWtue8TcZ8NmXzp8BILkG7U
	KUzBJYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXn6-0000000Gxgq-0Lfu;
	Thu, 14 Aug 2025 13:14:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUbc-0000000GUKq-100F
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Aug 2025 09:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=l+SUkVruI2YCcUMa+FcC5+QPx3okcUg5cMFby/7ouv4=; b=cH9seLJV8NGyW01o/kVl1BD0NK
	FkAVuFK7GJNS16QS8neI6v2JJ0ilT9SDeAwumFc6E9kKOd8wNr8n2jx04u2bSA8VHAqs7AtWgQx3k
	cw/7vo0SG8MRemTkulswTTjGwkK43HJaPpdc5+BPQoHCV1ts5mZ3IF21So0ZNXgClIvcalVjcDGS8
	WldpKl8LTDbjiFqtMllpnVyicFgzTI5YDWR2mbKIP/7BulmPcfzlrZEPXDOw7EOuYmMbMzlxlltAI
	YW6ozPE8AnUJHI8JPNTbDYDY9vjrLNn4ALndNkwggREEZ7LupBFTNLMoVDRaWULopa7nQiXe8gMA+
	h03iIabg==;
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUbY-0000000GLBX-2EtY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:50:42 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-53b1718837dso351331e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 02:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755165037; x=1755769837; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+SUkVruI2YCcUMa+FcC5+QPx3okcUg5cMFby/7ouv4=;
        b=GhCSm2FAqzAJCmoCmBySwycl9eE1StABjyQnYK+kOxdql0+7QVUXULqkl8AMvvRxZn
         wcLD0UJywsv0GWhYiRTMRgAsHnB18//ORcYw4fh3T+A41E7hgOABxQ0xpWorYPY3+Qw8
         hjbRj2Ab5HYBCiaQqrpEDaUaWoA5LPrNKeHe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755165037; x=1755769837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+SUkVruI2YCcUMa+FcC5+QPx3okcUg5cMFby/7ouv4=;
        b=kPMyXNlplJE4lIX6G8p34Rozcha8HHaOUf+tH2rcifPBGz2Zp2McwU4yMmuArQqYpk
         vudVE8NeCgdCdIeRHKEQHvyEwkEuT6Rn0sKzpV9NVOrgTRjVByZQZCeX+e9FZoCRz6PV
         mFt7ViToJ/mMbZgG4XfjnFMHSyMV8upHyJlP44xmyOAEdYTbr58pyzjUKEFt0Y2CdDyZ
         yFf+VKJ9E3OllMJIWikKY6KbeWmcM95UYxR/fb8vyxqTbS2mP7Ws4pFv4bnpm0eruPUl
         2ERdCpL4S57Dtp3/Od4lshinP7MbLGzYZBCD1EEwR7WJnV9t55YfSRJf5rAZ+Z7yeOK5
         3T+A==
X-Forwarded-Encrypted: i=1; AJvYcCXWaJDAYGj/qTrN44uPQwrTFHXAjp94fiMi4RQG9i84dOrlg0VfOmloBrRYPcVaiy+fNbRnlULKp21zsfhjBsWq@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh8obLJSPOHcxnPofhh6oicBf+mHfiFArh46whJCO6gZ23z9RU
	YFOyfY4VUEW3AMe//LYNslmYrrnP1fhoPcV67ei2zxpFQLjxL3opoDImJnNg3S2Vbr8Tk9YtZaL
	5//4=
X-Gm-Gg: ASbGnctnfyOgbFaU2eXO0b+38eDa0iai0rlbXGudhkYP/Y93Zspqi+H/lAriuYvoR1D
	R9YhKGqCcWXSYPo455RhlKZHIujjv6sVsRc1UkUxjq+Z3UQrM8XRS4gKZCqbLYaP/bahj4qeG8r
	nvyRGVXjU7dBrfvu9aS6TFPj9NLchaF95VIxH+zevym7LEyuqoajKt7fMsvbuuufE8ZCw8yFpIK
	Jr2Zs2boUk7fLtb6SQW4T7gEEodcXBN2GUdm34+06x/FLWOJs7T+DtNTftKM3G331hmzVVtcwfW
	aNCfD6pI9kYQBW217QNfu8I6/gF71u9bmc2cKWgz+aKuM0kbZHhYicfCgSmEslFfF0wgaKwd0H5
	NWcb6mTxshqCN1ocaLOKdLdfEMTN0lc2nn18u+mN6JSKUERU/AJHyc+NjuNIT+Cz2X0Ea
X-Google-Smtp-Source: AGHT+IEcbtVNqbDETijEjdQ517W9/nQt/cmEioXjjUp4P78P7S4kCjZVI1uxaoBoSZmnQF0zpUhRwA==
X-Received: by 2002:a05:6102:cc9:b0:4fc:f5a:490a with SMTP id ada2fe7eead31-50feb2ffba9mr821277137.20.1755165037356;
        Thu, 14 Aug 2025 02:50:37 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88e029e751dsm3022813241.26.2025.08.14.02.50.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 02:50:37 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-89018fd51a0so174392241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 02:50:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5oe5TbtJR/OC1sJ5UPqsaplvOpL3IBZfUgmeKAVIoIhFWZhyh6VBA0ePDqWZOr2mJpngAvQR0yvHzcDzbUKiB@lists.infradead.org
X-Received: by 2002:a05:6102:3f9f:b0:4e2:ecd8:a27 with SMTP id
 ada2fe7eead31-50fe030e2damr804847137.4.1755165036132; Thu, 14 Aug 2025
 02:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250814092510.211672-1-wenst@chromium.org>
In-Reply-To: <20250814092510.211672-1-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 14 Aug 2025 17:49:59 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhw2R-2YVpgBnRDAn-6prJGm2a9oq9tCASkpXHDP_-BoA@mail.gmail.com>
X-Gm-Features: Ac12FXwCy2I4l7L6eb4V9g1X9AwsA4Ouah27uikhuRM8HDiKM-hrJ7wZo6sGxh0
Message-ID: <CAC=S1nhw2R-2YVpgBnRDAn-6prJGm2a9oq9tCASkpXHDP_-BoA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Enable first SCP core
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_105040_808504_57566977 
X-CRM114-Status: UNSURE (   9.17  )
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

On Thu, Aug 14, 2025 at 5:25=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The first SCP core is used to drive the video decoder and encoders.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Fei Shao <fshao@chromium.org>

