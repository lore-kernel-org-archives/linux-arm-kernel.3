Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0504FC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 12:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4IRRsvoo8LNiQl/rxb0KCoq+lvsxQ7GebgKoKD5CQk=; b=sgAw3GKX/70mY1cNTZaVow1ax8
	J98O+ilfS211KhursDmi1k+4i/Ge0V5+8lFCwCqFnUZPRZYNDWZhPLTRXPWSQIDSZ2JfOy3NIjXv6
	AdNwzmpCMtL44KgX12jAmXyTvxwSBJVnEsCF2Dw95JF0LmlvbhMcUwel1r14y+JsNfAWbWsGvZag0
	uW4R5sw4RSLJd90h5wiyzcWLzB8ME0fSprTzlJfZCE43o5czGaKWZR8L3F4VS+3IppQau5pSo2mQR
	6wSAO+wJxmV1ZWzUfdKn/LyaKPL7TlaM0pgYo5oc+7XUaL5+wLLanFoG5fpkTxJCgf2Q1jzTnJtcT
	bZbP0qzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud77C-0000000EGTI-04Lw;
	Sat, 19 Jul 2025 12:56:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud703-0000000EG0Z-1Me2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 12:49:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C196B4422D;
	Sat, 19 Jul 2025 12:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCECCC4CEE3;
	Sat, 19 Jul 2025 12:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752929350;
	bh=JhG4cUlhKgYFQz3cgZNnjli9ESfpxaxEnJSPQZbW0Ig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AgZK+PhL9KcwBlBqF6apnlNa9jTsn3quUdEnM1NNxcGjj7WCF1J3z92e4dN0sAC0j
	 e/O5xo//Jx5pfrivRhHvDCqY/xFbG5X5Ff/uzMnBg5lMOjGBFCSHXTWDwAIBz/LgM+
	 pAlyV8aNhc5OMFxT/tLpFMP2Zo46Lx6SKS7YCOyPAmL6n3m2H+LU80WB6g8NRbzQIr
	 HZX1JMS4SoTk7FcMYFGlsc7e4OZv78ZlfKL4KbV7fg/X1cBQK9LC7M+H9YK9GMAEM3
	 Fu/6O2P8t2eRnWbq5WWkDY2nFtssRp3/AQu4qgAvEVtePejIGNaDdv+iNgloeF7wii
	 CZ68vIUfIdtXw==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: apple: t8012-j132: Include touchbar framebuffer node
Date: Sat, 19 Jul 2025 14:48:40 +0200
Message-Id: <175292930372.11148.7080198294186970764.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250620-j132-fb-v2-1-65f100182085@gmail.com>
References: <20250620-j132-fb-v2-1-65f100182085@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_054911_381375_402CBA67 
X-CRM114-Status: UNSURE (   6.27  )
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

On Fri, 20 Jun 2025 18:35:36 +0800, Nick Chan wrote:
> Apple T2 MacBookPro15,2 (j132) has a touchbar so include the framebuffer
> node.
> 
> 

Applied to git@github.com:AsahiLinux/linux.git (asahi-soc/for-next), thanks!

[1/1] arm64: dts: apple: t8012-j132: Include touchbar framebuffer node
      https://github.com/AsahiLinux/linux/commit/d1cf32949f9d

Best regards,
-- 
Sven Peter <sven@kernel.org>


