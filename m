Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F833E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 08:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFuCzZw0ZSXOxWAl1hKsVP+FUUmE0s1fk0k+N/EmV/A=; b=x79kOzZhOYnXxZs3zDgpoapxaj
	4ZiTIXbmvxwwrALdA8CwR7MDTwNfV1d4o0yg+cFksvdLFb9Fj9myhrFmBkXFehufGAj9lE/o/VvBr
	sB5Knm9bPFJxcCCMK0sBmVXsYd0AWouZWe7c9CrpAsy+DxspA3SWhSO7oezaQ9mzqzwKbFj6XwEnk
	DpdhsZRjcGeMZqX0i5NSQwjcNUF5NKkPDNuq9njk3KcRdJGs1y5qve6FBgYCqHHRh54ippS1xpJGk
	UjfPunYOFJTBSveOfjFDdb8W9NYg7B6kEJAuB8G+BmWpKUkzKb97EEng1y7AfR9WnOzIKBmxhq6F3
	Jh+yCegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1VW-00000003ADg-2BbD;
	Fri, 13 Dec 2024 08:58:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1UR-00000003A4Z-2KcQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 08:57:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9FCA65C6B7B;
	Fri, 13 Dec 2024 08:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DC4C4CED0;
	Fri, 13 Dec 2024 08:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734080258;
	bh=xDmSPde6zgTTU8RgYt3vl6ZlezjpwcKd+HV0Kib8ULM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t+veKa6H3gfVGJH2pAd/wzzzO4upCTB9lprVGLB9pVR5PZD2IJNs0R6M8zIG1Y+oH
	 Fa4fzTKihME5boi/Nak035iEoiIzLNoOdQTJGwEk0vhM/Wk4bWbEJCsaHaa2e9qArg
	 QSpqsuk4z2oQUy9m+Am8mw+UQCaW8r+lZj6iwe/tpLhnmnVnYxG0tOsjMxrXlnHYgE
	 E3X1WuwtrwfmluwzR5KMKvxUH7INsHCVPNh/qUmdN6ZvnuTDBFd7L67qjxYNDcNIKH
	 +4mEHNQ7HbLobs0YTokloCjApWgb2GXISJpsh46VuNPOMKsiFfsfmbCceCRdyLBH7x
	 eD8elA9PmuISw==
Date: Fri, 13 Dec 2024 09:57:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, peter.griffin@linaro.org, 
	daniel.lezcano@linaro.org, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de
Subject: Re: [PATCH v4 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
 binding
Message-ID: <qwwd2hqcqtk27kw3f4jtnxwu2joebr5ysyusomqlnsdu3wbcco@ldurbcu5ymr6>
References: <20241212-b4-acpm-v4-upstream-firmware-v4-0-3f18ca64f1b9@linaro.org>
 <20241212-b4-acpm-v4-upstream-firmware-v4-1-3f18ca64f1b9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212-b4-acpm-v4-upstream-firmware-v4-1-3f18ca64f1b9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_005739_635569_DC7DA0B3 
X-CRM114-Status: UNSURE (   8.63  )
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

On Thu, Dec 12, 2024 at 03:46:22PM +0000, Tudor Ambarus wrote:
> +properties:
> +  compatible:
> +    const: google,gs101-acpm-ipc
> +
> +  mboxes:
> +    maxItems: 1
> +
> +  shmem:
> +    description:
> +      List of phandle pointing to the shared memory (SHM) area. The memory
> +      contains channels configuration data and the TX/RX ring buffers that
> +      are used for passing messages to/from the ACPM firmware.
> +    maxItems: 1
> +
> +

If there is going to be new version, just one blank line above.

Anyway, wearing DT hat:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

(I'll review drivers a bit later)

Best regards,
Krzysztof


