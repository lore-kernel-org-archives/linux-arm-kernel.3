Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF65C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfsZ4Hr0wmB5sa2cUchGQZzT0be/9tuArc+VqsT04RU=; b=3hFXwS4JQclXl8e3EDo/ho0AJt
	pCCafHfYUI1AqKOdDv0Sw/dPg31xSa1yKdFytloc4qPAg9mEVeSQmxy1EO+Q9L57od6d38sJ71p5p
	PYFYRGEv2F7iAe8oV+QgLRFVP6cRMpbWXMhxy0TS7SRpzUWH2YQWFNqvYmdrLT8V9Xxksn6ZIvRwz
	IEVMXBzcrx4bsgSYz5VMtdUyuag2AjmX3BoBkNSAkpA4u5R0KkOj3sAlKoLtqiz0DUILIxm+3fZDq
	mWrRuT5jKI+txMZsOVg9FSBE4K5lpMHyHT1qDjrrl4ieqcpkgM+fFEYYguQD7rfwAaVhKO/iUofD3
	p0CvxMQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYhB-00000006KBI-05iP;
	Tue, 18 Mar 2025 15:17:33 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYfT-00000006Jvb-10zN;
	Tue, 18 Mar 2025 15:15:48 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38da6a1a20bso717428f8f.1;
        Tue, 18 Mar 2025 08:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742310945; x=1742915745; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vfsZ4Hr0wmB5sa2cUchGQZzT0be/9tuArc+VqsT04RU=;
        b=MlHmzbgEDZhcCbySchvu+KSi9F7vAzpDqE3Cnuf2dD9VQH86SmZG9Vd69sXYxyyTGK
         EJtXZztBd651mmcLaCjrU2GBkfYMhuGOQRhFPnagkq3LiN1MKr6ULUuVUP2eTjg3wD1i
         3v8Exty74Yw41GcVf1SuGGwDfYLMJhhe0dC3WWolc/FdHSSmyhVj6yBtBlhD+lHIDTkS
         ECThYjSA+At50FpgdxCNk+krMq5qlKa8FY253YnArTpdayspGmghU1C1RwAV+jiLoAoI
         4FD1RYl8+HFdlWzqWCeDI6u8/qxqWyvbc4/oRjnZYlIWLE99A7iXEBuMP9Vtc4LqeXSL
         Aitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742310945; x=1742915745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfsZ4Hr0wmB5sa2cUchGQZzT0be/9tuArc+VqsT04RU=;
        b=TtG0xkCpkvSyQHhJPyhQBz1S/DFnRXUtegtxFocRqBF+T6UP8R9bBl+8qffzDYJsD4
         qKYihO3ze+id69irW0Sjfa+AEWFraQSIMbB4d5aanwjzw20BqBk/GF+QcY9SMS9ww9fw
         tkEGfYGC7XuPzUREkxGfRiBFhg6TJqFxbVElLXkt9lmtjqFKni2dQioiDBI77/9N3vfo
         aEg2s0CIAawHoC/30n9Y/u6G+IuV5RS4+nUwON2vo9uDJcReaoI3xrXfvS4G0YpJbpAJ
         FzDaFd3oot/T70Ocz+IMQ33UViW7cOrnjUDNa0/gchyj82ZCH9VBwxru+dDRMlMAYsbH
         14yQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+qNs96yINQIZEtkPEK5l/H1NXHeAlk276QkgYTnT/YiHVuATF5wGb2dT2v/P6N6oJvhIIRH+M2t52SLyrzOA1@lists.infradead.org, AJvYcCXoOAWDwo7YR6sKv4JxDJUlVahHajk45DPen44mg+sIOdg9rt1MrxLuR67VSYGs7em/bfu8aaAhQ7BYo6opab0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxbFKk3Pbhtu2ScquhuGYLBIzfV9BHAFpG8kI4+ebGjzMIjzZix
	lkyAs51efPwzOdChnhN/YcnvSGbFKCZfCyvsaOsGidCeyuT6HAVE
X-Gm-Gg: ASbGnctVbs0l4O9XjYEa3dKj9wk62CcaE/lwas+G7qFlq0cO8u2xaLrKPgrsuUf3F62
	gSgz7BfARZxYsV0iWb2ymCgm/J+M/99hx0VqrzWmkBWHT71OQ0C/ozd2yjMeUP1XA9gJyDvKchr
	aBxWjQaeMiGEN3kNdiZvg9L3RK7rmDTmuh2Jh/E8v9w2iiKoVaT7fbNmsUOFX/Vu9mj5Mgt8uwk
	7esXUvsTv/SN6zBWYHbMOs5Cdfown3Mzc8aCQiW9jEPCVIjm6ri16e213yColxp+XI1ypG2yOm3
	z8NWlA2epPbehqbvu1Y6DlTI0PVt+aP+
X-Google-Smtp-Source: AGHT+IFoFkrvmKX6oudoUNLDCMY8f1EeKRpKsVXrfH4lPyc9AssKZHYKJOieMoARGtgxMGgZdLntEA==
X-Received: by 2002:a5d:59a9:0:b0:382:4e71:1a12 with SMTP id ffacd0b85a97d-3971d239c31mr6323034f8f.1.1742310944949;
        Tue, 18 Mar 2025 08:15:44 -0700 (PDT)
