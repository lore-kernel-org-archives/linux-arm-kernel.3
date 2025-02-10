Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D13EC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 13:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IR1STzBHWflyOdMHe8euRfwJ+fzKwFGSyoXduLUKaJw=; b=e034PWQDYKOfbYWJdXgXtsWL+a
	HHzUpcr0dorHfnC/veml91Yy6Hq1FypFVVRzSB164oYYsZkhdkmxLlST+zD3tjOJtvHtC5QRYbJd3
	qwV5nHX2iF9lBlakya2V+f09RJyR+JcCBEH04aZyAs5C/OpUscdf7wxmIK8/qkP/f1Po1t9yJ7cxW
	7/iGBAfz7hs7iuyUmEWm+XlUB/F9f7qvvvcIQXrQ/jOnyLpIvlofOA0QMXZ3NoVNkW/hV21ZRphhV
	A52tOOw7T+36McNoEkIDCXX/AmFgwssx4ps1pw2psYRrsJin7WfdackEoIn3vHAfr036HCyADspBj
	jwTiN+VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thTkI-0000000HWju-2vye;
	Mon, 10 Feb 2025 13:22:42 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thTie-0000000HWGa-1fVk;
	Mon, 10 Feb 2025 13:21:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so6420625e9.3;
        Mon, 10 Feb 2025 05:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739193658; x=1739798458; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IR1STzBHWflyOdMHe8euRfwJ+fzKwFGSyoXduLUKaJw=;
        b=bVwaaKadkWJqnR6tUeSXqaEtj4AheiaBvmPO3TWLXQV98ijA0BJk6S9yRGtCDeffVy
         inuNyXsodHcUNi7JO0t+8tu/4bOPt4hcdN7LGVs+oia0rcSD1SE5zX2kQSHBvmsWYi5p
         m27KND+f3LyObpdPfTUfLj077ExAVRhuqIGxys5JGYiLLqK+vEJb5UHWU5NCqRQDLa1O
         4/l6nl/hhm5TVK0hQuv1am04yOyy1sb1RXah2nsNO+HcLlMXIgXlYj96zcWglAoOUi/E
         mrKJCHkF/B7837eKh/LRwQbutmecRa9bJhnw94vmShxJA6M8KboH5L5cki1PFmRdkSH7
         uwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739193658; x=1739798458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IR1STzBHWflyOdMHe8euRfwJ+fzKwFGSyoXduLUKaJw=;
        b=JhQIC55R/kfrjK1PtRPOusZuJgt5LSG4ikd08Nz4J31+vNxxKIgkfwiLLDSr82wivW
         rSjOvKoRt07Bu9f7m2LnAg0wNheoD4aKHckkIk4OqQZmTLnYXZfNxoTJapVYXBcWS5KV
         X181iQvzpnUkbQapoU9RjYDQJ7ZxcCLzYM7ZHgYgSzZXtw0JmA9FmtT8SHPzbZZRihzj
         CphJyxtv/y9eKHYOzawEN7kc4HP6X1aZ1a0fxR3Mb44M3ptTamjpCatLRG0eQvt+Za5c
         eK3lmbsPx51PFgBcvYLTB+5fiP7+A3ATJRh7rQwTQ5k9t+c9Grm9ye2HgFG/t23NHwkJ
         wv6w==
X-Forwarded-Encrypted: i=1; AJvYcCVezNthZGQMB63CaNVwohgyAUoQYLHKleBxPlFLLv/a+WBCCsZmVczOOTpX0ko5w9RWbtCb1DeyGTNUUZZi7Hyc@lists.infradead.org, AJvYcCWWHNQADqEos0sB2RPqSffYzpsUsZuzA9RhQu/De2wfPtsWdQkJunrGQ/DIQOU6ZHfsRd6XYzjeftZEG7zVnoU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yya1PdGa5RI0PV1iKW8sFqfvWfrdfWdGBAQiYBd13T0rfdO2MJ4
	Mcv88GccjPfYlwHlLByoOcaXN8nQycCLa3rhg1skRR76Lfs9wAPO
