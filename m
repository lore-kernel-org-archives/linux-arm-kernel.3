Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A1AE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 16:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hbu7641CeG8xNiROLSccwQDpo4bojGzR/nTssY8hmOI=; b=WMXlo6Gyw3MzRUH4h9aEYVg2jT
	cI6trMDBE3Fg1AZWunjh4fJgHWeGwKRH56xu/xAshHyXu1T6Sg2ZVMJOuFSOVi/c100E9j5J4Uhvq
	oq0JXwlRewjcQMGcylLB8SCuAJ1mq7uepGCEQcFjQ0WOY1SDfOXW/Ek7b7B1y/mS9BWWbVsb8nPoz
	DTukdYky1RZHEv2Rm1TSz8nQI3Jc3Y7mFcVtdaNnhs6IaktE2KxW8582eNwqjDuEx1uDAOE2wZlUN
	1biwQ+hl4p4AqvCecmqnEfJCQXlB1dECTh3E7zOVi3FOn+WJQF67wnHzlNcY5pHdCTmpHfGksdw4d
	keN9fddA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTT3-0000000H5pE-0O3A;
	Sun, 05 Jan 2025 16:27:09 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTRr-0000000H5XU-0liQ;
	Sun, 05 Jan 2025 16:25:56 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2f4409fc8fdso16571079a91.1;
        Sun, 05 Jan 2025 08:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736094354; x=1736699154; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hbu7641CeG8xNiROLSccwQDpo4bojGzR/nTssY8hmOI=;
        b=ICaozO5HHcgTMUVB4QF6pHUZVHu1DRKNpRZfwWT7QD0bcE5jcSnpYGzcUns+TtQHA8
         aj2W1t9lzamT/GP38KFwxZhsvZfU9XUZRYB4awlQRncSOW+m5TYcNC2ZLr3EtuuVCS4c
         I1cNMxCt3qTs4+OKnuGiH/FAVWZ5QCAvkpoaRTPZVqSiQ5kmEvcEGMbsdTFcgDcbnES9
         vL1RdeveM7EznCHYcjcKkBjn8oz3eVWO/CgNuRrDmZngFw6lZBxFJyp4UrihMnD3PLMx
         DJOeX1PEemJseHMzLJ2VKCt/PSVnRhFGfEH1B6wMPdNh6RSueUfmrQ8En1Q2Iemcgmbk
         s6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736094354; x=1736699154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hbu7641CeG8xNiROLSccwQDpo4bojGzR/nTssY8hmOI=;
        b=l0mo+rMYuI4shJAqyvwZq3oUDvPZdf9yYR5ldzMk6oGznm7CAVkaj0y9f9ctTOHme4
         Eyh2s4Y4Op+gBE3YjzuKxuPT6UfLBf3p067F0G/u1WQVhY06Pr1kP9i7YECGpX+psKOx
         suAKIxmy5TxjXUNNhLifjyFa2jabgrVNbxI9gx10WdV+Lh9UXykoOFVEf91ax6rYYgRv
         W+O9i+bSWvQwmyDsJf+HKs2dbPA8j1qNGqBH7nmcxN/+jPPlu7vytiiQ2OVVNG+9Xkxw
         iTTaAyERFhebAF5ekMV7kmbwpaSv30XvaRkdoNSDgCIz0zvZtNX46wF/b/6eq9VW8NI3
         294A==
X-Forwarded-Encrypted: i=1; AJvYcCU9y1KadC8XIxTuySN0ASu9vVRcTs+jjKsC53qdCWI7xtfEhjOrx51hpyHUHSjSzInoCrROWKuS/saxjmdXqTfQ@lists.infradead.org, AJvYcCWSc9cPpSvlb/wHKtrFN0Sg1OdXohi1erA+dcVhJLpBZvdW/kHchfdR5tTr6W7j8RRhFygsS3Zq3g0Qg+sMCng=@lists.infradead.org, AJvYcCWel5bgbWwPEaXbehcX7nl3UGu69rZ+N1s3eVsq6UJKSv+0Mw5zofUgdF11UeLf1nNoyB6kTiO3fErWenBgYII=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbCbxV/ebIQSa76PVkAE4v8GIoWrGTXLlg5spwNZUv9cyruGLD
	2h7bu7CwQkWihorODwxQx3eojQI/czMfTfY4lO7vO853J/n2O9L4d14OKhpfavqEqDJv+7XgF1N
	fung097gBgqMigWtE3+2Xh16NUZU=
