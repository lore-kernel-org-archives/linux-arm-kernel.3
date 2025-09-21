Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF38CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 17:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7YfsV2G99r80KQssVgIJbmMWK30nEvZ43WlPBGSS9xY=; b=YsjjcUgdjgf7RV0AQ//oe3ORwS
	kQx+Z8epf50bAniil23Ew9LuE/Z7CZUqXYcqvuyT2YdGuEnO1xMZhx6Zd9XnyL8oteo0OQNuARIVw
	5+5zgunR1IKLL57Wsl8FqEoGfSEvGuSbqREDHV3coZq/V3nDXjiKX2vadrYbFMqA6fIhRSDzkjSqf
	G5xDNjPPtd98bj0XVv1yn8WgOYXcMemOVHObBi9j43lasCNWXzS1uqE/4+gx7HDZkbcNF5loOYmH4
	Fg1iGJPkUxBh8tHiEKVxXeMY4GK6PE86SVjDRpR6ETr1oGk2a/YwyBkjPk5XbXCaGuSk55PMlCeEy
	wQf/qMPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NwS-00000007wKX-3lQi;
	Sun, 21 Sep 2025 17:33:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NwQ-00000007wJy-48jB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 17:33:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A09F601A3;
	Sun, 21 Sep 2025 17:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE141C4CEE7;
	Sun, 21 Sep 2025 17:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758476018;
	bh=7YfsV2G99r80KQssVgIJbmMWK30nEvZ43WlPBGSS9xY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Y/aryhQCnJCNYHglVF1skKXdPHR3ip82tNfG7amdGWDwc5a0EVPCtukBDVm9qCIPk
	 77ozaj6h5O46It0OOoeoiUTDJCea3+f9qEYA0R9gxNsydHdOe0i54uJIwq+IxgXqNc
	 tTAXY32sZKrQQC1juDFSZw7JWcOIDhiIuFGuuoqzMMZzfNbhm/Ad/A5Hriv3n1zX24
	 XS8x/Radi9W09C3ksC8zLD0r/Z1fZp1Gi3CAIu53sr9N6CkKa5WF3WS8XZyOPiIyx6
	 BZYIEyH3UDyKKZaBbHQl9rsieo2UMmF5/VzrjHdPVCcmpBBenaikmhNLR5n/30f3jg
	 1/RlDtyqdwa0A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250625-upstream_rcc_mp21-v4-3-9368a86c8515@foss.st.com>
References: <20250625-upstream_rcc_mp21-v4-0-9368a86c8515@foss.st.com> <20250625-upstream_rcc_mp21-v4-3-9368a86c8515@foss.st.com>
Subject: Re: [PATCH RESEND v4 3/3] dt-bindings: stm32: cosmetic fixes for STM32MP25 clock and reset bindings
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Sun, 21 Sep 2025 10:33:36 -0700
Message-ID: <175847601668.4354.1665490967315325613@lazor>
User-Agent: alot/0.11
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

Quoting Gabriel Fernandez (2025-06-25 02:07:26)
> - drop minItems from access-controllers
> - remove rcc label from example
> - fixes typos
> - remove double '::' from 'See also::'
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next

