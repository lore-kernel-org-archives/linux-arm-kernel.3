Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F14BC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGs/l04TD5R/3ve+iKBgA47mAtv6wQTleh/5nWpeFXY=; b=xYpQuZ7MTs71XczWCGsRxpG08J
	hREaTSP0CVz+/6rO1XgyFTqcD+gaMoi/aatM6sMS8KCa5VLFa9I1Doa5x6Q3iwd12YlgA3IXNjLFI
	qns5USTL5lzBejPiXOyKz2eWsPwLtO3mif1C5CFIEO156z6o8J57Pu3fKarfb20KpI3evqqxPL7Sq
	JgAgZm6oRW4XL2txcU70hetZIB7ymF0ZtBlMxkl2PrXh97GFOvApqBaD10CN5VPKUXeeNvaFFnt42
	RwJByMFxq5AuxzRsH7Uiy8q5Y8BHXvTwLSpt9Xcl5XJEJos4IO1zk1HWcZ2VBFL4SEkOKmA8QLdFK
	TH77rluw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBb-000000061d1-1DIq;
	Tue, 15 Jul 2025 19:19:31 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubj1a-00000005nAV-3Yn3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 17:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1752598840; x=1753203640; i=markus.elfring@web.de;
	bh=rGs/l04TD5R/3ve+iKBgA47mAtv6wQTleh/5nWpeFXY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Zj9mWXMUqbHUj5UttK3QGJjbuppTk+KdkSUpZ1PM7Bgeoddv4RJIpmIPnnwUU0xp
	 +VKV3GOju/NjT0///k/+6Z1L1wQPKi+UqO1sQVAHRiDVsOAtPGKAnA69RH6KQlCTs
	 RqD900npnnx7LTslGLgrGAWkKTuJdbALPD+OZElm/Ts41dyLh9ogI0cA3IoqNPfGW
	 dTf4mLS9FbhhzisTlBqYobRTijANMW23+ZQ0RNuldno8d0OgteIQTVbjGTuGZkFNx
	 IieZRsO0Uwu2LzIkNpThM4vMTnZXDBxzHrjrxCjYFtprdX0KLdzvxGgcFSQC2DBCN
	 P2JlXXiz8aSF73FGww==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.1]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQPdr-1uG5Qf1ZaL-00VKQl; Tue, 15
 Jul 2025 19:00:40 +0200
Message-ID: <8fe0f561-ef44-4ec2-9b93-f73105bd67ed@web.de>
Date: Tue, 15 Jul 2025 19:00:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jacky Chou <jacky_chou@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, openbmc@lists.ozlabs.org,
 BMC-SW@aspeedtech.com
References: <20250715034320.2553837-10-jacky_chou@aspeedtech.com>
Subject: Re: [PATCH v2 09/10] PCI: aspeed: Add ASPEED PCIe RC driver
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250715034320.2553837-10-jacky_chou@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PoiZJ9fSzSlWKLh1vwNyOAzkuNF7hTRNV71wlCsQn9g9VWcuxTx
 nT8JNwaatT96O2Duhbk0shm1AnqD4uQPhFU12ISegzxBQZh3+6CXUa5B7lNmbliSmSeZm8S
 G4xWGpI8d1VQASPeeVwHpTZK5ZBwxPjT7anBgPmC4d2Tui/pGWvOVuFtKIpaPfsuZYgmH0J
 v9SrV1YYB8SF8bevLSxeA==
UI-OutboundReport: notjunk:1;M01:P0:l7+GOJ6r/JI=;1sd4JOf/kjylVk4WVzZqgERQhZF
 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
 aWM3kKNw0AE8xw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_100103_261910_6A783FBD 
X-CRM114-Status: UNSURE (   6.11  )
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

=E2=80=A6
> +++ b/drivers/pci/controller/pcie-aspeed.c
> @@ -0,0 +1,1137 @@
=E2=80=A6
> +static int aspeed_irq_msi_domain_alloc(struct irq_domain *domain,
> +				       unsigned int virq, unsigned int nr_irqs,
> +				       void *args)
> +{
=E2=80=A6
> +	mutex_lock(&pcie->lock);
> +
> +	bit =3D bitmap_find_free_region(pcie->msi_irq_in_use, MAX_MSI_HOST_IRQ=
S,
> +				      get_count_order(nr_irqs));
> +
> +	mutex_unlock(&pcie->lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&pcie->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.16-rc6/source/include/linux/mutex.h#L2=
25

Regards,
Markus

