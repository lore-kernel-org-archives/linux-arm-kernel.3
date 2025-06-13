Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2A2C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 00:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rva0RzQIkUYUcYPpIJdvS6jyS8ngpfdISZUwpw5dy60=; b=ARkBN1FP2Pp9JnRpuRiQBC7A49
	k8YhEKi32qY/B79UFY6OTYlDwtFmVF1Hdwmk4CKaXHLp4sJDfMmtJVE2fJkxGQOCNnW0ANc+B31NE
	uESYBr7wDNlIEmA1xV+az38UfKJta/EakBR0tRY0s83emniqCjK2HmLqgtoyivf6tLg71/aA9kk69
	Uc0q7eSod9FrbyFLPGpwU2h/hXfYzgrahaY7pJ1wSuswXVwL/dg+uf0mG0pmehV6aYxN/KOgdhrbL
	QARRGyK7Vi8glK5dww8GGqetuKfdgDiPeyfIqhipq0bWj+djUE1KL/9ZJZD85qUaDPbB1bR7i2gq9
	9Wh9aXGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPslO-0000000F0sj-3qpc;
	Fri, 13 Jun 2025 00:59:22 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsjF-0000000F0iK-0vUC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 00:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1749776227;
	bh=rva0RzQIkUYUcYPpIJdvS6jyS8ngpfdISZUwpw5dy60=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=GCUIthgLYeq7D5761tx1yj+y8VqQXqv6qRWZ0/43kAIIjK7O84Ey9LDhbekpp4ryg
	 mq/1+2pumYSwArM5LUUK/8XkBEE3/1JDey9ckJup2qjEs/PAhHXvNgdPAMSnhZQkhi
	 go0PlroEhiksYOsUZS9wcnS1BHW93tfTIUAGnFdzZC8mtN9NVLCVq2VF9SUOdKacl/
	 LDPk1Zbmzsx2D1CqAurEfi6VtBpyh+2DPJ4EDgyRc38kDjdqcTGbgk21Zarttvr3td
	 j7WWOvId8CmjOJDonUn3+LMXWlK4xCUHtTfSXxkhI8lOXO3vFz1F1SVR4QOsbaar4s
	 WAbbR4ijK4j1A==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D9D746445B;
	Fri, 13 Jun 2025 08:57:06 +0800 (AWST)
Message-ID: <831a5bf06f6e7cd7dccce77d11209b5cc0f1387c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/2] mailbox: aspeed: add mailbox driver for AST27XX
 series SoC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jammy Huang <jammy_huang@aspeedtech.com>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "robh@kernel.org" <robh@kernel.org>, 
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>,  "joel@jms.id.au" <joel@jms.id.au>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Fri, 13 Jun 2025 10:27:06 +0930
In-Reply-To: <TYZPR06MB6568BA93BCEEBEE3B9DE15EBF177A@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20250610091026.49724-1-jammy_huang@aspeedtech.com>
	 <20250610091026.49724-3-jammy_huang@aspeedtech.com>
	 <13b88c1e404a9abe5cfae6673cb93e0b020e3524.camel@codeconstruct.com.au>
	 <TYZPR06MB6568BA93BCEEBEE3B9DE15EBF177A@TYZPR06MB6568.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_175709_445619_33CE2039 
X-CRM114-Status: UNSURE (   6.62  )
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

On Fri, 2025-06-13 at 00:51 +0000, Jammy Huang wrote:
> Hello Andrew,
>=20
> You can find it in chapter of ast2700 datasheet below.
> =C2=A0 III Function Registers -> 12 Inter Processors Communication (IPC)

Great, thanks. The description in the memory space allocation table
doesn't match the chapter heading, which is what tripped me up
("InterProcessor Controller" vs "Inter Processors Communication").

Andrew

