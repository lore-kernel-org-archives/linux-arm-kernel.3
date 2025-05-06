Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58F2C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 23:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smuCQykHT+vVpyG3o1FnOfymv4/KjoNvv2ZwLmkWFQc=; b=iPOIko57fATxwbgdoxNxeKbrDV
	Hzh7qlgGk6vNZ6+e17fpL0uG+hkqh4ejVokjaEpPKg0pI/955Mshh8faczN/B5Y73lv6meNp0KgYO
	aAjPdFyvD0srwf4czdBl4JEl+Ww3Yqlag+eQWcNFUdqiUQ4zntACj4t8h/NV+DWHme7KrqT3/umP1
	XANF4G5sh4aC4UAqAqvoFFKsRuxCyKJhbLMci1xlK61YeChBX+dUUWsHRajDv7kTrfKHkByKvdsOJ
	llEEBIQ8cnsSS3dYljbOX0fJ+VFs7TqOHJNZ7HFxWNKpyVD5mKz3nOSAeqxWQadcln7OwV/UB8UYm
	XOnwmIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCS2x-0000000DjrV-44Ft;
	Tue, 06 May 2025 23:49:59 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOFA-0000000DGSi-2dJO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 19:46:22 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5fbe7a65609so630550a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 12:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746560779; x=1747165579; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=smuCQykHT+vVpyG3o1FnOfymv4/KjoNvv2ZwLmkWFQc=;
        b=A0UFlILE50JqdkTmqcLg2IfKpPy/cAdxONQdR6+wPOwPHUO7oNlynxEXxF+sYlnuK4
         tZSy/6SQLUwMFcAoDXmSsKtD31xKcTvRojgk3uolBlTy/30P34xu/yRfjOmWIjs8OOgu
         9LeNLsrTb2BQQ7z8Mp6LcQDPAcD9Z4rF/bRQMqRTMZYjl/Y01bgWexJd92uVXmHaN2fe
         R/xzK1T0a4jvVEaH9oCeWFJ/jmce9Ja82ujZUD8ag0KXwhzw69tzzxr64T/scisjNPhm
         wlZGjbWfp8XJ7LWTzFCljw3fBYIkc4qZO3aQRl9RKwnL4PKXHXrYYYy9L8KomWoX32NJ
         GRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746560779; x=1747165579;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=smuCQykHT+vVpyG3o1FnOfymv4/KjoNvv2ZwLmkWFQc=;
        b=FgiyNyrRf4BzWHoY2bOiGMWrX3dnkd7NdLwByc1N+67a/8fC3c8YunSC5nUF63F9l3
         J2SXqgCG6DgNr1qR4Dot0zKhYn2uujBrhb2ixWV3ICV2Wmu+/6bQ1Dui+E+2FhMVesIv
         FWe/ePAJerz1p2B2lsRgInLqdwkJSnzBNkXVsre+eoZmBLVEo8vvQGt6wGp6bAew5f8U
         ueeeSfz9sPgdAvHlFUj5zEfy0XaritJkjP5li7lxNJaG4z+khaeZNR/dt+KBjZIXh1Uk
         qUw/NPbC8YR9+T0jZk/0fXJKZfFprn8TJGV3Pi3GzQgoTmjCtSRYwWdvVz6RgjmUoZmF
         Lwmg==
X-Forwarded-Encrypted: i=1; AJvYcCV6R+NGo0LUknxaLlwElwq/uPVMSahxQjMaC2+nkAow8Z+Uze0R3r5y01mtCbZjqXiDy7ufFFyRYTpOEOt4T132@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdesl9alT7ylsOjubKRih155KGRag2UEOPjCpB6OSF7dlXuq+5
	IMDdZPvszfNwxBlLZMogbuLpzC5qR7UkXfwUC5CksAJaO+7Yt+Gf
