Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1714AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPAsGC/1kPwqJtEBVDKuR6kEkbgn6y+zm0h6s9vKkYg=; b=dIO052J4k1i1ivDZcnTnvMxs5l
	NwqM6yjFtxUuia5DAiRvtJ3sp3O6LxoYHLZimWUtjlkvRHFf/fTnJEp75WbwUnqO+k9Ue4S5JSjRC
	OOO/edIE35Y1YuIUUoBfLsRLAO2zhCmiOdR1sa/B4i1Ntdt3odK+3WlyShpBcHBJ44KqYitUX3KVJ
	mf8QdFXo8ip/WzC+/rflDN+tIzbXlACQX0Qi+X0q+k4fKQjtzmtDGri4qB5q66+PW1WguoADMIuL5
	PbIvNqRINTU3WasYFWCWGs1RRJzx33U/iuevo9vNrwR8yOIGv1Rcy1pUUKMU1NLlQUoGxmY8KKSNn
	ZnK+JqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAS2-000000075Fs-1yGI;
	Wed, 12 Feb 2025 10:58:42 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAKF-000000073Jq-0Mcp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 10:50:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A246F43191;
	Wed, 12 Feb 2025 10:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739357435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LPAsGC/1kPwqJtEBVDKuR6kEkbgn6y+zm0h6s9vKkYg=;
	b=C8jZPP9OENUbhih3cyMW9qDaXrAVLZ3AIGea6s0MLdCuHcdGqMlmHi8Owvu3fzToaIlRMl
	00fAiFL7m7Fo+dErGAhMaDZegjz1UbS7kL4tVp9hNpgL50LDXzMrGGC5qVuSpcnKWEwk7s
	+j018eD3QX4d7MsYwCeDcjklWy1yEREi5LEgR7UXNIqCCYU+vCHWZMiPpA7nz4uHKVFYDT
	r8Q2+8jaY1GRjHrNar8qHaXSeh7W7ugmz9CQGKQ6EFa6wlY216nVxoMtbPMbfjpIqX1mXU
	LqTb0BzoTYVZgD2vQtDB2sPRXRseS3DKdSEG101R+VZ0YzEtVEj+mjqqbzpKaA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Conor Dooley <conor@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert Marko
 <robert.marko@sartura.hr>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] marvell: DT root compatible fixes
In-Reply-To: <20250204-headfirst-evergreen-ec92900ee782@spud>
References: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
 <20250204-headfirst-evergreen-ec92900ee782@spud>
Date: Wed, 12 Feb 2025 11:50:34 +0100
Message-ID: <87wmdvsah1.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegfeeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffffkgggtgfesthhqredttddtjeenucfhrhhomhepifhrvghgohhrhicuvefngffogffpvfcuoehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfegvdehgfdtjedvtefhvdeikefgteeuhfeukeettefgvdeuueettddtkeegveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeguleegtgemheekuggvmegrtddtvgemvghftddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeguleegtgemheekuggvmegrtddtvgemvghftddupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegtohhnohhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhto
 hepshgvsggrshhtihgrnhdrhhgvshhsvghlsggrrhhthhesghhmrghilhdrtghomhdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosggvrhhtrdhmrghrkhhosehsrghrthhurhgrrdhhrhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_025039_260835_B62560B8 
X-CRM114-Status: UNSURE (   5.34  )
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

Conor Dooley <conor@kernel.org> writes:

> On Fri, Jan 31, 2025 at 03:08:24PM -0600, Rob Herring (Arm) wrote:
>> This series adds some missing root node compatibles and fixes some=20
>> errors in dts files for the root node compatibles.
>>=20
>> Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied on mvebu/dt64

Thanks,

Gregory

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

