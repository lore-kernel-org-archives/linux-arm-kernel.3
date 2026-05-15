Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2243CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 13:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1O3Uv9ZACqlT1DjzNL55O3hGy5mm/f60RLVWQ8N0rvQ=; b=QklcrA0vayw6RXTPTQYFBL/81f
	oR/rzzmBe+Nax7w3HOQ95HKrygZL/ZdlQygxjaKQ4uFd5I0X9oW+HrJnUO7gmjeEor83w4IqIWkiE
	FBLBnDK9/QX6AJDZY10vp6NPbrfqJzzmlIONGD2ZyU51EKQ4CKBVPtBbBDkveLgdkSRkDW/EROTsC
	if2SwysuhJ48glNFgxT4alvWrbDKqmP6cGvPteUplFZh9W0Cxj2A1a2ViPSpat251ajXGNhTWQk67
	b5OHOfsyh9p5mF2BqgGm1XfG5zxjVf5oI0SOGxYzfcqSDwAjfzrlDaaWlznkFCr1eGmLC0qNMjemx
	2BdYZ+uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsN0-00000008Q4J-2bu5;
	Fri, 15 May 2026 13:14:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsMz-00000008Q3w-0Fnw
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 13:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1O3Uv9ZACqlT1DjzNL55O3hGy5mm/f60RLVWQ8N0rvQ=; b=BxIdPsImr6pCnRslwzJHklPZpc
	zSqmE9zCz+W7Gk2rOQNBra1LZKTLAsUrFdgDoBPdW4iiWOHYS1z0SQHsjHxN6X7Pxge4dAYM9wcPk
	/UiP7FwTx18CthBjYoApmI+PRjaGdZpEjZJFCDEMYWVOdNgUEeIc/UzH/t4rFWPiGXS3WjZClcWEL
	MkB5G59BPKmPh0CbR0rgWSieEgYDv40Z4IzVisWu+d2Uj3pjH5X6x9Y93Ufg4RRM60XMLJ21nNsIq
	ZPIIxUB2X+ERf8iaDY98owAMwT5qtsNa8/O95JC6E4txqi/bG2Y30e7iOjTIdbbAHZbqqOONnsaTy
	RWsWp5Ug==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsMw-00000005GqZ-0YAJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 13:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1O3Uv9ZACqlT1DjzNL55O3hGy5mm/f60RLVWQ8N0rvQ=; b=GDb9KE3dc8qmyI0VEzFmQ754UX
	AhMwsKMwKCOBjsy2MY+59KnOdLreZtA9w1qLHxsKCSSQuVtbXRKdfyj0QKkD5afAtyMA0LK3ObL30
	qlfGJTJDYfLT+pMTnzVEQDLgvaRPUTslm1VeNk6uhfDBBAjuw/n940U/2W8iRDykFW8w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wNsMg-0034A1-U0; Fri, 15 May 2026 15:14:06 +0200
Date: Fri, 15 May 2026 15:14:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, maxime.chevallier@bootlin.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: Re: [PATCH net v1 1/2] dt-bindings: ethernet: eswin: refine
 delay model and HSP register description
Message-ID: <0581dba0-c500-4a21-935f-9324692fce78@lunn.ch>
References: <20260507083037.152-1-lizhi2@eswincomputing.com>
 <20260507083136.175-1-lizhi2@eswincomputing.com>
 <2436c6e9-4aad-4ffd-9fef-0cbbe38dc66d@lunn.ch>
 <29bee81.8323.19e2a8bf746.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29bee81.8323.19e2a8bf746.Coremail.lizhi2@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_141422_531361_EF3EB193 
X-CRM114-Status: UNSURE (   6.60  )
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

> This will help determine whether this change should remain in the net
> series or be moved to a follow-up net-next series.

net-next. It does not fix anything which is broken, and bothers
people.

	  Andrew

