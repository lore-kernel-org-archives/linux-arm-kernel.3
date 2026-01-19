Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83996D29C3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwYpB7OUoD7RGVXAKZghgG2fL8VsvMsrJb3SXVA7oO4=; b=CzahdtvGPY6qF+lqChp4u/gT8J
	c1cf4/iW8ax8aSznurodw7cv0Ju1y5run5geUk4uWMFUX7nStj+bHwb2kWz9saD2RChj3aKF6Ganl
	altox1X6/TVRxK0QnRegck+egnGpEAhGFQbCPKZY82aDFaaqFmceldvA1bby43/952Fl29UiZpZET
	PIuOjNWeFv1IifhRCbxoLxHslqcEKFs8F/VTlZrg3ObAlcsqLdMJ6m7ZMSfqY20uTIm4jP0uDynF0
	1NdSMEFWDfai9au3bz8ZFS94EI51dIpp1nc7HIrjQO3VhfJoXoJu5IKP5q1LXQKxUd7L3uUj4DEue
	ZvIrZwdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrea-00000002PIz-3IEb;
	Mon, 19 Jan 2026 15:58:56 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhreW-00000002PIB-2pU5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:58:55 +0000
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56367b39e3eso3832589e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 07:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768838331; x=1769443131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwYpB7OUoD7RGVXAKZghgG2fL8VsvMsrJb3SXVA7oO4=;
        b=pzzERpTe6IcPmnwQmQr3JUGMAVt3/juLUDhZe0t2gMmhGeEF0I4RKXfsp3HRquKhDl
         zNOIYFT0cnR6gOIxV7JsXFizguSrlSpVE5jel2ePsVPG7HNOxCDDCaljd8CFg8KIOPQ9
         JPtkCrNwXJ2vTezApEEhmWUy5aVRXnfY6T417mMPTfqKtaKBjMe+hubgCiYT0Q6EAXNs
         lcdfgFBVFJs/DJbh58INAQRrR2/MMtCuIvxD4v5ymelxDVwaCR7wKXZB/wlwRfB+Iowk
         d6ItbdSN6OMHTy4JQS+zf2FDPdb6ksdXqythLTd+XDTwYaoPZOKo/xXhXlQfObZrh2yE
         SNMw==
X-Gm-Message-State: AOJu0YzQ/wqaHPQpCKwnsdVNdUway9FLp0KDQXWqckyoduamIklM6b+K
	6vfRU5aI7IQuUiUlyO2tWfAHdRXB8xkyrVSVLtzSa9YdJu4T+uqvQh3lsnNkh0Uc
X-Gm-Gg: AY/fxX7QMxsR54tunC9u/pnvkwtsbUtpCN6FCARgwBio/wp4FqQ5phQRulB0mRARBcP
	UzawgZQG0gAtI0NSDe3N0pzGTVZsms3CCFj91GgDl+r/N5ai6EhfdVwc90LxLp6BVd8F/TtQd53
	e5hhlzRxI727OJR+wsK912hjyPW1gn7bJZdx6/w46a+YCrFRsnndhpD15ECs0+kyZ1oft2IsvBD
	PuLH8OvoLDZv3w+Wr8mZEaEQo+z+31pV9vQSuFvubgfXTQ1WT8ZluGOYqtZHRLmNbLtyEA8PSYQ
	eYVg1/hlJ/aEtr6ul0uhx5zhOHle+vZrFwHDzBd5W/j/9a+LVXB6sNQiRRqa//vLQrfGLPFWXbG
	+HE0UuE+XbSRbM3VzZv/urRgtHpPdiuZBntGz3nIeu8fVg7G9pVTxfg36rC2gCfzXnB7m4vhUh7
	70VpZPcD2VHrZCKzAhfo2+5iLYasfCz0GJ55FvwCEGAf5n663k
X-Received: by 2002:a05:6122:3b81:b0:55c:be5e:e9e9 with SMTP id 71dfb90a1353d-563b6307edamr3827493e0c.1.1768838330639;
        Mon, 19 Jan 2026 07:58:50 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b6ffda3csm3035773e0c.7.2026.01.19.07.58.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 07:58:49 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-93f63c8592cso3756876241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 07:58:49 -0800 (PST)
X-Received: by 2002:a05:6102:3e96:b0:5ef:b32c:dff8 with SMTP id
 ada2fe7eead31-5f1923fb2c1mr5628745137.5.1768838329404; Mon, 19 Jan 2026
 07:58:49 -0800 (PST)
MIME-Version: 1.0
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVyQpOBT+Ho+mXY07fndFN9bKJdaaWGn91WOFnnYErLyg@mail.gmail.com> <2b6f19f3-aaf9-4fb7-bef7-f38e19f94351@mailbox.org>
In-Reply-To: <2b6f19f3-aaf9-4fb7-bef7-f38e19f94351@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 16:58:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUfinX6K622_ThmX-srfq2Mb3CTHD-LdAR3YgDTZq51oA@mail.gmail.com>
X-Gm-Features: AZwV_QiA0q5O-g1daJUkKfsigh6f9aOP9tnmWWUeAh4TC3ZblJYVL42xTYixBq0
Message-ID: <CAMuHMdUfinX6K622_ThmX-srfq2Mb3CTHD-LdAR3YgDTZq51oA@mail.gmail.com>
Subject: Re: [PATCH 00/11] Describe PCIe/USB3.0 clock generator on R-Car Gen3
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_075852_711783_C288301F 
X-CRM114-Status: GOOD (  23.61  )
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

On Sun, 18 Jan 2026 at 14:54, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 1/13/26 3:19 PM, Geert Uytterhoeven wrote:
> > I do not know what is the actual issue.  Adding debug prints to
> > rs9_suspend() and rs9_resume() shows these functions are not called,
> > while adding 'status = "disabled"' to the renesas,9fgv0841 clock node
> > in arch/arm64/boot/dts/renesas/salvator-common.dtsi does fix the issue.
> >
> > Perhaps you have pending patches for the rs9 or PCIe drivers?
> > Do you have a clue?
> I believe this one should address the problem:
>
> [PATCH] clk: rs9: Reserve 8 struct clk_hw slots for for 9FGV0841
>
> https://lore.kernel.org/linux-clk/20260118025756.96377-1-marek.vasut+renesas@mailbox.org/

Yes it does, thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

