Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AFBCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuCDpFi5rbOpE0JK/zNBJ23ZkC7xxv42pAHKzW27gjI=; b=umGPEOR8Uz8V97d5/f4rXC5jM/
	2+uxg6vWiuDku2aUe5Y3pV1nTVNJ9EsTq/80Op9KyWpTxxxWoczzkPT77jQs5IWmxj0Iqv6tEwMBB
	hzl+YBsAIms545wdcwrgCBbcwEMealdwm6DjOMchsWrBFv69sqdhstvWAEjLhQ6ANhapUfVj8zQ2A
	g0d4wKYdYs8TyAlEe6b03Zr7rfNji2aGu+YshKtdBpp3nx2KghNA+piGvT+3dtvwMdcG0lJCN+gAq
	jOfq87xDoXVuDFtYaUJt/kg+lTS4FOXsC6/ErgFAEEUXOUHwxbeWeYywp4/iId8GkQ+DbXgLjbMI4
	0+rDvqng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1xj-00000008qYB-2J4m;
	Tue, 09 Sep 2025 17:16:59 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwyR-00000006uLG-2Hlh;
	Tue, 09 Sep 2025 11:57:24 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-625e1dfc43dso5109300a12.1;
        Tue, 09 Sep 2025 04:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757419041; x=1758023841; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yuCDpFi5rbOpE0JK/zNBJ23ZkC7xxv42pAHKzW27gjI=;
        b=WoUU6Aw7RoSuj3iQ5Sw3IVM2+JTkpBpaA67aqba2/48TtBba3d0UcAEiLFqdG4hCdj
         j8npyXcJFseUhkE20yD6Cz1srdfvZfiSYJmEn2q0yHAyCMFfwK2ilEehOTlLIXcVDczD
         fy7VkSYEidX5TMgG8+CXWso2WRwjqB+Sg47GuyLnt/NnC1fotBEV7Ao4s6+xnfTHUbmo
         SbrbqaUMQdR5FbY7ETMb0NiyYQyi15S9qhWbGe1StO8ZZMS9XAR6e5OpIFcnOhnBjsHh
         rU5Do9Z0x9A+sBmPTe+F2xHwWGTwrFWKKVovNiUu7iQEDpAqY9V2LB9uIVGV6An+Llav
         L5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757419041; x=1758023841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yuCDpFi5rbOpE0JK/zNBJ23ZkC7xxv42pAHKzW27gjI=;
        b=h1hHXyM8IAR5PvWVXCJwXjwStl7Q43pjaosxaGIJFa8519JDICj8Xs4qFajoJvv7u5
         9sd5bKpex9Vh6n6XUig8KGULH3MRESP+TecNXsP9ADKaFwqVSzi0SY2aM8L2yvG62lL/
         on88VogBr6yLzpCn/la9lK/El7VptAqHHGM7NnEHAqajJ2cMI8F1iMCjSUM2k2pNarar
         2alxQpC23iyzIOMDnTAyigg2HU7BViBBcnOR1BipB3hE5TuAK+gjHaufV9xOLznvL+zU
         u1P7ED9kGnhGGhb1uyhPylwsxST8sLhuK0tm8UTn3VKJZ/itCd1dxRMcEzNiwElAckGe
         SOvg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ3l0vrmI3g82Dq4HeZNOVmrOkqvEJXAl0gbUEE3AXqxML/+EmK+nqmpA8mwfYeiLpkE5x4VXAW3y6vTPU3N3z@lists.infradead.org, AJvYcCX/ca4X7Q48eVu83vT5VGrJZIBLDAoMFkNHA7kHFPHoOBb3MjPdg14fXn/tvZYvIU7jUR88575mG1Kh3qg71PwDGg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr5EbzB34QzXUaI0+tSv354ejdXV+ifXB2B3S5EQNq4Go7ErB1
	Rw3403q43xP/EWxudqexcdHa7JLSwkiaS2dGe5ax+aSACIMwdK1fSpVsAR1NPCNROXlLLO35wGV
	ZdJ0d6QKeu7Hj285YNzcXRZHRLMehFis=
