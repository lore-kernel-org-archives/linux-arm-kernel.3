Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8226FC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 23:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fo8qKj7nqalMFa6jbEYk2gJc+8qoMJ2aW2aqOsu5f6M=; b=AuA2MT0plUBH9mp+Av7y39KY2C
	UNUJyE+5QvhZhhL1bikSMKkHtTTkjv/y4ogGRJRAO36Xt+ClMXpQN6Ea2e6ZHGyux8jL5P30cHX09
	sp3q81rluzckftKh06BOrVKtp6Uk/SD+oOPjDw422DpIzU59EkpMFrVk45oSXhjGU9IWiUZ8/afT5
	f+nrz6voq5pyFPXPnpROOZpMNBsN0RGyWdlPSh7iEFcZxMp7cblu3QdCIy0gtQD1eAV6XolLci7fp
	9y3LN7JjZMvKc6plfzmIYXUpqqVw0LPdgaquBtvlrMk9O0cf1fkIDM/OoGBv+p+sspPeeH70m0WZy
	glilxs/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9AIH-00000006l7O-0G0R;
	Tue, 22 Sep 2026 23:53:01 +0000
Received: from smtp5-g21.free.fr ([2a01:e0c:1:1599::14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9AIC-00000006l6c-2sSO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 23:52:58 +0000
Received: from L30177.local (unknown [IPv6:2a01:e0a:ac2:22b0:2cdc:bbe:fc6f:48d1])
	(Authenticated sender: vjardin@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3A3835FFAA;
	Wed, 23 Sep 2026 01:52:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1790121169;
	bh=fOkL1hSKJnjCwTHhXl0OSRfcdCEWcoIUhfY9FGgJdzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TLu/vrpEkcMTNJsY870IVqM8YtkjChmSCll7W9eE2ihzus8ps7aq8ma9xQL2wwGuQ
	 rdUUASiduU2FQZL10+kQg6QbsBMQanF9pHlczbJaORSdxeEIaWChzac3GavMoXkvyy
	 t0gm8oWh8pgmdlRK5OXS03JnhuoWk9XM45oXRSKpAi6wrHcs5oKSUTK2YCW5miikEX
	 pbu5khiOMfxx9h2H6X5O+22UxRUNT3uvbBsqC9KIZ81e4Cm8sRBnV7Bh+IzFKmHSUv
	 a2R1bhXF6sBb+epqCHrO6brXNf6BvJ1d+ijWwsJA3hWESgXwPbu8RrnKfbV9pSEjNL
	 VHvfDukBW4Y5A==
Date: Wed, 23 Sep 2026 01:52:36 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Carlos Song <carlos.song@nxp.com>
Subject: Re: [PATCH v2] i2c: imx: add I2C_M_REV_DIR_ADDR and I2C_M_NOSTART
Message-ID: <arMUxCW5ZTzLT3VN@L30177.local>
References: <20260812-for-upstream-i2c-imx-lx2160-reverse-v2-1-f1343714c5a9@free.fr>
 <apcYp0Zc7CrJMiOh@lizhi-Precision-Tower-5810>
 <aqO9SMvI89rqoEGb@L23803.iliad.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqO9SMvI89rqoEGb@L23803.iliad.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_165256_885835_C8273764 
X-CRM114-Status: UNSURE (   8.22  )
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

Hi,

Le 11/09/26 10:35, Vincent Jardin a écrit :
> Hi Oleskij, Andi,
> 
> It is a "gentle" keepalive on this patch. It has been sent last month and
> it had been ack'd by NP (both Carlos and Frank).
> 
> Is there anything else you need from me to have is applied on i2c/i2c-next ?

Please ?

Best regards,
  Vincent

