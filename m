Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3445C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 01:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wujDbdLCxL/DpdBnoqRy5zFxIIGeoL7Sk6EHzkya0U=; b=oghs6Y2IEfjvPT5R1rl5+kgR7M
	20Hi/1B8L3o94OSTzvy1cayXDJNTpeCqcLFDuJmsSQJ0dN7EwWtLXL9mSNag5hNZ48pkJ3qOUIiJd
	DxHAflTqGAcLl/V4/zeqtGBPJCQ3cl/FnoFi3JHlR8O58xsVDPewUE75Z4bXAad9wAt/WNrSu2m1S
	RkJ3vPzew0aSaoml1732mYCDSLAVSMJ2GX/wGBti5DtbbenHyxNpdagUdb5Q6xHJI+0Bl4f1mE0at
	tO1RsrsNQp/sYAXKzxOmv6jjovXz139eKuoVJVBZq9tOXH2T5GOVZ1aZm1FrdX0eBbX9KsgOXj+N8
	mYiYQLhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscS-00000004Nrh-3pRZ;
	Tue, 24 Jun 2025 01:38:41 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTpTY-000000045xb-49k2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 22:17:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B816C4316C;
	Mon, 23 Jun 2025 22:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750717034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/wujDbdLCxL/DpdBnoqRy5zFxIIGeoL7Sk6EHzkya0U=;
	b=hjBhVmbGcyiU0FhamaTO4mJ8fYzx9cqq5s7T/OqiVIGwK3l9XsvlKbbCpw2j686knF3DX1
	P6ZDaxbHqy44tYfap8QsCVkqX3NeoNMbHl3OFW5wvubSbJMLHVhe/Ayj9gWLET0IYLCq0A
	0J6lZdsUQjOxotNQWgs9Te5pRl8yw+LcspAy39/cF+NV6YjnO8ljYxSbNuobXgIElu8UQ3
	LcGIIZfm6lOzdIJYy0QcOwZPLG/O5gQ1MDegxr0j99s3n2ubfJV3CHZ6KZzkripG1pYycz
	dgC171lIPK8pBJU5yL3oW4Y+QA4Uo3KW7hjpmpqwvNRvEupji28KO2Kk1RqP8g==
Date: Tue, 24 Jun 2025 00:17:12 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
Message-ID: <175071653812.1309305.11999722555032816982.b4-ty@bootlin.com>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddukedulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfffieeiffeffedvgedtjedvhfdvheeftddutdetfeefvdelheeiveekgeeutddunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrnhgrfihrohgtkhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptgiftddtrdgthhhoihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegrlhhimhdrrghkhhhtrghrsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepmhhtuhhrqhhuvghtthgvsegsrgihlhhisghrvgdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_151717_514045_9CEA6714 
X-CRM114-Status: GOOD (  12.37  )
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

On Wed, 09 Apr 2025 21:37:21 +0100, André Draszik wrote:
> This series adds initial support for the Samsung S2MPG10 PMIC using the
> MFD framework. This is a PMIC for mobile applications and is used on
> the Google Pixel 6 and 6 Pro (oriole / raven).
> 
> *** dependency note ***
> 
> To compile, this depends on the Samsung ACPM driver in Linux next with
> the following additional patches:
> https://lore.kernel.org/all/20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org/
> https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org/
> https://lore.kernel.org/all/20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org/
> 
> [...]

Applied, thanks!

[25/32] rtc: s5m: cache device type during probe
        https://git.kernel.org/abelloni/c/002cc0ee90e6
[26/32] rtc: s5m: prepare for external regmap
        https://git.kernel.org/abelloni/c/a57743bf009e
[27/32] rtc: s5m: add support for S2MPG10 RTC
        https://git.kernel.org/abelloni/c/e64180846e7e
[28/32] rtc: s5m: fix a typo: peding -> pending
        https://git.kernel.org/abelloni/c/972a3b47f6e1
[29/32] rtc: s5m: switch to devm_device_init_wakeup
        https://git.kernel.org/abelloni/c/1dd609587414
[30/32] rtc: s5m: replace regmap_update_bits with regmap_clear/set_bits
        https://git.kernel.org/abelloni/c/f5adb1fa04d0
[31/32] rtc: s5m: replace open-coded read/modify/write registers with regmap helpers
        https://git.kernel.org/abelloni/c/b1248da00836

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

