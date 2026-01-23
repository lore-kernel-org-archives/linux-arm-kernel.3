Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8901D74ECB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 13:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uRZVas5P6xxkBpdwTHJQR+xs1A0EdTWP84ona+zohk=; b=Cx2MvBuvhA8uDjeb0cmjbawS+Q
	mAqKZ8/4szBVO0OAew9UmbRT5ftYcaK9sswQeaSP2XpUwRkeT7SP8gzMDh4WDSta5NdudImYraMc8
	YwwHJd8gtl/0MB7xkTEMX/NYKrwv6tOFNf0FQLxY0HPw/5WRAuznNjhXCuPOG/6MrTB+YcJ2bSbaq
	hSNIT2oPitXrAxgjIlE2pXz4ZcKb4J2d/SVkfFQKGboa9KV5GIvRryXgL6kxeHWcq8S6Zdcs+UWFN
	wWYsIJnsq6EDyGqBq6iN9mVrv/Ti/C/2tEdfwHOcTGptN4iRdmdgprNtKH/2KLgXJ1eaiIM0WoM8f
	ApUetrEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHEN-00000008xps-1Dnp;
	Fri, 23 Jan 2026 13:29:43 +0000
Received: from mail-ua1-f54.google.com ([209.85.222.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHEL-00000008xol-0QG6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 13:29:42 +0000
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9480078b2fbso2245768241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:29:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769174980; x=1769779780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uRZVas5P6xxkBpdwTHJQR+xs1A0EdTWP84ona+zohk=;
        b=IttzvfE5hh3p/oe1pWNsJNiaXCSH7nvi+7zfaUYG8DhXKrmUm6XY2Zge+kngT7ajgq
         5WD3jtduoPExMrd5AB+NltoCfIZBCX2ggCi6cERn8KAdsHvYidLtAgZZ3gM4pwQissPh
         zZ0XknW0g2iuqEZBrIMfORPw2HxAzXDkKOxkNDDE3WtDszuA5QISx33xP/aOY0cr9Gu1
         UtyZQhM7VQXcHieD7e848llFzYxtSJcPvCZAcn3stjXlYy/NQD/U1xfw+bRTM9LHJKqW
         b6wyOXBShzdtVdCfnap8r/w8YcnSf0xN7wqIoSL1CzyOami+S3rHSIOOEMV6J7Ntw3mh
         3LAw==
X-Gm-Message-State: AOJu0Ywc8+fN3/JPfzlvgvqeqPSlZ4lBFOJaHQIdfagHl9Og77/E5UKp
	NR7b1p7zqVgG5xjJ//WYm4qEtCp2fdBlF7nNqUyEkvMPhunS2M5XT6nfyAL3aC/Q
X-Gm-Gg: AZuq6aJTMEd26NKbFEXmEj+UrZc4I8c67Zt5hrBW0L8cH40Pkt/UbJuz0Yupsjx/N2G
	PI+uHjvzWLzFERsV1n+SaFtmETOuisC23JeRITejhhbkyJeF2zxVMacqsqvJC7Ex/Sk+Sdrhe5d
	2WnAryO2FMKVYGMvJYFcgp4MA2gQXiHFVy4tLz7w9WkUrbAZsLNBVct/HYJM9y7VXFaFK5WxA21
	yLSiMarsAHbC4DVp5kI0n6L/8LDqXlU737atZFsd5tU7Osrq/aJ8/3MRhT+iCH17ODGn5tsC8bC
	/jUJ9W5apONM0GzaOrJeb1gUwsFrlvtXOYsc4ZDaTY4r1vZLLDB6qtPVbDTMbteWHo0DPWmkIG5
	jcE3Rw21+Dm7pMVrIdZGSa1L5H26WT9mwMWwNfBr/fgzKDt4bCGRHdt3I8i9W5CSaAEQ3oBd1jt
	9FfxrmUdrOvLbAsmSkilEE/RtrRQXhEQCOsMRelTTz9dANou72
X-Received: by 2002:a05:6102:d87:b0:5f1:5be2:114b with SMTP id ada2fe7eead31-5f532eef721mr2327304137.20.1769174979830;
        Fri, 23 Jan 2026 05:29:39 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f55118c549sm366806137.7.2026.01.23.05.29.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:29:39 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-93f5910b06cso1473137241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:29:38 -0800 (PST)
X-Received: by 2002:a05:6102:3752:b0:5ef:a3c1:86e1 with SMTP id
 ada2fe7eead31-5f532e93002mr1974929137.11.1769174978693; Fri, 23 Jan 2026
 05:29:38 -0800 (PST)
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:29:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9XAn1RfkFpof0yUeYhfmQOnZMSNBAA1rQFBNX_Z3TMQ@mail.gmail.com>
X-Gm-Features: AZwV_Qi8xIqx9SrRtjX9A1sHdg0UhI1C_69Cyb2P2OJhm9AIJr1Yv60yV3PReM0
Message-ID: <CAMuHMdW9XAn1RfkFpof0yUeYhfmQOnZMSNBAA1rQFBNX_Z3TMQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] arm64: dts: renesas: r8a77960: Describe PCIe root ports
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_052941_132228_A38337E2 
X-CRM114-Status: GOOD (  17.39  )
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

On Sun, 18 Jan 2026 at 14:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add nodes which describe the root ports in the PCIe controller DT nodes.
> This can be used together with the pwrctrl driver to control clock and
> power supply to a PCIe slot.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

