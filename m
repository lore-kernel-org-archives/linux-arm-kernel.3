Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABD0C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWHowVpObp7HV+fLEVrMYxcsNuOJ0kAuRTVH5wUoD0k=; b=N3m1/raZQA7tgcU7Q1mtWIrTBQ
	uLDnjuMimmQYz8VKKuxmZfTU5EccIoUfxuzxXKPEqatLqto9UfFH/E+bD3aTveAo0+C3/GsXARCxm
	sWjPh6GxmQsYDCNx6y/H4/os/JWeFa3m77wEltY+Rs+QxCc9eXgkahpc8qaHdO8B12prJQRVIqk20
	1mZ4T9NrgSjiCh78ZpzKm6gDb8OXZMx0eP+5elISnoo2q2Ae4+/gYcbNGhgl7vadOQapu7XdFTDHM
	8/TPV7jVyDnKatm/NGueVjoskVhc4PVMx0V7ZgMiOvU5jk0o2J8OHYmqFhfgXuGsFvdQrQGqg97gK
	rtP/KleA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e80-0000000BMaw-3v0S;
	Wed, 23 Apr 2025 17:43:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7bzE-0000000Axgl-2XCU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 15:26:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBDA55C2CE4;
	Wed, 23 Apr 2025 15:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D06C4CEE2;
	Wed, 23 Apr 2025 15:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745421967;
	bh=fdx+A6tYLe/1AVGhBuKzYaJJVZ/VjPsQYhS5cYDFSBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r+PkeQFBD7vF6kEIPZupcaoH+HjYVBpmdseVIlvNCtzLGfPDXsTSnyf8DNJTHuwi7
	 t4Q7rKe9eOx+XYLEGiWcHOZf27W2hCcV2h5HlZeSpduzhIVRLYFkcZl/tit8ezc/pM
	 WpNtKEp5itgJw0hOTU+HPpjCIb5rZ9ViEhzRHyQKf1Bd8fEBp1YSNZipKmqN0nLAd7
	 EBfUgwRogbwjXcv5evv6WgTXbsAlEJ2RngFPZ6teSl85RGEs8JFxVwK9lqChN5zlTe
	 JyAiqAX5dXQFYPMtBJWjjp9P4OzAKnCfxvH559redbajEVnRpHtd96NeCFtiEe1nBd
	 iq0Jv0JbCHdEw==
Date: Wed, 23 Apr 2025 10:26:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: timer: via,vt8500-timer: Convert to YAML
Message-ID: <174542196522.553193.15954115826639529513.robh@kernel.org>
References: <20250418-via_vt8500_timer_binding-v2-1-3c125568f028@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-via_vt8500_timer_binding-v2-1-3c125568f028@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_082608_686442_56033FF0 
X-CRM114-Status: GOOD (  13.58  )
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


On Fri, 18 Apr 2025 18:33:45 +0400, Alexey Charkov wrote:
> Rewrite the textual description for the VIA/WonderMedia timer
> as YAML schema.
> 
> The IP can generate up to four interrupts from four respective match
> registers, so reflect that in the schema.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Split the series from v1 into separate bindings patches so as not to
> spam all the subsystems with unrelated changes, per Rob's suggestion
> 
> Changes in v2:
> - added description for the four possible interrupts (thanks Rob)
> - added overall description of the IC block
> 
> Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-6-f9af689cdfc2@gmail.com/
> ---
>  .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 -------
>  .../bindings/timer/via,vt8500-timer.yaml           | 51 ++++++++++++++++++++++
>  MAINTAINERS                                        |  2 +
>  3 files changed, 53 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


