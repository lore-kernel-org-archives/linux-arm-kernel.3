Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B25BCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 13:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTq/+CR+1YPS7UoGRwrDDUPcf4nRdaeC2o8uP0i5q8s=; b=KKeVmnbyQ7Bh1K1ntiXp/SUQla
	gdO1zIZ2JXpAr0ffZLVEVDmsOXkORr8f5iSfejGSdR8JCdXiX07EMckIdyDkomGF98ZQIbZnuNYmv
	OA3p8x4j4Ce01wytGLg7clERfakY0twu8V5qB1gepUFCdyQlZilVPOYFNHvRJ4TCC0gZC+FXRe3QM
	1ira0Gys7ZUotZP5OhXErQm+nkCRhadKNfptT6TxkU99xdxzOmIATcwd+P8qdzyAXhsEPmY16v8eF
	sj+OfTULCvGLZbyBZ6nLfZ0kG/+q5oZ4xmcGmeqny8yhJr3GMzR8dLljob6YMcdjt+tGof9e9vEHU
	QneKGtEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAplX-0000000Dkrd-160D;
	Mon, 20 Oct 2025 13:17:35 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAplU-0000000Dkla-3nj3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 13:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=GTq/+CR+1YPS7UoGRwrDDUPcf4nRdaeC2o8uP0i5q8s=; b=UQ4RY7a+iw2ZNe6jCaBXAspIq0
	ZGZiSu+snnG1VxqR0lS6tv+dPf1jX3LpaKq0oVTtAwnhzkq8c1UUTJztqLmQbOpw2CwAuohUQ37TC
	jdfPyfM2qd5JvEEJnJLqkM/ToRFaZxlGmqpN9sTrga9IIEcdvZcy7owoCGcVpn4muoTZ2OwXAigB/
	NdbSch5+8iyAuWFOsHGaF8oQFj48nrdQIHjzKcBwtQemugFgQhGigdTRL7RJjl4+C79+cnPq5LaBp
	tbZA0qE0uy66tBV7gHf9V4uvB30R/0y2CM2VpUvIpAJrm2WuCOvM5FfqUlkQTVKt/uNkV9fbV22IZ
	d0p02pYA==;
Date: Mon, 20 Oct 2025 15:15:11 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alistair Francis
 <alistair@alistair23.me>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>, Andreas
 Kemnade <akemnade@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v3 1/3] dt-bindings: mfd: sy7636a: Add missing
 gpio pins and supply
Message-ID: <20251020151511.1fd8611b@kemnade.info>
In-Reply-To: <175993751776.2584245.7441294249150226238.b4-ty@kernel.org>
References: <20250917-sy7636-rsrc-v3-1-331237d507a2@kernel.org>
	<175993751776.2584245.7441294249150226238.b4-ty@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_061732_942839_DCFCE022 
X-CRM114-Status: GOOD (  11.82  )
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

On Wed, 08 Oct 2025 16:31:57 +0100
Lee Jones <lee@kernel.org> wrote:

> On Wed, 17 Sep 2025 09:14:29 +0200, Andreas Kemnade wrote:
> > To be able to fully describe how the SY7636A is connected to the system,
> > add properties for the EN and VCOM_EN pins. To squeeze out every bit
> > of unused current, in many devices it is possible to power off the
> > complete chip. Add an input regulator to allow that.
> > 
> >   
> 
> Applied, thanks!
> 
> [1/3] dt-bindings: mfd: sy7636a: Add missing gpio pins and supply
>       commit: 7d983e997cb53d4c48b61b105163c31c92a35823
> 
hmm, what is the fate of this? I remember having seen this in your
for-mfd-next-next branch. But now I cannot find it neither in
your mfd-next nor your mfd-next-next nor general linux-next.

Regards,
Andreas

