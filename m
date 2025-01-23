Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B63EC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 15:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ObmF4EAbz69jChCTuuA+EV0Ksc0exXQpmKmEqjaiDU=; b=LcjhOhOCMpXoYdUOTZoK61AC8Y
	xZiQU+LeYUb5n2r19euLKOZpJybbDY+S/HhaqowSo9lZVVYHIOZVkzlB+jb1COLI2bG1yfV/yxXIn
	6ErS+pJLljXjFPU17H5Q0DznmcR4IWB8QvBrXmx2Ov5IERrE+dktnfuMLrrgm99Im6upDwGVSHbG2
	1mR6uJRK4Nx+k+ili0+OTnCDTuDz6J6sqmW0X6hJQT1O2E4JU/RWHCpL0wtficHtl3Nf7v+qCIy/F
	XO6eQHsb4ZlvqT8OHdylQ0v3UW+WanMDvNitWLTbxRlW7Rdb4B/4Im3o5fP8b+5QaHAWBL+0JTkuH
	m2hQInSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taz98-0000000Ci4e-1vP1;
	Thu, 23 Jan 2025 15:29:30 +0000
Received: from mail-ua1-f43.google.com ([209.85.222.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taz76-0000000Chpi-0LD6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 15:27:25 +0000
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85c5a91374cso525132241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 07:27:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737646042; x=1738250842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ObmF4EAbz69jChCTuuA+EV0Ksc0exXQpmKmEqjaiDU=;
        b=np+RYrjBFpcQkhpmBCAkaAONuC1rlTckcEc2KVOyJmKpCjX+G6ugsp3C6YZMfTO4FN
         VwQl9tmdkM4cPwxPLIdWorF0jC1eLiOTHNtfl4fPQk8CtXSRoNj7Iu7mZcQstmDjBbzv
         CBdMgbBLMZ5bXknZZy5pzbWpz39rNQczMvBTIsXkzxotO6Ppq+E8kL+2pBsPoCdhB8LO
         h/+t82GkCmUfUfFyZ4EI9XNzf3d0bnuC34oa5ABtrjoAc+bCtmqXOnKxrT+q8WnxvH53
         llzJBdC05vuUq7Jd5LIdi8t03AjY6a+oGX/DfFpdmo3EWzpJEadv4OwpAlyAJWKnbZVs
         mBRg==
X-Gm-Message-State: AOJu0YzYncKb67w6Y628HsfYVaOIu6hsFZDmczxiGwk6EgrgHk07UFQX
	a5jrsnmu1B/gbLXxbEdNxGbDzU8ua0OI2ObaIq+xDmc9AqTRxxWh26uibKVb
X-Gm-Gg: ASbGnct5ZS2w+T5C1Kzv1gML2MbTVKEvfhqUwaFG8Qf6RNmpRqzAu+g0DTs13BhEHp1
	F9G5xgIPDd2g5RsoWALGsA8VN2ve8jCWf7KfGDakiOS3u6aqdlyKRBQzUqTQaSWnMxBR5W4hVPS
	uSll/tEZZfDiFagB+sgHdQ8R8Bm1nrFuxWKl5GLThmEitah+wLkFZ6s+puw21RVZDhHQ+8BvJHT
	Z1ZmFkI5SWlhV2IBOD5rJaILwFXtGAUFglkZw7z3kUY3A4hfn8yr7lAafECa2tF1ornQYWkyhrG
	dKxNjIohJ7/M25bPm/wSAEwi23A+tXwVFrUFK/J6UCHYB+A=
X-Google-Smtp-Source: AGHT+IGM7vryunpQtEHttgxuTSaJ2O7lM30uAogRxXxLI6iVkIFksudH3Aiui0/W/GHCuIIjgp1C8g==
X-Received: by 2002:a05:6102:2c88:b0:4b2:cc94:1d6a with SMTP id ada2fe7eead31-4b690ca2b07mr24594811137.19.1737646042482;
        Thu, 23 Jan 2025 07:27:22 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642ccac884sm3512140241.29.2025.01.23.07.27.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 07:27:21 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5189105c5f5so695321e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 07:27:21 -0800 (PST)
X-Received: by 2002:a05:6122:2388:b0:51c:27a0:25b8 with SMTP id
 71dfb90a1353d-51d592b4225mr22852885e0c.2.1737646041403; Thu, 23 Jan 2025
 07:27:21 -0800 (PST)
MIME-Version: 1.0
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org> <20250118111344.361617-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250118111344.361617-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 16:27:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSasSLCE4_oGPUync3XxoESt-CHVr=pZQ06-LZRpBNdg@mail.gmail.com>
X-Gm-Features: AWEUYZk9g_baLNniWFP_GhMat-002Ka7cDv_endiqh4DLReqMtzsEkVZBq2x96I
Message-ID: <CAMuHMdVSasSLCE4_oGPUync3XxoESt-CHVr=pZQ06-LZRpBNdg@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: s4sk: Access rswitch ports via phandles
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_072724_114964_3F6D5C47 
X-CRM114-Status: GOOD (  14.36  )
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

On Sat, Jan 18, 2025 at 12:14=E2=80=AFPM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The r8a779f0.dtsi now contains labels for each rswitch port in
> the form 'rswitchportN'. Use those to access rswitch ports and
> slightly reduce the depth of this board DT. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

