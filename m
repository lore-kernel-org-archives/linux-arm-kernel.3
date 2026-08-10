Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED54C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=; b=LT9ZRozEji9LH0zQXtGtLW8HeX
	4RN20F5zzNAgq72Pmx18Ll7ec1KAyaXimLEpVIEpRmijI8yk6vK3Fubzcwx8Y/Mou/0DVN8UAw0so
	3y7mQu1zEXwSZrGzxciZkyzojJlkmPa2ZjtoGti96i4cUqhUT3V7FSsQOXERwcaPH0zqgDJNUOmfX
	RbYef6Kp4wdhe/YvM9GywYLpM44L7v/1LyEnlO6eI7XKhyFGhiGNdFbDB3V2cC6SKhU2PVoa1gHHM
	vbzzImScT3CB3p5L3i+Pcge2yn/8lhxTs4ASrADaWZwEhTaZmJ+9+pwfo+A1A1HOONrT1zd+yJXuH
	9k9SvOhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtR8P-0000000C27N-0YCd;
	Mon, 10 Aug 2026 14:37:49 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtR8M-0000000C264-12Rb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:37:47 +0000
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c2ae02f69eso1545707e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372665; x=1786977465;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=SHGXnOp/nWv9vDNoDRzb0mO0Ql9mKhh5i/JxulEvxcoBccsfePMKJ75T4SBLCudmEz
         t9AcSwh4BxfoHSvd+2qOc3JQrKXILBAD8bewj6lzQqwPoFK4mj2P9YpYx3+fDyMSP+LW
         BbW1DaSVXf064j8NGHRkg3vys6DZGke2ND4pnfNfzrvW6wSIpoVGHjKj+pMMXJGj4k3S
         KwgJ9jxkHGQL+FyoEkD7915CKxGRY2cDVr39FkVYyHi0nwXzxmqMG2XT0PAltv+N8CCR
         tnvJ+1Wquz6vFa3D28XawRmCm9Z0YrkiBKCyBVZbh/7syvJ1aKVxOPaW6avuDhoDyYBG
         c/dA==
X-Gm-Message-State: AOJu0YynmJ67EhTlv7jcB9Q8oJ2nl0u3B/x+maYWLlUI34oykH+uP+Sh
	/5JQFYPvT0/DYVAFVgbt95ZtAhoLgIbFz2cdhxMIY18yF07wBsVHqppgzV+Yhwu1
X-Gm-Gg: AR+sD10ELTg7i4vCp6XhJkiI+2Yx9UQ7eiNKpCOYYeKFSQzAt0xg43ZQgqy2p1BWZD/
	+n/wyhDHqowQ4GoQBLn+3C8NIqH7wGPtkx0sCY/Xg6BQJAg5g8SCt2PisYaPRtz8gXAJBO6hqRT
	+IAUaL0W/0hNf8PtHBPiREk97vlJDNRHrwnhk7LV44IU/yYuQ3ROkfy88mX/wqpcw7A0aHjeP6j
	pwGKLBVhu+fjEGieZXJsHLfcFKGw9lTmoFTwAr3J/BEt9ypm9WHs7GW/x6BVF/CsdyK5niZ8F8X
	o0/ZsVHGycQxn46IhIPTHSCzLXbMkvmb3os4FIuSbi9EvrYoErIXIg9lupHgwgcoSK//ba/J8rZ
	ksNhUfsYrj501vOzO6g/lfXDpDEtsKKkdVIAAgTayPPeSuxFPF1J8Or07m6AiHfXCJo3sCnkWH2
	POyIp8gu+nrc4F7mMQ42n7twYZXeQeiGSCuC/18NeSm3WDF+rzZjvJIofkVkj85OxGgU2FZNn5+
	KuXgIGJ8T+qS2UOXrvQ8TnCdA==
X-Received: by 2002:a05:6102:6d4:b0:737:bfe6:3b03 with SMTP id ada2fe7eead31-760e8315fb3mr12027828137.7.1786372664910;
        Mon, 10 Aug 2026 07:37:44 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f303c685sm3575246241.9.2026.08.10.07.37.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:37:44 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-73b909fbb6bso1253039137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:37:44 -0700 (PDT)
X-Received: by 2002:a05:6102:5045:b0:74d:ce64:efa9 with SMTP id
 ada2fe7eead31-760e9951613mr12721738137.12.1786372664138; Mon, 10 Aug 2026
 07:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:37:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV8xxRd9dXL81KkbZ1EDFsoEe=scSVHFQF_vRWW7VtjjA@mail.gmail.com>
X-Gm-Features: AUfX_mxs1_ZDykWyS01_th2qlC8zb09CRRUvphOnXvBwUpf5EaZWE70oCbGmkLc
Message-ID: <CAMuHMdV8xxRd9dXL81KkbZ1EDFsoEe=scSVHFQF_vRWW7VtjjA@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm: dts: renesas: gose: Specify ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_073746_294374_8DAF1CD9 
X-CRM114-Status: GOOD (  20.14  )
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

On Tue, 14 Jul 2026 at 15:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
> the system wait after deassertion of the PHY reset and before start
> of communication with the PHY via MDIO. Opt for the same value as
> used for KSZ9031RNX, which is 300 us.
>
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
> reset high is at minimum 10 ms. Set the DT property reset-assert-us
> to 10ms because the KSZ8041RNL RM does not explicitly spell out how
> long the reset has to be asserted, but this at least covers the worst
> case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the URL corrected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

