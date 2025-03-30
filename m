Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212EDC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 16:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWmaPEBCcVep6ivy67YpcIJ9fVWG8k2+ksMu4Ozutug=; b=mnDohDwBhK7cSltJbdcMo59o8X
	/f0sHhB4Ldjte2WDS//fphAYK7rLvDDOUzojss3uXwqmsXPMe1chqZNEKvDBGvn9T2qxdK/M945F1
	a1qHtU1NiVCPcLORNUZXm1oAWRGpldO4gJGsDtXSka3X2YruO6uVjrQAwLGi0VSoPNLlkcKc0W908
	zlC3JdZgy5Wf1T61znp0kZE2RJkILw93Z3taVQY/bNREGUvgcyU0vU08WHWmjbNEcRrxKvqugJwiR
	Vryr0JwzGPsIhowIjL8lGMFNfq2hN1ZJXALyPi6Q2uJa+JLqaMRZQfDEX9CXWfk+FgzrctAt6UOGG
	f59ly9Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyviO-0000000GOaQ-2WAb;
	Sun, 30 Mar 2025 16:40:52 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyvgd-0000000GOUV-3mYY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 16:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KWma
	PEBCcVep6ivy67YpcIJ9fVWG8k2+ksMu4Ozutug=; b=WJxMleBGPIyk61eiSxjN
	6THuXQo5RXXvN63Bbd+EHVDh+TszFJcjZ3S2y2cINoiADEWeQSI93RsBZHrv+7Fj
	mLzL5qVZKkOuxNlo1g6LAd11GFbxvL0COskSO6qCfDFi0Fz3fGqfZHPxk3OLJvqN
	QxAHGYYiEpMNhZ0eODbZw2RXp28Zbpw5kOywhWnjsNxtzk0OF9uLu1D30UVeTXdx
	51rMcIzVuQdwSbpYHYPppo03a4e1AK1+1Y1v0kQk/LFIHTu91rj7jecRUk9Nr2Z2
	odzcZHIudGq432JzHlSi7dTgSTo4Hbh/C6JBHYasxIWkTeECeqJuc9CZSIZZt7ka
	9g==
Received: (qmail 923151 invoked from network); 30 Mar 2025 18:38:57 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2025 18:38:57 +0200
X-UD-Smtp-Session: l3s3148p1@3pSa8JExAK5Q8qei
Date: Sun, 30 Mar 2025 18:38:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexey Charkov <alchark@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Rob Herring <robh@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@lists.linux.dev,
	Tony Lindgren <tony@atomide.com>, Viresh Kumar <vireshk@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH 0/5] ARM: dts: fix faulty ohci/ehci node names
Message-ID: <Z-lzoCavFLmci1mw@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Alexey Charkov <alchark@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Rob Herring <robh@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@lists.linux.dev,
	Tony Lindgren <tony@atomide.com>, Viresh Kumar <vireshk@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>
References: <20250330121326.9069-7-wsa+renesas@sang-engineering.com>
 <2d2307d9-6a5a-400c-b209-ae2b31ef87b6@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vzh6KfJjgUUPaEDv"
Content-Disposition: inline
In-Reply-To: <2d2307d9-6a5a-400c-b209-ae2b31ef87b6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_093904_812606_1D4FF464 
X-CRM114-Status: UNSURE (   7.69  )
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


--Vzh6KfJjgUUPaEDv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> You just adjust or align them with coding style or what
> bindings/dtschema expect (but it expects due to generic naming
> convention which is still just convention).

Ack, I will "fix" :) the subjects and add your tag. Thanks!


--Vzh6KfJjgUUPaEDv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfpc5wACgkQFA3kzBSg
Kba8YA/+PD/rLwfhGQQYraav37Sl9h4EMPir7OzEK50nJ1QVdYIOm0KPE4sLNBdZ
id18ft+22rfs6F+u13xF4IEo+ON+8HS2HMoCZBZV+KD5xRt4q5dv8vpttcw/YvbT
3x8sCKi6psarTcko7SMM/eV1lcXQZTQ4cmP8A36rFDlXEkCju+wK9EFeYSDHa9oE
iu+7TXoAaGwmMLu3Qk3uUm0+MyQQQi3DvRzUAe/qW6C/Q3XQ8eUo0fDJxEgVaZXU
wL0A7Q2dmuOwPtyepwbQFLeqWJCPU1/87A0bIhxBoMX9R3yJZUWSyKmABHgnNXqr
ZeaNBSLeiZx43pz3XNHJU0l6fB6q/7x56EVEo+V0xW1whKzABP1ON6YeyEEewm/D
sZnH1ti1glAowUauFLPyp48UM9hJ3GAp+a8eZHl4CusS8wlkQbeY0p2h2uNmLLlB
j15qLBL5SGejbktjCM0ewbFLQGM1ybAzGtqk+j0OKwFUfz9L7440C3w+pfZZvOYx
Sg3HNArlrw4GfdZtHOTKT8RG+9CNGseLn3PEm+V5dQjKlQSDCFliudaMxqsw+dad
ec7nhjwjk09s0QNavm9oiyXZXbN4Ga9iv/nAfVe3n7rhHYFyrc9UquMdqIqb5bm5
KhQGd1mFaQg/XUFzGyoPGNrS4wAP8ZAbAfkiEXx2MYZnuXVETv8=
=8Dxu
-----END PGP SIGNATURE-----

--Vzh6KfJjgUUPaEDv--

