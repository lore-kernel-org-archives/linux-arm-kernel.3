Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E93BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 05:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LS6g789aLB8ApLS1q1d05BR3y23KGQ689leRV5Vb9so=; b=gBYElmqd2mlXP8RVUIqz+F5CwM
	AIQL+iS6PypM4xI0Ad5xn03KgPOLMehbnUTC6+VIDWqFZcqshf2qvnPz6h7ZhP2fTG3rso60uPLC9
	kF6O88GRD3H8O87VY3UEu8cTjrtCXgfrJlgguPyMBOSkgYQu+lSoFlwjLKpME7gc+qmVlrOuzfIhy
	JTXlvFWlOgykmNLG6kv2pb+2g5g0pLv1Mf2CUEcP+ciIUpvcpHr7gFmpH+9WABdOKKi+t2JxrP1v0
	ORDW8nnZYUpTzoZD+sPPo9ikZn9E6CMprp46MFguRdaCz7b87OfWdFD8ImrmZdbu4AwRLnsi8RvSC
	4KP9UCjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV2IB-00000003Z0w-25rT;
	Tue, 07 Jan 2025 05:38:15 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV2Gu-00000003YrH-0tsI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 05:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1736228214;
	bh=LS6g789aLB8ApLS1q1d05BR3y23KGQ689leRV5Vb9so=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PoNvvGRbsBte9//EfiRckwJTLJc5iTLakSR0TjCowl4xcFJx+B2MlUYLh8DgWVtA9
	 +nWw/DQDe7EtDtE37FLAiPSeI4fa0SATvGfh1Ps5BsWQAyWsOJJU+S/mVz3V9hI60x
	 TMmHI1HPeR9WKrjsvxg/82JHRUuDjhPeZG+HK/MF2CN/8NwPL4wqXsb9mkVTYcdcHl
	 kjzRDP1rwSXXWy7NFuXmRh/drKGVuefB27i8I8UwFr6GByaa9NNbqWQYe+jk0wFVdG
	 3lcu7WHBcxbgtzX5jnClTJRf6HRivENtNqB13pbkst5RcvHKTldRrOddKmrRIXUhFQ
	 2JpeLCpYBQBFw==
Received: from [10.200.97.88] (203-173-1-122.dyn.iinet.net.au [203.173.1.122])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C87FE706BE;
	Tue,  7 Jan 2025 13:36:47 +0800 (AWST)
Message-ID: <0b592466305793dfa788daced6368dc4c9e3852c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 4/4] ARM: dts: aspeed: system1: Use crps PSU driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Guenter Roeck <linux@roeck-us.net>, Ninad Palsule <ninad@linux.ibm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 eajames@linux.ibm.com, jdelvare@suse.com, corbet@lwn.net, joel@jms.id.au, 
 Delphine_CC_Chiu@wiwynn.com, broonie@kernel.org,
 peteryin.openbmc@gmail.com,  noahwang.wang@outlook.com,
 naresh.solanki@9elements.com, lukas@wunner.de,  jbrunet@baylibre.com,
 patrick.rudolph@9elements.com, gregkh@linuxfoundation.org, 
 peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Date: Tue, 07 Jan 2025 16:06:46 +1030
In-Reply-To: <d3de9f99-1cc2-491e-8dac-1a5d243e17f0@roeck-us.net>
References: <20241217173537.192331-1-ninad@linux.ibm.com>
	 <20241217173537.192331-5-ninad@linux.ibm.com>
	 <d3de9f99-1cc2-491e-8dac-1a5d243e17f0@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_213656_459325_214F65A3 
X-CRM114-Status: UNSURE (   9.28  )
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

On Wed, 2024-12-18 at 07:16 -0800, Guenter Roeck wrote:
> On Tue, Dec 17, 2024 at 11:35:35AM -0600, Ninad Palsule wrote:
> > The system1 uses Intel common redundant (crps185) power supplies so
> > move
> > to correct new crps driver.
> >=20
> > Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>=20
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>=20
> This patch will need to be applied through an arm tree.

I'll take it through the BMC tree.

Thanks,

Andrew

