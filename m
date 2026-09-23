Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63060C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOsjR1C8KRldJmAM/WaBd8dcZ8oAMqD1v2iQK87wQ/8=; b=f5kY4oilHrkjQzKRCQKp+2x2Fj
	nFjp94hfRiAtZfF1VF09Ttwgf4Kkr21nQAcOSnFU4ve8GftX8U02qIomrV9yyK+VIkRE8fprEGVsT
	Zf9zPSqQFXz4AWN7b8jvrSqc+KY9Mxo38iI7G0T5sJ/Tjna/vRuAjnhMeE0j2Wwn4RlOwUWbKBYjn
	/ELBFPGwFJWGPiRZkHNCrm+BGN4dch29VvUflFE9hxYGzUYYR8jvNAILhqTOftlo1YeL70O0iCsOa
	O0OQy1ka8hfapXLaT6mQDbs8DEOl2roACIBFQO7c9lmt/LMxGZfWePFVdYCW6CG0Wy4aWn487rMnq
	2G+Rg/TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JrQ-00000007qXR-3I2w;
	Wed, 23 Sep 2026 10:05:56 +0000
Received: from mail-qk2-f12.google.com ([74.125.230.204])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JrI-00000007qWK-0TpO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:05:50 +0000
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93a2a8c29c4so77729085a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 03:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790157946; x=1790762746;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fOsjR1C8KRldJmAM/WaBd8dcZ8oAMqD1v2iQK87wQ/8=;
        b=ckY/b4VhQIGdh6D5/EuDOVJM8e0vqx6a3lDWX5QQ3atuBwsR6Wv3qWURemZN0z+Rdf
         F0Idr9zPuH3PcsmlWLENqihEqSwk/q8EJHpv9MiS0fMW25VfnQYo4Ckp4fNIvZOaaUJy
         yqAj22CogOFSfr287zALiXPuyxZJLIIWQ4jv7IUI1yb3uVinI9J6uReGjcMjQ9tJk64o
         k9L0o9zO3ilPhqp5GuvMedaEnaQVubFp5AB5EgewbbGGXeIXGw1FfBg+FQ8dVW23Fj+N
         6hROYEbR351gs3K3tdqW7n53+Mr8gYmO/L9MUnMhn3q7LHWFFwb5AL1BVm7qcJmjHxFt
         +s1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwuirL/PvwKGYSzxOUaSIpZDBfuPPKnvdfxoEiXnaKYhlljAjtaxmptRP31BmoIiG3GtzyoAfgL9C7pMZ0tzHBP@lists.infradead.org
X-Gm-Message-State: AFuF++mvDQmL5Ch04vdzlIDy3b2rV1H5NdbL5dH9RmNsaHB+EdFLA5Bw
	dlgoJ4GXarv/+AuatyyEjBk2dB6WFb9MxcyX0TjdXrxe4ADlun3j2udK+Rz/mYz3Y5w=
X-Gm-Gg: AYBFou25ibz1di3I3Da7awHnBE989uHJPh2vUcZ/r609+bv/2NNjOGjM9Tmz9YyZVvL
	io9XyG5TUz0Xxh4giXmCk2Qxlmkmi2tS6zywSWLb4ko113Gu+hIBenbqvj5t8U4J25hQZuJKKcv
	YabyvPAKYAl9N7cSvsXplaT2X2mHQKNeqq1Lmwb22Cg+q2XJi/c2FAV1OAXtKtxr3ZYobDumvYn
	C2CTXKKAfsV0+z7SXxzfqyg51a5rbHT+Q0pJDy3wSnHwNViXoeo6AiPE/tBDJ845OTDisIogs5e
	pQ5sAJomDPXlt09PzOhPL2ZBbpxwj1av9nnt8ij0WQXrGDnx3qtDkCBm+p5fzN7mcqXEtgfuKFp
	mfBh5oK6sx5l3Haufp5P++aQdPv6FaoC82k22cwAsL70r8sZ8rKuUFwP5ArU098WgfJwNskHztP
	Ss/1c63EMQ0wGCRy80cbSaNsdh8ngDqrT7/xK/SFWXIWZM4uHMEmyKmdU9sqWyNMpeXOnhQR785
	Vk+gGlrDdGD/Y21tPw4WsnYtBG0YIL+A0bf
X-Received: by 2002:a05:6102:4188:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7ac1e24f078mr2067871137.32.1790157529933;
        Wed, 23 Sep 2026 02:58:49 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f324fd53sm1516561e0c.16.2026.09.23.02.58.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:58:49 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-7856441f7d8so420322137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 02:58:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwAeM8vYCXWNkh3bsbB7966/GJmY/Zd0BrFrsQYtOt/eT97imnaNn4Kq6L/S/5kiKmWnrpiH3aJ0v082WaNkxMN@lists.infradead.org
X-Received: by 2002:a05:6102:5493:b0:7a6:d3f5:3551 with SMTP id
 ada2fe7eead31-7ac1ba3aa41mr1865740137.14.1790157529595; Wed, 23 Sep 2026
 02:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org> <20260922-mali-c55-renesas-dts-v1-1-cd63cdb51033@kernel.org>
In-Reply-To: <20260922-mali-c55-renesas-dts-v1-1-cd63cdb51033@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:58:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVkhSNDn3BpBt-9K8FPKhmODYVF-PCKr+AH8B+o4GHuJA@mail.gmail.com>
X-Gm-Features: AclHuK-ZLnADC_yQSZhQ6KyATq7TTVujDV7zLDX1BCp0BDcquLjKrWDdI_wG4Oc
Message-ID: <CAMuHMdVkhSNDn3BpBt-9K8FPKhmODYVF-PCKr+AH8B+o4GHuJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Linus Walleij <linusw@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_030549_149627_33AA2661 
X-CRM114-Status: GOOD (  20.37  )
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

Hi Linus,

Thanks for your patch!

On Tue, 22 Sept 2026 at 15:34, Linus Walleij <linusw@kernel.org> wrote:
> From: Daniel Scally <dan.scally@ideasonboard.com>
>
> Add the Input Video Control Block and Arm Mali-C55 ISP to the device
> tree file for the RZ/V2H(P) SoC.
>
> [Rebase onto v7.3-rc1, place the nodes in address order, and sort
>  the interrupt properties. - Linus Walleij]
>
> Assisted-by: LLM

Dear LLM: Please take into account the review comments on the original
submission:
https://lore.kernel.org/CAMuHMdVCeMaQ8yFnMgr1Nko+0yQxn69BR9fGJ2WPvADMc2gvRQ@mail.gmail.com/

> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

