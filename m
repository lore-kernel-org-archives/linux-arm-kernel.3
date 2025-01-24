Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFFFC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 08:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21/Fo5Tdq49I07jy4+fbLqvZK/EtzCAZXLWiwq+gbdQ=; b=CsfGZ9SiAj1HJG3WX5+ORurnJR
	QGEDelI8zNVcRQOe75+RJ1tjllLu0J3D25UmC+ZqRHGtNXoRunmW0a5jdRvFuJGK9JkPslkFOYAzS
	+cMz5nrUJxHn1vPtnEspK9trTncevKb21GUo8EyCyw7Hl7L0f7+69biQetN+DztDqfdyzP0mr5w3v
	vsWbjDWar8P0V+/mqoZWDUadGFWf1oc7KnFb1c2BQgqqGhrWc0S5NmRFF0JlEIVo9+OTCNhs3CsCY
	rods7Bl3CZ0tplHM14RfZig+q1uIqjR88MyS3YUEsxYOHpwNRefeLY9p0gkeOi0M4TSEoeQw8RDRr
	OGYlD3UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbEyx-0000000EEPH-3Opn;
	Fri, 24 Jan 2025 08:24:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbEwO-0000000EDuu-20JG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 08:21:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38997A40D9F;
	Fri, 24 Jan 2025 08:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A1AC4CEE2;
	Fri, 24 Jan 2025 08:21:22 +0000 (UTC)
Date: Fri, 24 Jan 2025 09:21:19 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] dt-bindings: mfd: syscon: Add ti,am62-canuart-wake
 compatible
Message-ID: <20250124-organic-glistening-bullfinch-d4bd12@krzk-bin>
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
 <20250122-topic-am62-dt-syscon-v6-13-v1-3-515d56edc35e@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250122-topic-am62-dt-syscon-v6-13-v1-3-515d56edc35e@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_002124_582737_1A067935 
X-CRM114-Status: GOOD (  11.39  )
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

On Wed, Jan 22, 2025 at 11:24:34AM +0100, Markus Schneider-Pargmann wrote:
> The wkup-conf register space contains a number of registers that control
> the wakeup through the CANUART block. These are present on a few SoCs
> including am62a and am62p.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

We do not export registers, but entire device. Decide what is the device
here.

Best regards,
Krzysztof


