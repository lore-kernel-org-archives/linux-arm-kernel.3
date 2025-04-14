Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78253C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 15:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Idhf1uOsxb4cE5b6JOh6FRZQbEx/EZXJ6igyZKGQdnk=; b=UxRzojc8HfhnTdkH61u28t8Hcc
	xWXSL6VuSCjeSKsMbc1t/i4OvPwDlVNQ5p0zlY8fE0S4uXAlegQMVBTKZkqV5Jeena0vwsKo4UgJ3
	NRLsjNt+prT9QffmxKZ2mGFB8mrsWbnt8xetTanecYgLbeO6SuPQBGq7FwbUFdxNYL9K6d4/Eydal
	88vhjdm5qpr1D8wYliDRnLqmNbGZbsEVaqjXKtLebX9BOHzQcu2tx+xEy4q62Ifyx2uPD4QJaiK5X
	nlgHldWWulW6wLuIRxePw1MSv9Q1sRGyEYe7mKrB1fvl9L2Pa8hWLSnX0kGY9HyVdAb+wRUGGxcQs
	AVy9gsoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LaO-00000002awo-0eEJ;
	Mon, 14 Apr 2025 15:19:00 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LGK-00000002W9O-01AR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 14:58:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60A0943877;
	Mon, 14 Apr 2025 14:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744642691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Idhf1uOsxb4cE5b6JOh6FRZQbEx/EZXJ6igyZKGQdnk=;
	b=jEgj8UhR3xu+s/UuoL/jT+QRloa0sejM3PND5K0/lOpr4zEucvObwXfWKQfcFE6gN0+2iw
	EdQk8G/yUMpRPCp9tZ0Ym+prXxiQ5Jpngups8hMPD65Yf8+691CY+bCXLHCI+2ZgYCRdwg
	5Fm473NEd53Xj2EIeSmaOplqnOMVWqml29cuyZwN/hr6C49RSYXswG6rHC71foXQpdR8b9
	0K8NZG8QFcpUfZk0YpKxW+x3MCSZXeVDqnHkxSgjCnBVrygyrncdwi5emPmgYJSrgiSqy5
	g2O9j3LLOylKDkhCwLrfDt3U5f8Bv5BSCSBMeyDQFiOevORTs4ms2PMtZJnRHQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 14 Apr 2025 16:57:24 +0200
Subject: [PATCH v2 1/2] dt-bindings: watchdog: fsl,scu-wdt: Document imx8qm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-imx8qm-watchdog-v2-1-449265a9da4e@bootlin.com>
References: <20250414-imx8qm-watchdog-v2-0-449265a9da4e@bootlin.com>
In-Reply-To: <20250414-imx8qm-watchdog-v2-0-449265a9da4e@bootlin.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Thomas Richard <thomas.richard@bootlin.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeipdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheprghishhhvghnghdrughonhhgsehngihprdgtohhmpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrs
 hdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdifrghttghhughoghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeifihhmsehlihhnuhigqdifrghttghhughoghdrohhrgh
X-GND-Sasl: thomas.richard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_075816_204472_A5FB6169 
X-CRM114-Status: UNSURE (   7.63  )
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

Add an entry for 'fsl,imx8qm-sc-wdt' as imx8qm also contains the SCU
watchdog block.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
index 8b7aa922249b..1d9f15ec6657 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
@@ -20,6 +20,7 @@ properties:
     items:
       - enum:
           - fsl,imx8dxl-sc-wdt
+          - fsl,imx8qm-sc-wdt
           - fsl,imx8qxp-sc-wdt
       - const: fsl,imx-sc-wdt
 

-- 
2.39.5


