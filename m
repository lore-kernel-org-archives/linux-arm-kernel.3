Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E14C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 14:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zotNU7rJ3SVVOWKtFNsAK5uaTmDszXvpsTrfKkmZ7NQ=; b=gWqLHatdE2dLOSuAvU3dymy5la
	n32JuatGMuztJV4o7FfX6luy1vLpiLrD3MFrafMWMKHKLmUa2Tz+AEFgWu+To9NZ/01G2du4Fsep0
	9n+gKelj3lnrGLBFVC1UjE5FPA1QYfJyiRTCqn7GciTs5NvgXP442pMjCYX6nZ/yQS7WtB7mFRdMb
	ptQpedaQ3PVjOFtwRTXQeMQ+Biumh/wS8sWqMwOqOA3r/6EJQJq0xNHu2BPPqgf2dRybPmzLuCtFi
	6PboTNjPk96k1kUG0O0bG4vIVDUb1OQFGy8eQk4x3PKgRgdfL7INBEofOTOc2hH3zCk6/uENorgGQ
	JIOZzWSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPgW-00000009wuX-03yQ;
	Fri, 07 Feb 2025 14:50:24 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPcj-00000009vZz-04kh;
	Fri, 07 Feb 2025 14:46:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3673B443B8;
	Fri,  7 Feb 2025 14:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738939585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zotNU7rJ3SVVOWKtFNsAK5uaTmDszXvpsTrfKkmZ7NQ=;
	b=mmKeQca3SwF0SEnls1X8Rt3DCjE9SSenlQicXMWpoMt80HZKE8t/yStGUuRpJDAe4pMWHw
	zhoFObvhK5kggHmjxfi5iPqqlUGcaSo+AbSTR5DdC9IHDOCYEiFGwHEy0uKsj/oYp8w9b4
	sBw9TTqa6xnTFGtBCZ4r+iklF1MxdUn8Qmrz/eeGB9ExgOQeaFAnJnfCQyI3g10WgZSebM
	ybSpBOM+iJ2qZC6GSNrpJYyHpecBfhgDuqTP3vVg2HnCLRQic0gnWVXxA2ifh3wgTnbI2a
	mmYiGE6n/C8xSaCUSNz7b6RV1NfSIX0hhdFV8EApSH/hrXXkalDfM1jykpjfCA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250203213036.9816-1-robh@kernel.org>
References: <20250203213036.9816-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mtd: physmap: Ensure all properties are
 defined
Message-Id: <173893958505.2918383.10809886449430911872.b4-ty@bootlin.com>
Date: Fri, 07 Feb 2025 15:46:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtp
 hhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_064629_208987_7B7FE030 
X-CRM114-Status: UNSURE (   6.04  )
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

On Mon, 03 Feb 2025 15:30:35 -0600, Rob Herring (Arm) wrote:
> Device specific schemas should not allow undefined properties which is
> what 'additionalProperties: true' allows. Add the missing 'ranges'
> property, and fix this constraint.
> 
> 

Applied to mtd/next, thanks!

[1/1] dt-bindings: mtd: physmap: Ensure all properties are defined
      commit: 038e2ba01cf5ff94dc8f740328ec565d18bb764e

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


