Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477B2C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 14:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HLOCXWX7xlvVaVCpmsch6Y2kBwILPZD+fHs79OQ++o=; b=b2e6NFfLKmKYWzjhdAm7Dl0WaY
	llrmpNBCP+hbs+6DRBLRFQ23AyJrNMrh/DVfZgNHsOVEKqaz5aZXuzViWYKEOS97OWQ73W2Cs0Dyv
	YQ8H8JtIlZ7hhbQc5zINmbr1T0liRUbWo78JYW9ipNXBVDWIKOvSFuBxoUwW1EUMvwTL48Iy40/AX
	DbG8ih3BYSD3tM7B+WHJL+gA8F40BvVe9uCmZ0nUmUAoTnbff4AmUtJdLx+BOeqrGC3vzn6c/0qVb
	YTyQmFsKPGVF5AEnfeHwzSIA3lySqrTEtG0hrOQOZXOCNEgKykdm9B6zeRsTVyVE5gjztwXS0CJWt
	2FAyDjdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8E3-00000001nA0-2gnu;
	Wed, 30 Jul 2025 14:56:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh898-00000001maW-1FMg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 14:51:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B04D5C57F6;
	Wed, 30 Jul 2025 14:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC63C4CEE3;
	Wed, 30 Jul 2025 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753887068;
	bh=16P5bJs+DSDc/BjPMR9Go7+cwZRcZib97tLNoQMS560=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Orzv+H6tINJf2jMXAqag/2hlzgi49AmaSDRnL9MhklbvGcjN1pi3yw4uEFi2lTpZg
	 3lwlhBWxQtH5UqRvAJKEZWUe4tjaMcoCPMzKAklGRwio/GzocdrjFGixBs0vLrl4rd
	 bHKjz+y5Prb/TfSC7f7pzF0G1bVB2R6MqNyny0JgZifRPWvjHQ7kc0qQXRbe3FLDRP
	 M4manPrF/C1KU22Hzb4dv+p9teKDVyAwBgEdaTUui80kS3+QMum3NBTu4z/5+dTScF
	 ChqvKJx4ymmEw4pdsSz3DxPRyMi/ih0QSfLfk/i5jGdeI2brM/sgFt/Gp+rUGRrOfx
	 SgYpcQ9h7ygHQ==
Date: Wed, 30 Jul 2025 15:51:00 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 0/2] Samsung S2MPG10 PMIC MFD-based drivers
Message-ID: <20250730145100.GA6782@google.com>
References: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_075110_372260_83FEB64D 
X-CRM114-Status: GOOD (  12.65  )
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

On Wed, 30 Jul 2025, André Draszik wrote:

> Original cover letter further down.
> 
> This is a resend of two patches from the original series that haven't
> been merged yet. That series was merged except for the attached two
> patches here. Other than rebasing against next-20250729 there are no
> changes to them.
> 
> Lee, I think Stephen's intention was to get these two merged via the
> MFD tree please.

Although I have no issue with this, it does seem a little odd now that
the set consists of only Clk patches.  Let me know what you / Stephen
decide.

-- 
Lee Jones [李琼斯]

