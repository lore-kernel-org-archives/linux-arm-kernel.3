Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F5B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 23:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mTm5UsBD;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=d5pK/Kob
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YX5EXa8MqOda9IpysisRoAlrusnl/F2jkf7qR97dinE=; b=mTm5UsBD5aGmB7u3HlxfG3YRXG
	U5BoGBfAKNK52zY3YEKPPuakydWAQ4QinmnoBf5gWsGgJwXMP8l2qymsD8Fn6S2RadGwWHhrcsdlF
	BUYZLuy4J+hfZWRkUGcqzuB2PwUGQo5K0wT2kgZHtUPeqJYJnkQQVIuSKTomASrcerkUNd3eBB3xx
	qeMDLsELvtqcBToKbGyUbo4q6R4r+s26WclDPR08dXEZHVGwe0gGVYEtnusOhw4fZMCsXrSa+oO5l
	B9MPMJ0vLDNVcLZ1LUhfoIIV40isVUSY/Ll3OWEYIL8E+pv2yzoQ3a8szXcKkJmVQZsPudgzCwwg3
	hnlQhptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMvwo-0000000Cj9O-49yN;
	Fri, 30 Oct 2026 23:23:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMvwm-0000000Cj93-1xs3;
	Fri, 30 Oct 2026 23:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=YX5EXa8MqOda9IpysisRoAlrusnl/F2jkf7qR97dinE=; b=d5pK/KobbOtuQpDfxp2yT2Kf5S
	l9hJX3nkPEjZu/TW9TDA1PZVuxX+eI131lrZFcSU3TUAxqLmfwED+9ZCRMD9WVxtGQdcAfu8z7WAw
	1ZoPZVMwNNAutn5gl7S+b86mz0BG3uWC5SIVZ96ejws4jo1UqRp8jXsfc5PScuuA6i89pcgMfl6os
	qMZvQDAmQln7oI2BBm/Cm8cJrXD+9G5gWfpzZCSFcWZCIGMPahsc5OxZzVbrHrwy5fQtMb5stvdNt
	EI82iTKnGHqc3nXiQbRU+dZoiQ4S2xj60C1VYIo6OQuPHOJzn8we40uJW8O5rOfGREj9lHlBxzvuE
	KQNEodKQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>,
 "Deomid \"rojer\" Ryabkov" <rojer@rojer.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sergey Bostandzhyan <jin@mediatomb.cc>,
 Jensen Huang <jensenhuang@friendlyarm.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Enable SDIO Wi-Fi on NanoPi R2S Plus
Date: Sat, 31 Oct 2026 00:23:35 +0100
Message-ID: <4193517.ZaRXLXkqSa@phil>
In-Reply-To: <CABFmFwrWL1sej-=xCK-opxn3B9VVy=TaCyRQU43sw=6PY7bcmQ@mail.gmail.com>
References: <20261023235959.2988087-1-rojer@rojer.me>
 <38baaf87-4d5c-48bc-a11f-a5b6c04c20a8@rock-chips.com>
 <CABFmFwrWL1sej-=xCK-opxn3B9VVy=TaCyRQU43sw=6PY7bcmQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_162344_528327_CCD8F0DB 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Deomid,

Am Dienstag, 27. Oktober 2026, 23:10:31 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Deomid "rojer" Ryabkov:
> Hi Shawn,
>=20
> agreed, it makes no sense here. will drop in v2, holding on for
> feedback on patch 1.

No direct clue about the board itself, but I assume the schematics
should be correct then?

So no change needed there and just send your v2, I guess :-)


Heiko



