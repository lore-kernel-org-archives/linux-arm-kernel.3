Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D2DC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 09:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HU3jlfHL29/51vRr+ClhtWxfhwAXBGkQarZA/yxGO2g=; b=4c2Zcpe9ZJ6xfBP+Ha1rj94IYW
	GZANEcd5pT0oNOCvxVBsM5rTzGC2AEgpoxK5BXYZGH5LrcSwDY/shHQX6dHDVCCPamLRWYC6ZmsV9
	Sn7gKG3hlfZVozQ0O+E5Uif9a8GbihIkIaAl8vKlylxPFIisGtEBnMITajGWnxerRE/OQs4SNY611
	cjbLJIJs1NA0NvW43P8IlZhjEckaqEBwBMcrbBXdX5ilJULPhO33u66g/FlL/GnwwRfqASAp31bc0
	nch/FYC9+DbjIHjj12648A3VxSav26eX+uSylJ7GkSehE8Fl0t+NrEBP0tYtKM9GOLxIXreQW5ETp
	RdqI/RkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25Bm-00000003QYD-0OSY;
	Tue, 08 Apr 2025 09:24:14 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u251U-00000003OrX-2AMi;
	Tue, 08 Apr 2025 09:13:37 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39c30d9085aso3111726f8f.1;
        Tue, 08 Apr 2025 02:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744103615; x=1744708415; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HU3jlfHL29/51vRr+ClhtWxfhwAXBGkQarZA/yxGO2g=;
        b=RlCIZ9REeUnVzNNrmOc5Uj4+yVZcoFkvrLbRBxF5dCB+sw5N6BSzNPzHsRiNN5Z9Ol
         AysEh+Edee8vZXNKid5PCEiqTG91QfjJprb5nfPC+JNUszBH79TusiWV7bb5Zk6iGr+4
         eHlEb9ymk2DosepszMdX8D3EdabJuOMc3K4PRu7JXa5MG2zUKT9PJfDq1E9RQKUPB+F4
         xilvkOycgtpg0pHGPnXHwDjx+bWO5cSqqmYMIUcOglDP4HrEgUB9rNZBiredqTcNmEC+
         ttHWa+2r+ribMAlrhh8dFw/pB85kJGSkrjMFBzTh3nIFx0QlyqcVqadTIXXrMpgRSKsc
         l3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744103615; x=1744708415;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HU3jlfHL29/51vRr+ClhtWxfhwAXBGkQarZA/yxGO2g=;
        b=D1O1pAQKmZ6b1mMqEFRRgb/Ew28Xzfvm46gNdR0dQ99xyDvrzNFkU85y4a1JSzcPKn
         Jz9FFhE2nV/xNrdX+8VKIZqSiwEPJwbeoskTFHaXSdLUq/x0RCi3fra6mwwcu3W+bAkO
         w8o4dXV5QwpoNtQuoIa2syS3ElwObi9sLf9PQjLwEMVN23MLI2kb4BYNqE0xttrkTK29
         LiWZ0eo75h9qqWSId5ZIHMX03yfqtsXBpaCYz2JvyTWZKohfgfINd9eodJO+PEXm4JBB
         qUtOaibBVTzjusWtULM2BRkvCaxjChKa5CQWltvsaZNcrVzfENBKs7WIeoRq8y6VvBe4
         cAAA==
X-Forwarded-Encrypted: i=1; AJvYcCXiCUEFGMDbESO1rzLtat5pH3WgFiMyLHZThitXczIVvtss4oR3yhhe4suAyw60wIaI1ASVncZmni0MAsOgoyc=@lists.infradead.org, AJvYcCXqaFoe737bF3q0A41OssqYu4SUSJphfo0neX+F/7tUugzxLx1m7DKYMhjPWhzT7EbtNCPuf3ES4J3aek+dOR/W@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9qBGsirHnWLkRx7yrGPd8ptoZVO7UlDTuHLFfgvzecbjOclHf
	SC0K9QL5AyvXwPwPlPr9HZrNwAr9drJ90XeIkdLzAVZPBrXV2Fhv
