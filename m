Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EA0C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 09:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKOFH2LoxcpTfC6CVHqjCAUEihzQMaHb7acIN6rZH+g=; b=0vGJ15nMUZqaVItNHgG84eu8bv
	nwDleJxfyBfTjyAh8Hndi3Lx7t0/bTaccnhHNGozfLlSROdbz0Yx8zjh2Mzy+y+pw0rjzIqKQF3CA
	jOVBxWQWxNdvhzshKowkInahl6Z+glBWrSSDtmO1JLfde1XfgjGHhwFHLo70ypIISr2Khe91BviSc
	5FxlEx8lsoU1AdtWU4Jpk0LlUyIHipqFhK9cTYuaWfYKk6igmWBOhwXLuO5yqEmCDYpxP+4SDDA8y
	yaH/5Ot2bics0+OB7LCS41TeHr6eKgbKuob/sdyH8EfSZFxLinOZuJwWwiK2X4bwl69lf9ozbT+gG
	8Y5yRi1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0dMt-0000000BHPu-0WNi;
	Fri, 04 Apr 2025 09:29:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0dL4-0000000BHCe-3jL2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 09:27:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0952143695;
	Fri,  4 Apr 2025 09:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D4DC4CEDD;
	Fri,  4 Apr 2025 09:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743758870;
	bh=j0RVHsK+8Z70siy6KizMbeUUMr7khc2n2FyBiYwSGY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k2mNmYL+Tn1jkYo6pbOKWN+sdTq6/m14DMgEi0eE9QfpMdbwetp53Q1//RfKRHqfJ
	 2a8UyNCncTI5cIVqNggzKoCvtwGmhBscLRlfO2qSRbvjhTD+0jCwLIeonWZaHheBuv
	 yXi7owlf6dD2e9L1gA5Iu28WHOv/F4mvVTGUnRwgQ44MOB4cqizdCNs1uwfBWA8yAW
	 LGdA+Q7J2ngW0r3OMnnjFVbZA7lCnxyV9NsQs7q9F9trZ5DQDm7fV1H2/FR6JVzBaV
	 yLHAMQVYISyQdLymipvLBbT7uCjf+438NTx0U0kSMJxiqOfGtwA9fNFmEzqrrkD4vz
	 9Pi8tJCQTKGwQ==
Date: Fri, 4 Apr 2025 10:27:43 +0100
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
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 11/32] mfd: sec: fix open parenthesis alignment
 (multiple)
Message-ID: <20250404092743.GC43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
 <20250403-s2mpg10-v3-11-b542b3505e68@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403-s2mpg10-v3-11-b542b3505e68@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_022750_948338_E6B601BF 
X-CRM114-Status: GOOD (  17.33  )
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

On Thu, 03 Apr 2025, André Draszik wrote:

> checkpatch complains about unexpected alignment issues in this file -

Fine, but either call it by it's name 'Checkpatch' or the command 'checkpatch.pl'.

> update the code accordingly.

This phrasing and grammar is odd.  How about?

  Subject: mfd: sec-common: Fix multiple trivial whitespace issues

  Rectify a couple of alignment problems reported by Checkpatch.

> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
> ---
> v2:
> * make new alignment more readable (Krzysztof)
> ---
>  drivers/mfd/sec-common.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
> index 782dec1956a5fd7bf0dbb2159f9d222ad3fea942..1a6f14dda825adeaeee1a677459c7399c144d553 100644
> --- a/drivers/mfd/sec-common.c
> +++ b/drivers/mfd/sec-common.c
> @@ -149,9 +149,9 @@ sec_pmic_parse_dt_pdata(struct device *dev)
>  		return ERR_PTR(-ENOMEM);
>  
>  	pd->manual_poweroff = of_property_read_bool(dev->of_node,
> -						"samsung,s2mps11-acokb-ground");
> +						    "samsung,s2mps11-acokb-ground");
>  	pd->disable_wrstbi = of_property_read_bool(dev->of_node,
> -						"samsung,s2mps11-wrstbi-ground");
> +						   "samsung,s2mps11-wrstbi-ground");
>  	return pd;
>  }
>  
> @@ -264,8 +264,8 @@ void sec_pmic_shutdown(struct device *dev)
>  		 * ignore the rest.
>  		 */
>  		dev_warn(sec_pmic->dev,
> -			"Unsupported device %lu for manual power off\n",
> -			sec_pmic->device_type);
> +			 "Unsupported device %lu for manual power off\n",
> +			 sec_pmic->device_type);
>  		return;
>  	}
>  
> 
> -- 
> 2.49.0.472.ge94155a9ec-goog
> 

-- 
Lee Jones [李琼斯]

