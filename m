Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F69CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 16:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0k5yjZl4vRmofziFWi9oG66Z9lvqiWvEA4ZQGqJDIvw=; b=lhU3CJ41/2qPF8hkLiirx/oz6z
	clG3sunK8ocvh97Y4z4CtbEe89yAOI93Roh7ZZCqgKDU0X+PpdGNICWhwlf4JUOGln7rb4kVoZf2o
	7GhYWGWUTluwSaa5ffvULcSll0LhbrDZJr/bdZrTaUQbYHwrLkrgxYgKErYDWHWiBZk0jUArXAVVf
	NNcZBoeji9HqCivqJvozMbkNh3//XLkzQJOXn6c50DjMNJ1UJMRR9V7byQF/uNtOmQ5HhaPQ1MYQS
	Wvt9VaDo6hUHdokR+vL6H7LquHVukMTISFVWB5W6UPt7R3twe8SUtNC1Nhh23ICnSxghFQsFBZzej
	EEF+5btg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURqs-0000000DQHn-3RMQ;
	Tue, 02 Jun 2026 16:20:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURqq-0000000DQHC-0eUi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 16:20:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D54A402CF;
	Tue,  2 Jun 2026 16:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661911F00893;
	Tue,  2 Jun 2026 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780417223;
	bh=0k5yjZl4vRmofziFWi9oG66Z9lvqiWvEA4ZQGqJDIvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hJIT0ssx97ERW0yGHGdcAT7Onyw2jRu3dp6/o7krwbw88WSv6suDGkCjttC1oDfsY
	 aSQigl1oNaNO2XtrFypJjWpzeyx9yWJbPf4I0urwcRMwUlMHmB1furYutcp9B9RRtN
	 g1OVtUn2jaT7a2LH8r2jVudjwwGLbPKZuPN32RgADkEl418D6BpCv0CD3cuFvSjUY1
	 UN9cmu2E5srnx/Twd7c1B2ZWVHke/iyUkf5XxXYOO26yFtXI4spd8q+ROi4Iz7rz/x
	 3XCAbB12R3EfmL/z9wfv9YNlNyt5uYoSNMUajVXFpP6GoUfY5AaAAs28YkFXBRgpr8
	 RjWX5shckYo+Q==
Date: Tue, 2 Jun 2026 17:20:19 +0100
From: Conor Dooley <conor@kernel.org>
To: u8813345@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	colin.huang2@amd.com
Subject: Re: [PATCH v3 1/9] dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2
 DVT board
Message-ID: <20260602-cupping-cahoots-40da41ef0f67@spud>
References: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
 <20260602-anacapa-devlop-phase-devicetree-v3-1-7c93c5df8d9b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PLx3EfovJTpILGs4"
Content-Disposition: inline
In-Reply-To: <20260602-anacapa-devlop-phase-devicetree-v3-1-7c93c5df8d9b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_092024_220166_498F8449 
X-CRM114-Status: UNSURE (   6.76  )
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


--PLx3EfovJTpILGs4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--PLx3EfovJTpILGs4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah8CwwAKCRB4tDGHoIJi
0s1kAP0VxPsI2ai9KcE8KjyAxQu6KSL/RYgc7cxhHgVC0P+rzQD2POXKO6YSEjEE
5WfTAe4ILcmjizB2Ac+SEFo7f85KAg==
=cSj8
-----END PGP SIGNATURE-----

--PLx3EfovJTpILGs4--

