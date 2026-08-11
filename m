Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457B6C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 12:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoVTJmbd8yKwYcWWlgS08ZgHIJGke3bvkQlHT1fmSY4=; b=URHC4LI995+W3coMhdoftlKQw4
	rvYiiv6sx8xXuUtF+DvkOZJds89vQN8wLUZsE0UBn3+P1eqcBB0RmCLAM4hlF+GcLvOkWzh71Uecg
	eRbjsFAY/SEXH/rr1hMtIl3kwTuTNCcegJkA+odWYKnpmobdQIqHOEsSM6FM2TwzJru1oWDPSq4f6
	NRUWs10a383PUxvIF06mXCDvrzJPy3K7LDpAAwVyu4j4NVHDzL+hrxSEi1f11QBlS1QTGqpBs6IoP
	DJrhnWpRNgQCRJ4VGd/bRp10mQsdBSn0t7UgQrT/bLIkhCjfH62u6Cv4FB6aMh4c2bTbfcWcJm/pb
	mrJOe1Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlIh-0000000Dz3G-0ECL;
	Tue, 11 Aug 2026 12:09:47 +0000
Received: from mail-ua1-f54.google.com ([209.85.222.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlIe-0000000Dz2C-2hyg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 12:09:45 +0000
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9773c6ea885so652606241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 05:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450183; x=1787054983;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uoVTJmbd8yKwYcWWlgS08ZgHIJGke3bvkQlHT1fmSY4=;
        b=i69QVIuvNRL3j58vg/BaHmOzgIT+8Q1EEQakRWFCNgxr82nzn3ogiv3+U+zqaitVhU
         WCEIJjbldbCRoQmJPoJyE7bDM8Of0aZpu6WCBQPLuNEgLnA59eCSOIMgYymNLrbQe4PY
         zBqAptz7yz68AP5Mefp0oGq/7QvACyMEf/DsCwIhe1Cm/Cy1UxS5rCqhxh5PhZ+JzwOU
         4DXn1T8tACg2fJa1hJZxKd5CReBYK0vZ41tgj2CPwViF8EFyYLnH9gBF4dR3l8+ZUU4a
         gsvlbxBL4jkQqnpEIPZvs+jkY4o9vmvA59HR/gt0dtv6LxE1ewIJZpsYSQL36QpUZ7r3
         DYeg==
X-Forwarded-Encrypted: i=1; AHgh+RrnggWgxr/RvAYS8AS0nmaehxQQXSStX60Jym14T7TG28KE6ZDFsy7yPC2GfQ90POoYiEGRDTIR+Hr2bByP6Bkd@lists.infradead.org
X-Gm-Message-State: AOJu0YwWK+nDEfjBj1dkn0vYFzyivwXh9lqLMtGKJsOchP0Z9q5WaTsp
	50E7OQe4OXhfJs2Rhd5lOREfBgL1ZNHzr16/dr89/6QEJYHrDpSTupdF3YFB+Ik0
X-Gm-Gg: AR+sD129n/0ZHDHRnXgNz3FdwV+evO/1h/chc1FKL9wQR3V9SmcxXWfhjm2fQ+bw2xu
	a0Eaa/Uyu4OjeSMPg8yux/6xbpKPmhsadOBXTnCWUxRvqxhtewhTtWkxfyA1Yn/NjOWO3gunqO9
	Cz/S9jdD7MDJ6UE1l/YUlhnYyK9RR9vuv+FkIvEZeoUI1ldKLUPaN7brjo/qDRCgNr2xTvLd3io
	b6I89G2LakbOPyDZP6xO0+ATkne9u1j+eEYTSLul1Yxv7pS0xUFjjFqff8gEki9auawVOGEvUzP
	4kJuPr+91Uijltoq3pmZ9OzAD+dSYFH1B46ZJzI4sHtn/Eg0ocrknLZfY7NOSzVcmKkqqz+4upy
	g8wXRqDKd0f9j/M53ebIdk5aNd2GkYEBCB/+rxHHNp9c6vJTTPNEGqUOqe6RYeg/FV5OiDUoowH
	ZkbCKfawohqJtgPBUNntQZiIc7U8jO04M2nbFq8qu51afgUaYdFh1KILtmg9LD3kpPRs1r1A/jY
	oukvaCJvDQsIrYIdInGXtn+E8ZAvx0fMADf
X-Received: by 2002:a05:6102:fa0:b0:740:2d81:c2a2 with SMTP id ada2fe7eead31-76b573bc4d4mr646608137.10.1786450183268;
        Tue, 11 Aug 2026 05:09:43 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76b632912dasm390945137.5.2026.08.11.05.09.35
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 05:09:37 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-745659c70ccso555914137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 05:09:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro4dH5qoxeSadFRoVOTnlolj9YyyAIi2Gd/RaW5FFiZeRFQHcLYxvU8DQb0exlgVdQmuWN7+iefnDPNvl5onBON@lists.infradead.org
X-Received: by 2002:a05:6102:15a3:b0:738:cdc6:f59a with SMTP id
 ada2fe7eead31-76b573b9e9amr650405137.9.1786450174738; Tue, 11 Aug 2026
 05:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
 <20260724-clk-provider-simple-clean-v2-3-56f306156d25@baylibre.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-3-56f306156d25@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 14:09:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW15QrpUhbra1Jg1_8rQWf8CE5TQiE5SUAsqvz5YmEwpQ@mail.gmail.com>
X-Gm-Features: AUfX_mxAADqzKHeccKVpUAgUM-G2gOwUTpW15Dago95Bl-ey6AOZpFlGkzHgs7Y
Message-ID: <CAMuHMdW15QrpUhbra1Jg1_8rQWf8CE5TQiE5SUAsqvz5YmEwpQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] clk: renesas: clean-up simple provider misuse of
 the consumer API
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_050944_681005_7214B8DF 
X-CRM114-Status: GOOD (  17.67  )
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

On Fri, 24 Jul 2026 at 11:04, Jerome Brunet <jbrunet@baylibre.com> wrote:
> Clock provider should not be using the consumer interface.
> In other words, a provider should not be dealing with struct clk.
>
> This change targets occurrences for which the provider uses the
> consumer interface and corresponding clk_hw interface exist.
>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

