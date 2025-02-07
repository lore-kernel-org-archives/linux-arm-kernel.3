Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47446C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 15:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lh728/h5T9UnM+HASA8Jq2heTWOphh/67rcOx7NkUt0=; b=1zzDHkGuwLAqRlAIy4LCv+jEL6
	AgwIcluNMRgW8WwghAc+QeLpoEh+vXBSXxG0FoZzvD0cBsj0L3uEA7NE8RZa5J0eHh9STzQesDUER
	HQfGO1j+YRwVLFXfukPjLilx/MkkMLePo/TOwygV3TMasXoJwQ+m6bbPyivF3coC4w464cF0cFyjA
	jWVSzbpRuTBl7ppFo8d4h1SfBnA1YTgi+irpeyCIEC4CczyMJIODSW9FWWQqVxK6fLI1jHTZ8ZnsO
	t2KK+3WzGW6HrjImYRjpw+troXZywh+poQblxCJDDelq4fFKOGBgWknMpP39Y+DhE7Mbq2Mtd9So+
	aRILM1HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQEh-0000000A3oL-20G1;
	Fri, 07 Feb 2025 15:25:43 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQ9F-0000000A2Eb-2wPg;
	Fri, 07 Feb 2025 15:20:07 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5de427a1d12so198962a12.1;
        Fri, 07 Feb 2025 07:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738941604; x=1739546404; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lh728/h5T9UnM+HASA8Jq2heTWOphh/67rcOx7NkUt0=;
        b=ZLrIhD1xLHTRK+61XV1+VcvsX67IZrbUggVi3ZtL2/LIlo0yzMWLQxq/3cUsvZ7M+i
         r2eP589hHbPv4v95mBACRHhDuLyd3Q9hv49rFCNdwq8PaxQQz4lUbXUdrbt8xxvLG1xh
         Whco83kA45A/j60MhmMkVKO2LeK1CrkA3b7zy7WNo5+Hj/gss+/EmY0B5y1PZSduinEP
         FIHbfpkH93iCnqvljSd17US7fmjiMAncwSr4z+RoEZY+2VGHeB1DCteY3q8Qirqr9Lhr
         0SbRtAVsB3Fqcn4iWXcGs48AZkeeg/Bh+eBRzU7Ilmw5k0cLN4VyCmivx12gWWKOkPSN
         ngNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738941604; x=1739546404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lh728/h5T9UnM+HASA8Jq2heTWOphh/67rcOx7NkUt0=;
        b=XH9s15LLjRHyqxXLeRmVLSUawXqw3hHh2IvV18SDelbNUSAcvBzsvWFU4fUhcR/9xK
         CyXfVfzkUbPD5fM8NKIBgIQtx5+t/795nJ9vYXk4vW5j6uFCXf2Lqc4bxDFBgj9J73B0
         YAw0He4qXY+9BnXXTccMVQdy3ZlZsQ2PYQZh2ZwDjt9lqhaASjhBgRzwI7kit0sCCgkF
         kYZP574gqb7p2NzwU8/MwIJwlOUbxnxf9a3KAohEt/t2pnjrRNFXIclwBTtz/IC3N7tt
         +eOk9s4g03bGhtmkAlS1xnM1o90vv8RG0v0GXfjre+9sk1fOHL11MBdHcQbY+9kmb9Nr
         W3vw==
X-Forwarded-Encrypted: i=1; AJvYcCUmtUYS7t4dLI8o+75bhlBiknshFBjanM/ODu8DHey9xueCzS+1MleFKGtltE7pQXtj5lrBbjBDNbhZJNA3Snqn@lists.infradead.org, AJvYcCV+qUx07rXaj3H2fwPToX+NP6ZxB2XfHKW7V0be8JC+xF8bKPv3a+wVizQiMfbyqNzMUk2fB93/H2NI3GbrVdU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZggEAF2a5qJkkwMijHFzfrvjG99VszAlwZkLF7JwlyisUHI1k
	75ZqbuWbJQUHL1m3Nh9xj3I+BIJXcgr4o7XRTsvSpmCloDLfaIoF
