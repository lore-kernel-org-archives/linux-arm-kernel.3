Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9698CC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 20:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p90m0xunQxHqQZ0c+0g0v1yinYQ7W+nJ8apC8cX71aY=; b=NC5MCs9W6nKtxTpPFNNrB7XCfs
	xotDc70w/VAMereOISGlDyEYI0yqRdqnaqA03yF4ezHOKYuxPC/SSfi7t/VisrF4NdmdowIx4jvn1
	NytnlJ6Rrd6UvQrwNVB0Ab3vZFKkQ6i7fDBXO1BqsFa/a7QVjxsn/EvfLCPCXcO3xPWVa0+xNCXYv
	KMxec9SUEBkLo+Ri+AHxhlfyzx866m9M6ewZHfxXGZ9qE4GoPWHXzl8UlxkqveMb6e6c5bVS8/SL3
	QnwIwaqeKouWYkkoch0OmEeK62BJ6JxeYGvIswV7oKn7VHMoN4mzU1bnKM44NLhYqfpUvs7WoBXnz
	Q0OEZMGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP5Q9-000000081Ly-0ghf;
	Tue, 10 Jun 2025 20:18:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2Ft-00000007XoQ-0XZ9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:55:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB2DA4A579;
	Tue, 10 Jun 2025 16:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30B3C4CEED;
	Tue, 10 Jun 2025 16:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749574520;
	bh=At7fLLM3/wUfJY275dT5xd+eA31XOZAJZjSF5Ow50SQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V/7PGg4vBMuJlJlIj7WXC3CJmwgFsQ15PjdFh+RXw9T7MsrVMCKTg9YMrXR/39ObD
	 mgkUaafLOIykXPMXRXyyMZdUnuTzBv9GzTOtha+FJd34LXQYLNt7dDREAgrQTtp62Y
	 Z8QMrp8UmfJnu8SG2uipUAY5ZTK9jwyV+UqpiDRznJtJwrf7b+tWHNmD0E2QyqipHG
	 OGbEsv9u2O9ZnuGSEE9lB/dMziEa+Zh4oXOaboU9052JMYAGMeXS2XASXYTo5CrG20
	 4bbgHlsNp4v59T24YsoG3SYNBAkL9QTQmr/AWlN1BMiE/nGoH0LEJxFPBAmdrBJWuS
	 OK6aNYvYSiXqw==
Message-ID: <2701ffc6-40a1-4004-ad42-1b096fa1c095@kernel.org>
Date: Tue, 10 Jun 2025 18:55:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
To: Nick Chan <towinchenmi@gmail.com>
Cc: asahi@lists.linux.dev, Neal Gompa <neal@gompa.dev>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
 <20250609-t8015-spmi-v1-1-b3c55ad01491@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250609-t8015-spmi-v1-1-b3c55ad01491@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_095521_191567_BFB5A4B9 
X-CRM114-Status: UNSURE (   6.91  )
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

On 09.06.25 16:59, Nick Chan wrote:
> The SPMI bus found on Apple A11 and T2 SoCs are compatible with the
> existing driver so add their compatibles.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>



