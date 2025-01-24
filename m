Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00E3C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 08:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZ0nIwGZcKWC9CI9oPaF+selKdSvdGUPn/XTMbdZTRM=; b=wzuFzQ+08BcV0IuDancPR8tyae
	sdhNdWEMWrobNOVI3JTOy84NGeVAJf0FyaEvrMKd3GtGzsY+k6IWIfytHUNZKkoYCtCgtY9xm3gUP
	TKvchjL4ayNVkop8bY2JbQfzo2K2am6cHLUgwcD5PCM01j4lqVJgISnXiqPVjkxTAdAfu71Fim3e9
	FLFukNyHFOEPEl+MyBNyWPHzNIeSYB7dM5auVM+sBHZ6aFS9ftabA9GLiaELc/cyyrktu4b2e9ILH
	reiwxuhhZkT6BOUJ4cf3hn91YolnlIYTPvxX46Xeb1CYui46zsvtlBVlWR4WH6htocJyuHVGxSrbc
	VEDbC8jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFA2-0000000EGOT-2zt7;
	Fri, 24 Jan 2025 08:35:30 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbF8g-0000000EGII-19Yo;
	Fri, 24 Jan 2025 08:34:07 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-46c7855df10so29566931cf.3;
        Fri, 24 Jan 2025 00:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737707644; x=1738312444; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ0nIwGZcKWC9CI9oPaF+selKdSvdGUPn/XTMbdZTRM=;
        b=JEjQ829sfy4miYbrJYRtS3hvh9Q5O781bVxpSRWoz+RxdEKQ6+ukC4Z9AjVumKccu1
         dmP5UCW8ZT2WSqStTtscVrTfH7dxDVwXShPamaFM5YOFHl3rzydzVtnFuGlYAzvwgZFH
         69XNMCVJ6tXkvSnKcaElLsFkY5JYtZCdNg8wEpgCsj03G+lKgJR2FyUb11uTb8DRi/Aa
         1CZRWxyPQIJoM6CHkJ/m87pmXuo0+yU3neV78eM2ZwZxPVsH/1DkzBgSPpAY+gxyXPSR
         lJTa8i0x24SP0qihdK7iI5mbk8SZWEfvQrsEcIkQGs/TYrPDUfA3UDkPSeeiOmRCo+BY
         GmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737707644; x=1738312444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZ0nIwGZcKWC9CI9oPaF+selKdSvdGUPn/XTMbdZTRM=;
        b=BcE0pj8/ENEbRCg8FYpzTIF0dk63O3fAXtlQLdss/3k7xdhq8R7JlBWkXCZnKwThuD
         gxVLjxfYGrzjiw+25y8BZ+FBp25+22nxAhi8BKhlPSL6v7ZKCM0jNIhDzN5NSL1XrTTV
         dUxueQijxLrBPqa1nLgmpogHrHq0x0VSMRkHP+LFXcF9CizRJVt1M+sgIxkX0xc5rCGR
         hzu0aHWZkOSpGK/Bd0Cx++Q/sropxP7PSUnyua5+bGryrL/YvqzmTEaLIYJLMMRsoFaw
         xRuWUBqOtEW4IWj9dkRAcCl9ghmzgs6SBXCEHwyFjMcMWMUvWX/PStib5Imh07ASZVu2
         74aw==
X-Forwarded-Encrypted: i=1; AJvYcCVDPPU8bYcyONBoMcZPAIZAGN7WnddQGdJzOM6LRkU1RTu5PccWJY65c/YE8vbBSFfDiGytZu0m+Hxj/icSpWF6@lists.infradead.org
X-Gm-Message-State: AOJu0YxMt0HIxeL+g9NIm644eM5vhQCp5sJEfutK6AsC/K2ZEI3EYwij
	BOoHlTzc7PxtnyNwQdBstnryGXgQAAOExarPvjuVdFHz6XmCFxrDPVguFVk2Va4MiT9f2Kgs3Qg
	OAQsPuHzYvyfrmHFHCO3zIs549Jo=
X-Gm-Gg: ASbGnctvMR4rB/Y64XrAPz/9MmlMsa/SMIdVl95WLhGWn8aoLT7ZgScKogAC5nA73h8
	F84COSahkep62OmDf1dnrSMstvZoRexrP8xf5uLw3HkeYGdxwFuXiOB2nJAr7d46DNhNAkmX9CI
	cNEY0nhZ6heNmctEpeqsw=
X-Google-Smtp-Source: AGHT+IFl2RBQvd/ETvziDYSlPrmT7mc177y845BPyOUXEov808xJd8TLaJbwsWABklQa7ECj77cxjS4eIL3qMRRl/jY=
X-Received: by 2002:ac8:7e90:0:b0:46a:1932:b07f with SMTP id
 d75a77b69052e-46e12b94a7emr491045021cf.39.1737707644511; Fri, 24 Jan 2025
 00:34:04 -0800 (PST)
MIME-Version: 1.0
References: <20250124052611.3705-1-eagle.alexander923@gmail.com>
In-Reply-To: <20250124052611.3705-1-eagle.alexander923@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 24 Jan 2025 12:33:55 +0400
X-Gm-Features: AWEUYZmQaM4V6YVDY2n2Q6kv8IFnTIzybv59I_cdQvKs7jFSzvTBO42nz64fyqA
Message-ID: <CABjd4YwA8P9LVuDviO6xydkHpuuOY7XT0pk1oa+FDqOo=uZN4A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix broken tsadc pinctrl binding
 for rk3588
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-rockchip@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Dragan Simic <dsimic@manjaro.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_003406_319880_0C118726 
X-CRM114-Status: GOOD (  10.34  )
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

Hi Alexander,

On Fri, Jan 24, 2025 at 9:26=E2=80=AFAM Alexander Shiyan
<eagle.alexander923@gmail.com> wrote:
>
> There is no pinctrl "gpio" and "otpout" (probably designed as "output")
> handling in the tsadc driver.
> Let's use proper binding "default" and "sleep".

This looks reasonable, however I've tried it on my Radxa Rock 5C and
the driver still doesn't claim GPIO0 RK_PA1 even with this change. As
a result, a simulated thermal runaway condition (I've changed the
tshut temperature to 65000 and tshut mode to 1) doesn't trigger a PMIC
reset, even though a direct `gpioset 0 1=3D0` does.

Are any additional changes needed to the driver itself?

Best regards,
Alexey