X-Gm-Gg: ASbGncvN7wimTbJ43f5Voq/pKrvBPSO57KvLif0+QyAZhaLRJRI4bjvdeNaF3INY+zA
	4ZvFlwKMpuJdGUOI2fiFt9uSMmZQ1ayGIluFHitFVQ11/JUolL6PF11XVdLqDiF3h1e3VJ74KvA
	dXSmYkyv4H82dkc9T0QVeFbuTBc6ANl07WJzv2yD86pYJyV4v0q5w8n2A/N2t7EndgiVopXEgWM
	khYqkkw/aq0EMupDTt5Tficszqk8w==
X-Google-Smtp-Source: AGHT+IFWzr+q68gGxYAFoeb3uI8/O6WUTRKkifzdIp81TCMsGZWVR3LYvNL8bjLQ9XMbKBsOaM3e8t33FBxcTQ4++NE=
X-Received: by 2002:a05:6402:3511:b0:628:1503:e02c with SMTP id
 4fb4d7f45d1cf-6281503e1cemr6478837a12.2.1757419041365; Tue, 09 Sep 2025
 04:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com>
 <20250827-vchiq-destage-v1-4-5052a0d81c42@ideasonboard.com>
 <731ead88-8dc9-4032-86f5-7a2dd5044b22@gmx.net> <175690685574.8095.13306600513284108529@freya>
 <0b9fa19b-195b-4bee-8f51-6b00ff2fcb6a@gmx.net>
In-Reply-To: <0b9fa19b-195b-4bee-8f51-6b00ff2fcb6a@gmx.net>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Tue, 9 Sep 2025 12:57:10 +0100
X-Gm-Features: AS18NWA1T_AOrlXPyZD_b1ewqRjcdGDJaWojtfrcUD5zfFVI3yE7LhbqooWIwow
Message-ID: <CALeDE9PQhYvGXOWE35EZG-e=7HCTRCw9gt7KhtuWUxMHVz_--Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] media: staging: Drop bcm2835-camera driver
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, "Ivan T. Ivanov" <iivanov@suse.de>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel-list@raspberrypi.com, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_045723_626877_51C03673 
X-CRM114-Status: GOOD (  25.82  )
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

Hey Stefan,

Thanks for adding me to the cc:

> >> Am 27.08.25 um 08:24 schrieb Jai Luthra:
> >>> The bcm2835-camera driver is replaced by the V4L2 bcm2835-unicam driver
> >>> that is already upstream. So drop it from staging.
> >> AFAIK the old Raspberry Pi Camera V1 isn't supported by V4L2
> >> bcm2835-unicam. Personally i'm fine with this, but this must be clear in
> >> the commit message.Did you already talked to distributions like Redhat &
> >> OpenSuSE about this step?
> > As Dave mentioned, the OV5647 should work with V4L2. I don't have a sensor
> > with me, but I can order one and try to get it working with the upstream
> > kernel separate from this series.
> >
> > I did test the V2 camera module (IMX219) with my series applied on top of
> > upstream kernel, and capture worked fine with bcm2835-unicam, so I don't
> > believe V1 camera module should be an issue.
> I was in holidays the last days, so I better reply to this thread /
> context even there is a V2 out yet.
>
> Yes, this explains the technical part behind the motivation and I'm fine
> with this to speed up unstaging.
> But my point was "Are the users informed about this step?". So I hope
> the extended Cc should do this job at least for popular distributions.

I was vaguely aware because I randomly read the lists.

The last I looked there's still some missing bits stopping the unicam
driver from working out of the box upstream. What is the status of
that delta?

Overall I'm fine with the old camera driver going, it never worked
particularly well upstream on Fedora so I suspect overall even with
the missing bits on the unicam driver I don't think we're actually
worse off, but it would be nice to get the last bits in place so the
camera actually finally works upstream

Peter

