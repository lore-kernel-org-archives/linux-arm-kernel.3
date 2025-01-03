Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81188E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 17:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3sGG96edDYBm065eZeyOamcNy6jLfsRwq/zrFHXSQ0=; b=drJHoGXk/r3mBd5FOqiqSQGDQs
	dTNirBpshqIjikaNsyldL0mlzWRlendtXyuqLOnqdyRRrR0Iwz46W1yPactmW9NVlx4/avzb9eY9r
	nvj/x3CHYOKT16/V4MQO2etfv0wKd5hSIop8Pro5HjZF1ZDXMIeRm8s3tDlRtLoWTVsWE+NqWQB0P
	l0pZN9yvRfL/FHKQNtTDRwBfNxgNF3iHd3t8tU87TVbc+2TbVQnSbwUrA19jJsUz4dEzVK0XjEz6M
	EovmyoUnU0jmJpWWsGZ7JwDUtvPv1JznkHQWO3YWWy7LeKEMrnv0L/A3a9GCcQHCZIsAymgFTqtLR
	SapauWoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTlDs-0000000DWqb-2j1x;
	Fri, 03 Jan 2025 17:12:32 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTlCf-0000000DWjr-0TsA;
	Fri, 03 Jan 2025 17:11:18 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21634417587so18993745ad.3;
        Fri, 03 Jan 2025 09:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735924275; x=1736529075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3sGG96edDYBm065eZeyOamcNy6jLfsRwq/zrFHXSQ0=;
        b=S2kXURJKe9RUeqW83yFQ9AClaFAluExWACBdZ9w9NPa0SOU/0uuV33NNH3+Goy2BXj
         ESmIq/ogSCPv4WfxBDqL+twD+Mas0EkBw9NAx9k8mwn8RO5tbobWWaSq207BjkVUifLR
         udp2tEY8NYU0afUxbHeBdLyk9BGCFQcFS/f/cm+mREouJmSt3Bv/XU43hfJoB9zaBX9f
         3uDy4ckx00nPAFwxJaNZ8XxLaMmCMb//xgrE4oQUkR5gHDRQ2YF5HLR1zxYlRbk9ZZMP
         KqkSMcHbQcOvO3302rTH2JTsMSVnamJbQJm013sLMxaIvuGv4SzWNBdEdD19EwvvQpxM
         AjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735924275; x=1736529075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3sGG96edDYBm065eZeyOamcNy6jLfsRwq/zrFHXSQ0=;
        b=PFi5YzZ9p6UQ1Xk+IjjwNsStF5HwUxr9yYs+EoTbVguvzjQrmKm5xDGlbvcRI/ATi9
         N1Bg91PvCHUnYecTH/ConEo9FN/dAx+Pw68hHqDWbBB6peJpLElDvG3S455xhkekVa3w
         ev6Nb1d3OyefOoE+7w2kJP61B8HxNDQ2zkpXw1IJB1HK8ill8JAlGSO+1zEotjvMw3tZ
         JKMuvOaqupcvRJ0z9o7DSleatiCLY3V+WhBOPsuabui52CdSl8RYuTHiy4fh7peO+ANo
         2sxls4U2A1XLvxCnxkicEDVsWw6K7lCExX7WIZI2Y8/wym2xZCgwpqe6WHtzbD67XPvG
         ZKOA==
X-Forwarded-Encrypted: i=1; AJvYcCU3Ny+ECn2rYI//m73MxWPp3TmuIBv7PmaqLW5OfMp9H2ewihevRTwxcWlIT8JLFcSHOfUZeipORqLsIpUKZjg=@lists.infradead.org, AJvYcCWQsvJgV6PTfFlSmvnoIxiCWfxSUw1xqfq0SjOS8TzIzOFJzPm21r4mg3bH/iukQeQGLlrPiJSlcsdhIv7dnVkC@lists.infradead.org, AJvYcCWVZG2oAYki1FFmj1bDozifG3gIfXgNPomrELNQQ0Fe7blyo+KTBwoKB0qZr3/HaYH2j4IcZQx4lbL2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5R0qpQOJyXE2DsjeKzTk+5piJ5Uer6jML6Sr/0asurqAkH4Wf
	2HJoaL6LHRPs8sivwfxXLOdG6noJtuSzSeoE/TMGMq2BkoHBlOBoOfj9rhTY
X-Gm-Gg: ASbGncvXQGw3ohalzqpVW17Vwke0GUhUyikUUSNzhyUH+mHEjAK1mWap/W0dwXiyEfd
	p2ixSblnhsbgA7yBOXGznZ/+iOboMgv+KUhU0O0pWiYdRQtnD2rEJS3ViwFPy+fLXxLoYKJoJbn
	Cs+SkhVztbhkYC5XU4/5MNnIAUi8MNHA8LtOoD4EMtLyCPmPw+wPA7pQs6vlLMAThwRV7uJfsmb
	ruqJycBFdCih5SBGj1j8VpaUZ0NmWAKmZlmoSUKnKWUiAKCehbhHNt7yUrIAw==
X-Google-Smtp-Source: AGHT+IHaGe/LjiNSdE/jVrq+uumD7Y1EPcnlnPCnn5kWuhTZJ0mjsAtVuPrcS+bRilEu9IblZCkZog==
X-Received: by 2002:a17:902:d4c9:b0:215:8d29:af0b with SMTP id d9443c01a7336-219e6f2706fmr263642905ad.14.1735924275469;
        Fri, 03 Jan 2025 09:11:15 -0800 (PST)
Received: from rock-5b.. ([221.220.131.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cde50sm245783305ad.154.2025.01.03.09.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 09:11:14 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: amadeus@jmu.edu.cn
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jonas@kwiboo.se,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	vkoul@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: rk3568: add reset-names for combphy
Date: Sat,  4 Jan 2025 01:11:09 +0800
Message-ID: <20250103171109.2726312-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103033016.79544-1-amadeus@jmu.edu.cn>
References: <20250103033016.79544-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_091117_154853_E38A5737 
X-CRM114-Status: UNSURE (   7.59  )
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

Hi,

On Fri,  3 Jan 2025 11:30:16 +0800, Chukun Pan wrote:
>Maybe the merge window is different. Can you test the following patch?
>
>```
>--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>@@ -325,6 +325,10 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
> 	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
> 
> 	priv->phy_rst = devm_reset_control_get(dev, "phy");
>+	/* fallback to old behaviour */
>+	if (IS_ERR_OR_NULL(priv->phy_rst))
>+		priv->phy_rst = devm_reset_control_array_get_exclusive(dev);
>+
> 	if (IS_ERR(priv->phy_rst))
> 		return dev_err_probe(dev, PTR_ERR(priv->phy_rst), "failed to get phy reset\n");
> 
>```

Tested with rock-3a. This patch will fix dtb without reset-names property.

Best regards,
Jianfeng

