Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB491108B8E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRX+OMldOdeMFpIvVXJBLmnyLP+fEiYih9EHDkj9U4g=; b=STzeUv4R1LDL3V3Tx+vWf0qP2r
	5/DJPua2ifat0sjC3CGVbChajKsz93vI6u1F3avA7gDNz3qsmlVlG3hRD1nRe2ZWPh+ryZkXH92Wn
	e5QchiJzi+ArczRYq4gBVBugPJx8ADfB8JVw4paLLQlOA1RH3lA2umyUg8YkdElbiVp4ZWnx4H77i
	rEwZHQnDpPfb3iwPO7wH0Oi9+HHJN+k+X3I6yGQPRo1oS6j86yfqrsLrQw3r8bY0y+kwz0QxtoucF
	fdAAq1vRfex0dX34Cai2frUoVuvVz0ngOapY+aTDkxdVDJ+UyInDw9QGw37gb5yGamJGDBYur0vUd
	WSizCWQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WZF-0000000CWX4-08xO;
	Fri, 20 Mar 2026 09:54:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WZD-0000000CWW1-0Wbm;
	Fri, 20 Mar 2026 09:54:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DB7D4365F;
	Fri, 20 Mar 2026 09:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1477C2BC9E;
	Fri, 20 Mar 2026 09:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774000494;
	bh=Q0aGbSl6B/lp07B37flZ6XciJQJYdWbJuRcU9X3peRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h9ZxHjkNbgvQPzKPdfxZCK/22EIU9Lu33P3QuUFK/tCeAcPuL1VV2tkOnNYUd/Dx2
	 TUeTd2CgfZIVLP+mvuZ5E48i6fOZtZwGnXKllLRa+hX84fo1GZ7zO64Pb2dSve/gNC
	 4E1dLs51q20eKFHFDuu1xA2Qd/KBvwT4Yjjud9EfcmHWPw12EPJQFmajU5rfX07GuG
	 UL4ICTPBTx04KW6U+sTTh7wmFZ6G7tKsJKKXl14axAbY1Qf9QHAf0BUlavAGVc5qjB
	 w5P7naaClyT8WC0e2rydmo2ne4ZDiXOq5vXE7pgePa9YBmtZDInGvQ9m91xqXDtQke
	 cdy8rP6YjAT9w==
Date: Fri, 20 Mar 2026 10:54:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] regulator: dt-bindings: mt6359: Drop bogus
 vcn33_[12]_* split regulators
Message-ID: <20260320-dashing-crocodile-of-emphasis-2cc43d@quoll>
References: <20260320072440.2403318-1-wenst@chromium.org>
 <20260320072440.2403318-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320072440.2403318-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_025455_198689_63C97E7C 
X-CRM114-Status: UNSURE (   9.56  )
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

On Fri, Mar 20, 2026 at 03:24:35PM +0800, Chen-Yu Tsai wrote:
> vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
> two enable bits in the registers so that BT and WiFi drivers can toggle
> them separately without any coordination. If either bit is set, then the
> regulator output is enabled.
> 
> Unfortunately some of them are already referenced by in-tree device
> trees. To keep backward compatibility with them, keep the vcn33_*_bt

So you drop "_wifi" regulators breaking the ABI, no?

> regulator. Also combine them for a shorten regular expression pattern.

Instead the duplicates should be deprecated and driver should still
support the "_wifi" variants.

Best regards,
Krzysztof