X-Gm-Gg: ASbGncvPhyg3hrPGJH7tvRHy0BLPIEss0zkLV/vOZ0F7puWeZLN4VddJuqmjjNnuZeB
	kU0WRa6u+6um/PAJbafsfn6tnFEO1Sd+S1aZbQrJ29GL05L5YbJLPCYyEuWQeEiXw/I5oyG9rXg
	QUQZ5DauOAgSLoXt0AH1hm/cP53LqQ69jjmzCJZUjP7Q6z5/SR/AoCfpUiUqLfWdkVRtC8jJnqg
	rkc5KwlZxotFAaDNhapqJK95NgwlgAooTfkYpYJSMJbe9AINziC55zm5oFLyG/e9OrDItToD4gQ
	gKw=
X-Google-Smtp-Source: AGHT+IFUjfhOH0beogOCy9/ovimvABwSwvmh22ByKVKZ5A30iXNQpGJX9oTjv2FUtPbwL+S7YBZBEQ==
X-Received: by 2002:a05:6402:1e91:b0:5de:39fd:b310 with SMTP id 4fb4d7f45d1cf-5de44e5dafamr1699198a12.0.1738941603629;
        Fri, 07 Feb 2025 07:20:03 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf6c9f9a6sm2677109a12.55.2025.02.07.07.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:20:02 -0800 (PST)
Date: Fri, 7 Feb 2025 17:19:59 +0200
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
Subject: Re: [PATCH net-next v2 2/3] net: dsa: allow use of phylink managed
 EEE support
Message-ID: <20250207151959.jab2c36oejmdhf3k@skbuf>
References: <Z6YF4o0ED0KLqYS9@shell.armlinux.org.uk>
 <E1tgO70-003ilF-1x@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tgO70-003ilF-1x@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_072005_738019_DA9EAB2B 
X-CRM114-Status: GOOD (  21.14  )
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

On Fri, Feb 07, 2025 at 01:09:38PM +0000, Russell King (Oracle) wrote:
> In order to allow DSA drivers to use phylink managed EEE, changes are
> necessary to the DSA .set_eee() and .get_eee() methods. Where drivers
> make use of phylink managed EEE, these should just pass the method on
> to their phylink implementation without calling the DSA specific
> operations.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  net/dsa/user.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/net/dsa/user.c b/net/dsa/user.c
> index 291ab1b4acc4..2e0a51c1b750 100644
> --- a/net/dsa/user.c
> +++ b/net/dsa/user.c
> @@ -1243,16 +1243,21 @@ static int dsa_user_set_eee(struct net_device *dev, struct ethtool_keee *e)
>  	if (!ds->ops->support_eee || !ds->ops->support_eee(ds, dp->index))
>  		return -EOPNOTSUPP;
>  
> -	/* Port's PHY and MAC both need to be EEE capable */
> -	if (!dev->phydev)
> -		return -ENODEV;
> +	/* If the port is using phylink managed EEE, then get_mac_eee is
> +	 * unnecessary.

You thanked me for spotting that this should have been set_mac_eee() in
the comment, but you didn't update it.
https://lore.kernel.org/netdev/Z4bC77mwoeypDAdH@shell.armlinux.org.uk/

> +	 */
> +	if (!phylink_mac_implements_lpi(ds->phylink_mac_ops)) {
> +		/* Port's PHY and MAC both need to be EEE capable */
> +		if (!dev->phydev)
> +			return -ENODEV;
>  
> -	if (!ds->ops->set_mac_eee)
> -		return -EOPNOTSUPP;
> +		if (!ds->ops->set_mac_eee)
> +			return -EOPNOTSUPP;
>  
> -	ret = ds->ops->set_mac_eee(ds, dp->index, e);
> -	if (ret)
> -		return ret;
> +		ret = ds->ops->set_mac_eee(ds, dp->index, e);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	return phylink_ethtool_set_eee(dp->pl, e);
>  }
> -- 
> 2.30.2
> 