X-Gm-Gg: ASbGncvGqL/gumsyhXNXi8jQ6PY4Kqk1hodYhLzLA3Ero5ReAJCMYF3icVHQo7YuZc6
	D1yTJPgn7YEmDi0E+kUoPArQ6l2Z7e0HgYxh69D6KYp2qiqetvsaEN6YymUpsKn3zIN/JKd0VKc
	nq543FDCUfZtW7kEaw5MRti6cKcfGEJg4kbN1j/W8/4tyspJL3eqR4c2ZUk+Xl1jMUjvEgD3jcF
	hgrPtEyUP5FDx33hW9r4TTkxX0kmCadV2vTzpFJifavpXfpGQQ767TO29A30wiO7ETRgmuv3jBw
	Ysyzja+dkwuEtrwM88TedKTKxbFZPDYicmrW5dC0cl3Po2PkgqTEUR+hgTHyALm2MRZRddcU4av
	C
X-Google-Smtp-Source: AGHT+IFmpUD3WDEfYZdyJZMlUcmM3Uz/pG9KD9AKQWX9zm9kiZbZimr4FaqPmFNyWRNVcwv9d/OHeA==
X-Received: by 2002:a5d:64ce:0:b0:39c:1257:c7a2 with SMTP id ffacd0b85a97d-39cba93d0aemr12569839f8f.58.1744103614388;
        Tue, 08 Apr 2025 02:13:34 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b72d5sm14132111f8f.47.2025.04.08.02.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:13:33 -0700 (PDT)
Message-ID: <67f4e8bd.df0a0220.369157.fb3d@mx.google.com>
X-Google-Original-Message-ID: <Z_ToufQVD2WfPA5t@Ansuel-XPS.>
Date: Tue, 8 Apr 2025 11:13:29 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v13 13/14] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
References: <20250315154407.26304-1-ansuelsmth@gmail.com>
 <20250315154407.26304-14-ansuelsmth@gmail.com>
 <20250318151540.4rmw6jj5hh2rp4b4@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318151540.4rmw6jj5hh2rp4b4@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_021336_562411_7A34B362 
X-CRM114-Status: GOOD (  24.75  )
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

