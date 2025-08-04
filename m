Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EBBC88CB9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 08:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Gzv5tINujagerTL8OjA+TdjToHLGlBL1J/EgnuGKwA=; b=XFU4B7b3l/YM5o8JNfUy0LuYHU
	VWv91m+9y0COCbLzsiObtphSrAkPLO3BNQzBjE4FHM2LJx0UB9uTQ+v/PK6CsFHmbmHnXNUjMtWyZ
	zb5sk+zYxsbdE6B54G+rz5xlcVGejEUtHwCdfWcgqaap6sMgyoREGNBUN8Fx9e1zsK80c3sa+lZ+5
	9XwQr+yMi+ousxxW1ppSDpJ7vBcC+8FtF0EekDUvucbB3d/x+I1WEZvRJqWAlDDE8rFVNTuFUVi9b
	1Qk0GfZnZw57Wqb34QlJ8jdUyu5hAQnElJvBrm6ArcVBXbWVtWv/T+1dVSXOrRGOfYf/DIUkRopGI
	5gLcqjGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqss-00000009zZf-1iLF;
	Mon, 04 Aug 2025 08:49:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqgJ-00000009xn0-1Z0b;
	Mon, 04 Aug 2025 08:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754296589;
	bh=q5NIFYfPGBPjvoRsywWnULzZC4/llLvrlCsM4PPmad8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GEWJMHXX5RsnmTOJN70LagzbEdSWbWeG4Gm61w/fGPuV9/F2aWcIOTOKQ7vzDwUyN
	 OkenWlIlBSnw9Tv6NaFVkxYARemn6szzVyFYaTjo5LWRmmRwvElFOoEDQLZ4e7uR6v
	 XXeCXGjhOr0eUfI56Cv8Ca62P7gl4EJ1YuCCOW41LGr3PbvaZI1DjnARAP02ZgAgxR
	 1fm88wpkzejL8TBWl0wcpl1Yxz9Pgf0lAC2MAJ2ACjY+qOFmbnP9+y2CA9p+F7co5W
	 cR1Ah377dwBdY/0CVgJzYZ4zDm2DJlbVoSdh/NJDYcbIrtNhKBQNPPe3LPLwiV4FU1
	 aErpIcMLRVAww==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:169:2004:39f0:9afe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 38AC217E0B8C;
	Mon,  4 Aug 2025 10:36:28 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: krzk@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	guangjie.song@mediatek.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	laura.nao@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	mturquette@baylibre.com,
	netdev@vger.kernel.org,
	nfraprado@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com,
	robh@kernel.org,
	sboyd@kernel.org,
	wenst@chromium.org
Subject: Re: [PATCH v3 09/27] dt-bindings: clock: mediatek: Describe MT8196 clock controllers
Date: Mon,  4 Aug 2025 10:35:40 +0200
Message-Id: <20250804083540.19099-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <fbe7b083-bc3f-4156-8056-e45c9adcb607@kernel.org>
References: <fbe7b083-bc3f-4156-8056-e45c9adcb607@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_013631_629274_407501FA 
X-CRM114-Status: GOOD (  13.90  )
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

On 8/3/25 10:17, Krzysztof Kozlowski wrote:
> On 01/08/2025 15:57, Rob Herring wrote:
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  '#clock-cells':
>>> +    const: 1
>>> +
>>> +  '#reset-cells':
>>> +    const: 1
>>> +    description:
>>> +      Reset lines for PEXTP0/1 and UFS blocks.
>>> +
>>> +  mediatek,hardware-voter:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description:
>>> +      On the MT8196 SoC, a Hardware Voter (HWV) backed by a fixed-function
>>> +      MCU manages clock and power domain control across the AP and other
>>> +      remote processors. By aggregating their votes, it ensures clocks are
>>> +      safely enabled/disabled and power domains are active before register
>>> +      access.
>>
>> I thought this was going away based on v2 discussion?
>
> Yes, I asked to drop it and do not include it in v3. There was also
> discussion clarifying review.
>
> I am really surprised that review meant nothing and code is still the same.
>

This has been re-submitted as-is, following the outcome of the discussion 
here: https://lore.kernel.org/all/242bf682-cf8f-4469-8a0b-9ec982095f04@collabora.com/

We haven't found a viable alternative to the current approach so far, and
the thread outlines why other options don’t apply. I'm happy to continue 
the discussion there if anyone has further suggestions or ideas on how 
to address this.

Thanks,

Laura

> Best regards,
> Krzysztof


