Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E42606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rYlCUMl9;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=AScjFEul
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RHo4ksSMFTqpRYw3uQoglMFwqaYV5jcly92lZB1Eo2I=; b=rYlCUMl98zIziF
	D4I4oKBYQ4YXsE6UdXqrcwBLvH3hdo3MVpVsTjX1oQ1VxedBDKrgN7Elvb+Jf62gTdhdNJ0jpzgeb
	eFaxLOVBz/ix7cxoIoC0bExr16ByhaV8SgvZ1MjeEnC6GaExu3lmJzGzTGdBfp7jRJHsvmufZtP1t
	jY7wtSFw4Ro9WzAeCcwtKglPNEuglcVs64EWMycjTVPnFIKu/Iy+OaZD10W74aP/WTdC9db/Q2kXe
	cx9MBkORILkxOh2wikSG6e+hz9iVo0i9nYv61lk9TTPH5sSrhn5V13Rx3h99JZCoo2keje14+DC38
	uEGk1S2WCvytYx50ZNLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKyD-00000008bmw-2uCJ;
	Thu, 29 Oct 2026 07:54:46 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKxZ-00000008b7w-07Cu;
	Thu, 29 Oct 2026 07:54:09 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261029075402euoutp02f14f0159405154af6a3d68d7dc748d93~i8N8jxRuB1871618716euoutp02r;
	Thu, 29 Oct 2026 07:54:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261029075402euoutp02f14f0159405154af6a3d68d7dc748d93~i8N8jxRuB1871618716euoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793260442;
	bh=RHo4ksSMFTqpRYw3uQoglMFwqaYV5jcly92lZB1Eo2I=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=AScjFEulN75U1Luf4MtUE6R+BytYIHPuNq0LhFxumn3iofIdIgbEJXtMTPy48a3ru
	 Wdhaxaw0RVAMVQXd3Gci15QeC66TqGEkd/a4g1DnHPRZrPKjHHSms8AOVZ6YZXMp7O
	 i1TXTYFRHPKn4JhpraQruzNbyOrrAagM00Ct8rxQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261029075402eucas1p1da7f497ccc2e469112e08cc58e0bb0da~i8N8KurDv2479624796eucas1p1I;
	Thu, 29 Oct 2026 07:54:02 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261029075400eusmtip101cc657f59153249e5ac29e8d60a05f2~i8N6lezse1408514085eusmtip1n;
	Thu, 29 Oct 2026 07:54:00 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Thu, 29 Oct 2026 08:53:40 +0100
Subject: [PATCH v6 06/18] dt-bindings: display: verisilicon: Add
 starfive,jh7110-dc8200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-jh7110-clean-send-v6-6-759594e43acf@samsung.com>
In-Reply-To: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Andrzej Hajda
	<andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Philipp Zabel
	<p.zabel@pengutronix.de>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Yakir Yang
	<kuankuan.y@gmail.com>,  Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>,  Conor Dooley <conor@kernel.org>, William Qiu
	<william.qiu@starfivetech.com>,  Xingyu Wu <xingyu.wu@starfivetech.com>,
	Sandy Huang <hjc@rock-chips.com>,  Manivannan Sadhasivam <mani@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=976;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=41iA01RWnUWvGtQAbZNvE1TbUzxo7jNLq+NLQx4Yies=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWQ9+t1Tur+wujbM1Ov2vRaVbj3hVcfPrfsgoPTcy/1mT
	XGFzYmwjlIWBjEOBlkxRZazG6ONJP8xPC0//vgXzBxWJpAhDFycAjCRniBGhubNvVwX9zkGLZ+z
	9HSM3Ae7VV4bXbQ9DyrHJN7g4O88PJvhryRb7KanTPHJogr/pVWuCtl2XF6mYN13+fUuB3YGjxZ
	7JgA=
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261029075402eucas1p1da7f497ccc2e469112e08cc58e0bb0da
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261029075402eucas1p1da7f497ccc2e469112e08cc58e0bb0da
X-EPHeader: CA
X-CMS-RootMailID: 20261029075402eucas1p1da7f497ccc2e469112e08cc58e0bb0da
References: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
	<CGME20261029075402eucas1p1da7f497ccc2e469112e08cc58e0bb0da@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_005405_331728_548784E0 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The JH7110 embeds a DC8200. The binding requires an SoC specific
compatible ahead of the generic one, so add the JH7110 to the enum.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 Documentation/devicetree/bindings/display/verisilicon,dc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
index 919a9001220120054cb62d1d01b7293367266f95..05a202633cd273fec358c095c64584d959d96d90 100644
--- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
+++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     items:
       - enum:
+          - starfive,jh7110-dc8200
           - thead,th1520-dc8200
       - const: verisilicon,dc # DC IPs have discoverable ID/revision registers
 

-- 
2.34.1


