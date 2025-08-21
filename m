Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB690CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 09:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fk0xDD8EPIhERL0BEWTkkqwiBfkZLYWi21PeTKx1dEw=; b=nJropDT8edRRue0NDp7TqMLpME
	D2u6AcA1R2jeyzw4eZQhM6HNUTduupx8Jyp4ucaQJDj8qtkLC9xffxgmMrB46PL5efFCkr5G5Lo4s
	3YkD7q3gBZINldS61kfiadbc0Qf34H4qAjxto8BbjC0qCQm8iIrwXBzQ9if+N7cGa5lRTfLpP4ez2
	gWCQhv3Xu2v6eAwUBKnFYqoqMAdFVy4gku3EQt6CCBHztROHilSe4/EjztdZekRRnLdzByftuLqrM
	08LUelsseCl9ygjsIQ9WwXgcwGYHqpy6edukrLQtpLuibvPlrzp0HwRXIDaM+BOm6JuPhUqZUUBmE
	tQX3JTCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1lj-0000000GQB3-1mV0;
	Thu, 21 Aug 2025 09:39:39 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozLv-0000000G39e-2Oc8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 07:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Fk0xDD8EPIhERL0BEWTkkqwiBfkZLYWi21PeTKx1dEw=;
	b=RGXDACYuomVrVszZwmqbb8g7OMlsV/8uZbysjYBOV0ebGpaUyWTzEeceztAueh
	uKJTPh5498+RzendPtffTU8RwF9ubELeLTMZbhZRs70XHGZj1NaTBXr8gS91gZbL
	xT8s9/778pSoOVGUkQiLaEZSn4mt09aPej6EvjQ9JGe/U=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnbyf+xKZoHlYZAw--.40022S3;
	Thu, 21 Aug 2025 15:04:32 +0800 (CST)
Date: Thu, 21 Aug 2025 15:04:29 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] arm64: dts: support the i.MX8ULP EVK9 board
Message-ID: <aKbE_dWm9T0sdzTj@dragon>
References: <20250714151346.7575-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714151346.7575-1-laurentiumihalcea111@gmail.com>
X-CM-TRANSID: Ms8vCgDnbyf+xKZoHlYZAw--.40022S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYJPEUUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIAA1mmimxQDR8AAA3l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_000451_964191_F8C6751B 
X-CRM114-Status: UNSURE (   6.06  )
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

On Mon, Jul 14, 2025 at 11:13:44AM -0400, Laurentiu Mihalcea wrote:
> Laurentiu Mihalcea (2):
>   dt-bindings: arm: fsl: add i.MX8ULP EVK9 board
>   arm64: dts: imx: add dts for the imx8ulp evk9 board

Applied both, thanks!


