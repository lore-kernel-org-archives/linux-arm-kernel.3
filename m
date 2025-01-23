Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B85CC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 11:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywUpj3PvGs7O6YC27wxHtXRfoNnEiXLhmb6FDXD8qK8=; b=0t06d6pqvpr1O43EiBYaokouvW
	+oShb221eAfmdFWo+N15GD3lOjBa+BcgjcBxdbkWwtAxB70VORnDKjsu0xGXG34YlGXrogN/34fnm
	DUG0WAVIeR6HNzyNdYxDlY6SZOzBcqoWJ793XMU/vMnzrukLNaMyM2d+z0fItmbcGrJWW/5lHtC8c
	FihHBHr6gru+wu94rjSCMNA541ep9QX6RF0BdrtArCuMLn5XGlmGWAhnTtL946Ff7dUbRwV4iJtSd
	d79quqeijz+Siz4Wdf3Wqm2zqscm/IF5vyiU2D89MFjgnANrrf3tTwN0cQUC2VLJUhMv2aEE+fBv3
	bgnoXa0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavQL-0000000CKgu-1byy;
	Thu, 23 Jan 2025 11:31:01 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tavP2-0000000CKSJ-2Gqm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 11:29:42 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53e399e3310so911354e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 03:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737631779; x=1738236579; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ywUpj3PvGs7O6YC27wxHtXRfoNnEiXLhmb6FDXD8qK8=;
        b=womIQ3GEQHk4zmZST5qmfjIOR/a/m3+zlu/o5zxUIBrCq6g3r1faRzfnEzwpbcKoM8
         8EBpPSmLqxBPM+HT2I/WaZN1pir/gJkKJdeG8tUatxIMFCnPT0mM67f00jLI1cml6WtF
         Uu6J6AlxH64AKCF0k2CDCKIhpi0ysf90Gy5pdB0diH5fzQHqezEOYcoaswB90thdNzBp
         1rWPWt+JW/wuO4yd74um4J5GgNK+4Edm7omfRo5gX9PQuOZPB7UUpBW1ER3F8zRQYJbl
         gjCZxO3yGjK08tiebtCHtcHvv/sKszUMi6qx08YbinIc4w1H5To6UG92jSneXeFr1VPr
         +k2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737631779; x=1738236579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywUpj3PvGs7O6YC27wxHtXRfoNnEiXLhmb6FDXD8qK8=;
        b=VI3ny3334+ZIca1e2GOyixtasqDjozXp7xE379NCctIxpv8UXmAGQvsdENestkdZ4j
         mbaGsiswkgYwWZKuR42Hf+exXNUXDYWVMpUqj6KXgr3Bag3eZskhN9HJs8DrVS8TMspe
         WAF0xJIckvxlEeu8Ouge7zC8fwNgUW9t4X0U676cXrkx/FVd2uMqr/TNUgffM3iqiDKL
         O0WEhvLauypmKhVMsfZZbIs6++H2FR6Bom4OZuwD+zZKb4M43s/wN/ZFDshoPZwI2jCV
         Hi5EGtwDpg1EQRrS4crkElgh2rKTxRd/n0LZvWIrP3GYGUJQqbKvlQW4rh3AynFLfZJE
         QsUg==
X-Forwarded-Encrypted: i=1; AJvYcCWcCF6OT+J+rN0sVuI2QHPjsJhy+upxfupljExd+bEjeqfOwDc7AoADCE6S/BEKXkArj7LhwoS7r1nOhYSa4Jy5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6MqO3iLrvI2q8uDcvPXn36gqTCKo8DZf7kwg2/mEZRdbDV0e1
	PMACNcCLbkMhpjp0YgQkz5NSq0uy8ELmQteBvBRZ3KhOBAjRLXdRiD1Kf+tl6ZE=
X-Gm-Gg: ASbGnctx53QR83CA3BvzztAgUB+Xij8Tp39tBZcVjDzme4h6qIR4g9SCcOFX0QYaLu4
	pEFhr4R/SGBHFGfhFXZNibQBVWbqDuyioAU8YsbDHZJ8p7oFFQfrJLP4Od9Ma5HOYUuheiChua/
	aPtgvNNV6IfEU1LZl+PoV+gVS7cpiXiA/o90hZkSUN0zSG/ZY/JEJ6gRflXbBB2yxLFgNaeScEc
	ep5DaLgmqlH6g+xS38Tsp1FQ6SL0rJbZgjMtsfS4WbixBiSv4gPSS/kQr7SJOSeWXMVaC0CuqNK
	PA4dKfrO5v86PQF+ztAPLA7HERt0elVrMoInuNv9OH4OtAhOrwWmTAVBXJkU
X-Google-Smtp-Source: AGHT+IH/IRIwigEV36zPfTMvutci/xM95ud1AjoiE5XvAxHbcLlm2/4wSeaGwe0S+EmSvBufcEVLsw==
X-Received: by 2002:a05:6512:2346:b0:542:297f:4f64 with SMTP id 2adb3069b0e04-5439c280a83mr10948852e87.43.1737631778565;
        Thu, 23 Jan 2025 03:29:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543bae0ba76sm771974e87.8.2025.01.23.03.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:29:38 -0800 (PST)
Date: Thu, 23 Jan 2025 13:29:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v6 11/14] drm/rockchip: analogix_dp: Add support for
 RK3588
Message-ID: <k4hno2c46ys3unusw4emhkevp3yezhtgyy566vfyfju3efyei2@twict2pypjug>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-12-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123100747.1841357-12-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_032940_571048_7C931A84 
X-CRM114-Status: GOOD (  13.60  )
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

On Thu, Jan 23, 2025 at 06:07:44PM +0800, Damon Ding wrote:
> RK3588 integrates the Analogix eDP 1.3 TX controller IP and the HDMI/eDP
> TX Combo PHY based on a Samsung IP block. There are also two independent
> eDP display interface with different address on RK3588 Soc.
> 
> The patch currently adds only the basic support, specifically RGB output
> up to 4K@60Hz, without the tests for audio, PSR and other eDP 1.3 specific
> features.
> 
> In additon, the above Analogix IP has always been utilized as eDP on
> Rockchip platform, despite its capability to also support the DP v1.2.
> Therefore, the newly added logs will contain the term 'edp' rather than
> 'dp'. And the newly added 'apb' reset control is to ensure the APB bus
> of eDP controller works well on the RK3588 SoC.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