Received: from skbuf ([86.127.125.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d2bb5f987sm82930845e9.24.2025.03.18.08.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 08:15:43 -0700 (PDT)
Date: Tue, 18 Mar 2025 17:15:40 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
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
Message-ID: <20250318151540.4rmw6jj5hh2rp4b4@skbuf>
References: <20250315154407.26304-1-ansuelsmth@gmail.com>
 <20250315154407.26304-14-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315154407.26304-14-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_081547_280972_05D15627 
X-CRM114-Status: GOOD (  17.25  )
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

On Sat, Mar 15, 2025 at 04:43:53PM +0100, Christian Marangi wrote:
> +/* Similar to MT7530 also trap link local frame and special frame to CPU */
> +static int an8855_trap_special_frames(struct an8855_priv *priv)
> +{
> +	int ret;
> +
> +	/* Trap BPDUs to the CPU port(s) and egress them
> +	 * VLAN-untagged.
> +	 */
> +	ret = regmap_update_bits(priv->regmap, AN8855_BPC,
> +				 AN8855_BPDU_BPDU_FR | AN8855_BPDU_EG_TAG |
> +				 AN8855_BPDU_PORT_FW,
> +				 AN8855_BPDU_BPDU_FR |
> +				 FIELD_PREP(AN8855_BPDU_EG_TAG, AN8855_VLAN_EG_UNTAGGED) |
> +				 FIELD_PREP(AN8855_BPDU_PORT_FW, AN8855_BPDU_CPU_ONLY));
> +	if (ret)
> +		return ret;
> +
> +	/* Trap 802.1X PAE frames to the CPU port(s) and egress them
> +	 * VLAN-untagged.
> +	 */
> +	ret = regmap_update_bits(priv->regmap, AN8855_PAC,
> +				 AN8855_PAE_BPDU_FR | AN8855_PAE_EG_TAG |
> +				 AN8855_PAE_PORT_FW,
> +				 AN8855_PAE_BPDU_FR |
> +				 FIELD_PREP(AN8855_PAE_EG_TAG, AN8855_VLAN_EG_UNTAGGED) |
> +				 FIELD_PREP(AN8855_PAE_PORT_FW, AN8855_BPDU_CPU_ONLY));
> +	if (ret)
> +		return ret;
> +
> +	/* Trap frames with :01 MAC DAs to the CPU port(s) and egress
> +	 * them VLAN-untagged.
> +	 */
> +	ret = regmap_update_bits(priv->regmap, AN8855_RGAC1,
> +				 AN8855_R01_BPDU_FR | AN8855_R01_EG_TAG |
> +				 AN8855_R01_PORT_FW,
> +				 AN8855_R01_BPDU_FR |
> +				 FIELD_PREP(AN8855_R01_EG_TAG, AN8855_VLAN_EG_UNTAGGED) |
> +				 FIELD_PREP(AN8855_R01_PORT_FW, AN8855_BPDU_CPU_ONLY));
> +	if (ret)
> +		return ret;
> +
> +	/* Trap frames with :02 MAC DAs to the CPU port(s) and egress
> +	 * them VLAN-untagged.
> +	 */
> +	ret = regmap_update_bits(priv->regmap, AN8855_RGAC1,
> +				 AN8855_R02_BPDU_FR | AN8855_R02_EG_TAG |
> +				 AN8855_R02_PORT_FW,
> +				 AN8855_R02_BPDU_FR |
> +				 FIELD_PREP(AN8855_R02_EG_TAG, AN8855_VLAN_EG_UNTAGGED) |
> +				 FIELD_PREP(AN8855_R02_PORT_FW, AN8855_BPDU_CPU_ONLY));
> +	if (ret)
> +		return ret;
> +
> +	/* Trap frames with :03 MAC DAs to the CPU port(s) and egress
> +	 * them VLAN-untagged.
> +	 */
> +	ret = regmap_update_bits(priv->regmap, AN8855_RGAC1,
> +				 AN8855_R03_BPDU_FR | AN8855_R03_EG_TAG |
> +				 AN8855_R03_PORT_FW,
> +				 AN8855_R03_BPDU_FR |
> +				 FIELD_PREP(AN8855_R03_EG_TAG, AN8855_VLAN_EG_UNTAGGED) |
> +				 FIELD_PREP(AN8855_R03_PORT_FW, AN8855_BPDU_CPU_ONLY));
> +	if (ret)
> +		return ret;
> +
> +	/* Trap frames with :0E MAC DAs to the CPU port(s) and egress
> +	 * them VLAN-untagged.
> +	 */
> +	return regmap_update_bits(priv->regmap, AN8855_RGAC1,
> +				  AN8855_R0E_BPDU_FR | AN8855_R0E_EG_TAG |
> +				  AN8855_R0E_PORT_FW,
> +				  AN8855_R0E_BPDU_FR |
> +				  FIELD_PREP(AN8855_R0E_EG_TAG, AN8855_VLAN_EG_UNTAGGED) |
> +				  FIELD_PREP(AN8855_R0E_PORT_FW, AN8855_BPDU_CPU_ONLY));
> +}

Is there a way in which you could group the registers a bit more?
The function occupies 2 screens :-/

There are 4 read-modify-write operations in succession to the RGAC1
register. Maybe you can converge them into a single regmap_update_bits()
call.

Also, for packets which reach the CPU via a trap, we shouldn't set
skb->offload_fwd_mark = 1. In other words, if the bridge layer wants to
forward them in software (including to other an8855 ports), let it do so.
The common example given in commit 515853ccecc6 ("bridge: allow
forwarding some link local frames") is 802.1X PAE (01-80-C2-00-00-03).

I notice mtk_tag_rcv() calls dsa_default_offload_fwd_mark() with no
pre-condition. Do you know whether there exists any bit in the RX tag
which signifies whether the packet was received because of a trap
(or if it was autonomously forwarded by the switch to the other bridge
ports as well)? The offload_fwd_mark bit should be set based on
something like that.

