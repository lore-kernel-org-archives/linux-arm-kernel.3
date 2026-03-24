Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD32F532ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 08:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgTjr1ySaQqwvk8pm1AFU5JmGfYl/gMQzs5mt80viYk=; b=xe4BHp5wOv5mkSuApj0kfKVeSS
	18my4pB4Wdbsap/jWni2dCWArJVmK1mMVYtYw/qu2WnnFj5jdUj/BL0ekwjENSEidTO4v/bC4lyM8
	TOT0s4mnHrdV5Xkp3lB4mQxiVhoFpR5mke7WmtcX2ShIwwZTRtLSg6wKK+Rl0PpxekEsZ5Vd7/TOX
	7DgZGOwfq44dgKq4Y7B7sNG1jSlfLMwf3vXNUuGD34RLkfOa/rKAdT2jv15wBRUh8B4NkY+EEUn5s
	sgN+voIweZjdBm84IWWGyqGfxB0QuqKTlPAg0IpWnWt/DKbF1wElMlLPdKyCQo8sq3ZXcDuX4NgCO
	JhoQ3org==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wpD-00000000xTM-2dPS;
	Tue, 24 Mar 2026 08:09:19 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wp3-00000000xOO-1EEm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 08:09:10 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-56b7fce3ae6so4674890e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 01:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774339747; x=1774944547; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgTjr1ySaQqwvk8pm1AFU5JmGfYl/gMQzs5mt80viYk=;
        b=WcxPAD3cnXfmwkrqsjVejZfjYNhNTsTpqjOmt/o5OucOQRcNXJTQftEem2U+QTP74N
         jnKsZUS4xzT038sqwmozpY0tsW8PTgh5A+sQVzRRXVgz7JpdTq6aV5mUPUG1j8lYjuex
         Q1L4ms079rOLTJAIaV4UB+4l2ADgO9bP+N8yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339747; x=1774944547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XgTjr1ySaQqwvk8pm1AFU5JmGfYl/gMQzs5mt80viYk=;
        b=i2dNPGYuuDklEkSKAHhpoQPuXttVq08gTDqEnDYSyg68YV2MA4JflO3Ld2At7ZmGV6
         Ynzekm9Gc9YJP0X8x1FpgmxUBWbK4peWHknfvr0ev0Pg3beSPbsGFmQKhxHKe/SPPcZw
         5tZSFCRPt0SmkyPBW0HFm0vZattNf7WKy03dkrt4IMJPCHGLy2KC6ktgWoQv+k4vulos
         Cvm5fA2EPnaJpuWYtef0bGOCGmOIEJdMmwyOtP42Xq0ASltkSya+81uZ9TZrxIBnEzZZ
         U1KsvJQGY2yAm1pcEWFqO1nRon3DB2jjVWZt/bPY/zHA056rnh2/pAW0m64Y4Q9jEId/
         67Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUWgsRx2COgFkQJbMsYf19GGpM9rzxs75iruyiIJkSnPLSLgEB4GpfTv5BZk960d53L2WNdTZ5Nrh4Fh1JaNvLf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1Tu6wtqpJozycA9Fx+rwFG9JVwA5tVGjrzuFSXw9oPll+afVD
	os+QDg6Upr5huuM6txXvrRRA7xygLdauFo4yTxo+5xcIiQrsWdo7u3f22mwgpD/Os9KL+DeWMXc
	zWx4=
X-Gm-Gg: ATEYQzygf85zNKD8FGjeCgPk81ahXf7wtPKuKE5vspyMBsxuZmOH5rokcixb8ALrmG7
	r4UEEYo7pTrcLBa7TV4fjZQ2S4+EaKrDt9PSUz/pKOr1kXPYEYZcaDCN5NSL/xZtoMEezMUfk7J
	Rguyt2QrroCj4UkbAOMh7bYvKngJXdiovse2aeV/kLd1A2sWocKzcoOFt1tmieiioTWI5lauA16
	jeMLzGqFpayzpxIzRHQlDv3rFl8WXfuIYOaGafkZZkyMTayFRJTknAAbHcuRQesm2IV9hcYjA20
	H9uiP7Ag/LNzycwkpNTu2qUsVggfdRVUDmXzNL/nWseEdIJOu2n7uby9wekW3uDCwoYPsHORErR
	ybvvvKIzlICYQZJIorc/S33HyFtlJI1ALHGPPJeL8UqPqVzN7bKJ/en51MJudrSRyqGr8fN2nvp
	AY5dOZr79XF/9Q7FE/BzJICwi5l0fecgHhTYHWqS4oWe5E5pgv2yPL78CKTIeuC2UCRfh/
X-Received: by 2002:ac5:c986:0:b0:56b:942f:b870 with SMTP id 71dfb90a1353d-56d135d968cmr908462e0c.0.1774339747354;
        Tue, 24 Mar 2026 01:09:07 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddb6d041sm14806255e0c.1.2026.03.24.01.09.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 01:09:06 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94ddffda372so3828861241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 01:09:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkcZaBxkdiv2zF51+roIgB0sDwlf/R61QP8au+QHK9eYAdMkGBCwDzxyBZQNdlm7AfmzZRQ9uWFdQZRgldHIdn@lists.infradead.org
X-Received: by 2002:a05:6102:2b8b:b0:602:91be:3506 with SMTP id
 ada2fe7eead31-603160acc76mr1148240137.11.1774339744256; Tue, 24 Mar 2026
 01:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260320084351.2461060-1-wenst@chromium.org> <20260320084351.2461060-13-wenst@chromium.org>
In-Reply-To: <20260320084351.2461060-13-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 24 Mar 2026 16:08:27 +0800
X-Gmail-Original-Message-ID: <CAC=S1nicdkyeArSxDrnDubdBk1QECfRRsp8Mv0CNGfxs8kDQyw@mail.gmail.com>
X-Gm-Features: AQROBzBA4rP2zsCeaLi30ZrkxDrzS3ElI-DHHIjgmcs2EqAF9GjEhjgWRZZrfYI
Message-ID: <CAC=S1nicdkyeArSxDrnDubdBk1QECfRRsp8Mv0CNGfxs8kDQyw@mail.gmail.com>
Subject: Re: [PATCH 12/13] arm64: dts: mediatek: mt8188-geralt: Add MT6359
 PMIC supplies
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_010909_371753_052B76E4 
X-CRM114-Status: GOOD (  11.43  )
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

On Fri, Mar 20, 2026 at 4:44=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The MT6359 PMIC has a number of power inputs for its various buck and
> LDO regulators. The binding recently gained property definitions for
> them.
>
> Add the supplies for the PMIC regulators to the common design dtsi file.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../boot/dts/mediatek/mt8188-geralt.dtsi      | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>

Reviewed-by: Fei Shao <fshao@chromium.org>

