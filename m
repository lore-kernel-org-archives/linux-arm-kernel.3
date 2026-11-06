Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83DC606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 05:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A+N+PY16;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=G64l78gU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7nQnjeigU0D/Ve61Bm64NyUI5X1+1HOvlN3FLT7eQws=; b=A+N+PY16FkzqiMIGGV0I9BiUWV
	ZvSJaV74z8lzSd0tjLt9MgIemEU7IlnnICxx6B/j27NjXkdELWmOK+Wxo899kZtkcBh3eK2N0qcsf
	SLfMCsOfQHxZGTv+36420tdQM4XIdy5eteCP3pdrVl25Avi9ZMK6p4Aiyv6X+66Z0e2ObdC6hPlc/
	YbV3IxECMHEykvDN4QLQtC/TidnV7hqIJ05Zq4oEhtp6bYUgOZapmxg96wSK0BYZL3Ve/7iLaaLU6
	dRhIHTWV8XtWJmCnKHO/lt9MxkhIWrpnHneVzXsLVd4bCJR253+DSZofEzXSMkansI2xAnIgX64EN
	qS8Tz3CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPCJz-0000000BFk8-3EEZ;
	Fri, 06 Nov 2026 05:17:03 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPCJw-0000000BFjl-3lrC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 05:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793942218;
	bh=7nQnjeigU0D/Ve61Bm64NyUI5X1+1HOvlN3FLT7eQws=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=G64l78gUR0IAlLTqhtV55R1Lb0orlCMZJq0U09Smi0VvQzm6H0sg0MuO+0ZDbw0Bh
	 68LLXZ6W9vlek5PSzEXG4YuQERv7CSRERiZnqQmyn5dAVrRVQeaefh9e4zYqJDzMgW
	 Mopav8bnBAWo71A7hDm0/39v4Wmdp94SWcYIuCWpb78GyL2NXJ2lrSan0fl0D7GPBg
	 l5bbr/nRNFN2gRPR2s58wf0Y7R9u0gr7kara2GOhoGRN0pRAh66T2Eo4LBsXnG/w2p
	 7pLFDrkzQL5xbg4Z9urIbaGcaUwPSGFrQF12jZxjcCbOvOrUqsrXmxRCKZ53be2KMp
	 6Hh5+nWNR8GnQ==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 773437127A;
	Fri,  6 Nov 2026 13:16:57 +0800 (AWST)
Message-ID: <4d149414902c2e7d2d8cbfb2cf741f6e6b21add0.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: yosemite4: Remove Floating Falls
 board nodes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: eric.yang.wiwynn@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>,  Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
 <billy_tsai@aspeedtech.com>, patrick@stwcx.xyz
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Sean He
	 <sean.he.wiwynn@gmail.com>
Date: Fri, 06 Nov 2026 15:46:57 +1030
In-Reply-To: <20261105-yv4-remove-ff-nodes-v1-1-aa707a9577b7@gmail.com>
References: <20261105-yv4-remove-ff-nodes-v1-1-aa707a9577b7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_211701_142376_0B79670B 
X-CRM114-Status: GOOD (  14.17  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 2026-11-05 at 09:49 +0000, Eric Yang via B4 Relay wrote:
> From: Sean He <sean.he.wiwynn@gmail.com>
>=20
> The Floating Falls (FF) board carries a pca9537 GPIO expander at address
> 0x49 and a FRU EEPROM at address 0x50 on each slot I2C bus.=C2=A0
>=20

So the expander and EEPROM are on a pluggable board?

> FF was
> planned in the early Yosemite 4 design but has not been used since the
> DVT stage,
>=20

That indicates they were used at some point, and the design has
evolved. Which "stage" does the devicetree currently represent?

Have you seen this discussion:

https://lore.kernel.org/all/d7794f74b26bbc1ee0a70e39c5671acc018f80eb.camel@=
codeconstruct.com.au/

>  so these addresses never acknowledge. The pca953x driver
> fails to probe all eight pca9537 nodes on every boot, and the at24
> driver does not bind to the eight EEPROM nodes either. Remove the nodes
> for both devices.
>=20
> Signed-off-by: Sean He <sean.he.wiwynn@gmail.com>
> Signed-off-by: Eric Yang <eric.yang.wiwynn@gmail.com>
> ---
> The changelog was drafted with an AI assistant (Claude Code) and
> reviewed by the submitter.
>=20
> Tested on two Yosemite 4 BMCs, baseline vs patched image: the eight
> pca9537 nodes and the sixteen 0x49/0x50 slot-bus clients are gone, while
> the 0x51/0x54 clients, gpio chips and FRU objects are unchanged.
> CHECK_DTBS=3Dy W=3D1 shows no new warnings and the DTB diff is exactly th=
e
> sixteen removed nodes.

This kind of verification isn't terribly useful? Are we trying to prove
that dtc has correctly translated the dts? This reads like it's AI
fluff and is better left out.

Andrew

