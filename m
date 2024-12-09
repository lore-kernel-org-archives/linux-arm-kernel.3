Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3640E77181
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 23:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+opuRzsTQ7K1Ei5kmbovGQpDBWvV453DJpnISWYK7E=; b=1IdWECVZJIY4h0OOgDbnaNd1Ws
	A6sRDCPnFTpjeJ8i17gJ5Hf21jTuQzAo4JjbdbOLuJ1y6a6ObuDZ+JvQhY6CMkfwBfKK2J5Ag2zeJ
	xDHIVg1nwzwSa0jxHloQbQiCZ8OICsSxVb9Bfd5OV6kVvNjgNEkhkpsKcd+E/4zvB9vqLaIPUsRe1
	LfNVmuAGWieypWpHrAGg1kSEZ58BE0pBYQTVZEIrgxuVpKdqcx5bpPKdKTA4oghdG85j+bC96CAbX
	65NfN0j4PMrvom5nMMdaUYDfdwk/SLAihglSVUl7gOuLId+NQnvDQZkoDwlGV8wxpocH5XiV84vga
	3qoh81Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnVq-00000009cNZ-1CBq;
	Mon, 09 Dec 2024 23:50:02 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnUn-00000009cHh-1y4O;
	Mon, 09 Dec 2024 23:48:58 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4350398046fso967305e9.0;
        Mon, 09 Dec 2024 15:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733788135; x=1734392935; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2+opuRzsTQ7K1Ei5kmbovGQpDBWvV453DJpnISWYK7E=;
        b=XgAr/lj8W7qLKOMjSO7pdfIU1VeFT2Xj2pOfIzir7DID10sehzQmRYpGP+keXFymV2
         h++p2XASAH63NXF2IRGQI3OjcqZ+Q0ypc+Gv9n9M/MvU2NT2sGzQbUcziiAuPA10wGDR
         wIUMjqirgbR+ZjdxA3yM0phjMNA1JEzNG4jNm8bI8uFDk07xtX3WFRCAZZZDYVDh+HYH
         hnwallj1FPoMiE1OD8o3xTO6o2Bk26o9wd0apRY+ll0ugJp+DWHYhnBHHjO8PeqOVWDI
         tiALRMJpj6brcTrC1DF/MMVMJZH3pqKVTmz8CufpUoiwHlkEY7QqXW9sX/xjsvGD0aG0
         rLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733788135; x=1734392935;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+opuRzsTQ7K1Ei5kmbovGQpDBWvV453DJpnISWYK7E=;
        b=wyTTH9wP0LUwMeHbBWK/oW54K49jBABXpMwEKbUJbQ50Z24s1xmA/URI3fD+LCaI/8
         TqzgM+6oObQrsMgVc31HyCHspjK3XQBcs41lzjNzuhUyucC+QYraB/8tTn9PKur5PyZI
         QqtW568CcttZRSkLrs0UuNOMA7Ckpva7fiJ3vUX3NeM8dEbj5ivlrHHMVgZ05S4vBWmB
         ywNiXC+VPIbfz/emZT259pb5IvIltZYbXA5QpKYLmwNc23jpyhWApwiccebTrlriSDX2
         4uXLIsSK5brr2Cz5rc67CShq3oSSmvmSEbOOXEOectGBPmvDaq1hDet1oilCaPrTAvOj
         APwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCBcXmmHwD/t7CWnkQP1jdsWygoJmm6EpRiPp2ri+V4x5gZ1ihowPZxyiAB/SKKEga6wNPiHaUjBVu/dLpgPs=@lists.infradead.org, AJvYcCV5e2OI35R2y+lXW7isutvX5hCheetX7iJWMn5SDg2GT+0nR+SuRG+IG7daco0tV9MVJqjM06gFiey6X1sDNXbI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0eCzxf+zieAUP5E5Ce0axlWahMXyl+p3a4emeeEahbehH5OU7
	OKwqT3MymhYAEpf0f1Vx77GONmT7hGGi09vtvZRNr1U9ChYkGSmv
X-Gm-Gg: ASbGncuRoccMhgh7MXJWZB8KawpUeM90FNW4B/6d29R1Y9/pkYYRL5nGK0IweAvX4RH
	5BOywRYBq7y53pwhph5r8ac+2qtLS70nyhvUV8IXrnU08MVuE7TIprFL5UStRZXneat7THs07/U
	TigNhLrcsX9ZgfLyi+Lt3D7zxvqEn6jhfubfbjx33CBihRnDgd/3icRwO6tajvhxMMEfwMj6Tee
	YHYGBk+ZTymGJEb+J/GdYzKbEBO5pS38mOXTnZ+LLfxHe0AtCG2zrFmc7K076O9+eQaIRYN96Vh
	28rhLVAOaQ==
X-Google-Smtp-Source: AGHT+IH9/KxJN7tPNyH97Gbd1yzXNSTFzl3Ym7oZH/K0A2GTk2oxeudvtllbhttHCkYsV4UVpV6MwQ==
X-Received: by 2002:a05:600c:45c7:b0:434:f297:8e85 with SMTP id 5b1f17b1804b1-434fff69f57mr25414345e9.10.1733788135304;
        Mon, 09 Dec 2024 15:48:55 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38621fbbea8sm14345085f8f.97.2024.12.09.15.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 15:48:54 -0800 (PST)
Message-ID: <675781e6.df0a0220.3c3d71.7a51@mx.google.com>
X-Google-Original-Message-ID: <Z1eB4tGzFOvn7ME4@Ansuel-XPS.>
Date: Tue, 10 Dec 2024 00:48:50 +0100
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
 <67577bd7.7b0a0220.1ce6b5.fe93@mx.google.com>
 <20241209154030.0f34d5dd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209154030.0f34d5dd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_154857_526270_E3B11391 
X-CRM114-Status: GOOD (  12.32  )
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

On Mon, Dec 09, 2024 at 03:40:30PM -0800, Jakub Kicinski wrote:
> On Tue, 10 Dec 2024 00:22:59 +0100 Christian Marangi wrote:
> > Also hope we won't have to request multiple stable tag for this multi
> > subsystem patch. Any hint on that?
> 
> Sorry I haven't payed much attention to earlier discussions.
> Why multiple stable tags? AFAICT all trees will need patches 
> 4 and 5, so we can put that on a stable tag / branch, the rest 
> can go directly into respective trees (assuming the table tag
> has been merged in). No?

Yes in theory only MFD is really needed (as it does export the page
symbol)

- NVMEM can go in his own tree. (no need for stable tag)
- mdio (require stable tag to correctly compile)
- dsa/phy (no need for stable tag)

So you are right, only one tag needed.

-- 
	Ansuel

