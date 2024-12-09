Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17159E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 23:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4za+GSZXfXk9ejvCCCE1cqr2r2pNcy2eq/BH59GGowU=; b=qQvvHIb/4tuvLaWJMk8JQ2OHta
	UvWiSbQ0Ge29e5l4RqK05sr4UrBBkNoIJJhTWysrxcUNnOlSKFbgg/p9XfpRnzxdatrSUHh/hOdu9
	tcVthluEg03HZDQ02k2m2HO0VoyMmmJyq3M46gsSjSPkHv2qOzUxuxndMF1xUeS2/X7Ldmwg7qHo6
	kHHj3LN4Gh4eAWj8dLl6fcDFr6MPxM0klKY3jhwj0uboFM5m7PG0xz/4y5bJi2zNfkkc/eAPh6WLT
	Icw4hT+yfmb7FmcwoBT4HLCxrz254gj4eRfFoa2Lnggm4gBbt9S/lVbKd2apzOUjEUbjjcnDL+Ef0
	A3FjwYCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKn6y-00000009YrG-2H7J;
	Mon, 09 Dec 2024 23:24:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKn5m-00000009YYK-3SPm;
	Mon, 09 Dec 2024 23:23:07 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3862b364538so2029233f8f.1;
        Mon, 09 Dec 2024 15:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733786585; x=1734391385; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4za+GSZXfXk9ejvCCCE1cqr2r2pNcy2eq/BH59GGowU=;
        b=TD/vMBpCLI8Q/Zsct+YNB0xb4zh4PmX6UvUYwC92T4WTM2ZPwl5+H56OF9edqKjTEe
         A0kmwsGahytEXLL4Zho77cBtI1YLeBj5NkkoJ9XEkUe4MtpoTASn0tg7FF8z1C/0EL4w
         1DY0gkTJ6FW/0ESN5/lQ3QQOIeYoiYNDOS32txTdVbvb+FDVMVs4FHGpSyUh+Ox7yWu+
         +KI55tgQFDPUTgFOwwTMaHpxtOx4R17/COzw8vKmMl4mH5mH7Fc0mbqGtqB2YmfP0F4B
         bVR8L6lgIIP7CtiLh8yFR0DNjeEpbtrfiRcRnkt/bhnfp5GClUFWjJGQMYf/Uby8a5dj
         nXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733786585; x=1734391385;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4za+GSZXfXk9ejvCCCE1cqr2r2pNcy2eq/BH59GGowU=;
        b=iiIAWoDSgMpBadwwaFpUSBnylweC0NvNUsj456Rh6AntjNjTuW4+i4DUFfBfo8Q1Zn
         yzEQDp+H4MRT3Oehj2rwGacY9M/R1e6KXA8EWcTpOhfMkTYXC798/aIluot00yHTwyTb
         5BiOuD88I+sjs6aciUjQiCmTUJtX+rr+iEMqwKWvEEwm5n6eLHFIFSctQNRnQoWJVSbI
         Z0iv7f9gS9rg7Cm8ImOP/ntMtOxUepFHxhhLjJeAldYP74vtYtX24/sLkJCwogIwkgxk
         X+pVeY2C+FFf4u339B498mynxM+DZDoRVunw0c8TEI42+ehtNaop3wC569xS+r3tpECK
         cztg==
X-Forwarded-Encrypted: i=1; AJvYcCWZQFReC5NGpEw86mZN3f8aikjKnGOaLoi0+V9BLTftL7qC00M9IAiLnPs75WlzM2ruTo+ZKDplrWRnlP+WR+Y=@lists.infradead.org, AJvYcCXqnql9EO29Nr0h33X9uzFcHWnYXMqIYhmt9W1Zn+ZenvFnQrfmkEtGFo9Fo4cu3cB+ScXfmb/fX5UsnxWPWTiE@lists.infradead.org
X-Gm-Message-State: AOJu0YzisDKVP5T3amTHthJ6ARrsZ5sWPG0l+zfujHX2nQnryhubXrIA
	RTfaoTqSca0wF8u3D7vnOTIRgv020K8x9ehHh+FsISbk8PttGVkj
X-Gm-Gg: ASbGnctYkrmWY157KIds2gZdlc1nynbjbfPt7wqdwuylXCv5gKzi6kmUF+wN0ceSch1
	NsuHXMSXz1/ZVx9Sp5oMkv7KbGvA8thxBmSPtG+GDSfXp3ZvajTo2heh8wDU9l+FmrNB06KVrgJ
	frJ/gcRCYWK2KdHbz0ajb+Rcopz/i4CJPctOc7Ca86xhjsUIgRW+Xyf22kZkMa5hFQUhd+sOHbH
	RUchE73RDAOyi515/Vs278wo6ZcntUUtChMQ6334vqvaLZqDHTKcHSNwxn+HG1ti4bBaAWKIpjj
	nNHMaLafQg==
X-Google-Smtp-Source: AGHT+IGcwzFHa6tjiFPLaKsV++wYg1Uf2gT5gfK3g5nqMFs22rDgHy9nqza1HTLsDkylobsAiFk1iw==
X-Received: by 2002:a5d:5846:0:b0:386:37f8:451c with SMTP id ffacd0b85a97d-3864699e721mr903990f8f.1.1733786584777;
        Mon, 09 Dec 2024 15:23:04 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f55733d2sm65178135e9.40.2024.12.09.15.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 15:23:03 -0800 (PST)
Message-ID: <67577bd7.7b0a0220.1ce6b5.fe93@mx.google.com>
X-Google-Original-Message-ID: <Z1d70wi6VzvCTIBj@Ansuel-XPS.>
Date: Tue, 10 Dec 2024 00:22:59 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 5/9] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-6-ansuelsmth@gmail.com>
 <20241209151813.106eda03@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209151813.106eda03@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_152306_859475_2DF2E926 
X-CRM114-Status: UNSURE (   9.41  )
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

On Mon, Dec 09, 2024 at 03:18:13PM -0800, Jakub Kicinski wrote:
> On Mon,  9 Dec 2024 14:44:22 +0100 Christian Marangi wrote:
> > +	regmap = devm_regmap_init(priv->dev, NULL, priv,
> > +				  &an8855_regmap_config);
> > +	if (IS_ERR(regmap))
>             ^^^^^^^^^^^^^^
> > +		dev_err_probe(priv->dev, PTR_ERR(priv->dev),
>                                          ^^^^^^^^^^^^^^^^^^
> > +			      "regmap initialization failed\n");
> 
> wrong ptr?

yes wth... I'm sorry for all these stupid mistake for this series...
Also hope we won't have to request multiple stable tag for this multi
subsystem patch. Any hint on that?

-- 
	Ansuel

