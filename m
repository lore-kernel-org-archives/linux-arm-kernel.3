Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D56C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3yNCiQ2xZIUlAriiD3kuROtqejdF4LbO3lrN5CP0pM=; b=0G6Akos53SseRALPBQThUorpZ+
	4q+zSuK4hW6NwaPxq+WIC/2+N7D58wNN9hIXIwxhlkjkKwF96GL6zZZsR7qKPsBStC0LnNy/F8OaL
	PzfLB4ue97W4SfPO0a7YlUlH+zUFKtbk+CGToGfOp4axibMypYajJkszqUNFbYiwi4f1fBT51f4a8
	EbjaUgZ6wAq8nodSewFwVIAERs+3HKaJjUem6YAOZ+Kulde6/Qaqq85PhtIUsGfTCLDf2lwRX9qcW
	Xb0HOW2yAYyv5amreri/HRlPAqTPLdBYLxi1EIxdT/TAcjWXCo8WtanNJ5rYnePovvbhVvDJhRSer
	JmGOffAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPAp-0000000BmV9-1Rhk;
	Mon, 10 Aug 2026 12:32:11 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPAm-0000000BmUd-39FI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 12:32:10 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c3fabe908eso501640e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 05:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786365127; x=1786969927;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x3yNCiQ2xZIUlAriiD3kuROtqejdF4LbO3lrN5CP0pM=;
        b=Np05so2J4sobiUnsXQ8+g/Nu3xsPhjygM4/U870hVKI/pwcG/oV0oZVTXrtOv7fxF2
         uHpfKXigzaxBh9ofeJYzXMaBConANZGRsnZPEPJ2LEuipzNbMIwGmfw+TDBWKHbFCFfO
         lwWq6oD2aosHtqg1LvG6xyUMnG/Az90mT5EAXat3v4BFRJK4vREgkB2NZ22UH9LMiCca
         iVt0vRl4tfdwT3ocEo7Jd31Dxn0ZxaDJOa64j9yG/zmosOP00j9a52XuZJEvZ698mMdo
         MaEn7SamjGAJHtrGfkqrfTGSV2n9Fzg2KBcVXPkBPwOMFKx4ck7TeFTqFV9GI6Jq4ohK
         Hnvg==
X-Gm-Message-State: AOJu0Yy6M/Kg64GRqWKopBe/vKrqiDexRgtl076Xsp7FXQrjsMdlJSiQ
	RmQ268wC2pbs8naGKCFFrcgtGjwNaLLNNIKvxTFB9FxeR7/sthLEJJQQMVaYl4iQ
X-Gm-Gg: AR+sD12Ia77f6dDNY52SwJ9FC+DhJ/2VZcffQ9o9WSaD3IW6qEF0zBZfAQ//5yiK0P2
	6lQx8IWkwYnq9oIe07TOBlPp5rcK4uozjoQW16fRE5E9BuMesX6xhsdy7zCtzFFqIx5Al7eedml
	Vnrcrc8NXgGGfdkMIMuHElFbHShtaGXBQZpYbn5AubJYOiNB3ZJLhy44Ovjtjst7pzz9P+6JFJa
	pc6NHXtbOhVr2aPw+tuEpiA2PQfq6w0+W9HXeOdrWNaNiTwiiO+CZGB+TXnEQdpe1TYTjezthUH
	wF67pXQk9MrS4WrmYg7FGNUTCbK8wt2w4HmCDLCDGHAV291248n+4aDQ3/7ZvCcdCjShaw4NXK+
	P2tnCHG0rV5pYlLF2mwgtcNIhGDLjSqmD6akD7hJFyTrQd+kP3J48QoVvs0AI0Ufb+/7Ex9+csp
	CThfla+92RRMsHFCCUlkzlWfaFMzLJKdeh3K8L6pToJpmbaclUTYUA7FU/cwi5xbquhdLGRRVeb
	FnAWpeHXBVmZfuLnIp46ym9jOK1pGIh1oJL4Q==
X-Received: by 2002:a05:6122:d2a:b0:5c2:d98e:3975 with SMTP id 71dfb90a1353d-5c3d90facbfmr5306237e0c.5.1786365126755;
        Mon, 10 Aug 2026 05:32:06 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40b1a8007sm4276494e0c.11.2026.08.10.05.32.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 05:32:06 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7389cff36bdso187271137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 05:32:06 -0700 (PDT)
X-Received: by 2002:a05:6102:2926:b0:747:4d96:dbb5 with SMTP id
 ada2fe7eead31-760e8b29c2amr8941171137.12.1786365126138; Mon, 10 Aug 2026
 05:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260705125324.13519-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260705125324.13519-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 14:31:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVtt6tNDRo3J1VRwx3Upsa2UWGkK9qqGXr7232AyY864g@mail.gmail.com>
X-Gm-Features: AUfX_my8_Kr3bd6yUN_SBO3fPdh69-mPfxOjVFEEVS03N_MOz4fZs0mAtI_-CGI
Message-ID: <CAMuHMdVtt6tNDRo3J1VRwx3Upsa2UWGkK9qqGXr7232AyY864g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Always enable edge
 connector I2C busses
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_053208_791044_EC0FAE07 
X-CRM114-Status: GOOD (  18.75  )
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

On Sun, 5 Jul 2026 at 14:53, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The interfaces on the edge connector of Retronix R-Car V4H Sparrow Hawk
> board may be controlled from userspace using matching userspace tooling
> that includes e.g. i2c-tools. Enable the edge connector I2C busses I2C3
> and I2C4 to allow userspace applications to use those busses and access
> peripherals attached to those busses.
>
> Co-developed-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
> Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

