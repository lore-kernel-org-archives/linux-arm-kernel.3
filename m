Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A0BCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+Vq3ysZS2lc4WhA67yDwpubRjl51dbZS1N3bA03ln0=; b=ZMbn2p9idgQwq/6AJpsq3IqPe8
	b/DUHfcKfVxtblDEAzZvKaYswk/uzsm0tjEYGdyIrYKiKYgR5tc5PTPUpqM3XkCty/pwzfpuoKOv2
	eyzXRJl6Fwy/IfXhBs4Wr4S5d1GBWuW3ddQA/beLG6nU4PNBjyKISvwEP9RD5IfwjXa/PtzNYwfwF
	1TPPNKFA82V05/dRLKFxCi8ZiZ2UiF8TvIbm/vYQeolzNn1gmY09WfhKx/41WT9pIAUHr+f2v93Uq
	9XbpZ2zR5D7WrcZe0y9U9pv0qBURLh+3JQUNruo9pGnKc/UF9r/cXXUuEMbqncwqOlNYq39lO1+ka
	OITCnP0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGF0-0000000CwR9-3m2L;
	Wed, 10 Sep 2025 08:31:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGEx-0000000CwPI-432S;
	Wed, 10 Sep 2025 08:31:45 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3e2055ce7b3so4000834f8f.0;
        Wed, 10 Sep 2025 01:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757493102; x=1758097902; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7+Vq3ysZS2lc4WhA67yDwpubRjl51dbZS1N3bA03ln0=;
        b=Fq4XptxDeVv1IZdTu9wgnzmPRof6No11965RngxaYuB3DGZVtnitD2wSulahkWFrtL
         vTuR9P4OTtScQYE22W3qTz1dYoIXdlq4twn6w8o0elbdlpIOgDvrJHll9A3tb9xSYG/M
         rYtYag2rx8KJVyQWCcH/h2CYtAvkss7p4btw7+979gooM3E+SoBm39xtm8oj/VOCsmLY
         7Qzh4tqE6bYjjHIWdzYFvTYRL8S789LyVohA4AsX9ZeDs5Cb0AOoGqAaur0mWX+wyH/y
         R9sQNrmccB+LLpcqxmI1MO6wsO3llN58XeMhfjGbgbLS0f8geFgqANeDy+SCbgz9tz5g
         Q4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757493102; x=1758097902;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+Vq3ysZS2lc4WhA67yDwpubRjl51dbZS1N3bA03ln0=;
        b=h/hRgYGrgVVQ9cALHt8Pc4Uul3/yW0kq4R+6zLj0WKmdSj+EJ4dy0IGCVx7R3wql4k
         yWBs91Q0P5paHg2FScXFvGKHyT2yKcU9Ah3Otp6ENSlEHppVg6RHMSSiSmVqcPU3GJ+P
         T3CAIgb6DG9Enw0mdx0LJjoJ8oCsbrhd1k83emFSzdf4KwhkoMPaeeC7qW+ZmETpGeQB
         W1LsLiEhnyAXq1jGZ5Hexu/o6btg8xq1fbk+ILBlQNPK6+37ZaRPqddk5/B2TKxUbRgI
         hfMJNeLtSAIiyvZ4jEyD/cOFvhp7iHEx8/6t56QsjSPpVvp04D7d5z3Sb6ROMDlD8aqi
         FR3w==
X-Forwarded-Encrypted: i=1; AJvYcCU16rLGMbGVh8TlTg5Sy5Wt5ayeu6oAWep6EL/IaYX5NepwYZKVMSGGceobagJqcl5cY/Jkpk95+XKEgE/nsQg=@lists.infradead.org, AJvYcCVG1y0q9WxJn1/ua+jDebq+F+acqdURnwN+gGcn5zGUBCiKaMvkgNK0/KtaI5D/YjvpBUBC4ak3evctTh6t0qIH@lists.infradead.org
X-Gm-Message-State: AOJu0YwKW2sHZne+n0iqnZ3U9vJoXkiKsZhCskW5A5BB5juwt7Vs7U1l
	MNMrsHTpFyA52N8g6WIT9BsD+YDhKcPz6c6Ryp8rwlKqtHrkmYAoZrNlT0GSCg==
