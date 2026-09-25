Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A140AC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 05:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlzdRlGdd7Zikk7dSYBL9Z3ARN+aV/+uUufDBsrWN0Y=; b=rkWYErlI+dZd0ag/GxeEbWrUzG
	gNLjGBIoaN1vTArMkPO5kbN/1WiuCwvZMnVbCoSs57AhOTAzQY3Ng4EVXTY8sXTeQy60CtER8SXxV
	n3E53gLN2dhYR6vRK/kEID4zmZCpma+zxgxP2RSgrTtHuTrYmGGqxs6WInT0l5TVd41SrlnF+ulCb
	Gsp6nLGifnFxErrKjj2MomgW1AG285bKmpB4vvtKlPNn9ZgOXSMwweojNXC6R/ay0CxEZaHBlRS1F
	6dkE4Ymjwnj8SA5dkjRUgHixg8qHaZ9uLDZi8ESDGaFMpcUV9+xrJH9W8SDV48UtZpUG56kWYXhN0
	PrCKW7qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ykV-0000000CiOP-3add;
	Fri, 25 Sep 2026 05:45:31 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ykS-0000000CiMu-1HHU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 05:45:30 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A242840E00B9;
	Fri, 25 Sep 2026 05:45:14 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9KrOa-5jTJs4; Fri, 25 Sep 2026 05:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790315104; bh=PlzdRlGdd7Zikk7dSYBL9Z3ARN+aV/+uUufDBsrWN0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j6dCNb4q4DEnZGpA1r035JAlpBfaLS4NWe2t1SfkXoVCcu7MAxc7Zz/gdAY56/zxz
	 pPGsuPYGYL64QW5BRKaU+3DpTJV+Iu8+Z/r3+tZI2r3RMWbQkzUmRbxRuCOcCYSk67
	 bWQCkkqNI2AQtI7DJfyGUy0MxNUZh6ipm/wAPSJ4ZUGUC/dtlzAp5Ai5O6JiY5d9H3
	 YUBKDeScKnqPdLqcJMR5L9X4iqllWlucqJwRVnCQVjN7u5tcEE1AiJfkfT5Y3R3+ZQ
	 GFRPRLCGB1BCWGETcarq3FHPlYdVdoabup6JGIERiK8LMsLJSliIUvPAQjps8SfAso
	 wQXUjfhuqfSGwlnnmbHGn7iGuZvhU3lD6NI50VGDgSMCqrRomG7l5/Nm0ZXLYGEDDh
	 H1TiQIHRx/7lDWkF3DlRS+WIbBZ7jX4Y6XQPyh0BrsSRnaLPZZ7LoRCkuFctIEIIu3
	 IoTb6pk2dRglmtBBM61RPgLO8F+pIGjQkrjTAhRqT9S77hXe1JoF5UH8L4hHRckVU5
	 kXORcBF8gmIVw/qnMMf9RqJQo8e+wZajdTFtAYGKc8aB5Rk7Y987RCOTMcqZ3Q+r36
	 A0qQ5U7ycmceX9Vf7sDlQMl7u5QqPG4pa7JNh0BpgHstaP/NaojAzSwljg2BR+8wrI
	 OQlkA1D+pLmyus4rriXx1Skw=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F168340E015D;
	Fri, 25 Sep 2026 05:44:47 +0000 (UTC)
Date: Thu, 24 Sep 2026 22:44:44 -0700
From: Borislav Petkov <bp@alien8.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
	Borislav Petkov <bp@suse.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 0/9] Add Aspeed AST2700 SDRAM EDAC support
Message-ID: <20260925054444.GCarYKTAdrrJ5a2VYO@fat_crate.local>
References: <20260916-edac-v3-0-23e9ed2fbdf9@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916-edac-v3-0-23e9ed2fbdf9@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_224528_502132_981560B7 
X-CRM114-Status: GOOD (  12.81  )
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

On Wed, Sep 16, 2026 at 01:30:37PM +0800, Ryan Chen wrote:
> Add ECC error reporting for the Aspeed AST2700 SoC to the existing
> aspeed_edac driver.
> 
> The AST2700 memory controller keeps the same overall EDAC programming
> model as the earlier Aspeed BMC SoCs, but uses a different register
> layout, a split interrupt status/clear/mask scheme and DDR4/DDR5 memory.
> Rather than fork the driver, the existing code is first tidied and
> generalised, then the AST2700 is added as one more per-SoC variant.
> 
> Patches 2-5 are bug fixes and cleanups to the existing driver. 

You always put the bug fixes first in a set. So it should be 1-4 bugfixes,
rest new features.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

