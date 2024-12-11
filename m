Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D29FE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 16:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eiLZxyAdC236sk/Nqx7Ju43ISHYNk16b5WIFQxB0EE=; b=WljduPIk9qYspfbV+u1M3DPMUd
	cakh5CCr174w1ZHGtuXjYc8jXyq1Evq24Pk/a3g0h49mjQgwRA9DaQ6ceWlOmI+v5GF8E9ZqwQO7v
	sfyPrdoO7L3Znm4w5gyV3uP7Y9u97gmg+zrtOQv4gQn50UpMAd98g9cZrcuJ14utsVWwNHgvSYKs5
	xFn4+jEFefjk6WmhySgPdBdTY8BE6ePSs9VRc6ZG3MikUurKbnOjX1pEMv5UCQvRq8sbpgTshzS6c
	4oANqBp9dqj+7Lt6EXy7jU8FascU89r0Mj+e88mZkSAl7FRL+n7O65L7t6d9jQiTu4sRuXHoNMfS/
	ORiqWeAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPCZ-0000000FNlv-3KS6;
	Wed, 11 Dec 2024 16:04:39 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLP98-0000000FMva-0Y8a;
	Wed, 11 Dec 2024 16:01:07 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d3cd821c60so594983a12.3;
        Wed, 11 Dec 2024 08:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733932864; x=1734537664; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2eiLZxyAdC236sk/Nqx7Ju43ISHYNk16b5WIFQxB0EE=;
        b=khD/yiXZCRfJfsvJqgTf2Ug3Eu39GFSywYbquLHQSFsHTar38mBDS5DjJAvJKWdrvD
         7pqByShOGGUWDchdh/UT6IDZcECv3ts8xlBNZEb7RHZqWAts8Rft6jDBgTQ0XyNTs4AS
         6bA8Oj5G86d1FDLA1mFt9yx9nQnhOxGw5RTIA7o83LCqGiQ5dh54rYxjg7viwxCbGSfI
         8kfB4t52w/dYKi5R6+UYJ3v94MwFfp+xcBhKnz9TPlCAu10b/jdzkGmP/Li+LZKFa/gJ
         4qD7Gtmue9K+4Ly/JE7Ifx1p4MN/Tq0oL3V21/+XhwQq8tQS0dLs2uTFQLcTtfdvC6no
         7BrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733932864; x=1734537664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eiLZxyAdC236sk/Nqx7Ju43ISHYNk16b5WIFQxB0EE=;
        b=sTO1k++ao1m2kf6R2VVONCtx+Dqh0BqeJGaaihAwMBVNjr6YORoJqCQE3vJrKFS0dI
         +m0fbdIzfjrg9ARK0f1DBSW7xtpBSvdHxLtP0tozIVN4V6EXM4jQkwOJng0NikuRCYfv
         gxGkW4voP38+ke0omkGPGA991k1T41wk77vKsocW/PkNGb0eSySvPLOTVZwU0msZFFAM
         FY5T7mHWpol5O/fgixpyUsFbnW/x+y9ziaYVALeCB/CJZcTgT+JC2Nly6RI17ktqaUbI
         h5NIr+rXwYwNmhlH56QEerWyoRxoj2ylinpYmu6zLuu4mHS+j6j9hGSFRKBLhvylFgNP
         5hRg==
X-Forwarded-Encrypted: i=1; AJvYcCVbKb99PJKi3S7tjd+CAOZ7Qhfl7udm3kPNYLLVZ5EyG9FW4//YIrM9b6NNgE4k2umzKCR/2G7+EuGEJ6RjstbC@lists.infradead.org, AJvYcCWIAiaHxauq7rf78qOqcPMHDzEzpn7soatJnll+7adfAEARa2lY8Ffj+pQYr3qUTh8L7/Qhm4GQdh3LKIGMzIw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyyMvvzr3GwC836wiHEJq58Y0xb+HkR45RES4A7FtONCzEk5HZb
	/JU6LcPWf/zRsJiuE3xytZSDTdrSLcie9adFT4TD+P3K5uyyuI2G
X-Gm-Gg: ASbGnctZwH4PBtBgSn5DF2rLU3wE3GbcWNxwbi+2aIY/0UShKczoyBcHWWSj8nmKUsF
	iinppolqYsrclFkjKdfvIPPiLZn0prr/fmfEnN9bdfpBMvIFz4slCELw8KQmd/ypzPyFLHV1eMs
	2MFLpxeYd51yaHcB62siO4eHCwNgRMljnOBSE/Hgpc0nlOe3Uume88DVTm0nyX9xswuyW7hfKcB
	3FEAVQGtw9SKIIEVawDNrnpFX0CpFeQKQ4su4Lrmw==
X-Google-Smtp-Source: AGHT+IGpHZ7duPMWiLF14rljsFoBTbUsF6ObaJbe99GJ62pMOFoPQ178gwFizB5Dr+oYjlRztVrq1w==
X-Received: by 2002:a05:6402:5193:b0:5d0:bf79:e925 with SMTP id 4fb4d7f45d1cf-5d43314d34cmr1136018a12.6.1733932863555;
        Wed, 11 Dec 2024 08:01:03 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7349b44sm6244827a12.71.2024.12.11.08.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 08:01:02 -0800 (PST)
Date: Wed, 11 Dec 2024 18:00:59 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>, UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 0/9] net: dsa: cleanup EEE (part 1)
Message-ID: <20241211160059.ypcydtoenlfc2wog@skbuf>
References: <Z1hNkEb13FMuDQiY@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1hNkEb13FMuDQiY@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_080106_166942_671DF358 
X-CRM114-Status: UNSURE (   7.69  )
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

On Tue, Dec 10, 2024 at 02:17:52PM +0000, Russell King (Oracle) wrote:
> Part 2 will remove the (now) useless .get_mac_eee() DSA operation.

Thanks for the work. For part 2, could you also include changes to
Documentation/networking/dsa/ to explain the new usage pattern?

