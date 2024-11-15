Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69332D68BD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 22:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KEsDTTAK1pZnid0HCmorMUnwqRgHVrxEO5D+fdsiII=; b=ZXkaOVG2DcOUAZd6T32f5UuUOA
	XPj9QhMwFwULojq5Y6fGdYkh4bDegbwic/rRFHdphBd0WJEDRnZdlram1RjHSYbJ0g2CtFzAxU2I9
	vK5yRdSM0G5rKAPsqvMqJyd56Mxs2TgJ2sF1F6ndYBNlQ4abAQxnksLS0FqYLhSDAI2iex47hee5M
	wSO5Cl100QbR6oYVW98+3+066/4sDZPzmBbtydRzL7r3aMicXhLctsUMx4P9PkR7RemDACyzRR+Kq
	bmYpPFX+peBV4YZq2GVDR5WS8y4YMz/AnArIRR2YbvWM8ZJudupHiWesqd5zKdaAPTDBoyM8gWDgz
	yGpBpS9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC4MX-00000004Jf2-48Yq;
	Fri, 15 Nov 2024 22:00:21 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC4Ld-00000004JQz-1HJ9;
	Fri, 15 Nov 2024 21:59:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so18723305e9.1;
        Fri, 15 Nov 2024 13:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731707963; x=1732312763; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4KEsDTTAK1pZnid0HCmorMUnwqRgHVrxEO5D+fdsiII=;
        b=Z3/zjfuGx/okdbsj81Mf+4+oR9H89Ghev17q1F1+bRIQ9uVPTRD8HoPl6FnSvZq8OJ
         +aE9BybM5Q9GpE0m+MGt6056XoQtSmG4CSdjCGIWXbM/L7HOu4geYSPTtgqG4vDXoy3q
         oomjy2AgbzAtQQEoQ2azGwMrG8OBbQwvwasaMmdjG5N+qlgY/YTUiE8BdYXT/PUHhMKN
         v5df/f5ByRgMMWVbZotXtfsGXe3bgrNFXtkn8LAztzAuVgoytwSA0F+QpswwBO/LImmD
         MZ9Us7KpnM36aDOyjF2xLxYI3VUoihigL8zc/LrxLumNUZ3TEFnECCMQpLoswH2roxk5
         6qdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731707963; x=1732312763;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KEsDTTAK1pZnid0HCmorMUnwqRgHVrxEO5D+fdsiII=;
        b=iwVpjhuJGYEthEd4zx9ARHpV050tXBL0ybORRulB9/aDV+0BlyVRSrIS5xvxTTAAHh
         +eKhMN1wiJCydGTtsgRZtPOXOVxEX5yrsEj/fsRR0EmoIzXnc7HpH9uGS6erXl4QIvcp
         jXYT5v1SL8T6VRvGfvAyLgBDHOqTTcBPzWuAATluxmUFjgWTNL55jiD2gBipiulSPniv
         2wIGQ2f5hOq6lzBGfyq7zGK2Hc6g6sZtecUUciD5aXrfmeGWSDKE5XE0ffneKS16b9uK
         aRD+MD8V0+lAJTxxDRSs5naN+TjwM/Jo/HgBWoKNb2FuRD9IEA3aLaJwFshEp3qLqTM8
         LDNA==
X-Forwarded-Encrypted: i=1; AJvYcCUspXrA8EC6zB7bJVSHOwdhchT0v5tCUGwmYzvPXKkJTXO9zEdvvxAzJetZixQub/iYajClDrCHfyg2dnPgZGfU@lists.infradead.org, AJvYcCUyCORH0syOLeRMk+tgTla48cAOsZQzgifBkk69xGz0FD0DzNBRBg3zm+TBQb9tN2eSaOkE7yF4wT843aBrBHY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzT9JPklq8mxPSn8o9SwiWN1aWGQav3BhN77Wj1GaFCF8aEaryr
	cJYRD36pAmCLbsVUykaz+BrYqzvxhcJCn1Og1kp07h+emtgS6lmB
X-Google-Smtp-Source: AGHT+IGlO9LOfsdfExxUPsSllZxIcizIxX7dbevaKMvsvnKdufl+ZPJG+GzOs3jrXwz5HjTMYIpSCA==
X-Received: by 2002:a05:600c:190c:b0:431:55af:a230 with SMTP id 5b1f17b1804b1-432df798ea0mr31583215e9.33.1731707962660;
        Fri, 15 Nov 2024 13:59:22 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821adad9cesm5343076f8f.37.2024.11.15.13.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 13:59:21 -0800 (PST)
Message-ID: <6737c439.5d0a0220.d7fe0.2221@mx.google.com>
X-Google-Original-Message-ID: <ZzfENklUN81HdO4f@Ansuel-XPS.>
Date: Fri, 15 Nov 2024 22:59:18 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v5 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
References: <20241112204743.6710-1-ansuelsmth@gmail.com>
 <20241112204743.6710-4-ansuelsmth@gmail.com>
 <20241114192202.215869ed@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114192202.215869ed@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_135925_365604_228E617F 
