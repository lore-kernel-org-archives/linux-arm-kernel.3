Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE6FFEE4ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 14:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPK+NaLQf50xu2Fhaj1tgGT7iUo/kV3hqX5GBq4zPwE=; b=XW9SGOPSTR35SFeiogRk4xSeK5
	wmK06XZr31onNgykqVp53rMFkhZM1X2G9aJuATzX6yOqIJiJgGZvxkGH2ZceFMt4fmeMvWv1Fvzz8
	72YBZ/3cXP4DaePTaz9lPCpdxz8EFzEUpdUtwI1far7VU0YG+aB/6tCXDfp/APLkkJw7GMntMIn2L
	o5X7np2Q3BnVsUWZ8pgz17zECMhUsyPDdc4VnDYm3rdLPQQLzzYNhW9VeuEoqYfwlow6X9jxsXfaq
	kYezNvmoyvzIVq4xcI9TaiCCI7mmKvmkFw0xsUc/eJN61QvkXUWjvMhl1hQSfrPvQ1JTw0z6GCLVf
	UAppucNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLXd-00000009w41-1FcK;
	Sat, 28 Feb 2026 14:43:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLXa-00000009w3c-2a0r
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 14:43:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D851D409B8;
	Sat, 28 Feb 2026 14:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2236C19421;
	Sat, 28 Feb 2026 14:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772289813;
	bh=DxlsWt8JrSJgLLW+czcpjK+QrBU8SMywKLQVpxZEYNo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zi43zS/heJJsjx8xD5CvT1NRMRViVtJGHmPcYbdsLKPOkA4kgvPuBIc6eHi3FYHNu
	 tKU1DY2o72t7cdJ85/8qLCfrTPKsjc2I0w0IqLRHk+Of69MnALJWE1nzCmnkz8fXPy
	 sEuAnCesSKNISU0tLU9aGVEIQaVldt+UahGx/Sj+7Sd78a4q27SyezNs/cdxpQ4u9r
	 uwOU1+GOmCXPRXR4M4U7QKn4Tw5bYAiJ/vzYE/rFaacKlsJ+0CrmDbncafKhc7e/NU
	 sXr1UkDQvz+RBz1TzBTlmnCP5ENZlloBy1Omt9vThLGReYdukXtQhY5IolHn4X07Wt
	 tB29snDc15nsQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	sunyeal.hong@samsung.com,
	shin.son@samsung.com,
	Raghav Sharma <raghav.s@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	chandan.vn@samsung.com,
	dev.tailor@samsung.com,
	karthik.sun@samsung.com
Subject: Re: (subset) [PATCH 1/3] dt-bindings: clock: exynosautov920: add G3D clock definitions
Date: Sat, 28 Feb 2026 15:43:21 +0100
Message-ID: <177228975881.54431.6677380218613505033.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202103555.2089376-2-raghav.s@samsung.com>
References: <20260202103555.2089376-1-raghav.s@samsung.com> <CGME20260202101954epcas5p27735b03488efceba5d7f970931905ec5@epcas5p2.samsung.com> <20260202103555.2089376-2-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=359; i=krzk@kernel.org; h=from:subject:message-id; bh=BJphhyUvycG85ma5KiuFViDXgyFJrR33M1MzhR+Y77M=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpov8J8SkbXScdOWTrVFJmnCLf50v3D3l/X2Fku d5SPKzffhGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaL/CQAKCRDBN2bmhouD 10CoD/wLDDrPPVk8HYtoavOY2eDXT/oFhSPX6oi2KVGzlzFii8DoOQ3XddBN0UpoaLGYxx1Xz7g w3DLym2bRUJBHma0SrdsRgTUdj1jhYXfv24T0iyuehPfvtVrbT+Iat3cDSBaZ2bMlP5b3So93/W GpXeXRGBjLpbP2ei/bZiLFMl1xDpmXyCZdaAcaQQlqzErlXLMRNKoUZvYhgorPedAVA9xFJqxra yjUzhC5lNXAoCf8VYWW7m/M4+qvUqRjtKt2w4L0f7fsd4DEYMLESLCszLsNGLM4vCoAtBpiBRdx kED9HDXv2iOMHlO9qXKqKDId20D8VnOgyN+KJbokks4a/MiZo92D87jrSQ3mv2FJy2ZK4Dj32HU QPLTNnyrebFcAq51Tj0PY4eEwaFAtwSPXLF9tT9hNPXtgeuwX12ie0e/ZannXGpzDMPMtoMIR1T GSwB2bUaiWSAFp8NPVFHcqkH3V5WRqMt+1J61isK3rqz2wEY/cEjibWiNjAG4aGVAEoqd58YAHG Mv/LWEtTKPL652h07w5C8gVtMRlX84bXD3HJK6H8EUVfQkoKzfm2paxXYB4J5lRVsEYhwHJ9mih NLkQoj/eyepRBNNa85ILYbKTziaFcetm1od5QuOn8KQqT5UFCUXTkiipEm5VDeiGXfYW2fAYHit Y9R1xJHBqpWHa1
 A==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_064334_700086_534F55B1 
X-CRM114-Status: UNSURE (   5.57  )
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


On Mon, 02 Feb 2026 16:05:53 +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_G3D
> 
> 

Applied, thanks!

[1/3] dt-bindings: clock: exynosautov920: add G3D clock definitions
      https://git.kernel.org/krzk/linux/c/6e5913328102f818303b01e854df37fa9f251a47

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

