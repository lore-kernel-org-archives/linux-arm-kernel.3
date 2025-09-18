Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09483CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 19:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCSFqQeHD3FzdSFJvCChrtnaWWUIDEdceVkA7gPBj6E=; b=WYK8MNhHawu+ASRWeNKXrTby9W
	/A44Axf+/E/9aGd7HxcHqBoGAOEEPHuaqvbOSBDPgQ+iQQOAwafyml4j7kFIWkuO/ZM6vte09uYt1
	l00coteWX+QH2p/ny0E9t/hgxwTN8FJheWz3SGn2QE0M7i/F1i+xija6ZTafL2jPpqNtrPx6jSzGa
	p1fzT9tggBYHXpy8mo/IpBHAQSF0Ol1s8lavMnj4ypabSXiJsQmbR54zCbfF2MWNBYqT2fqYWlHTa
	1icFMHp6p/xCr3eAymQkePOgv1bucwaL+Mk6TNYPeqcUaOQHYEmESHHrvJHMwGrvMu9AgPB0Qlz0q
	A1f7V8Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzK72-00000000yQb-0wmj;
	Thu, 18 Sep 2025 19:16:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzK70-00000000yQ0-3WRY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 19:16:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4070A6020F;
	Thu, 18 Sep 2025 19:16:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16981C4CEE7;
	Thu, 18 Sep 2025 19:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758222969;
	bh=KjDn6sHmv2zJSG8U1crdiaXSz9YTXqPKu6icdPo2s30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FLCmFbFgOB16yHVUmpDid8KyJanGo+jSn4CL1c+SGxXbJK3Fv7XKbe5Uyu3WxUuru
	 MDVtzh6VYbrNpkkJeeVkPWv0C47MrlxpIyCGDKypNjPMLn9sNmH1NwlmhD/taagqqd
	 gmgCOuagY9ejxFmzemfErqQ/Xs7ijJ+Apl0vN4K90uPNG6nwMHKb1hLpVA7gwndNQW
	 sgwfLX4jzMcO9wyZ8ZWL2anuS5ztOf2AGh74nboaAD5mSI9PQRGyPOfnNrg7mQWIIa
	 3NN7gkuRl93CTFS3w1wfYIbcA6k2UMrwO8PsYeiLaHhzRI9KsoMEYGbrjCDREFPxaF
	 cRjVKu/1OGEBQ==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/3] SPMI dt-bindings and nodes for Apple A11 and T2 SoCs
Date: Thu, 18 Sep 2025 21:15:37 +0200
Message-Id: <175822291282.28444.12268120049385663263.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
References: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 15 Sep 2025 09:52:23 +0800, Nick Chan wrote:
> This series adds dt-bindings and nodes for Apple A11 and T2 SoCs,
> and the existing driver appears to be compatible. Drivers for the attached
> Dialog DA2422 and DA2449 PMICs will be in a future patch series.
> 
> The dt-binding patch depends on other spmi dt-binding patches that are
> already applied in apple-soc/drivers-6.18, so it is best for it to be
> applied through there.
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (asahi-soc/for-next), thanks!

[1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
      https://github.com/AsahiLinux/linux/commit/4b167146ec05
[2/3] arm64: dts: apple: t8012: Add SPMI node
      https://github.com/AsahiLinux/linux/commit/8f6e6934e33e
[3/3] arm64: dts: apple: t8015: Add SPMI node
      https://github.com/AsahiLinux/linux/commit/70fa521f4d55

Best regards,
-- 
Sven Peter <sven@kernel.org>


