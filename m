Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ECBCD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nefc8G0NeaGyb3UUQULb64nwG2lmumgk5OzS0zMOeq0=; b=bQHk8Epua+XCnOSSG2MrRd8FUb
	XGlcI+ljpSTjWj/ZgdUTpObYwVs11B14VJF9aMage9G4+UBEnWd6GW4/mkx756QmJqsznITRpeWPx
	BRFYSE8Kl5OsBo2/h1F3o3c6KEoWEItRp72/Kq8fich8/+13v3VOjND7Sia9uvFfxQAfQAGWdd+0q
	A0BsTlN8xNohE+eNmZMTlixE4Y0YM/LeLnwFuykLmRyy10M0xIL6DAPaSUh4taIqavhdtSsCxKdXw
	SvnNuD/2jDPPAWPl8rQ0Fj46RO886pWy/QVcu2YwOBRW2GBk/I0U5l0I9muy6bgK8qnPKjH+lpqTj
	oKL5z8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyYI-0000000FuKD-1x2D;
	Mon, 18 May 2026 14:02:38 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyYF-0000000FuJc-3EYy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779112950;
	bh=Nefc8G0NeaGyb3UUQULb64nwG2lmumgk5OzS0zMOeq0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZWaKw0M8IW1TXPTTsI7HUNxZSISrzmkTLNJukBj40iCHyHYVdd7+OD4OIFEAzJgQi
	 M4izzl9RdIWTpSNmXU2HIRyJZd9Tyu84ONGnmB2jZrtlDPM8X/qVWbG53+dI95fvli
	 F/wol8eBioyTpGdWye8EYvva64DQiZ8sDiPMJnJpYNjJjYoCJ5N6DGKvMk5pdqGFnX
	 NL5uUDbP5H5UsdOhO1/QcgQsV2Ew5gbqu+DwFmOmmHJHjVZTEWjwJbW+RgLsylZkhy
	 EIFOVJag9WLUG0gekQ1k0RySJRIiGSKsEWFmHatrcdej7DIKRUByRex+pZfSQV9b2i
	 M35kL3oTaPnlQ==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7BCC56025D;
	Mon, 18 May 2026 22:02:29 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Patrick Williams <patrick@stwcx.xyz>, Potin Lai <potin.lai.pt@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Andrew Lunn <andrew@lunn.ch>
In-Reply-To: <20260323-sanmiguel_init_dts-v4-0-caaa48a7f7be@gmail.com>
References: <20260323-sanmiguel_init_dts-v4-0-caaa48a7f7be@gmail.com>
Subject: Re: [PATCH v4 0/2] Add Meta (Facebook) SanMiguel BMC (AST2620)
Message-Id: <177911294941.2210651.9798336892963650465.b4-ty@b4>
Date: Mon, 18 May 2026 23:32:29 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_070236_221361_7D157E62 
X-CRM114-Status: UNSURE (   6.76  )
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

On Mon, 23 Mar 2026 20:41:04 +0800, Potin Lai wrote:
> Add Linux device tree entries for Meta (Facebook) SanMiguel specific
> devices connected to the AST2620 BMC SoC.

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


