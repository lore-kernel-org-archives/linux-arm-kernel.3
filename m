Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B27606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 08:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=acrv6+ty;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k0ecfEyD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZCAoLYZlSrLohEk+mBrzJi43HvKosm2TxiN/tMhp9/s=; b=acrv6+tyzl+Nh03H+/F9EO60sp
	Tt8Q2lNITJsGvJIRUV4c6O8ngFlLoAUaiXzWu7ycovzNlHAdsrPiH8ZQe1xmJXMeHG+nnVFt7JDGZ
	1NAIqU4JAS2+9hW6BJeObYIGbhGpSlpeKYSEo1tYdHlcZ/T0uOrCpZOVOi4gzzmQ6F8BxOmZZKusO
	9XRPET5ehf4NywXFfbryspRvZELXRBPxvx8S9g80EJYx3wziWS/VASSeQgH8rZrjSu0i1swtmIQFW
	TBY+MSNzJMRcL4twF6jk3WiyOY+lC3+dLR91lENRh+qLRUZTYLblxpVsJr/NQaarlVA6daPsh2bqM
	oJa9Pgfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN45H-0000000D2VW-1IPc;
	Sat, 31 Oct 2026 08:05:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN45F-0000000D2VN-3pSg;
	Sat, 31 Oct 2026 08:05:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 92E3F40A3D;
	Sat, 31 Oct 2026 08:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617E71F000C1;
	Sat, 31 Oct 2026 08:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793433901;
	bh=ZCAoLYZlSrLohEk+mBrzJi43HvKosm2TxiN/tMhp9/s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k0ecfEyDslk3OPxAdAna6unlZefnr/LSIYKvo4kar7IqKLLsf3yvlR0IuZ97gCV79
	 t/fv2IGxGjaz6mfSd0xNgpGBONXUtlnisUH41brdoXR1yGN/Z8WD5Wv3zffFJ2t2G9
	 OoERCMFJ1TwI2NqVa/C/nj0BYzxew+9cHHQfwyksbLzA0vkdquWShg1/RK5YprOUN5
	 gC/wP+3E2bEWPi76yjhOitPIvGSWsYGWXG4yrGn68l7u0ecbKua29ubmmUISq69FcU
	 Ym71YAmNkC1qunfsbohxe8Fm2HygfBNcjATBQAeMX6pVi22rnjQPK/+Y91eBqclG1Z
	 yd9Chh25ADtBQ==
From: netdev-bot+sinfo@kernel.org
To: Igor Velkov <iav@iav.lv>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Lukas Wunner <lukas@wunner.de>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Wei Fang <wei.fang@nxp.com>,
 Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Doug Berger <opendmb@gmail.com>,
 Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4 0/5] net: phy: postpone PHY interrupts during sleep
 with MAC-managed PM
Date: Sat, 31 Oct 2026 08:04:59 +0000
Message-ID: <179343389984.3286.809839136574794731@kernel.org>
In-Reply-To: <20261031-b4-phylib-mac-pm-irq-v3-v4-0-5ba23b3ff9a4@iav.lv>
References: <20261031-b4-phylib-mac-pm-irq-v3-v4-0-5ba23b3ff9a4@iav.lv>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by code inspection). If it was triggered please include
   the symptoms, like the stack trace or error messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

