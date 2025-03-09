Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26937C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 17:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYVeDPxjhFeZxy0KwWJDY/eKgxnMZAxnPE/IYVsYVHI=; b=xtx4Wr17mBaBq+ANKGQEZNFDq3
	8GCMlyROw9XWvBKsKeeTLahziTMfePOfxXG52kJmTYPDFxLdR66nWokbqG6cIPE1y4oEskeA07cMq
	4YEGTlC5vH2oywuFqVavTpMGQK5nyGsfl9XSCamz0M/u29CScdIZ9d+C5EHOcY0Nv1ryRvZHh3BVP
	+WKhSJ8cDgd4uctmyaRbGxR2Lc8HeNecMR8ETeAiWQbGlJEypQRB7Zwjv9UFiOyR0H+EJPKpSZa19
	F1alPCa2LD9S+I0bDgr7bbFowwThQHux2ihvmjV86t9x+I2HJrao7ZQLi3OnxOjRPLgeid4JbS4yQ
	gYO7Zevw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trKuC-00000000tzV-2jfd;
	Sun, 09 Mar 2025 17:57:40 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKik-00000000sXy-1BpR;
	Sun, 09 Mar 2025 17:45:51 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-390e3b3d3f4so1590975f8f.2;
        Sun, 09 Mar 2025 10:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741542348; x=1742147148; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mYVeDPxjhFeZxy0KwWJDY/eKgxnMZAxnPE/IYVsYVHI=;
        b=WdAjR8J55XjYdjQrWiUsbPEOsYzf9LeKCeFQS52iuKPZCNnwoPqUnkPFadwS0jVWHH
         wURLFudcGLjIDDXzEnky0WLZZ4z6J09/7bj6mZ/cukjycYAhgYlTUCKg9u6Vq8oXpL3r
         UISbsuFI4HCql7DzU510jk20qvbp7TSd2jeNHYowDSE3ftZm4d0UPygGEZM+9xzVX1i8
         44ADBc0nParmxRcnuh5qT0y6POb82i8P4QYF2GFQdE9Nq/8g6k3Kl2tFsSabihra1pIJ
         6erY/ijOZGKrQqH2T/5hkavyFeJa2w+8bIVzakhKngU6Z0PpWpzyiGl85rq4KjFFoOCE
         WrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741542348; x=1742147148;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYVeDPxjhFeZxy0KwWJDY/eKgxnMZAxnPE/IYVsYVHI=;
        b=U5uSlPQbeCwVVXa+MHj9kRcN35HhMXJBg2bthT7Qa8nXPfi7qjLHe8NLIGSxFo7u6X
         IiXrH3m56O6UVHXqSB/sCrQIKA8XU/nGgoK79GCpym1MoSktnluLse9SbvUgoW0Fwt46
         HC01caUX/dmjqiyt/3VFaUMvZ7DM8Kf8mDBkt+xv0pbRsA+ILVume88bW76I64Xiyry5
         xLGulWcKChHmnS6jI8f5DfsfU5aarxznxyIVFOLeOVIj62YbmfN651RkxfCOhs9nCxzh
         gw5UXCPr7qbpf3i2jp6FA8WPJQ56uIBHS59hlQSrPqLwSoEBYLsCoz27sAs7OaQbZyrk
         FFsA==
X-Forwarded-Encrypted: i=1; AJvYcCUJq7biU5r8la6zEY1G/VKbrZ96jSckydgmm0nAKTmfDEnCs483/Pknqi+CXJpi9bR/OqV1eMBmbbgARHVGcEk=@lists.infradead.org, AJvYcCXzeJfJsgpecE0i95r6L26xXC/42SpCDPPLxrvUuLqHwy2FJL+SL+JwD0dLY1UkVxbCj17sv4BDRKZnp+qUdVKX@lists.infradead.org
X-Gm-Message-State: AOJu0YxUqyRzOGI4tvjIaIIU5RbiKdYRqYEE5N0iIP/furBcGIN7C7Hk
	gJzdYBXUyUU8l/jAE2dxb/rv5CNbz1vEnB+lUjKKtVmBuVusD89i
X-Gm-Gg: ASbGncvrAYGz5oXyEcyIUmDHv7vYJKtjyWXT22p/jWGtc8e4zfAPNbzd2e3UzYrk6OK
	oWA736MwzDrfe2yocmzuF4Gdusj4NLq/0jSwEr0QFsOhN+BiGFSHNJx67JFvRGLXJnm1q2u18Gp
	WEUMR9CG5xL9gLLIK1WwwW6K0yDLJzpWZnpw/pUTX3fE5XHi45iB0Vz1/hekBs5guNPqiaxsr2n
	9riUYQuFTv31uQ3sQAJXomEgSvzpciJ8984zDQJ9l0y9WRTx3pAX7HwA4I+2Xqj0PekBDPudkBp
	7pRwqhhgzsoRbt6b6iMg6B4PaLPiRW5ltPznfIj6FkYD0SRcThpFqqyHfHzjJtRdEM6MMfF30Jt
	p
X-Google-Smtp-Source: AGHT+IGp7jEKMgtsCA2TGbrvYbtqFa4WUNvO5evZDxVuTRVZ2MCZ3kALyJRYRl99L7jGJPY9VOa7nA==
X-Received: by 2002:a5d:64ce:0:b0:391:3bba:7f18 with SMTP id ffacd0b85a97d-3913bba8128mr2360645f8f.12.1741542346719;
        Sun, 09 Mar 2025 10:45:46 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c102e01sm12708957f8f.93.2025.03.09.10.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 10:45:45 -0700 (PDT)
Message-ID: <67cdd3c9.df0a0220.1c827e.b244@mx.google.com>
X-Google-Original-Message-ID: <Z83TxxTXxVGMYZzu@Ansuel-XPS.>
Date: Sun, 9 Mar 2025 18:45:43 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v12 07/13] net: mdio: regmap: add support for
 multiple valid addr
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
 <20250309172717.9067-8-ansuelsmth@gmail.com>
 <Z83RsW1_bzoEWheo@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z83RsW1_bzoEWheo@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_104550_326223_890325B6 
X-CRM114-Status: GOOD (  15.70  )
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

On Sun, Mar 09, 2025 at 05:36:49PM +0000, Russell King (Oracle) wrote:
> On Sun, Mar 09, 2025 at 06:26:52PM +0100, Christian Marangi wrote:
> > +/* If a non empty valid_addr_mask is passed, PHY address and
> > + * read/write register are encoded in the regmap register
> > + * by placing the register in the first 16 bits and the PHY address
> > + * right after.
> > + */
> > +#define MDIO_REGMAP_PHY_ADDR		GENMASK(20, 16)
> > +#define MDIO_REGMAP_PHY_REG		GENMASK(15, 0)
> 
> Clause 45 PHYs have 5 bits of PHY address, then 5 bits of mmd address,
> and then 16 bits of register address - significant in that order. Can
> we adjust the mask for the PHY address later to add the MMD between
> the PHY address and register number?
>

Honestly to future proof this, I think a good idea might be to add
helper to encode these info and use Clause 45 format even for C22.
Maybe we can use an extra bit to signal if the format is C22 or C45.

BIT(26) 0: C22 1:C45
GENMASK(25, 21) PHY ADDR
GENMASK(20, 16) MMD ADDR
GENMASK(15, 0) REG

What do you think?

-- 
	Ansuel