X-Gm-Gg: ASbGnctJ3K72iaxpAUiOFEm3NEk1GuVBHDn8nTxDFCxLYcwYZQbr8+O01utdY2wQrGs
	aGBDY4VjV1AHvvoflreuER7YXNuHBZ+KikqFv3OGlJkVNIWoKw/CE2y0l+OoXFQfyvFWQ2rlK3k
	kckhqiVmU+SiQzsFdRcthRn8HRIdSFEmkZIAjvt12lomv3uVxLqNemB0JLUz9mfg3cXzUDWFzjB
	WQI2NbttVCeGUpvmCUORjn6dy9LOOiF8quS/CCV8gNl26YKT+hlFbAFxT0ssM80GedJqbU1zJI8
	cmA=
X-Google-Smtp-Source: AGHT+IHKAnx4OMOJyxd+FsV4Q2cMCuFMhriiOBiD/pKtcrVChJIsEdo0ysTRISiCt7SIXZmiHfdEkg==
X-Received: by 2002:a05:600c:444a:b0:439:4b67:555f with SMTP id 5b1f17b1804b1-4394b67585fmr4261405e9.6.1739193658476;
        Mon, 10 Feb 2025 05:20:58 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4764880sm6684638f8f.25.2025.02.10.05.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 05:20:57 -0800 (PST)
Date: Mon, 10 Feb 2025 15:20:54 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v3 1/3] net: phylink: provide
 phylink_mac_implements_lpi()
Message-ID: <20250210132054.oaqb5mboh6qiixfv@skbuf>
References: <Z6nWujbjxlkzK_3P@shell.armlinux.org.uk>
 <E1thR9g-003vX6-4s@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1thR9g-003vX6-4s@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_052100_440402_F62431AB 
X-CRM114-Status: GOOD (  18.31  )
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

On Mon, Feb 10, 2025 at 10:36:44AM +0000, Russell King (Oracle) wrote:
> diff --git a/include/linux/phylink.h b/include/linux/phylink.h
> index 898b00451bbf..0de78673172d 100644
> --- a/include/linux/phylink.h
> +++ b/include/linux/phylink.h
> @@ -737,6 +737,18 @@ static inline int phylink_get_link_timer_ns(phy_interface_t interface)
>  	}
>  }
>  
> +/**
> + * phylink_mac_implements_lpi() - determine if MAC implements LPI ops
> + * @ops: phylink_mac_ops structure
> + *
> + * Returns true if the phylink MAC operations structure indicates that the
> + * LPI operations have been implemented, false otherwise.

This is something that I only noticed for v3 because I wanted to leave a
review tag, so I first checked the status in patchwork, but there it says:

include/linux/phylink.h:749: warning: No description found for return value of 'phylink_mac_implements_lpi'

I am aware of this conversation from November where you raised the point
about tooling being able to accept the syntax without the colon as well:
https://lore.kernel.org/netdev/87v7wjffo6.fsf@trenco.lwn.net/

but it looks like it didn't go anywhere, with Jon still preferring the
strict syntax for now, and no follow-up that I can see. So, the current
conventions are not these, and you haven't specifically said anywhere
that you are deliberately ignoring them.

In the end it's not something for me to decide, but I thought maybe I'm
speeding things up a little bit by opening up the discussion now, rather
than wait for a maintainer to look at it.

> + */
> +static inline bool phylink_mac_implements_lpi(const struct phylink_mac_ops *ops)
> +{
> +	return ops && ops->mac_disable_tx_lpi && ops->mac_enable_tx_lpi;
> +}
> +
>  void phylink_mii_c22_pcs_decode_state(struct phylink_link_state *state,
>  				      unsigned int neg_mode, u16 bmsr, u16 lpa);
>  void phylink_mii_c22_pcs_get_state(struct mdio_device *pcs,

