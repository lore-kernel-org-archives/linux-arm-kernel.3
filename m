Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D655C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaPqhmr8I8MG3sHhnHr618dEFB92sPQdSnz5qoyYh/o=; b=CS1bjxkLW7ODV/Wxa1l1wqW94L
	68NsDFe7RbMGf+8g15m1ZCr3ks27s16Kp21sEfK101whiWIGvhUo1XRaltV7voaPEV4EB/oFex8AD
	rkZ8JuSaud9QoXGvmXMv1BoemMZ23z/qFiks5W+8TsFEmw64m8o67HxCQ97YkVB/dO/8NVCI+X/Kt
	cGV4awQCAI2k4hD2Luy9HGSeTtnh2qTdYNU2kNHhbkrJXcDt3/2DezA2Hmh7xpnQiU5xZ8vSKkn17
	KwuB3R0xw6vBQWEGGwzYG9AtlKmRP5ubQNRewIReuxq3kbwscjMsaW4iIZU/n6AyWAKNvdlbLYl6j
	pZSHC0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmk8-0000000Ctlx-1Scu;
	Fri, 18 Jul 2025 15:11:24 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmcW-0000000Ct4d-2bnw;
	Fri, 18 Jul 2025 15:03:33 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4ab58105261so42718631cf.2;
        Fri, 18 Jul 2025 08:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752851010; x=1753455810; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IaPqhmr8I8MG3sHhnHr618dEFB92sPQdSnz5qoyYh/o=;
        b=bM5np/BM7/99JCHHAbG31c7mkNxxe6pGwdzYp9W1IzzkBLHTi9boJxAjn4KN+t450f
         qNZbhrDLZbOnlpC1ofQESHooD06vdGZinKgTQkzklywtP4LSmztLyZPZm8JDKuakU56q
         wNYV5u8UIecp4rEySkYKiV5KvNj20WCu4dsYg18uGK6fIHhYhc5wSiivZgHcud0S7t+V
         xg6OSDajv6ZknEKyriz0jvOsygx2BO+3dm/qBZYurqGceTwZf0/KQxxOGAZ27bCTC7sP
         bl5As7EkREAB6HWBaQuKR0m6klRg3rL/IsDeGsmKpeYr51VDJswylM5Oy5C5hoIez04c
         M6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752851010; x=1753455810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaPqhmr8I8MG3sHhnHr618dEFB92sPQdSnz5qoyYh/o=;
        b=ml9YtZMb197K8Eu4Z5h+MjHMvJDNWA4aos05wOcMgyJkF44IcVIsAbU+dX4mMaddfh
         teXrvZ7G7t7vIXSQpc+9lsKmEvMoqtJhyJRvpsd8zOEfEuFL1TFxAHIBWbZQ3G/nC/6N
         BgIkiBNs89ZTkjp3z8tMVwTJ4+qnnPJZBIA4LnVvmqTdftCN6nmw+iTlx/JyXl0DHk9o
         TxlXC8xQ2NWLQtTfH7ACp0xLKHXFF7XnJUCvvQaWVlaKoYTFOmYO4jEy4s641tLdsrtS
         G0vRDuKxQFWJ/VGSd5pj7Pnzj3mvBHKrGg8Orxf+eLjJRiEakEGW1ZFchX5s+rK8NwZ9
         mhXA==
X-Forwarded-Encrypted: i=1; AJvYcCX8WMmBxrvCSYAxOZt9/D7ao2CVHtBD9X6+gc400KIk9jnAaRC/PKqP3VClRsx5XXiGqDqGMbEXogeUN15G54FN@lists.infradead.org, AJvYcCXpr6ChOQxKlflcHfi7xdrJURHs8zRgyXx9xvwUEiG4E3Kuiagp6RlFsKfUzNHC1Hc7BZMS9+K+PgsC+cQj9dI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIjHTztv9pifx9mMFU5NWfg3XNkhChtjLfkyO0PJU4tu8oZvau
	ucTgc6ni1v2XhvvbEXUs2hF6hIdK9/gsgqy1fFTEa0Wg593PkyMcP9MgnISSkiPcq65QQOMcCWe
	DVbJltmGdMxz/yrAf+zocjof3hXxwFA4=
X-Gm-Gg: ASbGncuq0fjwrnkGAdeXBy7CWxsdEp/XLBkBwBTUH2Z08knjquXodP3aM0ADW8TBNhD
	EhBqMlbg6DFWCYxdY52vY+FzX+I46uqZTKkGwjQIkBnjgpHCH5E3KVXlKEyyzCqy89f8QgLdZ3y
	Zq3mMsOBQCzhpYpGycqELBOwDwXyjSS86M7AxzKMdo8vuD0fSql27G4UpkBbBwFvLgp0P9rWbOi
	Sib5RtC
X-Google-Smtp-Source: AGHT+IGa8swPXXVAGbewHZ/SdoCPvBaIYn9opH5hqxkroYSjw7vm/HyHQEtmf/m9BpPT+G/u/pQ40OxmjrLtqI9uzx4=
X-Received: by 2002:a05:622a:648:b0:4aa:df09:133f with SMTP id
 d75a77b69052e-4abb4578b0dmr39626691cf.50.1752851008967; Fri, 18 Jul 2025
 08:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <CABjd4Yxz=mrNpqgnHSgD0tr4ALH3YW9MvLULES568yHNFiPB_w@mail.gmail.com>
 <20250718140110.308996-1-amadeus@jmu.edu.cn>
In-Reply-To: <20250718140110.308996-1-amadeus@jmu.edu.cn>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 18 Jul 2025 19:03:17 +0400
X-Gm-Features: Ac12FXy8oFQyajABj_LuZ7IBJacD8iw-8MfdCYFevfgzhAwQT7Tsgn3fiksLCw8
Message-ID: <CABjd4YzLaAgd-5Cg9fMSAgCS6Wt6=uC8K3WRhcAtnjjg1je87Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: rockchip: rk3528: Add CPU frequency
 scaling support
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de, 
	jonas@kwiboo.se, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	ziyao@disroot.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_080332_660697_4566ABE6 
X-CRM114-Status: GOOD (  14.47  )
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

On Fri, Jul 18, 2025 at 6:01=E2=80=AFPM Chukun Pan <amadeus@jmu.edu.cn> wro=
te:
>
> Hi,
>
> > > Alexey suggested that we remove 408MHz, 600MHz and 816MHz from the
> > > opp-table. Do you think it is acceptable to use 850mV for 1008MHz?
> >
> > But why 850 mV? Vendor .dtsi [1] implies that chips with leakage
> > values of L0..L4 might be unstable at this frequency with a 850 mV
> > supply and need 875 mV instead.
>
> Because the actual frequency generated by 850mV is closer to 1008MHz.

Which likely means that you have an -L5 chip. It will be different on
other chips - it's a lottery of silicon quality.

> Since we removed frequencies below 1GHz, all remaining frequencies are
> generated by PVTPLL. I think it may not be necessary to use the maximum
> values of opp-microvolt* ?

Only if we deliberately ignore the unlucky users who got lower quality
silicon (-L0 to -L4). They might have problems if we run 1008 MHz at
850 mV, which PVTPLL may or may not be able to make up for (depends on
which ring length gets applied for this frequency by bl31). If those
chips didn't need higher voltage to run stable at 1008 MHz then I
doubt Rockchip engineers would have put 875 mV in their .dtsi

Best regards,
Alexey

