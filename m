Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A97CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 05:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2PykgTZ59OqLYyaVj3A9+ycwaibzO5zZ0kF4EM5pJA=; b=C6SsGvE6tHWcVPAUH+3OAgDYpu
	evjQVJ2ijXkqxGX0vvcTsV8oA5dxgvEYXbHuXtSgoUqR/opGZF9y3o3dTghQ7I5ZsS5yUVitT7817
	dy5i+Ewc0CW0FTvWqVfbYLWkJK1Wit6AwzN9kAGOBWJxUCfR0pA+cXX1dPE80P0AM9QGwgcAacsgJ
	W56VW/Fi4bAOI/ZUEKuRVj6IHttGil8LbowWmXqCD7xkACXnqd4IwKt1HbcGXGJZgYvH5F1x7NqJ9
	zaY7E15Fki3aXtTa0o3Ef8fgDtykMn94dehPAXgVdlMHgElUlQGQycfG+mL/Mof4VvO/nmVQXEIkk
	qt+Klnxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqHe-0000000EETQ-1aQr;
	Mon, 18 May 2026 05:12:54 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqHc-0000000EESc-2Wi9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 05:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779081168;
	bh=i2PykgTZ59OqLYyaVj3A9+ycwaibzO5zZ0kF4EM5pJA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aPKfRaxlpjRjX1lxwyOR0yHKYT3GuwmduyuUMuIz4evV85Lhyye6c/jHOGUCIdNvB
	 S5xtRrhGTLc5RP9pZSglxjsFBOPgX3ieP658Ou3ACBnx3XTLEhi7vRzYtNdUxh1jdd
	 kiCOuVgYeX8VSaa4gw3E7ayvZX/tSsblwiYJLdTckSrGK+HNVPXYVJO6usfs3MkjZV
	 ojMBo3aCxP9DfhGbNf4LAtgcZsy9ckbl6CdtoSY43nftGwYvVtirenIYoGO6GdO3s8
	 MokfjlSrD/lpiqfqLxhwqQe02ke9lSoyIK9FhXefC5zhcPSpWJhchdVLbG9MKNNbGA
	 oSII5YKFtnUgA==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 97F586025D;
	Mon, 18 May 2026 13:12:47 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Colin Huang <u8813345@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com
In-Reply-To: <20260511-add-jtag-trst-pin-v1-1-b0be2f7b2da5@gmail.com>
References: <20260511-add-jtag-trst-pin-v1-1-b0be2f7b2da5@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: anacapa: add JTAG CPLD TRST pin to
 SGPIO map
Message-Id: <177908116750.1269230.16667761190075154399.b4-ty@b4>
Date: Mon, 18 May 2026 14:42:47 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_221252_832114_82185796 
X-CRM114-Status: UNSURE (   6.94  )
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

On Mon, 11 May 2026 17:47:56 +0800, Colin Huang wrote:
> Add JTAG_CPLD_TRST_R_N to the sgpiom0 pin name table on
> Facebook Anacapa BMC.
> 
> This exposes the CPLD JTAG TRST signal through SGPIO,
> allowing proper JTAG reset control during debug.
> 
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


