Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC7CF30956
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrCqdrr01xMGx/SCx6YPhCapPZnumyW3whTx771nk9I=; b=nK7lDyt+feMV4ChFmyjaQEBLWY
	qXgEOrCLFZtqjqydWOi4htQ9BYHBfQvk3TnpCXng0H7agHvJn9RSOw7WpfQLDlj/dJsrgioDeZpfE
	EE5A9WQERbsA/foDwB0I6LEJEt/DAEf5jSErWAA73hQrEnTX5GYwTv6nbCm1e+jXLSWjTV5A8sz3I
	4ZNjB0qIfSCgOLCLFVWh4137yEPq45CnzEjJaGoBZLa1Id1WU8mJl9cV9G6ykHQRujPe5fCkkG9Xt
	/TpV3gDdgMtdnNKm7Wezd22Nf4b9npPDzlfz539aiYaF1M8fOXbr42jps4cwFdIMbcE//2CL7m0KU
	G2vLW/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7q7-00000001lnT-0kfE;
	Thu, 05 Mar 2026 12:30:03 +0000
Received: from mail-pl1-f179.google.com ([209.85.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7q4-00000001llc-0XBR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 12:30:02 +0000
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2adff872068so38987755ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 04:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772713799; x=1773318599;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrCqdrr01xMGx/SCx6YPhCapPZnumyW3whTx771nk9I=;
        b=wi5OSxZd+ii/su/aprz4K64gWXXvR/ua5r6KDIky/Qi1AJbOs8NFz9KtXoeR4++TgU
         eaV/W88gMUtXDYMQgbA//qgR116Lg3eLfBx0R8RP0GQA4maz1GRuNPpSBiM5kB8J8Xy9
         b7aHILaAz+t8EAFfiDN9TS+ibpgwCtNK6nEautcLLfjR9me7qV8MrKnR2ENn5AwpXy4r
         +4Ihl1qUSHzJ4RROq/QrIajUO3b88QP9I+KNDqtUQ1TRqI4RnaV5H9t2D65H24fMpHx9
         coQEm11j6C9AiFZLZMAA2Fut6FOsHMYXjGWE3xkDw+Kapp9ajwQYA7vQieTuDNDRzXib
         q98Q==
X-Forwarded-Encrypted: i=1; AJvYcCUokftCIfdVHsSBYHbokPKnOp93JCdveSxB2SHZeN5fyb/Rafh6oqxg3mwNawQu8f7/8dJFgVkidRQ7/fbnectS@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ8xhqNPK96caR8wpkPe8DvqqGOvhs6ZwsUWfGb69Q3PVpgSJ7
	ZqcIqEczb6TKG4UB1lCmfyMDYb776+LLS+mnJUbGy5XRNYlOPHAqVGRV
X-Gm-Gg: ATEYQzwAJi84eNWvxvUBJxzvPdfFoUVWvC8JomQo3xX2M0qQe4+EA+10t7i0vRW4p2k
	9LAT+tUt1JSLIxpqpqANbroEaMlI0tHB8YwEUhvG2vpICY6Swolf1sSqS1h2wJvR2OB6Oov2Aoy
	EXuh5JA3HC99AJN8wDQwKBUf7UrXjJMXzAMDeWm6wt8ndmcNXzkB5ZUBXmmNEkDnoEa1Q+vT1sb
	xpuhmYuOdisryRRpOcRiMu44XRUGmnrOWDd1yjR29ROyIDecV1Dm66nyQ1XskoIYDhC0YG5SjlD
	Kbon9NZrShSVdBe9QnQTDB07kT+gsIyqHYBkt9dF8jeXS3HfLBF/4aNBQy+OjqrLJxjvL7F8IbC
	b5dA0bV36pYWjQ6wv+oopjjXM4gl50aewRPC9swOsPS9UHVHEUv1/2rrv4fdb2MjQ2y4eUhcBok
	0G1oHdkVQCi1NvnBlf9s09Q/Kws9GiWcsftRtIfxoHzmFcohW5Sv0akxPww4KiH5kvmb00O4HN7
	Q9TGNgUoN+VR8kE6Z3W1TurQw3fNplkyVfezBkhaAbucmfIYP0=
X-Received: by 2002:a17:903:1a43:b0:2ae:4701:3c31 with SMTP id d9443c01a7336-2ae6a9cc1c0mr59976385ad.11.1772713799017;
        Thu, 05 Mar 2026 04:29:59 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa43sm225561035ad.46.2026.03.05.04.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:29:58 -0800 (PST)
Date: Thu, 5 Mar 2026 21:29:57 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305122957.GA1652563@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305121532.GA1649635@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_043000_202619_F3C4664A 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

On 26-03-05 21:15:32, Krzysztof Wilczyński wrote:
> Hello,
> 
> > K:	\b(?:__)?(?:devm_)?(?:of_)?phy_(?:create|destroy|provider_(?:un)?register)\b
> > K:	\bphy_(?:create|remove)_lookup\b
> > K:	\bphy_(?:get|set)?_drvdata\b
> > K:	\b(?:devm_)?(?:of_)?phy_(?:optional_)?(?:get|put)(?:_by_index)?\b
> > K:	\bphy_pm_runtime_(?:get|put)(?:_sync)?\b
> > K:	\bphy_(?:init|exit|power_(?:on|off))\b
> > K:	\bphy_|(?:get|set)_(?:mode(?:_ext)?|media|speed|bus_width|max_link_rate)\b
> > K:	\bphy_(?:reset|configure|validate|calibrate)\b
> > K:	\bphy_notify_(?:connect|disconnect|state)\b
> > K:	(?:struct\s+)?phy(?:_ops|_attrs|_lookup|_provider)?\b
> > K:	(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)
> 
> What about
> 
>   F:	drivers/*/*phy*
> 
> or something along these lines.

For content match, it could also be:

  K:	phy

I believe this would match everything of interest?  Perhaps there is no
need to have any of these complex regular expressions, would be my way of
thinking here.  Makes it easier to maintain, too.

Just thinking out loud, really...

	Krzysztof

