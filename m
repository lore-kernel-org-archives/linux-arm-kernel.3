Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A04FF60CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmqQ6wZIRPnhYS0sd3BTzNstv85HX3Dp5CcRYcQGE7k=; b=aUJbMdRAo78dGWyiB3Og5hhCs/
	DwsDLQDvwKv8adBHcMf1kgW4CpdRAdICZlu/lGtUEb3OAgTyqnDciQI+igxEzMbHL1PnqNwpVxuaV
	WkBl8BeRMWrMA1vEC8uAUKkFNyA/sKu5nbsNUgDc65JFDWaTZ1OnP8CsUM5C83NUq36J9dK4wjX0Z
	M8B74hDpkVHMQSUGBdhb87cYLWe9slDNqbO0sEYwffPjuR9MayRTcenYw7DJ3VC8d4lbgb76LFrK5
	ze8zLlvwPbv4XIiqb7JJCBN/GuJnZF4UsCvnZq+gJiaRZnf7iC21ntzuCGW1xtOtOdre83eRP9B+l
	/3oeq2rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TAi-0000000CQhf-1WCa;
	Tue, 31 Mar 2026 07:05:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TAf-0000000CQh3-2LVT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:05:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 350F740BDE;
	Tue, 31 Mar 2026 07:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D92AC19424;
	Tue, 31 Mar 2026 07:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774940753;
	bh=KFUGUbZlt5y+7LRJYgMDfqipV4WSv3ujjJvVX13vUJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GUA6qHvDM2laEodb0eD4IOrmcC3rZGCMCM+flk+jlLkIo2VcLP64tcx3DMHoHWtmJ
	 CC1bkoskwUw1Cm0ybVon5qZ5tfIncaSAThvmvHVEjnnb/X4aGqEJKGT1545OcdBLEG
	 LKM8yAtGiBzfhbRZNJ85XRdPRiv2y7KC/GHcbldSppKo6CucsuCECVUU0zp9zG314Y
	 43CLIl7g4FQ07ksYyhk/Hs06lBZ2k2bJsNlqowS6IKIpUeWFHpZPhdrROYeqGI3/Ji
	 s8C/dH9e+Z8RPiwXetH7vb0vYu0/M+3EobUMONuVVG4jjxNdW1Tq/vyHy3Gx/l9Z62
	 pAKhM3o8jw/rQ==
Date: Tue, 31 Mar 2026 09:05:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, shengjiu.wang@gmail.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ASoC: dt-bindings: imx-card: Complete the full list
 of supported DAI formats
Message-ID: <20260331-notorious-messy-salmon-1acc76@quoll>
References: <20260331012450.1298115-1-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331012450.1298115-1-chancel.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_000553_612977_4F4B0571 
X-CRM114-Status: UNSURE (   9.60  )
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

On Tue, Mar 31, 2026 at 10:24:50AM +0900, Chancel Liu wrote:
> Currently this binding only lists i2s and dsp_b formats that are used
> by existing sound cards. However, DT bindings should describe the full
> hardware capabilities rather than only the formats of current usage.
> 
> The SAI audio controller of i.MX audio sound card supports multiple DAI
> formats, including:
>   - i2s
>   - left_j
>   - right_j
>   - dsp_a
>   - dsp_b
>   - pdm
>   - msb
>   - lsb
> 
> Complete the full list of formats supported by i.MX audio sound card to
> ensure the binding correctly describes hardware.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


