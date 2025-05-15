Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572FFC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 13:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3sH6idRVT/DTznLTmJ3CWldluNb4n55qNSbRTmuPbw=; b=EBDCnqi+AMaMrv287d5iNhFzLN
	kgsx5YPSFE8yayjtmE0MbwPMqjbKrAgL0pFhpPlJVjydpRerd3EEw7TvsZSlWVTsz8RwY54j6a+vZ
	AxyrtBbhgaKC8nhW3KaHB60IyXBB88LpE9fd4x6Uy0QGDtjc4dz9Cdarpj6h0Zqd+LFGSW5wFPsne
	WQb+lNN/NC5GjBEvF7B7+lpTiF8QFTYA9eJfowipBXZBTqjZRAFKDKB6hFkPaAlRvB60fgmk0w89S
	AfYoG1MLq6wUOGLxNpq1RWLD3NZ0s8Zkkf9DNEkVUUF5X3E/mBzOR5W14/RnX9zjEuBWtuAeSMcGI
	uXUeTDBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYNV-00000000geV-4BTK;
	Thu, 15 May 2025 13:12:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYCe-00000000f5w-3ru0;
	Thu, 15 May 2025 13:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=j3sH6idRVT/DTznLTmJ3CWldluNb4n55qNSbRTmuPbw=; b=k0slbEMxZpoCLTyT3w91VY5ST8
	NqULa0lfbpb18LrpnwQD3SRyRIDLO5t+0IbT6qNV5dOX0qoGUo+qSbVZQPU7Pyxa4vSmFLLwX7GKV
	4odizJqzefzcex46WcFy4SxVz89UZnwSRTajJQc1LYmTxWZW0XaTnOZJl24hIkH/lLh2X+gm2cZSq
	fPpocHx6QCBh7z1ZCvfeOJZ+9HuRaBVz4OUe2phgh6ucu+HMO8ys65ZcK7zpZ5xhwENzjyuU8ose+
	NCK7dWM5UcbiJl7MCzLzApi389XJ4mfTJPX8R3NPQANvCBbTQFOQ2OGjWH8o10VTtEpbYQD6b6bKa
	2ybO5tLQ==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFYC8-00051K-F3; Thu, 15 May 2025 15:00:16 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
Date: Thu, 15 May 2025 15:00:15 +0200
Message-ID: <2745929.KRxA6XjA2N@diego>
In-Reply-To: <20250513011904.102-3-kernel@airkyi.com>
References: <20250513011904.102-1-kernel@airkyi.com>
 <20250513011904.102-3-kernel@airkyi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_060048_955640_39E91122 
X-CRM114-Status: GOOD (  11.48  )
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

Hi,

Am Dienstag, 13. Mai 2025, 03:19:04 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Chaoyi Chen:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input of the CDN DP
> +        properties:
> +          endpoint@0:
> +            description: Connection to the VOPB
> +          endpoint@1:
> +            description: Connection to the VOPL
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output of the CDN DP
> +
> +    required:
> +      - port@0
> +      - port@1

you're adding the 2nd port (port@1) as output port, which has not been
part of the old binding. I think this warrants an explanation in the
commit message on what it is meant to contain.


Heiko



