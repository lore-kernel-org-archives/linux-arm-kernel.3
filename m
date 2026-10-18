Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D853BCCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 13:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhGyumamsbJwvfAtfGydBWyfBrT9VHxtfq0yzwmUVgA=; b=CNfWdZyxFLE5bweEUcVzgwZ1lI
	0egZGgpDVvHK/Hq8Jp/nu6O0sDvL3ZLzXy1j0TU4VLsAtNaDTLWzDgGNDRTHnkC1CjYOG0elGoSw1
	txIVPt6lTM6Mk/hqyZLWBMhcyR50IXZPpiW4D/YbQ14LF3LQ20y5QNK7xMCtkb2A+c5OmHRb/RPXi
	woUPPK+EU8kOrE0mHvya3HQbrE25J4zq43/syFdQcnoq+0TtiYqisjTLHB06feIpl6m5kDnONRVO4
	Fn+J3+ZpG05omtDkIQ8TJW41GAHmjT66PXHxa2UvN3JqU3ceW1Coyqu+b+gzJlzE1hlAbyPnBzoyU
	YtEy6Tgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIROw-00000005uma-2wOq;
	Sun, 18 Oct 2026 13:58:14 +0000
Received: from mail-pl1-f169.google.com ([209.85.214.169])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIROs-00000005umC-3tE6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 13:58:13 +0000
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9d7791b00so1294205ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 06:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792331889; x=1792936689;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fhGyumamsbJwvfAtfGydBWyfBrT9VHxtfq0yzwmUVgA=;
        b=OXPhsnAKERtFp0xYLM/6TXtIlvoYkANA3Z0K8pwp+tPhVBRdTDuv3ge7CBhL3sKXr0
         1RuCgECgFK45192Tubms38ztfoxE8im2tr3njVWOWkQEBMvFU+HyRNUIzLAI/l+v0Y7L
         r6qKywDfStUZNyAVM0gUMcS0hKMDo2InGEeyr0DMXcY3VkFBxXVYM5UTYJE5tmtDaVBG
         J/xe7eoHuyk3i+UYy/e5jtRBQLquGrsi5Tth3co7M3RhKLwmk8mCPqiqqmFmnbZuQp8i
         sOUb2/GXY7OakYMJKEFatkzfb8aAclnhYmDWIgt4rKoLZPInGj5848biX8hcEmb9bBdV
         icyA==
X-Forwarded-Encrypted: i=1; AKwUvByHcewLSQUav0pn/18xiI1qw8ec9QyndupZIJkGVBj33NS7BFa6IbOwx9lORypbTaOcOEWGYSSjjHSiA+eNzBsK@lists.infradead.org
X-Gm-Message-State: AFq9FYL8cF1dQuRO6SpSXrKgDBdAjixmd2qiyJtwQkdWdfe/eN5dpXYN
	IaMwugiimAjll+AoPGxI0DHwZDSKwVZwLyQm33w3nrLHim9d3uSXcRoFXdbkbfe4
X-Gm-Gg: AYBFou1TJwXCS9AwujRlREv4/UJ07TiQ4doCv6QvU2rTnBFhmTZIMZYh14orCy7W191
	lTjxHROsxUDicV0vCZQwlo/dnEniAeSzE5pf9rTOk33hi8m8JW7ObqjVm9n4qm4c5F1BWBrkTeW
	omBR/2197lJxYw+QG+NuhgjBExA5AArmlHRLDv81K4mBrbYQi7LV5k6l0pSfxW4UhKdCR1NyWL8
	A0QSb9CTn3WEFMP7eshoprbhBkSQQ1/UjqoJ00SA0Ab6MV3i39b4ljrc0aHr62Tj7ZfVk35jNHe
	dDRF2rmoKQrulUb9cEQ4IYU4Gogcivnx3Z/U102fihwQ6eK1xRK3fHERCPg3oJJPE7P/x4Y7T3a
	l4guT47hut3dBCtryToj/qaAKIAa8397kX6bqKX4H7e/HWccLmLYa2umBV97OZXZeeDaxsPXj4o
	ApYfHN8kTp9eHHAFZIzUqq1tOZjxMKrRdiRUmaafwARqFOYlMN1z5//jqrvDKH73QIYJ71EIyZW
	AoQqb7De3P2ApMIy1rHxxlPHhqtczULj46eR68=
X-Received: by 2002:a17:903:4b4f:b0:2e9:9524:b004 with SMTP id d9443c01a7336-2e9a7154e1cmr41827675ad.59.1792331889193;
        Sun, 18 Oct 2026 06:58:09 -0700 (PDT)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com. [74.125.82.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804d6esm29202745ad.14.2026.10.18.06.58.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 06:58:08 -0700 (PDT)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35b2c599f43so2987210eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 06:58:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwguPa2AK3kv00OXm5TGaDiN/JhBGEbbVZHG7XpR7mjkzOpLvwy19dwBLyKYj5plaHLOsV+G0kLQnlNZ/WXSRrD@lists.infradead.org
X-Received: by 2002:a05:6102:5249:b0:7cc:2a3c:9a33 with SMTP id
 ada2fe7eead31-7cc36b49079mr1291606137.34.1792331517781; Sun, 18 Oct 2026
 06:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <1d7da50cfb58232c6dd4c4afefb938fd7e62fdcd.1792163045.git.geert+renesas@glider.be>
 <51d8ba05-76e5-45ab-91da-3c6cb02505d7@mailbox.org>
In-Reply-To: <51d8ba05-76e5-45ab-91da-3c6cb02505d7@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 18 Oct 2026 15:51:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVzX8fd4NDQi8ow0m+48g8p-LBHMysFi+fOqp1oDtT8LQ@mail.gmail.com>
X-Gm-Features: AclHuK8HjL2MgNJEhgQ8UPYzZV_qfVLea-QA-Rw_khapKdsDEf1HaCakMPT5y5o
Message-ID: <CAMuHMdVzX8fd4NDQi8ow0m+48g8p-LBHMysFi+fOqp1oDtT8LQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] clk: renesas: r8a78000: Add clk_hw to clk_map
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_065810_991990_AA0AD7D2 
X-CRM114-Status: GOOD (  20.71  )
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

On Sat, 17 Oct 2026 at 19:34, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/16/26 5:55 PM, Geert Uytterhoeven wrote:
>
> [...]
>
> >   static int r8a78000_cpg_probe(struct platform_device *pdev)
> >   {
> >       struct device *dev = &pdev->dev;
> >       struct r8a78000_cpg_priv *priv;
> > -     const struct clk_map *map;
> > -     int ret;
> > +     const struct clk_map_in *map;
>
> Super-nitpick, use reverse xmas tree ordering here if there will be V5.

I believe that's already the case. What am I missing?

>
> >       map = of_device_get_match_data(dev);
> >       if (!map)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

