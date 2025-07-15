Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235EFC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 04:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hwZ9pGB4/hx2ABFnIm8s8H6CXYLZ1v5EE31wGJd/Es=; b=oVk7FHQMvRK+GGqpLWLFH6Uvyg
	FrxUHbwhZ0WQK5lWujw7TW0RbcqPAstYhP3wyGuMUOfhOJ1Uc/+cKrtSde7dPRQEtsV2990yn8MuK
	Q6uWbRw3yY71wxvR1R07kdMXXpyjSwNkRz6wgxILAbAMMG5D3gG5APfA2W63LRKuG0oIGE5u+JJ3Z
	4ZrRYMeFDPdjccSp3pb2oro/ZBY+5vvT9tpBoIaA83idYml5lHucl8F9XqZmmY3Ibv47+Hfdc0v32
	f+DAaJ8ipjUCOsSm/BrlYhICXHwaggdF0Xw2W+D9kIRXuFOHpUo7MbtEPzHTVWxYIZBFWnx1RAaey
	zAkWg7Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXJq-000000040e1-2hD9;
	Tue, 15 Jul 2025 04:31:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWfC-00000003wJn-3I7J;
	Tue, 15 Jul 2025 03:49:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 30C9C5C561D;
	Tue, 15 Jul 2025 03:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD55C4CEE3;
	Tue, 15 Jul 2025 03:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752551345;
	bh=gcY+rcVUM18+WL+0Uv5xjyIiT5YsGsvyMAcfAQ3GkXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O/yaklxrP0q+LJX8BWpX6hyeBc2f/KflPpHmmNR3Fd62d9XmHx1WSIpVtjpX7BwwV
	 HRDq7qIM1rE6yyfcgaHHeT5qm1qUGvAp/RnJz9fBjBMfe1PQ4pc+kvC2zYwjBI0G52
	 8thHGh4Iygy5PkoPsp5ZuQ6vB0eMp7V4Ycsy9tolXO6yIQkAaPvhq/Rdmo/LRHwVgN
	 EDmSV0Zbv7zVOf1f6N2bvOzCrs9+4aGMEYbCQwO/gY52OT+2mdIUzn9Y6g4splBD/g
	 TNlXtNb/z4kwuU7vw1+Du74z1+tgVmd5LCFDG1wXEJRtFjs3wwxbdJzREVRJiRHNcu
	 Qhby4nuvpwwvA==
Date: Mon, 14 Jul 2025 22:49:04 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: cpufreq: Add
 mediatek,mt8196-cpufreq-hw binding
Message-ID: <20250715034904.GA4699-robh@kernel.org>
References: <20250714-mt8196-cpufreq-v2-0-cc85e78855c7@collabora.com>
 <20250714-mt8196-cpufreq-v2-1-cc85e78855c7@collabora.com>
 <fd561a8c-f1a7-41c2-a686-abc89f5fa555@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd561a8c-f1a7-41c2-a686-abc89f5fa555@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_204907_002236_F0F09030 
X-CRM114-Status: GOOD (  25.34  )
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

On Mon, Jul 14, 2025 at 04:41:30PM +0200, AngeloGioacchino Del Regno wrote:
> Il 14/07/25 16:08, Nicolas Frattaroli ha scritto:
> > The MediaTek MT8196 SoC has new cpufreq hardware, with added memory
> > register ranges to control Dynamic-Voltage-Frequency-Scaling.
> > 
> > The DVFS hardware is controlled through a set of registers referred to
> > as "FDVFS"; one is a location from which a magic number is read to
> > ensure DVFS should be used, the other is a region to set the desired
> > target frequency that DVFS should aim towards for each performance
> > domain.
> > 
> > Instead of working around the old binding and its already established
> > meanings for the reg items, add a new binding. The FDVFS register memory
> > regions are at the beginning, which allows us to easily expand this
> > binding for future SoCs which may have more than 3 performance domains.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >   .../cpufreq/mediatek,mt8196-cpufreq-hw.yaml        | 86 ++++++++++++++++++++++
> >   1 file changed, 86 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/cpufreq/mediatek,mt8196-cpufreq-hw.yaml b/Documentation/devicetree/bindings/cpufreq/mediatek,mt8196-cpufreq-hw.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..26bf21e05888646b4d1bdac95bfba0f36e037ffd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/cpufreq/mediatek,mt8196-cpufreq-hw.yaml
> > @@ -0,0 +1,86 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/cpufreq/mediatek,mt8196-cpufreq-hw.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek CPUFreq for MT8196 and related SoCs
> 
> title: MediaTek Hybrid CPUFreq for MT8196/MT6991 series SoCs
> 
> > +
> > +maintainers:
> > +  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > +
> > +description:
> > +  MT8196 uses CPUFreq management hardware that supports dynamic voltage
> > +  frequency scaling (dvfs), and can support several performance domains.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt8196-cpufreq-hw
> > +
> > +  reg:
> > +    items:
> > +      - description: FDVFS magic number register region
> 
> As already said in the other commit, we might just be able to avoid adding the
> magic number register region :-)
> 
> > +      - description: FDVFS control register region
> > +      - description: OPP tables and control for performance domain 0
> > +      - description: OPP tables and control for performance domain 1
> > +      - description: OPP tables and control for performance domain 2
> > +
> > +  "#performance-domain-cells":
> > +    description:
> > +      Number of cells in a performance domain specifier. Must be 1.
> 
> The description is redundant and doesn't add any real information, I think you
> should drop it.
> 
> Bindings maintainers, please, opinions?

Drop.

Rob

