Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D48ACA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHPKIc2EAhtf1OuBtgR8U0gLmRhaxT4Kf1rFgphyCzw=; b=eNEK9fv+SJ+m4zChRJod3ZdbOl
	E4phmVbjI2xIE1UHj9ie48h/WUAL9TceCbnLIW15EK6vimBiq0TgvmX5eW+s0CJOUQ6oA+bVAKwvw
	/3W0qaq8pAbxOiBj8l7K0ODKQlAr129FSEYisaxJ/RME7Ury2kmVqkr/doif4wZsJTx8L9TOvnF2f
	eEPqRzW2V8o2XUudEl/thSNzO9CyAZe+0dZGYXdhtvubdeDQkyUJV6nxxEf5hohAobW1L10GC8GvT
	8QK5poJp4pSVcYWvx3d4eo5EezxYxQrq1laPQsDiw+NEFrH7v/43ax9IJWNTUN1jreLxD8i61Vtal
	VNGLO+bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphuQ-00000004AmW-1xDT;
	Sat, 23 Aug 2025 06:39:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upUZl-00000003AMs-304z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 16:25:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE0C9409C8;
	Fri, 22 Aug 2025 16:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A242AC4CEED;
	Fri, 22 Aug 2025 16:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755879912;
	bh=8CXwgL/+PbdFXIfwkA92lYozok0rqy+77q6MtFphVrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qiYmya6L8kNHYERlvmgxjCRxpeVdqscnoIDjfqOoXEDB6Ox4pFLHW63cJqp5CzjnR
	 sFVDxiFSH6mnPlPKZMr5Am+Lr4PqPcZWQFNCbcXXvcLEhvy+aT2h8n1sbDdzMbAFp1
	 0uja6NqHnM8R+UmJmxAc1GmNq0d8KqMoulJXqfUO4NXr1p6TJ8GOC8NV6i7EwRta83
	 g3djrXMLHcbBxp/RQjoFzqiMtQa/3gm5bon23Fztec54T3sGqm9or6l288An5U1sHy
	 JMNvpGgabEf3B9K3EAe4BAUgv9E9Xz1eYLTyxAAB7nd1M9KII30dbCO1pQTArpqEwe
	 pEeh1W/GaqzXw==
Date: Fri, 22 Aug 2025 11:25:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	Sam Ravnborg <sam@ravnborg.org>, Shawn Guo <shawnguo@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/5] dt-bindings: vendor-prefixes: Add JuTouch Technology
 Co, Ltd
Message-ID: <175587991149.3969185.13763012454689940665.robh@kernel.org>
References: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
 <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-1-b492ef807d12@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-1-b492ef807d12@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_092513_771131_C4E3A176 
X-CRM114-Status: GOOD (  10.55  )
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


On Thu, 21 Aug 2025 09:55:28 +0200, Steffen Trumtrar wrote:
> JuTouch is a chinese touch screen supplier dedicated to manufacturing
> high-end touch display products for the global industrial market.
> (www.jutouch.com)
> 
> Add a vendor prefix for it.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


