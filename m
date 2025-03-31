Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DB4C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 10:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKU5ssgS9U8JIuOC1fvhct5e36R0RAbHOX6C6hmSOLQ=; b=Ave6pawGJ0/Gmd4Y4N2xu9IYa7
	Vtfc84MwhdyhppmAMx1FiPMbNxUjGdFy7IaUmzS8sdzB8Nos/dSJJTs8qbr4H2v/LSwaBUxbWdKdt
	ssTmXzdnQBlAvJjo37bl9DtUPa1hTgCx7BDisVHIU3p0GAX22Cow8iWMLJY0cY4vx3WqJgi2O2CAk
	8gGKGGNz4UO4e3Jn2U8KuDJ40YDM4iwyb0NoQ8VWZ1BeM2bpCE9Bs1gocX47539BG5l5hPYLp/g5C
	LFJnpMZeHpv84h74WmgtdoCR+OikrliQowIGfO4MkyhsqGI8pEH4ezGX352op83OMh9rNO2T4859N
	NSydaypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC1u-000000000xQ-2i3a;
	Mon, 31 Mar 2025 10:06:06 +0000
Received: from mail-ua1-f46.google.com ([209.85.222.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzByI-0000000Hao6-0Bjx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 10:02:23 +0000
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d3805a551so1901428241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 03:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743415339; x=1744020139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QKU5ssgS9U8JIuOC1fvhct5e36R0RAbHOX6C6hmSOLQ=;
        b=NK0vXk7u5iYaO/kgKF2dWWclX2AyqYSNAQMa42C+u0J7sfZH67ZY142fV4DosUbduZ
         FwOBBeRHfGhYnqtOEiqtXtHusK14YfFEhBDcTF2vALfiibEh3OOWCloU4tSHmyYp2PGU
         +DyTeQmBVAKw1BAKcLRTL9tEL9qooiO3vsTT0Y4DlzRDiECdg5BwQMl2BwGcH+T0JaQN
         Wz9d8BTAzmGDLH7LkS1iFPk5geRYuGZygRPZ1oOUsrfjFkr0A3bfVRabNp5kHeGd5jwa
         /K3TIEufv5E8wEdqKpSjt4xI1Nh2T3Ho9Wmk1jIU1z76pD/D2EgHuJRzfC485VhU5FS0
         1DUw==
X-Gm-Message-State: AOJu0YzwLQJI51pGa1KJgXu6yBO9IIWBG/et1yA6ZI+OKutHjAkTTNBt
	2PGUlNszZTYCloYofFUyjXKLC4YrIm0axF6Q33EQlIfmjLYfBvre6RQ854oR
X-Gm-Gg: ASbGncskVU7cfG1KITc2oM13MOo9ItmnmRZfEPkH9xgoL3i9oGBt2aY/LWvUkOUoY8h
	ixmwhlmcO1Hx8lHaxuFqiXybk7wV7K0k/xAK1uGp9Ymcz5gcTHN9BjjER9dVklFAFQbcu3z9kbY
	fHvU4+W7RIU5p3PR0cSKfdWEst8vxBfxH5P7cIIk8bhkWVz0MUC5TYDywgq9j5OdVo6Eq/3mB8b
	VETfu0MpnYEPD6LU0UeSha99IbRPDklr7EpBwNFGBQseffjVT44P74PinQFTb1N/8njPLan31AA
	33l+0xeIsZXqJur1jXnPG52M7hkh5uVk8uA61smF6xuBX2fGLU6ZdisiBcBgxE+ok92sqXsBBXV
	0N1coG57aueg=
X-Google-Smtp-Source: AGHT+IHoxhXdmw7f67UZlFB/P+0oGeo1SThlq+EJI1gCqb8tFKy5NtycCnMvftmFWpX26hm53diwiA==
X-Received: by 2002:a05:6102:14a8:b0:4c1:abaa:ad93 with SMTP id ada2fe7eead31-4c6d386e304mr4393602137.14.1743415338835;
        Mon, 31 Mar 2025 03:02:18 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c6bfc844b3sm1544638137.2.2025.03.31.03.02.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 03:02:18 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-525b44b7720so1787430e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 03:02:18 -0700 (PDT)
X-Received: by 2002:a05:6102:510c:b0:4bb:c4ff:5cb9 with SMTP id
 ada2fe7eead31-4c6d388ae4fmr4100264137.15.1743415337988; Mon, 31 Mar 2025
 03:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250330195715.332106-1-marek.vasut+renesas@mailbox.org> <20250330195715.332106-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250330195715.332106-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 12:02:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVgHezvsk75D1Z=+ZQXW7=174QZDUAycErPFmmmmO9cEA@mail.gmail.com>
X-Gm-Features: AQ5f1JqDdBD1I-JTXMgL1IxghxfY7n_rRBPJO23j4mio03-iZ44J2Q5D0QBXoMI
Message-ID: <CAMuHMdVgHezvsk75D1Z=+ZQXW7=174QZDUAycErPFmmmmO9cEA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: vendor-prefixes: Add Retronix Technology Inc.
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>, 
	Kever Yang <kever.yang@rock-chips.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_030222_082441_705896AA 
X-CRM114-Status: GOOD (  16.63  )
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

On Sun, 30 Mar 2025 at 21:58, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add vendor prefix for Retronix Technology Inc.
> https://www.retronix.com.tw/en/about.html
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Although too many companies are named "Retronix"...


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

