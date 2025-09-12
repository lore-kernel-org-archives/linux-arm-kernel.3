Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C525ACAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 22:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVaKksK86+6l/now4jDnqJzPYXz3j497f5eBLemjxh4=; b=BFY4ABEa/oSDQRNHeszuTZ2h2S
	eVLCuy1oFe1ll1oQmG8Uan6lBTRVEI5m2NhijILxIZ+btuwYYr7EQXT45651bS0gOKdkIHzw0ZZNL
	nfbhhzyAfA3IpJXguJbn9si8iqkIuFbORa5fUIVb5CtbfFPkaw4B+9kDleY34Z23mdyzt15L2Okgq
	Fi6wNNbyFRKBjN2gM9IZVw44abHICasTmkkfatRuGzNpUVS6ef8v6xMO0JzOpuEp+4Ww3KMp4TK3d
	2iHgnRY5cx2MeNVqbi+k3rOTe4sx/DchSyE71dDo5xaCTM9Vg0ohr24CRsQvUZCmxFokLOAp6zdIQ
	VkLCZJVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxBqz-0000000Bkk0-0vT2;
	Fri, 12 Sep 2025 22:02:49 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxBqv-0000000BkiK-2dCu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 22:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=VVaK
	ksK86+6l/now4jDnqJzPYXz3j497f5eBLemjxh4=; b=LOsddw8UblcV+2BcFY7K
	C6pwglAK4IU5mARj0LqB/qM0rYFAzymBL3+nBDSNXMINkzuZ8LyXyshghs4lbPFa
	3BQxPFsePOXS1J8ZOwqLlgY3O16rZTUnivjCCeKCLrQPg89N7za/6ULgBiWZbK60
	VzxBFy9nvB0M7Cfaxu3HehYPNaXzpyAJpzlkW2WS6J3j0DzfaM4wkz/T9ehAGo5n
	b+dGKK1PWojvovLGDQ6EVMscBCLJ+XssKYLEwfPzDH3Vt70Hn8J0ycX4YGiMVohc
	pPt9KrYw1jeeyomkBB/wh2z05g+h/sLmC9Q3+qnik8yzxhbpeJ3gW8OBnm23V3wc
	MQ==
Received: (qmail 1498791 invoked from network); 13 Sep 2025 00:02:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2025 00:02:38 +0200
X-UD-Smtp-Session: l3s3148p1@eVTez6E+apsgAQnoAHJ8AC93OVDMgFWg
Date: Sat, 13 Sep 2025 00:02:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 7/8] dt-bindings: i2c: exynos5: Add exynos990-hsi2c
 compatible
Message-ID: <aMSYft5jCQe5iYdo@shikoro>
References: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
 <20250907-perics-add-usinodes-v2-7-58f41796d2d3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907-perics-add-usinodes-v2-7-58f41796d2d3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_150245_950979_1E45A892 
X-CRM114-Status: UNSURE (   7.00  )
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

On Sun, Sep 07, 2025 at 10:13:38PM +0000, Denzeel Oliva wrote:
> Add samsung,exynos990-hsi2c dedicated compatible for
> representing I2C of Exynos990 SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>

Applied to for-next, thanks!


