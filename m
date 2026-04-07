Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D73FF510C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 16:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=md7enuAp7cE0xk9Umd3BnWld4tuZgkCN3RLrGtZ0fWU=; b=CBcCn4QfPWRbFqNCofmHNepE7E
	sG+83unUQsv9cYYze3/nplt8Zrk14zDDV4QXfHXZCUqHFmHXRbbf7/3rqdfM01Yilds5YuUQwhof/
	1P7LnSkuVsoYbAidKucAR4dCRXYZpZe/Uw2fvBxljoQQrMY12Xa9Cr6MTINVKCWiX+ATdaCfnJr9P
	tpPfqRId/OJ0xIR2lToQTFFVuKfxUIgM7JC9iCivkkLg25NVzQWAcwla8AiScNG9Y6qc/yDKxIDNt
	hTQcDQqj8J3WplSUnqSMaLwVoLzAjGpthhH8Y2wqrNNgoD1GBiq0LN4dkFl2zkVGnFAdZE6grs6bQ
	MVol4IsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8x9-00000006l9L-1qM5;
	Tue, 07 Apr 2026 16:06:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8x7-00000006l91-3C1u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 16:06:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5763E43CE9;
	Tue,  7 Apr 2026 16:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED684C116C6;
	Tue,  7 Apr 2026 16:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775578017;
	bh=mvUZweDlyjvVe2JcQ7USWDAKAd3S21Moj2GrvsWKB38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SvODB8vMZ5cfQpNdKcqYNH3puirStHN6PvyBPN88TgoVecbiRqavcSW1iqxI88Y+q
	 SJ9h/lfh3KVXzK+LFyR8ty9DAkTf+9KMcxPrIKRfT/3awJ6TNbGUJ+DkqgpG76281s
	 L36pFGImM7Gd3O3KXW1Zi63bnjzYArWhtv9B4jp3o5LoAhJWiQTC0OCTdktl8E4Tmi
	 ORZSHVbKXqsixEWVJS+pP4G0Fa69jQzLD8O+Ujqt56v+TGswKHGdGg1FX7vgUe4SoH
	 eQGDYart+SOYLEYKY+C2RyzvwJMRNM13OdSO+cMBIOZAM02hVvsCLrn7BcrVEORoMn
	 hQ0dPeRNu3uoQ==
Date: Tue, 7 Apr 2026 11:06:55 -0500
From: Rob Herring <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: arm: cpus: Add Apple M3 CPU core
 compatibles
Message-ID: <20260407160655.GA2643629-robh@kernel.org>
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
 <20260320-apple-m3-initial-devicetrees-v1-1-5842e1e393a8@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-1-5842e1e393a8@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_090657_845751_3BEA4D3B 
X-CRM114-Status: UNSURE (   9.47  )
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

On Fri, Mar 20, 2026 at 01:23:19PM +0100, Janne Grunau wrote:
> Add "apple,everest" compatible for the M3 performance core and
> "apple,sawtooth" for the M3 efficiency CPU core. These CPU cores are
> found on Apple Silicon SoCs M3 and M3 Pro, Max and Ultra.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Rob

