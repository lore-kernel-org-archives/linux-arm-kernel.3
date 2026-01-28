Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A82D25B44
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 11:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qYF+OMHzpUpn67zzVLUIwDwbqG7uxpk42nhaKidxBE=; b=fbCIDnpTl/gubPlJXNNl5jQ4u9
	GcYFIzCy0/gb7cwiCobpsqLIF+Hu3gdPeaXal5svm0U0U420neAdP2KdZAQSePkJS526uSxFsU/SB
	GqUwOLcqDfbnvS6UsAX4WQci0/ez3pht0mlaucEBQJC1h7krwOUKF59MTLkBpdmy6YSzrX9h/QQBe
	LcvGLVoYnoqN3X+XH37o/A8LsBtWygQSIAd4u8IN3pe7S+5XZGVsg96mNbTM9odROUT3oTBCJDumM
	NebbLNH7+0wBQp/2v/q8UsNm2voNytUYRBVE7F7zrK8tFW0tOqpgkhBLlYdn3QfXWtNT4bjtMPAGC
	N5cdXZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3ar-0000000FuQj-0Lvg;
	Wed, 28 Jan 2026 11:20:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3aq-0000000FuQW-0KuC
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 Jan 2026 11:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2qYF+OMHzpUpn67zzVLUIwDwbqG7uxpk42nhaKidxBE=; b=FI+P1nLyIhT1sv9CAWpQ3Px+C5
	ji9vbtAE4Gd5ukGyo03TzmeVJ0o711VeY5wp4v2Ur1EGdgmeY79oZETYm9ftEZVtK2g4WoG+WRl/i
	4kVJUT2BqGd1tgYrSRazTk9Wqk7JEQEyjWCKyy4DksksYtqu8NISPxfig8u4i8U7UnjkvFE3X1kmV
	m8TCB4HP0dXBWlpGJ8G/K5WdW4FPu6DJIi9bGP0lGGIThJp5xjObPG7SqGV56nkQd3mkVwx/YSels
	NkER9DovMOtBuwVwo2i2CfNwpuAu50KDJfy4ZN3QSTwiVl8Lh+mT7eMOhCzUvTU/vULjRPSWLIeUb
	3kh6mXAg==;
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3am-00000008OUc-2yA2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 11:20:14 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-1248d27f2b9so5334640c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 03:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769599210; x=1770204010; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2qYF+OMHzpUpn67zzVLUIwDwbqG7uxpk42nhaKidxBE=;
        b=SlNbvV9wk41Ur9z7jhFYtnaEiCjziARAE2WmBSwys+wLpTjBtPlZFNND89hLdFqdlF
         7RbD1lmjf1LFPmAuGWbi/7Gs/NH3qkZ4Z828wGuDfZDtdXIRe576oPCaWHeNGEuFt+xL
         /c35fFk4uENYDjW8w+1aSettgO7zIl9HCLAz2Wq1HLHAajE0TcsEyU/hH3u+ZfOCfnth
         B+bjIzYrqRtZqeakdBI44ta3o7ss8sDrywMi6bBHThs34B6OJz0Od7AzgM5reWYVBz1o
         jBSrR0KYPOIc9PN62ivnxKAdUQVM5OGySxALB9CkcsGpl57ilJw2sHZv77rq14FS6ggj
         7IPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599210; x=1770204010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qYF+OMHzpUpn67zzVLUIwDwbqG7uxpk42nhaKidxBE=;
        b=nYkhanCJ70TCdfj6S5AmRna3ZhqpyDaufF6z+cAeRCB/cm3ewwJF1DQYq6etpb9DwT
         8/JndV/h1Wvx4Hoka+Ueg8xQMKIwm0hPJWd9fvZMmtx7akUCkBvmZW6bcQNWo+rLut8C
         brMXmvx3sqyKalylh4y+ouPevWGoi5EyzDcg6WiicdZfd409XbZw9xcwnzlZgHIm0i6s
         UGJUCQAiV20nm3TSwYzdqQnKdPP7+eZiRSSkmpeUiYGBrNvz13sDW7jUjtU+ZPfuQffz
         N8PdWTGfXUUhrpKJtKM3pjmeiJj4i+SmdffUFPUFk43fv2X4bGUAhzPNVSuScce0Ft8d
         lX7A==
