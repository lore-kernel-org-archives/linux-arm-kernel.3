Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA86CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 08:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaJdoHn0NXDruimCAXmm8uA1Fs0q8Xm1i44RzkSnJK0=; b=38HdkMwXIq1k1dck1SJq8Z2Fd7
	euzTWJ65hwpLXobuc1/Ymplsj62I/ygi0uSQj6kZMnS9O+otGdz34l/zSYlWHofRcpQ/ZsAoLBryH
	1LSTQslgtIJu2C5EEkByHu8zsNbAIAJvP19RMSsk2nSIuv8tXfBCrEOuwEEAIQzqhp2KKl6umx389
	vsfQ17LdXdzQaHDIjnPpAhj9X3ixHaOCupRyzeKAYjcb2emIafRorT0KGleJFXTsah+TmM6+X0x64
	bMe4yrBfN5/qJmefzMhqwElLYfYzea51KoFGLm6Fm+p6p7DP3XLSVN0zl80MyC0wTHzphJJqhp4KL
	Od+gwhQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7R1-0000000GEKq-0K0Q;
	Tue, 21 Oct 2025 08:09:35 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7Qy-0000000GEJt-3X2W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 08:09:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CF5A94E4123D;
	Tue, 21 Oct 2025 08:09:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9610860680;
	Tue, 21 Oct 2025 08:09:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66C00102F23E8;
	Tue, 21 Oct 2025 10:09:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761034169; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=uaJdoHn0NXDruimCAXmm8uA1Fs0q8Xm1i44RzkSnJK0=;
	b=jylajQiNswkpvpiLrpRh5lrXTaTqojw5jEJqLhUpL/ZqFUrnBRcvcO934JwKAlNNYApAXd
	Sa6UwGEwL9e7y7wlca6U8b/EFgTvmvkMJVHolpYSLiKOPISIh+A1ls3iURh15zFbPzjOu+
	XPZYQBSdnp9dDMWl/ocXovDmJw7NSZe/lsy3KhCehdtTUqhpdUsOf48DKEO5LRmS4EiS5V
	AxxsyDVpFYgG13bX5wjCFfPkuhjz12m7mTIg3OtJtfr4P4eDUthaIBQP4U1m2l7Irn8T/4
	4dNS7GVGHbn9Ynvqgg2jAHkA+XFZjHhCzL/OG2wBsHsoHbLo5zwAWywiJObqZQ==
Message-ID: <29322269-6d27-48da-a58b-1d2053369833@bootlin.com>
Date: Tue, 21 Oct 2025 10:09:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v14 00/16] net: phy: Introduce PHY ports
 representation
To: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
 <20251020185249.32d93799@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251020185249.32d93799@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_010933_013908_3DBC0E54 
X-CRM114-Status: UNSURE (   8.94  )
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

Hi Jakub,

On 21/10/2025 03:52, Jakub Kicinski wrote:
> On Mon, 13 Oct 2025 16:31:26 +0200 Maxime Chevallier wrote:
>> Hi everyone,
>>
>> Here is a V14 for the phy_port work, aiming at representing the
>> connectors and outputs of PHY devices.
> 
> I can't help but read the lack of replies from PHY maintainers
> here as a tacit rejection. Not entirely sure what to do here.
> Should we discuss this at the netdev call tomorrow (8:30am PT)?
> Would any PHY maintainer be willing to share their opinion?

I can definitely be there to discuss this, thanks for organizing this.

Maxime

