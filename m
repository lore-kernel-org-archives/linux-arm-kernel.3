Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B302ECFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 05:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MmvYsdYLqi8x/SH3dyd0R5ZjK0zEZ9vTir8J+3U8sXY=; b=0rSh5AFDR3eQhq85b8bksLeLYr
	sBiPcInDdV4hWk+cs29acLqjexw+M8kQ282iGnu3InXD2Ez305RF7Wu+iT8w32+4qhPX9oMGz5JJD
	B/+zHblQDKDnCRJktuSh3qxHFQbucTh5CcFJxS2MFnFsrVSsOYHHhTQZ9pAE44QSOdkUWFtoauExS
	AOyuAYq7CErEHJDvqR8WMo/Dca5nmpAMKglupwf+emM+BF+HeshowdKDVw9CONzkPtapA0BLGLZsq
	9eo8xyQFp1Q6bLsZQoh8eusj/+AY8XFCBy/fB1sNPQNJGR7jTggUFe3v9UwXdIRLJngdYPdvzhjUY
	E1gWsduA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNOlt-0000000B6EV-0w0B;
	Mon, 24 Nov 2025 05:05:53 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNOlr-0000000B6E4-0Jix
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 05:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1763960748;
	bh=MmvYsdYLqi8x/SH3dyd0R5ZjK0zEZ9vTir8J+3U8sXY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=U4n1f8Nai6P/wji1kcpqWMJCN1Pgwyp7L6Hc/2dmWMe9f19pTgvDvuDOsuOtxq+pP
	 uQd8JsuBDJxBZZLBWlF+ssOO1J0kLRvyWePn4iSWYMkP6FJBnkxDMqGgppd1LfEMeh
	 W3rOt5uwLnflvUn5noi9fLGhdHojb/j9cQboiMr6wlA4yO/X3MKjIcM2Bnm50aPzmC
	 d8hBKLbK0+CssWRCUC/FuzkHdzmqT0tKta1IYs4FC6oRs2gTaYbKYuhjWKFWFBhn3L
	 XK3BCs8CsNEauTX5dKEm8YEvtLOVzfVF0/GG+EtjPFiYMcV04OC+80oi8JWMVtTVzZ
	 02lM+KhhKUmog==
Received: from [192.168.68.115] (unknown [180.150.112.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 563C464DF5;
	Mon, 24 Nov 2025 13:05:47 +0800 (AWST)
Message-ID: <9e322334bbb18d559c5f1a73947976218f84f3fc.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3] ARM: dts: aspeed: clemente: add gpio line name to io
 expander
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: kimi.zy.chen@fii-foxconn.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	george.kw.lee@fii-foxconn.com
Date: Mon, 24 Nov 2025 15:35:47 +1030
In-Reply-To: <20251120-dts-add-gpio-to-io-expander-v3-1-cb650ac76f85@fii-foxconn.com>
References: <20251120-dts-add-gpio-to-io-expander-v3-1-cb650ac76f85@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_210551_305299_A83308D1 
X-CRM114-Status: GOOD (  10.42  )
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

On Thu, 2025-11-20 at 10:41 +0800, Kimi Chen via B4 Relay wrote:
> From: Kimi Chen <kimi.zy.chen@fii-foxconn.com>
>=20
> The chassis power cycle process requires a forced shutdown before
> cutting off the standby power. The SCM CPLD implements a hard shutdown
> host function that is controlled through the IO expander in the
> Clemente platform.
>=20
> This change adds a new GPIO line named "shdn_force_l_cpld" to the
> PCA9555 IO expander at line 10.
>=20

This doesn't line up with my count of where you've inserted it in the
gpio-line-names property? Is there some explanation for that? Are you
referencing pin 10 of the device? If so I feel it would be more helpful
to describe it as "IO0_6" or some such.

Andrew