X-Gm-Gg: ASbGnctZkKJi+zoYo7Y7EomdZwBfdmg78fWuaTtKHE9VsreZsXM6lVjJEF9xP/lsXIU
	7YMXj9KEGqRAyFyFvmLW/+UJ4XZ+CXI1XWllsgDVXBDW92HLqi+5p
X-Google-Smtp-Source: AGHT+IFvM6SBJtTLap+Q+DAFUbWc5zkuC4KMXDzaQJdqhN7s7+4kdqDXZd2/wUV9q/FU9iZ8tCHqn6eI4aaM7ptY90Q=
X-Received: by 2002:a17:90b:2545:b0:2e2:c2b0:d03e with SMTP id
 98e67ed59e1d1-2f453633e61mr74488893a91.5.1736094354238; Sun, 05 Jan 2025
 08:25:54 -0800 (PST)
MIME-Version: 1.0
References: <20241224-drm-bridge-hdmi-connector-v10-3-dc89577cd438@linaro.org>
 <20241231004311.2574720-1-martin.blumenstingl@googlemail.com>
 <l3u3wtnxyhrwjynevkwfjwarisc4yt4xy2rbzf5kb7k5l5dw3n@lxqtimymyjg6>
 <CAFBinCAh8iazDNx6GtOOJyXh_V-NfUs6Uf=ywN9kvQGPEmjrKQ@mail.gmail.com> <x73a2utr5sp4iffk5626zqfth4ayu3x4jkxd7xwjti7ehrgnzi@ploxx4i5db5h>
In-Reply-To: <x73a2utr5sp4iffk5626zqfth4ayu3x4jkxd7xwjti7ehrgnzi@ploxx4i5db5h>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 5 Jan 2025 17:25:43 +0100
Message-ID: <CAFBinCBstfDa966+5wKLFdQNhnjW+d5Mpj=x3BDY+R5nHNnKLQ@mail.gmail.com>
Subject: Re: [PATCH v10 03/10] drm/connector: implement generic HDMI audio helpers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
	alain.volmat@foss.st.com, alim.akhtar@samsung.com, andrzej.hajda@intel.com, 
	andy.yan@rock-chips.com, angelogioacchino.delregno@collabora.com, 
	broonie@kernel.org, chunkuang.hu@kernel.org, dave.stevenson@raspberrypi.com, 
	dri-devel@lists.freedesktop.org, heiko@sntech.de, hjc@rock-chips.com, 
	inki.dae@samsung.com, jani.nikula@linux.intel.com, jernej.skrabec@gmail.com, 
	jonas@kwiboo.se, kernel-list@raspberrypi.com, krzk@kernel.org, 
	kyungmin.park@samsung.com, lgirdwood@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com, 
	matthias.bgg@gmail.com, mcanal@igalia.com, mripard@kernel.org, 
	neil.armstrong@linaro.org, p.zabel@pengutronix.de, perex@perex.cz, 
	ple@baylibre.com, rfoss@kernel.org, rgallaispou@gmail.com, simona@ffwll.ch, 
	sw0312.kim@samsung.com, tiwai@suse.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_082555_241178_F6B3E2FE 
X-CRM114-Status: GOOD (  15.96  )
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

On Fri, Jan 3, 2025 at 1:37=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, Dec 31, 2024 at 07:49:40PM +0100, Martin Blumenstingl wrote:
> > On Tue, Dec 31, 2024 at 3:34=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > [...]
> > > > I checked all instances of struct hdmi_codec_ops in v6.13-rc3 and i=
t
> > > > seems that there is only a single driver which uses the .prepare
> > > > callback (drivers/gpu/drm/vc4/vc4_hdmi.c). All other drivers seem t=
o
> > > > implement .hw_params instead.
> > >
> > > Yes. However .hw_params don't have access to the infoframe contents, =
so
> > > I had to settle on implementing .prepare.
> > While debugging I noticed something unrelated to my problem:
> > hdmi_codec_spdif_dai_ops does not implement .prepare().
> > FYI just in case someone wants to use your patches and feed the
> > hdmi-codec with SPDIF instead of I2S.
>
> Could you please send submit a patch to the hdmi-codec driver?
Sure, see [0]


[0] https://lore.kernel.org/linux-sound/20250105162407.30870-1-martin.blume=
nstingl@googlemail.com/T/#u

