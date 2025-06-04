Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECA6C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 09:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRV0Q86dcfMGK7s8qaqpOjDtaB6acLpurJwiHDkiJCQ=; b=IEO/VnATsGyxvihJ3D2fcPyEo/
	MUTz96c0W4bW4VoD0bV+b0fXxwGWlL1dHkpP9WT4v9hdlQxVJ9ScLjOvla4fWOEDpluC/jft0sJg5
	M9zDOnmMtffez8ILYaDR2eMXLo8oNsoeQDTLMQxI2T9Fhyzjl6fbPKpI1blAuxUYSBsEgEQCqWOsx
	ubsObIKEI7X6TPEJ9SsQMvZLBDYFqAxUSweGwegVahhluRoAG1+4FbVPXhL0rJYE4jRqf0WlBCqqT
	cSfwAo7/smCboS9t+d7GbMdJ7ltVLoBfh8+8LiVt4iBO7ewOUPT+UxYXu5pNbd5Pvijn/NV9pbDBJ
	kMlF1cWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkEh-0000000D0BZ-3ozE;
	Wed, 04 Jun 2025 09:16:39 +0000
Received: from mail-ua1-f54.google.com ([209.85.222.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkCI-0000000Czfr-1M8e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 09:14:11 +0000
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-87dfe8388f8so1356513241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 02:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749028448; x=1749633248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRV0Q86dcfMGK7s8qaqpOjDtaB6acLpurJwiHDkiJCQ=;
        b=V7WbfJ/qd5N324Qm/927mXrxIoCSjCNCIqITcPG24sy9w8c3lNCkrEFOCUc+W3b1wx
         Qm28z5umcEcW8lNm4fTT1lyOeCUEXWwm1+31x1BvFtl4xokGGDK9osr5kH3m2zEKvfVP
         8pTdnMr5bjpPcki3+M2dyOiqv/6huMFwud8TUKBb2lO/urjNoXqoUJfb99xMXuONOINC
         +pgiaHA6NoabpDstPwawVVEOr6jcTzIKjSjSPT2vXcIC31Uhorn7vZMc0OkJFD/uJ2p2
         tsWVA6K1DXWlIvcCRORgbJrB1I4f2UDqwLEYtNNekoRCctF90Hey+b5qwTeHOd5wagjp
         KaOA==
X-Gm-Message-State: AOJu0YzG1gxBofw8eRJtY/46a8gqAWfHh1I6oZ8F03fe4Nr269XdVOS9
	dF04Td6qXDgPh6kEM+Sit7VVHQPXgYKtRte3+Zj+2a/eSDSm9vD90A2n4WB2wWeZ
X-Gm-Gg: ASbGnctc7rYU5PJ2RakWCLwmn/kn5ITBajD9bQsQ42ncgMwtleDrT0ZZYvDCeSoN22s
	3/zwZNdufVj7aBciR0Bh096JDwR4BVEsPrRjIbD+V+y9QywaV31OA43LpYaCQVipud/7TdGgTZX
	gShbd4Edq8E1hF5nM3Ce7xKyG4G23WtusWZhD618QS7HI6YOUhQSz03CCg7S+SIFW7/31/HxCrK
	oClm+mCdw6jRh6LXJOg6mWUUdCLSJl5AGXIA/nMqt55hFLIlcucyTGpwFVX5CKlwQm0acz3TYCl
	hoHyrBnZTY2+NlPNbtVo+WrUNP0hhjlQEo3VfeawzmAI5MtPre4Toqr4NiPtFMa2Ag7/XSzbTxY
	CwEyTTaH/iE8oTg==
X-Google-Smtp-Source: AGHT+IGOrKg6gNFkyZiIaPEeJDK0gEMSrZknGNeL9q4/lrHodHlFrwwOGY5fAHFIwVSVlP07W1V3Ag==
X-Received: by 2002:a05:6102:5a91:b0:4e5:9380:9c25 with SMTP id ada2fe7eead31-4e746ce3cadmr1123114137.3.1749028447915;
        Wed, 04 Jun 2025 02:14:07 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e64449ad1asm9794285137.17.2025.06.04.02.14.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 02:14:07 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86d5e3ddb66so1738112241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 02:14:07 -0700 (PDT)
X-Received: by 2002:a05:6102:4192:b0:4e6:d784:3f7 with SMTP id
 ada2fe7eead31-4e746de3672mr1008327137.15.1749028447356; Wed, 04 Jun 2025
 02:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org> <20250530225504.55042-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250530225504.55042-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Jun 2025 11:13:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMnjryv6nfP=7DTmsCtucuw7RAuYxW_zTRhCnwFxR34A@mail.gmail.com>
X-Gm-Features: AX0GCFv3oImgu85Rwzjgo0touyo51sp9hBFNSI5sTOBJmChOTLWl5fT7ekg_o3E
Message-ID: <CAMuHMdVMnjryv6nfP=7DTmsCtucuw7RAuYxW_zTRhCnwFxR34A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a779g0: Describe root port
 on R-Car V4H
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_021410_362184_2E3E61E2 
X-CRM114-Status: GOOD (  18.81  )
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

Hi Marek,

On Sat, 31 May 2025 at 00:55, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add node which describes the root port into PCIe controller DT node.
> This can be used together with pwrctrl driver to control clock and
> power supply to a PCIe slot. For example usage, refer to V4H Sparrow
> Hawk board.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I will wait a bit for more comments (if any) before applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