X-Gm-Gg: ASbGncuy6/yzXReZ/XUXYs/yjmqX7A+6tmeidoIk8YGX3Dd+BPDyI3TVrRikVQyYwRf
	ID2auniMoNZlQxWiKM7Iszz9GXCTDQDcVux2xR2N2b4L1/uapAUPADSTgl0r5YMNcGVQU5PXJfe
	55mLedSabpfZ4xCeCcJVNJvEESi0HGOTxrQn0319r6t+c3SrP39oLR43IAGRnvkOfal49som2Iu
	tAbuJIgC52RljD79GiySdK2L9cHCaYViKl7QS8Or4GGQfGcDQBifhxppk+pD90zqFNuDXZVdkPX
	UrI4o+jd/yZYQZLcvbv/MCyz6mX/MzNBQgErGvAIkcm3kA==
X-Google-Smtp-Source: AGHT+IHF3pcKHZxx5T+TWyDWO6i8RnZU06h3QHjYT6OlLwaA6F+B11QDpeLyDwyzcv9mQtYOntSFew==
X-Received: by 2002:a05:6402:1d4e:b0:5fa:8277:6031 with SMTP id 4fb4d7f45d1cf-5fbe9f3c5a1mr395090a12.26.1746560778503;
        Tue, 06 May 2025 12:46:18 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fbcca170e0sm786106a12.3.2025.05.06.12.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 12:46:17 -0700 (PDT)
Message-ID: <eb2f0337-9261-4867-b6e2-dd6ca2fd25fa@gmail.com>
Date: Tue, 6 May 2025 22:46:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/16] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Jakub Kostiw <jakub.kostiw@videtronic.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>, Julien Massot
 <julien.massot@collabora.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Eric Biggers <ebiggers@google.com>,
 Javier Carrasco <javier.carrasco@wolfvision.net>,
 Ross Burton <ross.burton@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Zhi Mao <zhi.mao@mediatek.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Ihor Matushchak <ihor.matushchak@foobox.net>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-13-demonsingur@gmail.com>
 <b214bf8d-33d0-4da8-bf16-cc62bd1fbd55@videtronic.com>
 <f22f1343-9b7b-4ae6-9461-bc1b8108619f@gmail.com>
 <d4165e96-7587-471c-a7c5-ffa26531a796@videtronic.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <d4165e96-7587-471c-a7c5-ffa26531a796@videtronic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_124620_673508_DB86D9B3 
X-CRM114-Status: GOOD (  18.23  )
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



On 5/6/25 10:15 PM, Jakub Kostiw wrote:
>  > I'm aware of this issue and had it fixed locally, just haven't submitted
>  > a new version yet.
> 
> Great !
> 
>  > Are you setting a specific polarity on the lanes? I've validated
>  > MAX96714 (after the upstream submission) myself and it works.
> 
> Our design has all lanes inverted, so we used:
> lane-polarities = <1 1 1>;
> 

Got it.

Can you revert the change you made to polarity_on_physical_lanes, and
try the following?

diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c 
b/drivers/media/i2c/maxim-serdes/max9296a.c
index f48f5b68a750..dea0518fd790 100644
--- a/drivers/media/i2c/maxim-serdes/max9296a.c
+++ b/drivers/media/i2c/maxim-serdes/max9296a.c
@@ -474,7 +474,7 @@ static int max9296a_init_phy(struct max_des *des, 
struct max_des_phy *phy)
                  */

                 if (priv->info->polarity_on_physical_lanes)
-                       map = phy->mipi.data_lanes[i];
+                       map = phy->mipi.data_lanes[i] - 1;
                 else
                         map = i;

data_lanes is 1-based (since 0 is the clock lane), but the bits
in register 0x335 start from 0. That means we should adjust the
values in data_lanes to be 0-based.

> Only after mentioned change we managed to get the video stream.
> 
>  > This should already be implemented by using different numbers in
>  > data-lanes property in devicetree.
> 
> Awesome, this will come in handy for sure.
> 


