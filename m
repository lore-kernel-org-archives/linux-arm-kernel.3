Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D754CC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 02:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IinE3EERWc6yXCwpp37aOo5C9ONkNdTpErOyVloYGc=; b=Hb257DOBAyH4srHpfj2VKLJehs
	HVLENmnI4tVc45ZgqLe7SNWwIWk+3vmJih1IfDdlt+T49hAQzbRDSZAgmF1TMExZADC47bIT3o9+b
	BIuKGJLfxD/aBK8lVOahsITpuIxxr9nTPTWJVuDOHMd8MhziMeeiF1HqkuU/9mUlrZDWRZXho6srn
	QRqw1OX5Tzq3T6gnb908sf+uYAS/Y9nBDf+k0tUSx0R7F4IF2cXya2Ym6ca4rFqUU2RTeOF8opTiQ
	TamLFD6PqJUEjgyy7nzAJoSQXn68eQogmIaiwKnZ4nPdN1ZR+tB7VxdJvfsD4GYLUBqLKdt5bJeSL
	ncjK02kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wui65-00000001sfw-3Nmn;
	Fri, 14 Aug 2026 02:56:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wui63-00000001sfc-2Bi2;
	Fri, 14 Aug 2026 02:56:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A09DF600AD;
	Fri, 14 Aug 2026 02:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0A21F000E9;
	Fri, 14 Aug 2026 02:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786676198;
	bh=3IinE3EERWc6yXCwpp37aOo5C9ONkNdTpErOyVloYGc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=YcgdltNi7kBCdNeGX06oUPdWsCvrcKvmYudlZeddfwNmGgulDsMTEK5+OaCKD/36n
	 nzpUi1ohZ7Gc0IwleRuC0WXsnFZG6qjs33RRiJUkw5VwHdzON42W4J3Ghl3w0ji3lh
	 4UYjfP2ctz+lh9qzBRLn1+Mwa+8LnRqW0SD1l863JdCubWOsLTLOsz9X8eKCw89QRL
	 s4PokuVjhO+D1jpBwCI/hW4RAEa0UncMpKxijJW18we4+6b5Vmb1ncVk+It8QaZu4O
	 xeoNr3iUbLX+f9XIW1198Lwip4xmnzi4rHCwQLVn641vmEaN4v+Nz7q0vgYLIt69L4
	 I10EhEOcNoPlg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260801195540.235298-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801195540.235298-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: clock: Correct white-space style
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bartosz Golaszewski <brgl@kernel.org>, Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 13 Aug 2026 19:56:36 -0700
Message-ID: <178667619639.5897.18080046231006197967@lazor>
User-Agent: alot/0.12
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

Quoting Krzysztof Kozlowski (2026-08-01 12:55:41)
> Correct a few white-space issues, like double space after '=3D' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Applied to clk-next

