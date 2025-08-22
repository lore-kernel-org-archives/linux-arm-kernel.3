Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD750CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 21:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTeBCNJiDt3v1ve0MlkfHgac60e/CC7BZoKpC+WEhvA=; b=wE/jKbxlNkx0CgEA6muS/s5d+5
	GC62Y1qHiWk0L5QgzUQ4mf+uJ+zp/yOiurEh8wy6oROUdGgtU5H/3s8vxVw4e8Qcz6F1VFdxDjDFQ
	rdt04E+LxAj22SGj5TpzzEo5JRW+Ps+fWQzaQgmoQrzNFtaqnU2K/h4co30XK4Y6aKJxJE6vFQJNO
	Tf6xptMrNpWkQOPqATgGVubTcqc3tYOFltH5DD9EoDG6X1cyVgjnnzXf+kb4queXGWE0iHh4SpH9K
	JffWElfmomLLfbv9agOeZsLhN5/jsyInbH8Kw16OOl4/nsKdHknGz33PoRGUf+3LpAUkGQsYlYLND
	i4LjZfFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZbD-00000003XNs-1dRq;
	Fri, 22 Aug 2025 21:47:03 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upO4C-000000022l8-28rP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=aTeBCNJiDt3v1ve0MlkfHgac60e/CC7BZoKpC+WEhvA=;
	b=fHpzJPtq6stk8SPQu4lRtLezJcNXTwTYyc6+wmgIwj2wl+ImFeTuEAAS3dvY2u
	Zf8hqpa1dyh6XWVdp0wYdQoGb8ELgyYXVgrissmSztP9Ll9GC+uch8cqlneXnQ+H
	iN4INmWzs1cLuIYljhwy6nroIQp7lG/LlUCPiILd7yORc=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBHBW_9N6hoN_AVAw--.14855S3;
	Fri, 22 Aug 2025 17:27:27 +0800 (CST)
Date: Fri, 22 Aug 2025 17:27:25 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: nxp: imx6ull: Minor whitespace cleanup
Message-ID: <aKg3_XjbcZFruQiP@dragon>
References: <20250819131800.86990-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819131800.86990-3-krzysztof.kozlowski@linaro.org>
X-CM-TRANSID: M88vCgBHBW_9N6hoN_AVAw--.14855S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUO7KIDUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgyxZWioJsEtvwAAs-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_022812_905089_B3C8750C 
X-CRM114-Status: UNSURE (   7.28  )
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

On Tue, Aug 19, 2025 at 03:18:01PM +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied both, thanks!


