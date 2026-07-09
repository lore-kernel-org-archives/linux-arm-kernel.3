Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3ADAC44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 17:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jp5a8bkMSRq1xl2Oo/rl01UT3ouclKqmPp/YdGmSlQk=; b=Wfy6poRl0Dh2nJvdioYRPzbulK
	R4qbsrk7M3H2xom7ttZqyTCrjH348bKJZ3Xv4NWXlvDOr3h8MCcbIQHwpgYTF6XNcajvB3xwLDH7T
	hyjvAwr3s0zsP90VSakVxJJewoggVf66Y1bMYo5o5kh+ZEdAIomDb/uYnqr9YprIQQ/x0NR49OwAg
	GBtDFj20iNVp7x4LYZral32rQKFptemH9jUX+B/qxJ9u6nAVIUFy/YkK6VHct3dw50MtBkhRPul6x
	rwrV7wBU3J3xj4OuvO/Uvmbe2xqA01Hr+XdUARu8U7N5yY2JbMck+AXeag+3nip3e9T2HxYMFxDYk
	q7HD1gFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whskA-000000038tb-3GVq;
	Thu, 09 Jul 2026 17:41:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whsk9-000000038tM-2MVy;
	Thu, 09 Jul 2026 17:41:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0763F6137D;
	Thu,  9 Jul 2026 17:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4450C1F000E9;
	Thu,  9 Jul 2026 17:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783618860;
	bh=jp5a8bkMSRq1xl2Oo/rl01UT3ouclKqmPp/YdGmSlQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hpt62WD+zgewnBaiAyk8fatWfXNeZ6msb9TWBAHhAVq4M2t/m1H20BHugWN+1qft3
	 sUpQQDiw6SvKT94QQzV8cE5u8I1N2Jhp1LCEehzoDKweM+SEi70xKjp/iZpL/C3Cxm
	 nOkaQAsDU511pLqxp2SuZWQW/rBP/P7ZjK/iAZPBNTC0VOFY+gfR1+Yg0hibzCDRTU
	 r3B/69JYSRNkdfED/+CZ+vmBC+94HrRggvuaHJn7jIiDGd+wWF/uwTv+h0tLuTOChR
	 IT1mC249IAoTgoYvTqqRcNyCbo3cRoknNfjjS/H9xy/F2O7R2t4RalwMy/FcP5zttK
	 B1ViNHNNm3ugA==
Date: Thu, 9 Jul 2026 18:40:56 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: reset: amlogic: Add A9 reset compatibles
Message-ID: <20260709-gazing-splatter-d99865558ad0@spud>
References: <20260709-a9-reset-v1-0-fd7cf039b853@amlogic.com>
 <20260709-a9-reset-v1-1-fd7cf039b853@amlogic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AmdhtgpzA1lljAwD"
Content-Disposition: inline
In-Reply-To: <20260709-a9-reset-v1-1-fd7cf039b853@amlogic.com>
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

--AmdhtgpzA1lljAwD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--AmdhtgpzA1lljAwD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/dKAAKCRB4tDGHoIJi
0iLFAP49tl0vHS3N6UDt9uFBHCZ7a6q9cVF0lxC1JeZuzDsmYgD+LBAg9Ud/X8M9
ItFfalps/ENL7kn3t73vYLG2Nqi/Rgo=
=Izl9
-----END PGP SIGNATURE-----

--AmdhtgpzA1lljAwD--

