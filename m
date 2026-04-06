Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3CAEF4EC2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 09:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3EBVPa5+SgsD0dXnuD7pGvS4tR2VULAk13x8kX/y8Fc=; b=qt6rll01kMo11HCjhyI4ld6T25
	mirKp/DVVzHIr2eNvCa6anNlsNK24oIFeL0TcQoy86QzFgEoVNOKfs/ZFKmeFG/G66UoRE77YsC/g
	YqcnMnBDKW3F4UpFyiSeXNmxEne9TEpbo0VDLb6tihQWTzcx0BSxAt4Ox6lS0UgOrIFDjRiJFZOGO
	lPijOW7HNtnU6noENrrQc4n/FcGmJr0mlt46f1w1ugqvsv3/w26ZQ84T7zSa3i+UPZ8XD36DMKaC2
	L6PV0AiU638QczXUXQ2jVM0EOnZNZ70foTieTuepLFhGfIInIktIUyq1oXPUunF2Cz/2pxCVeIeYa
	yFCT94Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9gRO-00000004y3B-1jgB;
	Mon, 06 Apr 2026 09:40:18 +0000
Received: from mail-vk1-f174.google.com ([209.85.221.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9gRM-00000004y2q-0eoh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 09:40:17 +0000
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56d89f35940so1304326e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 02:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775468414; x=1776073214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EBVPa5+SgsD0dXnuD7pGvS4tR2VULAk13x8kX/y8Fc=;
        b=lO+eH+uciQpOIWHTcXkfEkSPxWdPfl99PlMYE+8lFvZa2KTlu0ruPt5p8nS28TdszE
         V1LmMKxyuF4Z8V0ib2sKwJBqKKfF4UCPizX4S2Gi58qICauRrmpnXMydDWu9EjMdY9z1
         bFFxhAkl19FEnjC15N2ex+8ZvRulR4RPIj8gjpP5ZKz+S8drTtCmHwJnNW6S/Z1VnH1+
         GuNgcWZ5NSAKNezuL1h8p3rUa/4m2Czor3iWtLjEhyzcrAR4AT/wY6kh+yGrlACh+DUm
         L6/GQqjKd7H2KpDqZJ3t3EqxEYoJw+grggsv9z7dwUJ53qLEEk9SXsespLAfTz9M1bF9
         I7PA==
X-Forwarded-Encrypted: i=1; AJvYcCVPx4Yb82N/mRLYeIT7v188T/cgS3aliQmNWOjP7+M+dycytrzgCatXzCc5gDCVAsXn513VOLM6U61YwvhjJTE6@lists.infradead.org
X-Gm-Message-State: AOJu0YxEQTftO0LYyVuW09R4wa/XG8JC38VlNz5FyZ3GiKMkxTiF6BR6
	BZFHEkfTk8n0rzUWQzOBMi+YWyM3TiswMaFJ/AYPLZaiHQRVIzYA5NogSVg9B0sz
X-Gm-Gg: AeBDiev9imu3aO4/9YNUmSBYpwLXkpSXJu4y/6P7ZF9muCLrU6qPoTdT6YVfRRHzdSW
	jT+yxW+P/ruZj5ZF6q8/4hu8Ybr78DlxcEj3rfxlqOmSOu3sxyKN/Z7GbJONNCxF8+ugei5XK3Z
	CxRqfjDw88MSlODjCCnZurSfUbU54N/bpuFnPK4fe6Bl2Z6hygONJyWE3HmMmwFknvAW6oyzxb4
	U5OQt+4DjHbI2ssTdeIDlaucL8vU3Iw0N4z3RGeEg3lvIcyv8i4K7peZEbr1gALQ3gnZRdPUUQj
	z0uvmpnP2wjM5Bg+tVGvByrmdzDsjcPRf0MZKmlqQHPIs2moU2dCU/FU29WDeKO83IvOJqBFuNA
	vOE4tTXNtrXhU/pcgFeBi0VSdPmXWz0IWGxe1ON5FId0lZRIzXgLnAdWua06oQY98PAThjmRmZH
	L1KZ/hsoQb+zNmMLOJXAj8y7WASD/nCwxH5nCTiq55jnArxmjFKwfvrOmGgLOMfhDiTiKrqDI=
X-Received: by 2002:a05:6122:d29:b0:56c:c8bb:cd8e with SMTP id 71dfb90a1353d-56dab8138a8mr4038232e0c.1.1775468414341;
        Mon, 06 Apr 2026 02:40:14 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9ba8019bsm15477425e0c.1.2026.04.06.02.40.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 02:40:13 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94dd01deb53so791523241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 02:40:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOrxJ3H/vhcNSTzwpEIPZrmx7+KAwi+nPsT99dPm8DJCDSdeiAcxQn6iCTsK6jFzr9MidL6BsoE57e3wBniqBg@lists.infradead.org
X-Received: by 2002:a05:6102:6c3:b0:5ff:e0be:f538 with SMTP id
 ada2fe7eead31-605a50d358emr3135757137.30.1775468412939; Mon, 06 Apr 2026
 02:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260402145858.240231-1-julianbraha@gmail.com>
 <CAMuHMdUfzVSQpadJYpEqPJ_UOBAgswnGzD_bp_U3U6jt2dy0dg@mail.gmail.com> <f914fb50-ffca-49dd-901d-0b0176e5ee93@gmail.com>
In-Reply-To: <f914fb50-ffca-49dd-901d-0b0176e5ee93@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Apr 2026 11:40:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX71HJL+krjUrDdnVLA44wxo6HfP9e4-qvFRhrc1qjigQ@mail.gmail.com>
X-Gm-Features: AQROBzAeRHlZRx6XLNF3owpO_ayyuIljh1J_K_FbzGbRKkLMW-kjt6HUF_2Ww_w
Message-ID: <CAMuHMdX71HJL+krjUrDdnVLA44wxo6HfP9e4-qvFRhrc1qjigQ@mail.gmail.com>
Subject: Re: [PATCH v2] stmmac: cleanup dead dependencies on STMMAC_PLATFORM
 and STMMAC_ETH in Kconfig
To: Julian Braha <julianbraha@gmail.com>
Cc: davem@davemloft.net, peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, 
	mcoquelin.stm32@gmail.com, linux@armlinux.org.uk, kuba@kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_024016_204707_B798B57B 
X-CRM114-Status: GOOD (  21.61  )
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

Hi Julian,

On Mon, 6 Apr 2026 at 11:27, Julian Braha <julianbraha@gmail.com> wrote:
> With the patch applied, I've attempted to configure the kernel
> with STMMAC_PLATFORM=y while STMMAC_ETH=m but menuconfig gives this
> error message:
> "This feature depends on another which has been configured as a module.
> As a result, this feature will be built as a module."
>
> So it looks to me like this patch hasn't actually changed any kconfig
> behavior, but let me know if I'm missing something.

OK, thanks for checking!

I thought there was still some difference between "if" and "depends on"
when the symbol is a module, but apparently I was wrong...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