X-Forwarded-Encrypted: i=1; AJvYcCVgvxzNfv92eFL1HfmKLJkdNTMXD8PNNulFQ0Srk5YE79p8YYyYBhB+1TfJWmB/VldMzEF4DvbAh/6SGyUywzSK@lists.infradead.org
X-Gm-Message-State: AOJu0YyvsXZiMx32QvxYMTNDxWZzpubXq4RH9+xIQySXcmLZtcw/hDmu
	mGdOD0vAYyJxZSUbKBORAXnKkqlmF2GG0nXs8pjCi3Yh35Tu5X53m9F4
X-Gm-Gg: AZuq6aJwQ2V54EAT+YCJ4rTiF286bJbEjeRqInggyQtbR0d1BsEqpBeh2GesyIH28iZ
	DwfnR2qL9HLS+8jmUYhDam16laFoLRXybVgb5TVBVnVtdJjGNrYtuPf1LKoeMqlzNjxOlbAeEXH
	9x6CTb8inDePq7gLat/T/trSi6px4rrMPJv/pI+sBQ9+yCtrJ6nIM80at0XOq8KZJWtF+GdXe1u
	S+lY+38vpuTgYaFiIDPXu5HIXkWC7il2C4EXiJQnpelbIk5/GCgZLdGCSRZcEPnu3cD4XuCjePz
	TR1I6mSNXONOkCQO9aG290FGrQhtvGj2L8i1h1sCgCOyH9J3m8JpraNci9Gnoxtqv6EuX5CxgTX
	oVGajNfPNCitq6CfEK+amp6AWQFnKhWEelgKeZUL5VfAGeWcbnT5S38UQEJ9cyf3jsleS/vrnpg
	rc6nhntuqtlQ==
X-Received: by 2002:a05:7022:926:b0:119:e56c:18a8 with SMTP id a92af1059eb24-124a00745c6mr2790960c88.16.1769599209402;
        Wed, 28 Jan 2026 03:20:09 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d7f597sm1867369c88.5.2026.01.28.03.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:20:09 -0800 (PST)
Date: Wed, 28 Jan 2026 19:19:50 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <ziyao@disroot.org>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aXnwlDOF40gs5L_7@inochi.infowork>
References: <20260128072931.875041-1-inochiama@gmail.com>
 <20260128072931.875041-4-inochiama@gmail.com>
 <aXnoV3Ay0uCc3HGQ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXnoV3Ay0uCc3HGQ@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_112012_992818_2C5745C9 
X-CRM114-Status: GOOD (  14.79  )
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

On Wed, Jan 28, 2026 at 10:43:35AM +0000, Russell King (Oracle) wrote:
> On Wed, Jan 28, 2026 at 03:29:29PM +0800, Inochi Amaoto wrote:
> > +#include <linux/clk.h>
> > +#include <linux/math.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +
> > +#include "stmmac_platform.h"
> > +
> > +/* ctrl register bits */
> > +#define PHY_INTF_RGMII			BIT(3)
> > +#define PHY_INTF_MII			BIT(4)
> 
> Please add a suitable prefix for these.
> 
> > +
> > +#define WAKE_IRQ_EN			BIT(9)
> > +#define PHY_IRQ_EN			BIT(12)
> 
> While you're renaming the PHY_INTF_*, you might wish to also add the
> same prefix here to identify that they're all part of the same register.
> 

I think this is good for me. I will add the "CTRL" prefix
to identify these are all from ctrl register.

Regards,
Inochi

