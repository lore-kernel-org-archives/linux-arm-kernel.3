Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5763CCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 07:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTZ1wSbQR1lsYIr30IpvPmakl8nkFVk5+Wo0/3x+lJA=; b=vAuTCDuO7uWkZm5JECBMSF5MHC
	qgxTBEqL60YU7qi5KDBX3wdO8Tv+A87gNSdLe/9kgJjhDY9BB5yubmEivbIDYTJWAqBMWSB3K40Mh
	rJHpdLvMa9uSVBijXT1shnB/Ezhj//WUpm3ODYr/jVi1yQZFSEnEeYMVYHv6LIe/vO1y8SXD55lpl
	rGUvestK56aIGEkB1+7V7rWmv4uJ2HmqATa796tZ4TjUB8G0IDCPJLonSzcGEknB+8OulJdxXCEj1
	ES6TQtwCmTXMEF8n2qpsR7WaEYjRr4GwCZwDi3lhjzoSp5b+HVxmdyBjGJFBJMrahpeg8l/VPCPNj
	PGV4ZuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthhY-00000004yce-1cjx;
	Wed, 03 Sep 2025 07:14:40 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utheH-00000004x2Q-10rp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756883475;
	bh=KTZ1wSbQR1lsYIr30IpvPmakl8nkFVk5+Wo0/3x+lJA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RDlZ2K3LBRqdSQCbuZYKoC7FADTYf2w98B+9TyKjmQP1odliXjoKUrejIj+YhKtRq
	 RAtFad20NX7wK6Xy7aZBdCVAnInzCeB7Qu/rzcctuLQV0PrKMsHyElUu8qDTIEi4uU
	 XFF3yhKReLanl7OsJwj0N5zsS7HPrkj7ALSxevskrBYxEcBtKvlZqBvUNm09UKbd8E
	 7Y55v42caluktv8w2YxGXyABRAk0ZnqR0lXrTMGYuIxL6EZo6P9/rzHiDEfHzkIgnS
	 5+7Wfo2IY1dE8YG3wQjFwN2zdGvXojh6AmXHJ7w7Iv74cT9BHT+Qg0NrqlCW7Kp+57
	 TzpGTXI9tK9cA==
Received: from [10.209.99.88] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6DF816445D;
	Wed,  3 Sep 2025 15:11:14 +0800 (AWST)
Message-ID: <f3ffa8efe3ba5274faa87e1a6e779f2b2c069a5a.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: mfd: Convert aspeed,ast2400-p2a-ctrl to DT
 schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 03 Sep 2025 16:41:13 +0930
In-Reply-To: <20250829230450.1496151-1-robh@kernel.org>
References: <20250829230450.1496151-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_001117_469311_51B09B1F 
X-CRM114-Status: UNSURE (   6.91  )
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

On Fri, 2025-08-29 at 18:04 -0500, Rob Herring (Arm) wrote:
> Convert the aspeed,ast2x00-p2a-ctrl binding to DT schema format. The sche=
ma
> is simple enough to just add it to the parent aspeed,ast2x00-scu binding.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Thanks Rob.

