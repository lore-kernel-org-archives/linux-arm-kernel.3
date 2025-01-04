Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CDEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 09:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0abcaWQP+r2/iPKmR4ToF7OO97HqDeEZcWmxMgAybY=; b=sBBoZcdOz5Xu9xFs5EQcmOsPDm
	9jjFtn3zwZQCFkQxGH4K74qgZg0fOryuyIxjPa/7cUyXGs+9R9ykAGh9faRvJSWZJsIm4BptzH3h9
	LW+fcjGaa38ApYMW9rcQb+F5AsgWjg1v3Yz4vm8KdnNK7Rc8Boh3HiTgNVl9pjQyFPIJxFnDvABiH
	bGj1igfNHFi85lArw+T0e7HwlUVwjcwjG8rFFNi/jG+Vz72A8clfQo6GrvwFUN5trApmQMHxz2vGq
	XrG9B4xneveUSZgI7eUfKC2Fm6qaawY8niqm60H25ED8zKulbJKp4JsL6DLZBjY3bw5wYqUjygAcZ
	jQfpVnnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU0XJ-0000000EnUU-1jH7;
	Sat, 04 Jan 2025 09:33:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU0W8-0000000EnOh-2QtB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 09:32:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD9EF5C49B7;
	Sat,  4 Jan 2025 09:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FDCC4CED1;
	Sat,  4 Jan 2025 09:32:22 +0000 (UTC)
Date: Sat, 4 Jan 2025 10:32:20 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: arm: sunxi: Add NetCube Systems
 Kumquat board
Message-ID: <46tuwtamwmlbfjzq7pjasgqa7ctgmwnljd6rvyljjsqgcw6kjm@7px3q6symrns>
References: <20250103204523.3779-1-lukas.schmid@netcube.li>
 <20250103204523.3779-3-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250103204523.3779-3-lukas.schmid@netcube.li>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_013224_663050_679C1A10 
X-CRM114-Status: UNSURE (   8.50  )
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

On Fri, Jan 03, 2025 at 08:45:18PM +0000, Lukas Schmid wrote:
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

No, patch changed. You removed now commit msg entirely, so don't keep my
ack... My previous guideline described this case: if you change patch
significantly, then drop the tag. Removing entire commit msg, for
whatever reason, is a significant change.... unless that's a mistake,
but checkpatch, which I asked you to run, would prevent it. :/

Best regards,
Krzysztof


