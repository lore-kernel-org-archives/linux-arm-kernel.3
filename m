Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC43C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 14:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsCqUSepLV1EVCdAVb1gjnK16IGOCWPNy8kXiha5vOI=; b=qBRdzZFWUf0sQPD0TsKqSDuRvG
	6j7xiLLWbu7VORVfodyMRPeWcv9jP8jP9nZuFaQG26ycx5aars070O11dvYCfBTfLAiEdznRpSRki
	K7kTSHhGnro5sLgvYGqzEQQkR21YRyHokMnKkzMh9eg2JF8J2Pr7yyIZqCLTv19waH4LTDvh4CP+V
	o1o2gDhgZGceOUcWOtihLlKR77r0BLUgSwlWAhZ9upeR+R2ahv9wVIM75hMMy+USr3HZNBywRgc4N
	AMINsDxQ3Vw8Nz7epwlXCYeGdjXxzcsMewqIP9ZbtcpoHObSN6fl5UCtm18wTU7XrKdAjhr0rrCGz
	/QxTTRiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkZL-0000000Cn2n-427R;
	Mon, 06 Jul 2026 14:45:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkZK-0000000Cn1k-2qh2
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Jul 2026 14:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AsCqUSepLV1EVCdAVb1gjnK16IGOCWPNy8kXiha5vOI=; b=gMJhOtqyYqMwz7E7eW5EreXKkt
	AiJLr/YtSMcRdW7XcfEXgJHuWl66WV+ImpI9EeIDaKUWYFs4L2FgLMUuEtWCIdjVgGlIiToraxHtP
	h2YIchuT9PNo5CPIFAGTlCLwusHoJHqA5v0p/rces7Go6U1UVv/syRZlY5eR9lMgkNF5lObgER0jo
	vicrmt43nfPJB4hVUfs7n8TiZSvF6UgTpNm5ojRZ7Ivh5jsLF//k3n8Q14bxjd5WsSrttdkefVyKv
	2f+Y7YpXPoCh2E1d1tLc3erqpSEAOxHPZBFMVIRMGRSwNN9HqFvnKsBreLmxdAtBS/f4TuIGI9cuO
	AExqComQ==;
Received: from mail-24416.protonmail.ch ([109.224.244.16])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wgkZH-00000006fcn-3c4k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 14:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1783349097; x=1783608297;
	bh=AsCqUSepLV1EVCdAVb1gjnK16IGOCWPNy8kXiha5vOI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VipuLJ4un5PyrPcU0KPcGiK0xJEfiUV3xhrpBqr6mg8Mps1BbtBjxAM5646uVOKIy
	 SlksiiSCQ4zT91kZrt2NMczhh5luxT2AaTiVzcPgJFBMOQkWgrhjcTPhaVxRzqJAuX
	 iF/4etLGMFunrq4FAQ5Dq13xGej6umdPTOu+JTsxCWybEDAk/+Vl+3gkCr/4gQtmqD
	 MY4lCSXXMGSjQgsHN+hWWv1d7NbqwLMzz0bJw+JnB+eSGjRfgt1aCO0qX9GMDWITnT
	 qC5d5gzcCEqZL+J3mqXcDsGcx2iqvZgwEMJiTm3gWploRJZijlDPERGrnjggRphVZS
	 /tpVlyzwY0cLQ==
Date: Mon, 06 Jul 2026 14:44:51 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 7/8] phy: qcom: qmp-combo: Correct pre-emphasis table for QMP v4 DP PHYs
Message-ID: <9a203e5e-5d16-400d-a507-8b68df8eb017@proton.me>
In-Reply-To: <4635a665-f605-4647-810d-c9d83a271a86@oss.qualcomm.com>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me> <20260622-sm8450-qol-v1-7-37e2ee8df9da@proton.me> <4635a665-f605-4647-810d-c9d83a271a86@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 4d9a7c56b233fd2d39549ef51db60aa12ffaa5e3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_154507_988636_BE9FBEEA 
X-CRM114-Status: UNSURE (   6.16  )
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

On 6/23/26 7:36 AM, Konrad Dybcio wrote:
> It seems like 8350/8450 should be using what this driver calls
> v5 tables, with this fixup:
Any updates on this?

Regards,
Esteban


