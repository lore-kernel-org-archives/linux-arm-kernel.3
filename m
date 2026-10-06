Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D58CCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 13:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZDE1b/ofQc5+FHYtixas/9EEglj1E+MKaqTgNZXuR8=; b=BO0WjgOF8fPzhIWv4aefjtKTs8
	F/2Trz8A1pbAYAwksrpFxu9DqGBml3TP2JHblXxDvfQ4KBJy9+DrjbXGp2AYw0eAxVWu1AAbaQBCc
	EmfrmxO/lmzc+ThuBkIS4TV8+mvhgjv2wA7y/7OpPhCffSAftqjIE1KntTwJjl1GVp8/H3RmkXJFV
	UQhFLtLi4z70+LPpEvIDn12r3K1qumBihsB/pAFZHqKogv2tlPlcoR/KWqMRiJgXn69dF+FL690sr
	v5klMMx+dY4JFWycLFWGk5pGdR40Df7t/QH76HcjN+1P5Sx8v3ZcrVwKU0l2O3PCkzYvKHg+8nXjb
	9TrOwHUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4s3-00000000pLY-05gV;
	Tue, 06 Oct 2026 13:06:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4s1-00000000pLD-0bi9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 13:06:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A7136022C;
	Tue,  6 Oct 2026 13:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A531F000FF;
	Tue,  6 Oct 2026 13:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791291972;
	bh=/ZDE1b/ofQc5+FHYtixas/9EEglj1E+MKaqTgNZXuR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JNuh3wEcshU+h7D3Xjy3UfNrTnrBGpRdoWxl/kSvhdeXg0tXVARBD7pYEL8gOna4X
	 0PfDdi5aJPNyvK//QgG4uHp27aDmp8fg3vCVaxOSGkqa+Vx5MO1ci553Sc2uL/FZZR
	 XMxmmKBM2ZLIYSgYeZrrMr/GFY6nNv98gP6RD9m6mPpleugtS3BMK9TGz2Fkr0eoDn
	 atqljn5kRrQlyJlQGoREKyD7H+J6ZYZGzZNc83wN5cO+2L9bAWNEmXDvJ+/tzDddX8
	 ll2rXkRNTl7yBXFtJeSOP9vwOgeo375LP06VPQ2W1nSZtvgH+BIPeKIrY9BCGNfS1a
	 7QbyyYn4UA40Q==
Date: Tue, 6 Oct 2026 08:06:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	devicetree@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Michael Langer <michael.brainbug.langer@googlemail.com>,
	Linus Walleij <linusw@kernel.org>, linux-rtc@vger.kernel.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH v10 1/6] dt-bindings: rtc: Add pinctrl for S35390A
Message-ID: <179129196974.1658029.8967859759819960854.robh@kernel.org>
References: <20260930-rtc_s35390a_int1-v10-0-e7b1cbc50a7b@posteo.de>
 <20260930-rtc_s35390a_int1-v10-1-e7b1cbc50a7b@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-rtc_s35390a_int1-v10-1-e7b1cbc50a7b@posteo.de>
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


On Wed, 30 Sep 2026 15:31:46 +0000, Markus Probst wrote:
> Synology NAS devices use the output pin for interrupt signal 1 to wake up
> the system.
> 
> Move devicetree bindings for sii,s35390a into its own file.
> Add necessary properties to configure the individual pins via pinctrl,
> which allows the interrupt signal 1 to be used for wakeup alarm.
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  .../devicetree/bindings/rtc/sii,s35390a.yaml       | 118 +++++++++++++++++++++
>  .../devicetree/bindings/rtc/trivial-rtc.yaml       |   2 -
>  2 files changed, 118 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


