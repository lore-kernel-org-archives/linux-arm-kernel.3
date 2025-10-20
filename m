Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E70CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzTURFtPy3dzPi4sBnNAvBJIr7LYeKbmO3mMPxuwgq8=; b=O1Rl+fkIFtf1aBSRuUD6QgbMoc
	v98aq1MtAn1ZNZza7CbVPtbAHjA+u+7eHrpeqIDhkn0zrIYVpn3BtBXAzAQ7VLk6oNDFtNXw4sPzO
	MjWeditm7WxZCkq8NQoluTmv0F5o7wchsCABvwMc+UoaUI4vxKKJqtqU9dCwsNkwsscECQIlrKSee
	OQmnWvUYxQcp9yXGt8H6n8NaGvvRCRRwCcySNJzXlAEL3XNT7G5qHoPW7Vy3Q6rQ238NiFB/RkwEo
	aQlr5V8IsmEGLG2KDtvKMiMimBR2JtgOmlnmpUl4tUvIi0OFznUcMnbdNyBCq3Y2XxXZluLF7id1l
	EWQTY/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtp6-0000000EVbD-30CQ;
	Mon, 20 Oct 2025 17:37:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtp4-0000000EVaY-3y1R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:37:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B4E7440FA;
	Mon, 20 Oct 2025 17:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1D34C4CEF9;
	Mon, 20 Oct 2025 17:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760981850;
	bh=xzTURFtPy3dzPi4sBnNAvBJIr7LYeKbmO3mMPxuwgq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iVkBH+w1fTEx4moPwmvsaZPHd/pQBjIgBsR4HG4CBwAny4SdL/16DogGkAfE3wHoM
	 xztKTxM+IdtyzuT7kvBYuyVbV2th6ja3FArLJYeAhGtRo8Kt6eKL4cOp3EvYz8vcxo
	 2wpIljowvQB+YzjpRDNhGPqR8TCWvrbRw1hSsLLaD2UY07iXGerspqfRwdtdoNEWhr
	 RoeQJNGSWRKU0+fZQQiTRYTnY9INojc7E/xO6QomGquL7tLDPyDCAY+AiCuN+R4pyk
	 EwK5BdN7WAsDeURgbF5BosNRt/8yFmBgnhzfi3ZyTKpaU5FPzbL9drpCJR9eMNmZgR
	 WTktnvdL8RO0g==
Date: Mon, 20 Oct 2025 18:37:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] dt-bindings: dma: allwinner,sun50i-a64-dma: Add
 compatibles for A523
Message-ID: <20251020-unviable-barometer-b32b5b4dd3ca@spud>
References: <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xq0vNRfTQ6DP6xaL"
Content-Disposition: inline
In-Reply-To: <20251020171059.2786070-2-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_103730_996620_A04E8365 
X-CRM114-Status: UNSURE (   7.54  )
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


--Xq0vNRfTQ6DP6xaL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Xq0vNRfTQ6DP6xaL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZzVAAKCRB4tDGHoIJi
0m6ZAP4iu3Q03foC7HmRU3ggvY+2blVh8J/CJceLcdTKFy2W0AD/f9wPk9NUjSXW
z8j7PlblLCw8HPglqC+pskZiHoBQswk=
=OHda
-----END PGP SIGNATURE-----

--Xq0vNRfTQ6DP6xaL--