On Tue, Mar 18, 2025 at 05:15:40PM +0200, Vladimir Oltean wrote:
> On Sat, Mar 15, 2025 at 04:43:53PM +0100, Christian Marangi wrote:
> > +/* Similar to MT7530 also trap link local frame and special frame to CPU */
> > +static int an8855_trap_special_frames(struct an8855_priv *priv)
> > +{
> > +	int ret;
> > +
> > +	/* Trap BPDUs to the CPU port(s) and egress them
> > +	 * VLAN-untagged.
> > +	 */
> > +	ret = regmap_update_bits(priv->regmap, AN8855_BPC,
> > +				 AN8855_BPDU_BPDU_FR | AN8855_BPDU_EG_TAG |
> > +				 AN8855_BPDU_PORT_FW,
> > +				 AN8855_BPDU_BPDU_FR |
> > +				 FIELD_PREP(AN8855_BPDU_EG_TAG, AN8855_VLAN_EG_UNTAGGED) |
> > +				 FIELD_PREP(AN8855_BPDU_PORT_FW, AN8855_BPDU_CPU_ONLY));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Trap 802.1X PAE frames to the CPU port(s) and egress them
> > +	 * VLAN-untagged.
> > +	 */
> > +	ret = regmap_update_bits(priv->regmap, AN8855_PAC,
> > +				 AN8855_PAE_BPDU_FR | AN8855_PAE_EG_TAG |
> > +				 AN8855_PAE_PORT_FW,
> > +				 AN8855_PAE_BPDU_FR |
> > +				 FIELD_PREP(AN8855_PAE_EG_TAG, AN8855_VLAN_EG_UNTAGGED) |
> > +				 FIELD_PREP(AN8855_PAE_PORT_FW, AN8855_BPDU_CPU_ONLY));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Trap frames with :01 MAC DAs to the CPU port(s) and egress
> > +	 * them VLAN-untagged.
> > +	 */
> > +	ret = regmap_update_bits(priv->regmap, AN8855_RGAC1,
> > +				 AN8855_R01_BPDU_FR | AN8855_R01_EG_TAG |
> > +				 AN8855_R01_PORT_FW,
> > +				 AN8855_R01_BPDU_FR |
> > +				 FIELD_PREP(AN8855_R01_EG_TAG, AN8855_VLAN_EG_UNTAGGED) |
> > +				 FIELD_PREP(AN8855_R01_PORT_FW, AN8855_BPDU_CPU_ONLY));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Trap frames with :02 MAC DAs to the CPU port(s) and egress
> > +	 * them VLAN-untagged.
> > +	 */
> > +	ret = regmap_update_bits(priv->regmap, AN8855_RGAC1,
> > +				 AN8855_R02_BPDU_FR | AN8855_R02_EG_TAG |
> > +				 AN8855_R02_PORT_FW,
> > +				 AN8855_R02_BPDU_FR |
> > +				 FIELD_PREP(AN8855_R02_EG_TAG, AN8855_VLAN_EG_UNTAGGED) |
> > +				 FIELD_PREP(AN8855_R02_PORT_FW, AN8855_BPDU_CPU_ONLY));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Trap frames with :03 MAC DAs to the CPU port(s) and egress
> > +	 * them VLAN-untagged.
> > +	 */
> > +	ret = regmap_update_bits(priv->regmap, AN8855_RGAC1,
> > +				 AN8855_R03_BPDU_FR | AN8855_R03_EG_TAG |
> > +				 AN8855_R03_PORT_FW,
> > +				 AN8855_R03_BPDU_FR |
> > +				 FIELD_PREP(AN8855_R03_EG_TAG, AN8855_VLAN_EG_UNTAGGED) |
> > +				 FIELD_PREP(AN8855_R03_PORT_FW, AN8855_BPDU_CPU_ONLY));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Trap frames with :0E MAC DAs to the CPU port(s) and egress
> > +	 * them VLAN-untagged.
> > +	 */
> > +	return regmap_update_bits(priv->regmap, AN8855_RGAC1,
> > +				  AN8855_R0E_BPDU_FR | AN8855_R0E_EG_TAG |
> > +				  AN8855_R0E_PORT_FW,
> > +				  AN8855_R0E_BPDU_FR |
> > +				  FIELD_PREP(AN8855_R0E_EG_TAG, AN8855_VLAN_EG_UNTAGGED) |
> > +				  FIELD_PREP(AN8855_R0E_PORT_FW, AN8855_BPDU_CPU_ONLY));
> > +}
> 
> Is there a way in which you could group the registers a bit more?
> The function occupies 2 screens :-/
>

I will use local variable and pack it.

> There are 4 read-modify-write operations in succession to the RGAC1
> register. Maybe you can converge them into a single regmap_update_bits()
> call.
> 
> Also, for packets which reach the CPU via a trap, we shouldn't set
> skb->offload_fwd_mark = 1. In other words, if the bridge layer wants to
> forward them in software (including to other an8855 ports), let it do so.
> The common example given in commit 515853ccecc6 ("bridge: allow
> forwarding some link local frames") is 802.1X PAE (01-80-C2-00-00-03).
> 
> I notice mtk_tag_rcv() calls dsa_default_offload_fwd_mark() with no
> pre-condition. Do you know whether there exists any bit in the RX tag
> which signifies whether the packet was received because of a trap
> (or if it was autonomously forwarded by the switch to the other bridge
> ports as well)? The offload_fwd_mark bit should be set based on
> something like that.


I did some simulation checking the full tag and also yesterday Airoha
confirmed that those register doesn't affect the CPU tag.

There is an entry in the TAG that signal some kind of packet but it
doesn't react. From what I can see it only comunicate when fdb or other
really special thing.

-- 
	Ansuel

