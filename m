Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43983C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 03:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7CAC38e00t9BNrxBO8THArYyzt9u+eyO7blKiSuqsOg=; b=UL+yabpr7JaWeV
	bpXfME+ERoA4QCTa2DiGE1YPZM11Mdxt73muKv3GabuA1jn4flJi/QVAw8Y//KUuq/FNRt5o5PrOn
	+Wdt2V/ZHEb4phm/gbNXtac+algYcUoQU+BQsVvHovPwvsvDyZoBqIAPSZGZlZ3lV87y9Z67zMMUy
	mQRFYi07y+TRN7IA0CQaMSf+Fgn29xm9qwQ82HRxqe9yqua5Ax5H9MXKIXHf5NM6HmsVOpnY9UWjw
	6v2gkMghpmHU4pJBvImRZ7+AwGw3iGQCK6dRQN6byJzIYQLTRoaGBGpAuPevF+/RzHx8LpoP7nmmJ
	p4ljB9BZ6jCAkyJa0LVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9FRX-00000004SQs-3JTs;
	Mon, 28 Apr 2025 03:46:07 +0000
Received: from mail-lf1-f48.google.com ([209.85.167.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9FPa-00000004SJU-0PjT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 03:44:07 +0000
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54d98aa5981so5380962e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 20:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745811841; x=1746416641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7CAC38e00t9BNrxBO8THArYyzt9u+eyO7blKiSuqsOg=;
        b=eFJtDHOu0JtKFb3BSTu+gt6cCv+zE0tXeYHP6nwArKVu59X482qzpOIH0S9DxdtPpK
         efcWrBGI6lMlurLU1RXVz1tlbnY0hDK2UpNGVgvnCfSE24c3NdUo7kpKSbWGb6UHkA8d
         HPBuzkldx9vGTH9TlemM5H+YJykAvX/TFLPb6LSaGTkFWklkpfI4HRgZ4VC8UNtM0svG
         AuwQ6nUPgqEWmMeqYPO/GL2Ma/1FLuAXGipSuZLON7rU/WF0epMvXW7zwBC0RKpcf2Ue
         lOMLaSkvW6JIqvrXrC61y3Egu8/ajBobZJVHASyRzWDdGiRBiIFDRvyyL0gX/sRvvOhp
         FcVg==
X-Forwarded-Encrypted: i=1; AJvYcCVxx/pvn+pOGbN7TkJaVJaHZrDVwBDtEMxBPjSJZk2uv44k0/QH78eZ3s1F91i9V6i4cL2E4QMBBhRD/YgxC4Tj@lists.infradead.org
X-Gm-Message-State: AOJu0Yywt908eRyOQTpo2Z2eeWIiEHKEPjPEYe9xVj/xWvXsxIkxgoii
	ATdyVBpXCsQXEiz9r/jmMIGmNfq2JF24yEFZjg2tMk8SvdTXU+Xt7W6o/5ZbSe0=
X-Gm-Gg: ASbGncu8u3lVwo3tWF0mG7FKGuHdugIKNMjfJ7Bpa1KDDX880bZdMMNKSaN0Ww60uJJ
	kmcUxhj2ygDd4Hc+YJLuaM+teLrvx+JfrcJrAI7g6OwqXuXy98SjzVPw/W9eBO9P4QiVHDLs5a8
	ktARNbHurRuHBZ/+D0uwQZr9yoi1rNMc3YVdVDYwcMGhYgRNhVDXHbSd3i+kHUMrvdO7N7rrbVl
	jwXlDR3cD0uhiFaaMHa10m8WR9hCtgz3UHK60lqx0ZdqD4mg7wOTrR1hV1eZb+P0HPXvasckaoc
	R6L1OIfug7xOLdgPQIXPabMZqNqHkxAcAPRMzS8oHqZicE0++ZktiqN+3lPAFvUfPVSgy3Hrhg=
	=
X-Google-Smtp-Source: AGHT+IEkmdckK7rqpOJaXhhQfQEI7OFkZ5WDmcvJUhZCJWOYyff7Jtz2qT7eedfWGDP+TUT6zRmflg==
X-Received: by 2002:a05:6512:39d1:b0:545:d27:e367 with SMTP id 2adb3069b0e04-54e8cc0e672mr2773769e87.42.1745811841130;
        Sun, 27 Apr 2025 20:44:01 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e9021a08fsm880013e87.113.2025.04.27.20.44.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 20:44:00 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-31062172698so45219741fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 20:44:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3e3VLRbBgjcxzxkaxb7wSOV1rvIWWY6OfJ+EJB9H8As9+Bd8vTScYV29wva825FrylQYsBOgCXyjG4SOL0eBX@lists.infradead.org
X-Received: by 2002:a05:651c:54f:b0:30d:62c1:3c0a with SMTP id
 38308e7fff4ca-31907612579mr39451231fa.25.1745811840373; Sun, 27 Apr 2025
 20:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAGb2v67=aENryhsQ6VBPwPXskMvMDZpzzeHz2LTUt-VDMTyzGQ@mail.gmail.com>
 <20250428030015.20915-1-amadeus@jmu.edu.cn>
In-Reply-To: <20250428030015.20915-1-amadeus@jmu.edu.cn>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 28 Apr 2025 11:43:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v65EP7dxOe_dcuF6hY+nU1GdO5gLLEtny_yCiOT7LbHbkA@mail.gmail.com>
X-Gm-Features: ATxdqUF6GOIa9pZuDBxWtkqX4m1trSs8x7Y-JZiW0r6eRTpffkJIo7zf_mFd4yc
Message-ID: <CAGb2v65EP7dxOe_dcuF6hY+nU1GdO5gLLEtny_yCiOT7LbHbkA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a523: fix SD card detect pull resistor
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: andre.przywara@arm.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	jernej.skrabec@gmail.com, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	robh@kernel.org, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_204406_156145_D53411A8 
X-CRM114-Status: GOOD (  10.41  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Apr 28, 2025 at 11:00=E2=80=AFAM Chukun Pan <amadeus@jmu.edu.cn> wr=
ote:
>
> Hi,
>
> > Fixes separated and squashed into the original patches.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git/commit/?h=
=3Dsunxi/dt-for-6.16&id=3Ddd97ddc4da0af02139b0e97e98c210219631e161
>
> In the above commit, dts was renamed but Makefile was not changed.
>
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-a527-radxa-a5e.dtb
>
> Do you want a patch or will you rebase again?

Fixed now, though today's linux-next might be broken. Sorry for the mess.

ChenYu

