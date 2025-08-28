Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1AFC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSYEX4c2DZhNrP+PCNeyaxJtbmnZq4iS9Apg1fXlrj4=; b=Scx/BGYDyBNYjZ8bmhkkFgw5zh
	hfAu3WXZIIOyu5p4C1rjKLbj6vfNXEXluO8PFliopfdFNF9MS8GMAjo1k2GoAYfIxg4t+1iXD7l/9
	LGKqv70ssOw4RRKA4iNXmIg7+XUlOmI2xDjT4rI6tZuCwV5Mqd4JSwlUS7L05DUJzFhw5dyBRyBEA
	G6/1QsPM9CC5IFdrGvCovibahe15cuR3Aiy4iBQu4r2o2KqHFlDG+tut4uvOPRoOMTjiCEckFzoZY
	9sxKZfRNy3JRE689ud1i+mBMyXZvilvugrBSvBNP3mmCFLBzqUU5RFsHzjXD8deEu3rs19j86zGj2
	pxgoUrxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgOh-00000002Tlx-2HVk;
	Thu, 28 Aug 2025 17:26:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urcg6-00000001k3g-1aU5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:28:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 68645600AA;
	Thu, 28 Aug 2025 13:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1933BC4CEEB;
	Thu, 28 Aug 2025 13:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756387713;
	bh=sD6IqhJUAUQSX8sWZdD+3J1KXCwPxPovjWXybaXMCZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1pkrag3z0zG5P2/OS95dMgXCg9ooEhLyjZP0/T3B5huTEC2F1sowiuxHCCFXHJJD
	 jZma4iNXMv9yXOUJqHz+wiaJPLp/qypSI7D6uo2zDC5AVKLvcBQlciZTxxGl0IgtIg
	 emSx6QrjXFWKjQNOwK9YCx1YtdSeLnGaBcbY5uV2Pb1dVmDKzs10vzO6IA4jSfyb5t
	 m4W9QHV8iG7Bw3f0EAFUJuUXmMX03eCugeF2MXBoHNBfTmA1O54hWKf1XTDSV1GXU2
	 fTqDTmduG+AZYmw7fnw6GuwLDzQBxit2hzfibIUY2kWZP+dD7vzjf3qxWkr2i+FP/x
	 RUxH0BCCnTT7A==
Date: Thu, 28 Aug 2025 14:28:28 +0100
From: Simon Horman <horms@kernel.org>
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"moderated list:ARM/CAVIUM THUNDER NETWORK DRIVER" <linux-arm-kernel@lists.infradead.org>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: thunderx: Remove redundant ternary operators
Message-ID: <20250828132828.GL10519@horms.kernel.org>
References: <20250827101607.444580-1-liaoyuanhong@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827101607.444580-1-liaoyuanhong@vivo.com>
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

On Wed, Aug 27, 2025 at 06:16:07PM +0800, Liao Yuanhong wrote:
> For ternary operators in the form of "a ? true : false", if 'a' itself
> returns a boolean result, the ternary operator can be omitted. Remove
> redundant ternary operators to clean up the code.
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>

Quoting documentation:

  Clean-up patches
  ~~~~~~~~~~~~~~~~

  Netdev discourages patches which perform simple clean-ups, which are not in
  the context of other work. For example:

  * Addressing ``checkpatch.pl`` warnings
  * Addressing :ref:`Local variable ordering<rcs>` issues
  * Conversions to device-managed APIs (``devm_`` helpers)

  This is because it is felt that the churn that such changes produce comes
  at a greater cost than the value of such clean-ups.

  Conversely, spelling and grammar fixes are not discouraged.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#clean-up-patches
--
pw-bot: cr


