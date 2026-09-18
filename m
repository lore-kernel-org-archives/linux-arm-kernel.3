Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04540C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIzulSOfGcXVqsgqU0OwvsRiP5B9G3lK3Cp7l6JKQPs=; b=pGPiSTL8ea1r2Vpo0t3DJe83lw
	MHhY7KZ00K6rKFG2vAw+Tj/yLQHBM/NYlMua4fmL73qxRnF5/mihzi0JdrHddQeOE2yGzz3By6EWP
	m1bQoQPtxajKXTBHoZE/nx5S3gBXdmVJvS0FzSGGlveuREf7dAE1wVcurcjCe9hxzS1Hcp2bmGcRl
	wFOLZIsRPfqjXtgJNDHPzLYyy48oIjJkoGjUXdCisImg1EQEQG+hdbuaOfhA0TXsog3c/peNGCFrT
	oqOVQJm9/42s2J3tqwv19LAx+NVSo9hSMaxXBa7dkpP/cP/w/gBjvCzxCcjVzoSOZoXtb4npiz9O+
	F732cF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7W5e-0000000E8Qm-2V5i;
	Fri, 18 Sep 2026 10:45:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7W5K-0000000E859-0Yqd;
	Fri, 18 Sep 2026 10:44:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DDC660A82;
	Fri, 18 Sep 2026 10:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E075F1F000FF;
	Fri, 18 Sep 2026 10:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789728289;
	bh=hIzulSOfGcXVqsgqU0OwvsRiP5B9G3lK3Cp7l6JKQPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a/ebx6ZE3GhCdIC9wVB4ASAmLQpKwpiY/K9Mfznw6N9dPYwguxfHQZNhzmCWFeUv5
	 pleWqu9AShpPNcTX6adwqqadsCifUFfBKICey/vFNuzcenhmtJoYeG63IibsyvF923
	 mo39/42EPT1S/WTH9i89g0CF3Mavj472+NxSkXv9bdF74xCwUkTF4gywhCduu/NWbt
	 Wg0kFye//eV3aS5SJ/lJSmHOIQTS8C33Cqw1nsmDvTXsOa//3l39roD/PcQXNXC6SI
	 DWTHVWILJc2FGgvBQWgYZv8K2ZmDWizLGesd1Cmdwc4vetjE3mPFth0wqVyf9rgKWC
	 QTUFV4d5qXV/g==
Date: Fri, 18 Sep 2026 12:44:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] media: dt-bindings: raspberrypi,pispbe: Fix example
 indent
Message-ID: <20260918-amusing-rat-of-nirvana-cda3f9@quoll>
References: <20260917002554.362516-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917002554.362516-1-marek.vasut+renesas@mailbox.org>
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

On Thu, Sep 17, 2026 at 02:25:18AM +0200, Marek Vasut wrote:
> Fix two spaces before { in example. No functional change.
> 
> DT checker reports this as follows:
> "
> ./Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml:56: example 0 [redundant-whitespace] extra whitespace before {

I already posted this for more files:
https://lore.kernel.org/all/20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com/

And doing such changes file-per-file is quite a churn, so better to
combine commits.

Best regards,
Krzysztof


