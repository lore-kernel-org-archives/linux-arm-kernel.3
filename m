Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2777CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 07:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRXv1zst4Bt7hVDwEw6Xuli+96Oj2bzsZ/K5tIhZjAE=; b=JcCxgah70oZt8Lz5yEtfr4/s+w
	QIsZxjuED2riuh5SJc+Ld2d1ig/3ff7YTpYMTggGy8aRwOd3OB0eCmWAeBbkgo428YEfaex+L2GEa
	V2Z9eG+ULos74BgpN4N6u4KsiwLjXoJKAglcc0OmB2vvfnmOqS0txOp+9F63zysFKthclMrtJUUCe
	QboMdYRqq6XvKw99ulwOmODJKceAmmgr1T9Yi37NErEfy8gDdc1rUOXekJPjASBhGB7AdIxYeTqo5
	Q8wMt2xIHImAyRwZ7g/fK/ueStGfVuxxWBs5HQI3kU4ihU/FhBxoaNqpjhg+7NZ3DBtAKtohfFr/1
	TGz4fsJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthqf-000000053We-0WuV;
	Wed, 03 Sep 2025 07:24:05 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthlR-000000050lC-0VN2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:18:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756883919;
	bh=uRXv1zst4Bt7hVDwEw6Xuli+96Oj2bzsZ/K5tIhZjAE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JWW4LWs3tbhpRxs8lsvP7o9byunRuzY8Y/VBgveoTqQl9Dirf9r8oPqMZnthfs7SI
	 JsaPYQi9d3XbOv6tZx+8BToq3JP1fuGozp8BYG47j9oV0wKXxe6cZZtCTu7p4iB3wG
	 CjE1xqbiJKOZeEgxdi74oJht354j7I6voOV/835gf9swmq65Miftl144m+DwoeiYw6
	 P/5yZsKogLm6udutuVBHBG8gJYk0qovUk6MEQKhzEV5758hXC8OnZPCM8qfPN+lfO5
	 GNOw8zx7T/X9CA9uHx9o9bm4dDgUSj4zWiXoii+2IP59VglNDGt1TlNYAY2tzzfFEB
	 0EaFEmy/Y9E9w==
Received: from [10.209.99.88] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A474B6FE7C;
	Wed,  3 Sep 2025 15:18:38 +0800 (AWST)
Message-ID: <0c815a7562551caf3960cd38b5d867c80747de4b.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Drop syscon "reg-io-width" properties
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Wed, 03 Sep 2025 16:48:37 +0930
In-Reply-To: <20250829211330.1336274-1-robh@kernel.org>
References: <20250829211330.1336274-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_001841_344140_0288CBEB 
X-CRM114-Status: UNSURE (   8.07  )
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

On Fri, 2025-08-29 at 16:13 -0500, Rob Herring (Arm) wrote:
> The default width is 4 bytes for "syscon" devices, so "reg-io-width" is
> redundant and can be dropped.

I had a quick look in the syscon bindings and can't see that this is
documented? The driver implementation behaves this way though.

Andrew

