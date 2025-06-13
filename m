Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAA8C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 06:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whxBYE463gQ4dvnKL9epaVnqgXjwtqwBi/Pgw4zDGAo=; b=fSqeA6nsXEf9Wz66fVSqE/hje2
	SDG3RbyZMVu4XDlx9zpOZ2WIUDJQhQKrc37CRj5XBt5WAKNeFukj767sVPT8uAlmGqgLenxS8ITp5
	whNR9k2hTMHCr5ucZewFfZhTwG/+UNeXFpoQrEj5ennuWP5URZuCZysNSta2ltgBK1RLhCaAo5DjI
	bzPvIOEarD19KE6UXRn54QZJhEpXCv//gjg9TqzCQpoUgJ59SZunUZyOh+ztKQuPZIMIrL9UqXIto
	frFG64T1DWWX5zuJf1dlmXhy1ZhaIJ5maODSnWEWla/sfFHB00oXaHa1U9MAiM8c20dMdB8OSaVrH
	ZNFu0JrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPxkg-0000000FTJI-0kOz;
	Fri, 13 Jun 2025 06:18:58 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPxgb-0000000FSkO-41aD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 06:14:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45C08442B2;
	Fri, 13 Jun 2025 06:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749795282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=whxBYE463gQ4dvnKL9epaVnqgXjwtqwBi/Pgw4zDGAo=;
	b=Qg6CdPM/9/G53Ye6rnkUDr/xFI5pnFi0Qc2CNo1k5EJ9FV6eeqEo9HcGkBncQNINKnTK98
	fFM2dOiZpmv915v6xjq0WEIz6AmeUYd9byqGSpg+Lz4n8SxLd86euyc46UGqdsULU+N1Tc
	7WrZMQVzSXLDZtvOaX6ufHwhVYG9UmE+/DwyiMg8vIuR7BiHJXLYgnbL+78gmDh/qqAFrP
	+qgd+urf+ygVbQn5z2gtF0L0ClUhuNkizcnLVIm99OlxY+N7yXptSwfSPx3ETcyV1dyNrQ
	Pa/ziU7E+M9dWpsuV40eIYOf1Rr85jOcyrkOxOYbTrve/Ll7IorDwei5XjJdTA==
Date: Fri, 13 Jun 2025 08:14:39 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, richardcochran@gmail.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Mun Yew Tham
 <mun.yew.tham@altera.com>
Subject: Re: [PATCH v5] dt-bindings: net: Convert socfpga-dwmac bindings to
 yaml
Message-ID: <20250613081439.2ad972ef@fedora.home>
In-Reply-To: <20250612221630.45198-1-matthew.gerlach@altera.com>
References: <20250612221630.45198-1-matthew.gerlach@altera.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujedvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehmrghtthhhvgifrdhgvghrlhgrtghhsegrlhhtvghrrgdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlo
 hhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_231446_638246_5A0E7E48 
X-CRM114-Status: UNSURE (   7.47  )
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

Hello Matthew,

On Thu, 12 Jun 2025 15:16:30 -0700
Matthew Gerlach <matthew.gerlach@altera.com> wrote:

> Convert the bindings for socfpga-dwmac to yaml. Since the original
> text contained descriptions for two separate nodes, two separate
> yaml files were created.
> 
> Signed-off-by: Mun Yew Tham <mun.yew.tham@altera.com>
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>

Sorry I've been spending some time away from netdev@ lately... This
looks very good, again thanks !

Unless there's some more comments from the DT bindings maintainers, you
can add my :
 
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

