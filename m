Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E4EC54799
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6URoQYvkyARkq+de1O/CjFhagN+Qpuz7SPoxi6whFsw=; b=I7vQqS9zFpYEO613O3+iWJYmt6
	0IhzfyC1Qh1vmtPtR7hFQCwnSx14xlMDpbGXRRhOm0JLGyuDB28OTOwUuw0UnkVR/n60amxsAxlqj
	8dPX3Mh57/4SHLmSHB8xghMFYApDxilSWUoNO0KXwIa45MYDGn5/jcen4slgXgAVS3oi7y5TwkNzG
	YVxrjh7rdAZWbOQ9OHQhfT/bbAg/sXinBL8bEqx+/uLFtWlZ/JYCBbRzTzUP9vcaCLfHvs+6u5Id1
	+SGHYEXdtbb3/Ogtg5pR/6xm276HIctL2dHPyp+5zjHcr1ROs0E+thx/fv+jOGWHWn4VBXXfs8X3E
	vUjTumlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4G4-00000009xYy-1OoW;
	Mon, 19 May 2025 17:26:36 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3LT-00000009o8c-33JA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 16:28:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7339843959;
	Mon, 19 May 2025 16:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747672084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6URoQYvkyARkq+de1O/CjFhagN+Qpuz7SPoxi6whFsw=;
	b=QCzgwoSzlGB5vwrvQ1ZVP9ydVTuDYM1OFRB48DoP8doFxQvmyt1ArlNphGXSwLVlmTGkcq
	cRMLQtlcxoLyAkoHP1YycLBl3qb1V8IBZCznf8/L+rhArjrJFFB7d0BdK8F/ZOg4Kiqrur
	fyj2PLk38D5/kiIxX81cSGAPHrdPaK4gnshejSAMrmCkzi1Cn+WD8nhmrqYkEKhcFx1Hyu
	a6ble7i9bBUUhToQe8FeYz0j0gRMwlG/B+mVs980YRqIEbxvN6R2Laj2Ak2zbeMv24cIfa
	Hf1iAMYHvpWzDjjhm/hzaXZOSYr8jwqI0WGWclrbf5Q2AMdB7FO68ttgUNVg7Q==
Date: Mon, 19 May 2025 18:28:01 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: exynos: use proper node names for GPIO
 based I2C busses
Message-ID: <20250519182801.09263bd3@bootlin.com>
In-Reply-To: <e5a3ce2b-4ebe-44c9-9bf5-9f460d5e7fe8@kernel.org>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
	<20250519121512.5657-2-wsa+renesas@sang-engineering.com>
	<006ee7d6-1289-4f4a-819d-9a5e5120db99@kernel.org>
	<aCtD7BH5N_uPGkq7@shikoro>
	<3f6e1b74-5d19-4194-b98b-91ab6f10446c@kernel.org>
	<aCtK1-Yn6u8-n8mU@shikoro>
	<e5a3ce2b-4ebe-44c9-9bf5-9f460d5e7fe8@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddukeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhor
 hhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhimhdrrghkhhhtrghrsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_092808_201264_EBFA5A6A 
X-CRM114-Status: GOOD (  14.32  )
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

On Mon, 19 May 2025 18:11:29 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 19/05/2025 17:14, Wolfram Sang wrote:
> >   
> >> ... so clearly the suffix is "-foo" or "-0", as we usually prefer. This
> >> should be replaced into i2c-X, by dropping "gpio", instead of using less
> >> favored suffixing (one without -).  
> > 
> > Hmm, I can't automate this because it will then need to be aligned with
> > the bus numbering of other existing non-GPIO-busses. Which is highly
> > individual per board. That means we need to drop this series?  
> 
> I think either we use i2c-X or commit 57138f5b8c92 ("schemas: i2c: Avoid
> extra characters in i2c nodename pattern") from Herve was not correct
> and needs to be fixed.
> 

I don't know if relevant for this case but Rob did the fix
  647181a ("schemas: i2c: Allow for 'i2c-.*' node names")
on top of my commit.

Best regards,
Hervé

