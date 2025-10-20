Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC047CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DO9vb9JHUkMOObYe4kyYX1yi7stoKPV827Hln6R4Jpg=; b=mr1J4vTxfQWmun81fFqI+1rP6k
	rT/ErCx337hU1SAXeL5DXZe74cmtvqtkx/e44ZWb5S1ftOtlRuHi6ZFtwufj2kOk9jxXkTDcH6XbF
	1Ok3XmfRZqzAmdppP1zWZG0mi6w6lEMpQlDOBI2aqvmHo/ktWYImtqiIfaYfmM/gq1QEkMm+bSa3t
	qoQtfw+Elivt2mWpQraCyVXYNR0dr74QOLIHXTWPPAcTITp1hTELxK2O1GyPyhBAIeniRTzQT63mL
	xPlz4InTcV6c+buM6n8HYCIiRXjodQ9F4+7PEtRxsGU8y1Ixxu1ZGxnb/C37SFPEjwA1SBsqMhNBD
	I6SDnnIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtpy-0000000EVpS-1RE5;
	Mon, 20 Oct 2025 17:38:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtpv-0000000EVod-3eYh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:38:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7888F453DA;
	Mon, 20 Oct 2025 17:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EEF5C4CEF9;
	Mon, 20 Oct 2025 17:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760981903;
	bh=DO9vb9JHUkMOObYe4kyYX1yi7stoKPV827Hln6R4Jpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jGxH2N+suxXuL9fBx7XnLDj/IcO3ZbTHlsjED0IRBjk07PMAlLffjvZhMm6dXqi+w
	 GTkph3skkvZNYDkbbUt+U1TTPvVJcbjQPvSmGjxQ1zjUDqp+hl6Xbb0I8HxMxVHOa5
	 /rETmwErJtmJvFMKV0J1/OpjWHkrlkE1z6ofXgvngqZhWZh2qeB2mOgTrNcxclByha
	 gYk0320WvhlyT6kp2AIKcSxSpM+dUp0NqFK9X+SPXVVrYaof1CHhbeyu4PH5n4Xq0N
	 h3inVKGz2prhrznhzoJVL4TTJXF5YQ7jnHu3eTIsuFp3eBJKhzDlE2GJXCGhN1pQID
	 Z6UTb79QchYDQ==
Date: Mon, 20 Oct 2025 18:38:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] ASoC: dt-bindings: allwinner,sun4i-a10-spdif: Add
 compatible for A523
Message-ID: <20251020-thumping-duress-db0b28c24168@spud>
References: <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-4-wens@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4MvR5AwICKXo3P2G"
Content-Disposition: inline
In-Reply-To: <20251020171059.2786070-4-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_103823_920734_B024B974 
X-CRM114-Status: UNSURE (   7.63  )
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


--4MvR5AwICKXo3P2G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--4MvR5AwICKXo3P2G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZzigAKCRB4tDGHoIJi
0iuEAP9QykgOk8Xg7M8d/Z/Zjb6hbjKdEh/OWt8jFxy8X82VJAD9GmQOn2UpVy6O
yGOHvmmxySCFUg/oyxUWEhZw74wFIAw=
=5qTw
-----END PGP SIGNATURE-----

--4MvR5AwICKXo3P2G--

