Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4921AEFD23E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXkTgtMOLhl4TizRQ1OlW2YG7QtDfVSM79TSTL4IFME=; b=xFj4nHIZGhe3fHDyQJBxmSWxc6
	x9litqNIsffNzODtZz6Ps2V3rHWVYs8M/292xL7CsNbaS4nJd1LoYZ9XVijV+RQLZ0Z3+LC2hl9GA
	8lkL+Nfk/0vfcapFDOaHoHV9MkjaOTYBUjmxHxdmQ0yjHzYlIiE0+G04Kek9H1FNsfzDKGWjQMazr
	ycu2z8Aw6O4j864twyooGs4G/AEhahmjvzMTOUcsDR5nSfFQA2lVcZR1ZRk4My9plyZGhhITCMDBK
	LtPSfkPHadOZgH/wWl6TJBa1ErGO0Yk77w3Qb59S2R99xitibC2RJ3UapoxXuki/+SEHup3evB1hQ
	SUoVeRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBuz-00000003ks4-0mXh;
	Wed, 25 Feb 2026 10:14:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBux-00000003krr-1dRd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:14:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 919F260053;
	Wed, 25 Feb 2026 10:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DFDC19422;
	Wed, 25 Feb 2026 10:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772014494;
	bh=1Ezybvb09OMMSafqRAumx+H3UoRIusDuBCGUgx389YY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fiYgKzsm7m4PU0dl3fUp9v+0qOHH54sdDVevNNI4MTN8F7mg8jyfqvy21+ARQjC0b
	 RZz/GXiP5ix4rHmMrmt79i3HsHIDhR2gJmIiegSE7JH/NI3ucHG1FBm4b8oR7t/ena
	 lj2cxWwPoVcEWKNnPdNz4OKcNNIyaNhSDL8/rLnvZ4I/s/lhALu5+4KFP+2ovZ16Ba
	 VMgJ8fXtmIvudCjo1oQXtLct5gjixPIQ4T+MUKtfgx39O4zksV1VRikeFmVDpAavng
	 UdaB4exN0KrNgjdgM/gQViVNf8w+ec/QfvhDvtgeNecVOJTL4aHcOIHjo2mIHBFmh8
	 gJpBfITZU8beA==
Date: Wed, 25 Feb 2026 11:14:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, baolin.wang@linux.alibaba.com, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock
 support
Message-ID: <20260225-free-fractal-ladybug-f02feb@quoll>
References: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
 <20260224220407.2351692-2-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224220407.2351692-2-kamal.dasu@broadcom.com>
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

On Tue, Feb 24, 2026 at 05:04:05PM -0500, Kamal Dasu wrote:
> The Broadcom settop SoCs have hardware semaphores as part of the
> "sundry" IP block which has other controls that do not belong anywhere
> else e.g. pin/mux controls, SoC identification, drive strength, reset
> controls, and other misc bits are part of this block.
> 
> Adding brcmstb-hwspinlock bindings which allows the hwspinlock driver
> to iomap only the 16 hardware semaphore registers that are part of all
> settop SoCs. The semaphore registers are based on the BCM7038 SoC
> where they were first introduced in settop chips.
> 
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