X-CRM114-Status: GOOD (  13.83  )
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

On Thu, Nov 14, 2024 at 07:22:02PM -0800, Jakub Kicinski wrote:
> On Tue, 12 Nov 2024 21:47:26 +0100 Christian Marangi wrote:
> > +	MIB_DESC(1, 0x00, "TxDrop"),
> > +	MIB_DESC(1, 0x04, "TxCrcErr"),
> 
> What is a CRC Tx error :o 
> Just out of curiosity, not saying its worng.
>

From Documentation, FCS error frame due to TX FIFO underrun.

> > +	MIB_DESC(1, 0x08, "TxUnicast"),
> > +	MIB_DESC(1, 0x0c, "TxMulticast"),
> > +	MIB_DESC(1, 0x10, "TxBroadcast"),
> > +	MIB_DESC(1, 0x14, "TxCollision"),
> 
> Why can't these be rtnl stats, please keep in mind that we ask that
> people don't duplicate in ethtool -S what can be exposed via standard
> stats
> 

Ok I will search for this but it does sounds like something new and not
used by other DSA driver, any hint on where to look for examples?

> > +	MIB_DESC(1, 0x18, "TxSingleCollision"),
> > +	MIB_DESC(1, 0x1c, "TxMultipleCollision"),
> > +	MIB_DESC(1, 0x20, "TxDeferred"),
> > +	MIB_DESC(1, 0x24, "TxLateCollision"),
> > +	MIB_DESC(1, 0x28, "TxExcessiveCollistion"),
> > +	MIB_DESC(1, 0x2c, "TxPause"),
> > +	MIB_DESC(1, 0x30, "TxPktSz64"),
> > +	MIB_DESC(1, 0x34, "TxPktSz65To127"),
> > +	MIB_DESC(1, 0x38, "TxPktSz128To255"),
> > +	MIB_DESC(1, 0x3c, "TxPktSz256To511"),
> > +	MIB_DESC(1, 0x40, "TxPktSz512To1023"),
> > +	MIB_DESC(1, 0x44, "TxPktSz1024To1518"),
> > +	MIB_DESC(1, 0x48, "TxPktSz1519ToMax"),
> 
> we have standard stats for rmon, too
> 
> > +	MIB_DESC(2, 0x4c, "TxBytes"),
> > +	MIB_DESC(1, 0x54, "TxOversizeDrop"),
> > +	MIB_DESC(2, 0x58, "TxBadPktBytes"),
> > +	MIB_DESC(1, 0x80, "RxDrop"),
> > +	MIB_DESC(1, 0x84, "RxFiltering"),
> > +	MIB_DESC(1, 0x88, "RxUnicast"),
> > +	MIB_DESC(1, 0x8c, "RxMulticast"),
> > +	MIB_DESC(1, 0x90, "RxBroadcast"),
> > +	MIB_DESC(1, 0x94, "RxAlignErr"),
> > +	MIB_DESC(1, 0x98, "RxCrcErr"),
> > +	MIB_DESC(1, 0x9c, "RxUnderSizeErr"),
> > +	MIB_DESC(1, 0xa0, "RxFragErr"),
> > +	MIB_DESC(1, 0xa4, "RxOverSzErr"),
> > +	MIB_DESC(1, 0xa8, "RxJabberErr"),
> > +	MIB_DESC(1, 0xac, "RxPause"),
> > +	MIB_DESC(1, 0xb0, "RxPktSz64"),
> > +	MIB_DESC(1, 0xb4, "RxPktSz65To127"),
> > +	MIB_DESC(1, 0xb8, "RxPktSz128To255"),
> > +	MIB_DESC(1, 0xbc, "RxPktSz256To511"),
> > +	MIB_DESC(1, 0xc0, "RxPktSz512To1023"),
> > +	MIB_DESC(1, 0xc4, "RxPktSz1024To1518"),
> > +	MIB_DESC(1, 0xc8, "RxPktSz1519ToMax"),
> > +	MIB_DESC(2, 0xcc, "RxBytes"),
> > +	MIB_DESC(1, 0xd4, "RxCtrlDrop"),
> > +	MIB_DESC(1, 0xd8, "RxIngressDrop"),
> > +	MIB_DESC(1, 0xdc, "RxArlDrop"),
> > +	MIB_DESC(1, 0xe0, "FlowControlDrop"),
> > +	MIB_DESC(1, 0xe4, "WredDrop"),
> > +	MIB_DESC(1, 0xe8, "MirrorDrop"),
> > +	MIB_DESC(2, 0xec, "RxBadPktBytes"),
> > +	MIB_DESC(1, 0xf4, "RxsFlowSamplingPktDrop"),
> > +	MIB_DESC(1, 0xf8, "RxsFlowTotalPktDrop"),
> > +	MIB_DESC(1, 0xfc, "PortControlDrop"),
> -- 
> pw-bot: cr

-- 
	Ansuel

