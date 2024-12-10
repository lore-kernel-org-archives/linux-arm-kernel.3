Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5704E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 22:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAnLPvcXxqQcZMFvRdGiegZqvPuvQ8o1GFTUSOFQNIg=; b=jPfbeH33gUDYG+H4r0u1NO40/G
	Xa4xkWWHX57I6FOJPihXxcI9YAX39V8e9J6645Q3EoO+YOJlIH6QyoA1JIrY5vfvcsSVxeFhNKZ6f
	OzJMRlyi2WDdb8uwpwRqGIKXne3DQzKNgIce2nRZ7RBEZ3KNQJoAWw4wwd4Awa38VJZHkRqftvi9V
	oGx0OitY5MzM2uOUxz3RgHe1iUlXvL0h7bBa73i+4VsRavQ2XkM/hAlApwVzWdx2+JG8mDxtIs2M/
	rdnhqu5optBzRWgM7kI+CO+IkJa/1aBAnPBZxj3W56leNmvfRj04N0jIIiUSZpAMAiJJ71jLyCqqc
	WC821Ecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL8hU-0000000D0GK-4AJJ;
	Tue, 10 Dec 2024 22:27:28 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL8gR-0000000D07C-3OSx;
	Tue, 10 Dec 2024 22:26:24 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3862a921123so3508334f8f.3;
        Tue, 10 Dec 2024 14:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733869582; x=1734474382; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UAnLPvcXxqQcZMFvRdGiegZqvPuvQ8o1GFTUSOFQNIg=;
        b=Hp7pCtQPd9OMVKOWiKPUkvYGQGekS8Z9GmGgqgc7ExmR5tBCJUH21Jw1fW4LC+Sgjd
         3rjEZoIk7nqO8zgwOxnM+f00N52pa4JJ6S17LtWkSsCcRMN08EFd23q2H1kKBQABqMyA
         1rG2e73Z+MxERQb4diVkuRm5Nj9u4rexPiPBizHab0GhiEcSiErbQ6K+fHQ9sVcp7ide
         7yQ5UmAFPKEYFzxxVcemYr27rd3EnGjSh1VLJtnR9huyqzx6fYHKal3i4yE3frauqEE3
         +APcnnCgKuxDC4B1vXOFvrZy5lxVqKoNMQdwltomRFOcHycA7973E5NNGEsfpKyNSPNc
         nPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733869582; x=1734474382;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAnLPvcXxqQcZMFvRdGiegZqvPuvQ8o1GFTUSOFQNIg=;
        b=bvCLwJLYNelKdDrfpTqVSBp0nhvCXHJvajYFRhe/DQDzFrGWOBJY8RHe1pAGzStnWx
         ytFg/LLHjvpc5eoCBwL9BUHJ+OHTr25V5VVc8QwGHsl1ZH7JdNIRghxvLJACwEdnEjAH
         bmQs5Wa4158XW6GnTj554lubVaNGU6/hymq+JEzF0uDOYI+cCgsCS0nXCysQSmhstgmY
         LoUiFIeg6D7AuzSfNSRQLRrCyJJ+k/Tn+UmVozRJjhthu2ClkkwnyXd3VdpFwNIgFln8
         Zpu7M6xL0Glblvnen1dSHDj1yj0VtiacWSEOwxd0CNYiiIwNndhLWcQbTY39xuOpeygQ
         GEjg==
X-Forwarded-Encrypted: i=1; AJvYcCXICOqHMM/daQrRfWTjGOaI5a/rztgp6WvFOmKB7kKCvolgv+fRLm/Srtj3a3QE7UaQQq72xV0rC/g06Tplu4c=@lists.infradead.org, AJvYcCXNsaQo2e8GnFncTy+cETp7g/PBTZyjHhCHzADQViVCKqKfxRvmzAJvLA4Y6/kD1pP7nbkXulR/vNZs8u6o4ZT5@lists.infradead.org
X-Gm-Message-State: AOJu0YzCCggSPTZJOFk6rocCkaYVZbNTaUQb/IbGsXvpI+1cIqvH/MmN
	Iq6ZJ1ZTYx10aKCIDIguJUI5vFf1+3wS1G7aEK8sx0Mq0f//bX3f
X-Gm-Gg: ASbGncszEQ1t9h6Z4ZgiRVB0ea1Jqa3aodAD7Gilkdzru/swyRYmEinzE5eLnTjiYH3
	WVPPUxjQqWuyLHT0PaoHicoXhVJ0BGBxu2fdisyew4QondBO6FTA3P0qEPsvsxqgjPybLPUWde8
	shU94y5OxterYXdAy6qf87AcE7pKLLlxdZiYkV0tWP44e21+hS4kZ+CiFY8jOFSD4jaEuh77Kaz
	9xVH6E8uktuFQPiR/aNxd/oVUZMYML98M0R6M63IGlUYOaHbGzBfBiTxOWAEDwKeaZo9r+NaXxN
	qibkdpkCrA==
X-Google-Smtp-Source: AGHT+IEIx73L8V9Xn20US5TZdCSs05hwB1+pqofuOI4Tftmw7ho7qTCb/DpbVER3GSlQTeepdonLzw==
X-Received: by 2002:a05:6000:1fae:b0:385:e30a:394e with SMTP id ffacd0b85a97d-3864ce862d2mr561573f8f.3.1733869581438;
        Tue, 10 Dec 2024 14:26:21 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f9da4cd0sm81688025e9.26.2024.12.10.14.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 14:26:20 -0800 (PST)
Message-ID: <6758c00c.050a0220.1dd14c.63cd@mx.google.com>
X-Google-Original-Message-ID: <Z1jACflOJaLJmhgy@Ansuel-XPS.>
Date: Tue, 10 Dec 2024 23:26:17 +0100
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 3/9] dt-bindings: net: dsa: Document support
 for Airoha AN8855 DSA Switch
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-4-ansuelsmth@gmail.com>
 <20241210204855.7pgvh74irualyxbn@skbuf>
 <6758ab9b.7b0a0220.3347af.914a@mx.google.com>
 <20241210221602.ohyzlic2x3pflmrg@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210221602.ohyzlic2x3pflmrg@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_142623_846550_1A40B514 
X-CRM114-Status: GOOD (  15.94  )
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

On Wed, Dec 11, 2024 at 12:16:02AM +0200, Vladimir Oltean wrote:
> On Tue, Dec 10, 2024 at 09:59:04PM +0100, Christian Marangi wrote:
> > > > +  airoha,ext-surge:
> > > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > > +    description:
> > > > +      Calibrate the internal PHY with the calibration values stored in EFUSE
> > > > +      for the r50Ohm values.
> > > 
> > > Doesn't seem that this pertains to the switch.
> > 
> > Do you think this should be placed in each PHY node?
> 
> Logically speaking, that's where it belongs.
> 
> > I wanted to prevent having to define a schema also for PHY if possible
> > given how integrated these are. (originally it was defined in DT node
> > to follow how it was done in Airoha SDK)
> 
> Does compatibility with the Airoha SDK dt-bindings matter in any way?

No it doesn't, the requirement for nvmem already deviates a lot so changes
are needed anyway.

-- 
	Ansuel

