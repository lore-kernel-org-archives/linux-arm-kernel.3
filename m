Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6870DCFC521
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 09:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVxwJKQ9vlWlL+AGfp59a3iwg1Rxrjjmw0+mAA1XO8Q=; b=QQCxiQbIZ1+fOrvu64ocBGUT2S
	b4avL/ALxrpOZqtOsewnaBxE8qkG3fq6kCyStU8bzchLGhYCgv64FPRFJ30HfxJBDICIgu24uDrkj
	Y7NzO9hTP4l3hze1Sjs1PYqal9YmCv2IvdhNefyWBbC/jT64zFLSuV+N9kMzkK3ro26wS32I92lQL
	qLQ6exeh1ERO/uUFZB9R9yfJ5ZOjxA9yc+3aEwBmnZIukz03i7umjdQw4HTAeLeTPmay00BIaAfI5
	iOVY571jYrEIxDZmWQuYtA2Ut9uZPiXimKVJdoGotVsyZagnZIxa99pdcD65fUMGuOuWs/CnIRtcw
	A2xi3/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMjwj-00000009Psd-1BVa;
	Sat, 22 Nov 2025 09:30:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMjwi-00000009PsS-31hE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 09:30:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BCCF60141;
	Sat, 22 Nov 2025 09:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578F6C4CEF5;
	Sat, 22 Nov 2025 09:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763803818;
	bh=Ai+LE8Gr95nnOMo5dHhh4+Xl9SJvGnQwsoBd7ie891w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=spcxbr0Vb+zV9Jg+OS45WrgZgjKKRLox9UNR5ofiLGgRbFvJqeEAD2myouhEnziJ0
	 KALERaD28C0Gap2b6HMiiuwy/2xh3BO0ZI1xb/a3YSdgYWIS/xqnzFoFyjbC1Co9xo
	 iWvAC5yt+cMNPjkDH8+y6BOPTsa1JMReARM/CxeYrC90dTf0dacWhDOHmhwCCHDgV3
	 IdS7J0FWsai3Kgdq+urIq8aqW0JHhHfae56saW+3pv9VuRyIHCDufSb0CV2QrWwpkB
	 9yTYIbmusTz774RBJGGfLpNY5QlkXaEPGTeepgs14Z8IO4dnOVjYD7m9ZoIAaGl5D7
	 /6pWyeCNyOjOA==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20251106022405.85604-1-rosenp@gmail.com>
References: <20251106022405.85604-1-rosenp@gmail.com>
Subject: Re: [PATCH dmaengine 0/2] dmaengine: at_hdmac: support
 COMPILE_TEST
Message-Id: <176380381696.330370.13914894604690798483.b4-ty@kernel.org>
Date: Sat, 22 Nov 2025 15:00:16 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Wed, 05 Nov 2025 18:24:03 -0800, Rosen Penev wrote:
> First commit fixes compilation under 64-bit and second actually enables
> it.
> 
> Rosen Penev (2):
>   dmaengine: at_hdmac: fix formats under 64-bit
>   dmaengine: at_hdmac: add COMPILE_TEST support
> 
> [...]

Applied, thanks!

[1/2] dmaengine: at_hdmac: fix formats under 64-bit
      commit: 938eae912ac52f8e9e5f2463e2db30cfe6f895d5
[2/2] dmaengine: at_hdmac: add COMPILE_TEST support
      commit: 5d8c5bea0da97809813b5f702700019cfffb6085

Best regards,
-- 
~Vinod



