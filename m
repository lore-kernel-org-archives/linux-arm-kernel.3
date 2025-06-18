Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E0BC71155
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 03:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pKigNPmZrFFJC/kPV5i7vSCvjFvbcP0l1T50tmE0zw=; b=JATO+K6golwPYD0geGvcoc6ofl
	Hoytzns/Zjq5gqDWUhZnY8Qlqyo1Xx2Y3aULuRc19LowBxx8YNBozjmey782vRKcpUtooPCKhWrwP
	NstWxc+N8rLp2OyRSEQBALta7jEmzDFH3dnLdG4Mfm9WTW1DmH1mF6W8U/kpmu51rJnv00GrxWFwr
	M9YYsqwA5kBOMJAuTWF2s4Q84uo3JaeHgA9CnR3s0RXeTuVC3lSCGUG0DYdUjR0gDIfn3as9KFPIl
	WGEpKlhXtPzREsADTafrzDn6MA7ViYcIB37BRhF5QUILfqc18r3o0mkXY9wojy4KRIRiHtIZ75BJR
	CAawj4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRj7i-00000008sFt-2uir;
	Wed, 18 Jun 2025 03:06:02 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRiym-00000008rUI-2U9a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 02:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750215406;
	bh=4pKigNPmZrFFJC/kPV5i7vSCvjFvbcP0l1T50tmE0zw=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=MDag//uujeHgEIW8EjiXtf2BXnS05nbJYgYjInjggZnP4NvHya2YAyfHshB529YMQ
	 GnNytvTl57xg/M0pZLHsAFClcKzo7i+WhMqY3yMN9f0NZrbiuRbMDiIXM64j3IzRwl
	 Fdg0SmXvmffbLAcTMcTRioMOEPx3PsFnEdVD+5k451s5ztDWyPHnPQOhoNRqHcrZHN
	 5YnvQuCAm9Eg9F4DfzrXtz5UER3pRbxAV5OtksZcvATKXB7fBZK7lEQ6NGL04Zite4
	 kl0xJKcUnFVaQCJghNvtu7EdT9Y68qT/rwbkz5GRqi5zIdSyYWayaLrsHiu/kJYKHp
	 20ch+tM1+XPig==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 404B5640A0;
	Wed, 18 Jun 2025 10:56:46 +0800 (AWST)
Message-ID: <9c85755a8aff6e6f8a5548f0b5e758dce7d6353e.camel@codeconstruct.com.au>
Subject: Re: [PATCH 7/8] mmc: sdhci-of-aspeed: Remove timing phase
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cool Lee <cool_lee@aspeedtech.com>, adrian.hunter@intel.com, 
	ulf.hansson@linaro.org, joel@jms.id.au, p.zabel@pengutronix.de, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 18 Jun 2025 12:26:45 +0930
In-Reply-To: <20250615035803.3752235-8-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-8-cool_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_195648_816558_2F750531 
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

On Sun, 2025-06-15 at 11:58 +0800, Cool Lee wrote:
> The timing phase is no more needed since the auto tuning is applied.
>=20

I feel this is unwise: we're now ignoring constraints set in the
devicetree. Auto-tuning is fine, but I think that should be a feature
that new platforms can exploit by default. Older platforms that do
specify the phase values via the devicetree can be converted at the
leisure of their maintainers (by removing the phase properties).

Support needs to remain in the driver until there are no (aspeed-based)
devicetrees specifying the phases.

Andrew

