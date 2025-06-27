Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD46C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfNgphxE2LgL1DArG9zhqTqtGU3NlGBbCdJzbJkgPAI=; b=TFn2aBfnj1htVPN4X+SZuU89k8
	46EGk/uyhBKVkvNb6FqG2T5Hl1a6+2EEAl6AhbwBWq3tmjvXTvNhx3ogd4EnD46ZqwzzjTkKBG25l
	apXVNrhq6kAiRvdvMSJq7zJKn34t2QBqCi0umuMXBShcvJx/g9he9XOJPm/BvAVspjfZUDzvovtAb
	zo2niii9LfxoThewvAsNSeQzb2/ppSGCllFyDHOn9FR36POIw9eOPuqr6ykGnmppsqdO+0OJ7UtxQ
	nGw3Rj8rl7l5dLsNfB+46SJpMVpMnDEFZWQSU9gymKe3TXTvVAraHCC5Rdj+s/R5mRFeBAQPbBD0N
	EzNtrm7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGMn-0000000FpET-327x;
	Fri, 27 Jun 2025 21:12:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGIG-0000000FoyH-1sn7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 21:07:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D685D61438;
	Fri, 27 Jun 2025 21:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6039AC4CEE3;
	Fri, 27 Jun 2025 21:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751058421;
	bh=902EI54Gb+xcSsy1G5rvjQtc51kp9GqWt45lEhPAzSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dzt3tiMFt0adkI2hdTvKU95XriiRM/5Uu6Ikh9prqSgdF/TGmmht6ZY6HEe68R1oI
	 jjH1jZC370En+rknZQ3h02w4hkMtewNge3/9LopYy57DuQa3ah1Wttcr4SWSMX9Kn9
	 R9VoB3taXJW+UosJTvtGDo/Oskl/1QQYxAdh58qSDwwjb6PR5uOW+hsBI2q1nUtVZf
	 qK5bMgmefV90KMSRXS3ua6PgP+DH8hBE0RjOo7gQ7Addr1h0rLPON7/Lq3EBntK4Nl
	 wrTBUaSHtSrXvtDYk0ZXOTjD1YgTv4+tvjIfDwhrL743yPDjxooy+kfJvDrbxB8dgb
	 GkjQd6dAjyIpA==
Date: Fri, 27 Jun 2025 16:07:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-pwm@vger.kernel.org, imx@lists.linux.dev,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: pwm: convert lpc32xx-pwm.txt to yaml
 format
Message-ID: <175105842018.146239.1932204219454180284.robh@kernel.org>
References: <20250625161909.2541315-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625161909.2541315-1-Frank.Li@nxp.com>
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


On Wed, 25 Jun 2025 12:19:08 -0400, Frank Li wrote:
> Convert pc32xx-pwm.txt to yaml format.
> 
> Additional changes:
> - add ref to pwm.yaml
> - add clocks
> - restrict #pwm-cells to 3
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - allow clocks, there are not clocks for nxp,lpc3220-motor-pwm, so not put
> into required.
> ---
>  .../devicetree/bindings/pwm/lpc32xx-pwm.txt   | 17 -------
>  .../bindings/pwm/nxp,lpc3220-pwm.yaml         | 44 +++++++++++++++++++
>  2 files changed, 44 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pwm/lpc32xx-pwm.txt
>  create mode 100644 Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