X-Gm-Gg: ASbGnctmQ6BDGT9La6Ptb8RUqTonvpQ0kOczoHmxyqwXb5yfHIIdzoC8a9XKGq27Y4f
	sIQW+1hHxwMKQBI5IZuDNJXaG5rkXB2scwZlpSAoAuQTsXkXdgTz8hW7/2O4LiEs1wbjX7CYs1M
	+sg27BcOt5GOuWLtrlVrm8TBzfvkWCtbG8qvryfUzqjg+qUbUoVnQP3YZi/LyyUb0OQFnbR/cZU
	3vVkOsharTfDZr/Fv6/k9LTePHLEReZFsm1ge+JNF4yjZVlJBZulBjg6XdLMdWrLs3+IMv/8D0R
	Ry2xyazs6JfSMGKQ5ZP4dD1PEfviLyfwNPG9dNjAhZoRzE7+T6+SPlyO/uoRfJMxk4Fgir6av4D
	sHCg/PiAtJwq8E5axSSfnzsc4uJGysX/BoqKx/rs4NxmT2dVDVnZIo2qxsfVxqmYXgAwqHQ==
X-Google-Smtp-Source: AGHT+IGx/xbJUIH4+beV7q9PMqx0glsggALR4qg5rZZAhjCkYIwZFcTKRYd4C8GT0jF1ei0YocGGkA==
X-Received: by 2002:a05:6000:2f87:b0:3d7:df92:5e31 with SMTP id ffacd0b85a97d-3e641e3b09amr13400380f8f.16.1757493101468;
        Wed, 10 Sep 2025 01:31:41 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521ca2aesm6060026f8f.26.2025.09.10.01.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:31:41 -0700 (PDT)
Message-ID: <68c1376d.050a0220.2085dc.675b@mx.google.com>
X-Google-Original-Message-ID: <aME3Z0CacqPJNZT8@Ansuel-XPS.>
Date: Wed, 10 Sep 2025 10:31:35 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v16 10/10] net: dsa: tag_mtk: add comments about
 Airoha usage of this TAG
References: <20250909004343.18790-1-ansuelsmth@gmail.com>
 <20250909004343.18790-1-ansuelsmth@gmail.com>
 <20250909004343.18790-11-ansuelsmth@gmail.com>
 <20250909004343.18790-11-ansuelsmth@gmail.com>
 <20250910082017.hjlq3664xvg5qjub@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910082017.hjlq3664xvg5qjub@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_013144_031641_8070E40D 
X-CRM114-Status: GOOD (  27.88  )
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

On Wed, Sep 10, 2025 at 11:20:17AM +0300, Vladimir Oltean wrote:
> On Tue, Sep 09, 2025 at 02:43:41AM +0200, Christian Marangi wrote:
> > Add comments about difference between Airoha AN8855 and Mediatek tag
> > bitmap.
> > 
> > Airoha AN88555 doesn't support controlling SA learning and Leaky VLAN
> 
> Is there an extra 5 in AN88555?
> 
> > from tag. Although these bits are not used (and even not defined for
> > Leaky VLAN), it's worth to add comments for these difference to prevent
> > any kind of regression in the future if ever these bits will be used.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  net/dsa/tag_mtk.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
> > index b670e3c53e91..ac3f956abe39 100644
> > --- a/net/dsa/tag_mtk.c
> > +++ b/net/dsa/tag_mtk.c
> > @@ -18,6 +18,9 @@
> >  #define MTK_HDR_XMIT_TAGGED_TPID_88A8	2
> >  #define MTK_HDR_RECV_SOURCE_PORT_MASK	GENMASK(2, 0)
> >  #define MTK_HDR_XMIT_DP_BIT_MASK	GENMASK(5, 0)
> > +/* AN8855 doesn't support SA_DIS and Leaky VLAN
> > + * control in tag as these bits doesn't exist.
> > + */
> 
> I think it would be good to present the AN8855 tag using a different
> string, so that libpcap knows it shouldn't decode these bits. The code
> can be reused for now.
>

Do you think I can implement 2 tagger in the same driver or do I need to
make a library of this driver? Just asking what is the correct way to
generalize it.

> >  #define MTK_HDR_XMIT_SA_DIS		BIT(6)
> >  
> >  static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
> > -- 
> > 2.51.0
> > 
> 

-- 
	Ansuel

