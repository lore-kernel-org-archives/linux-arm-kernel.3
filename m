Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA21C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 08:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgzPv1C3occXuVL/w4Jgb3UPJ3haT1nkHRHiFKA5F+Y=; b=1F1IjbP+/MfeXofIFrudP31ZRr
	Utg1C+UlfvxxDbuZTskW6c/TPRnAgoBg8lvxgdoxISg5vipmbl5Qg6OmO1TVwXZcC5R8k0JY+bMRN
	blFmeKLx545Or2ON0CIbbY85CRH8AnBYpqXlYVH5lIQ0ZEonvgqQc46woKyj2GK1N7+KyrLoBWHFu
	8780KYs2dL+LIqSDuiYb0kC7i05BozhQUN4DGJYXUzqegtQDCG5hGFIIKhKBKHT4lBdWz1RozVdaf
	x6dAXrA4jDtm/Io++fgialTNUvhHxIc084eEAjPw4IK3W/wMoL1k6hJLIrylP4V7nAHxWGByfSVne
	2VKKwubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fw4-00000008qtc-1kw2;
	Tue, 29 Apr 2025 08:03:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fu9-00000008qcp-0KLx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 08:01:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EC704381A;
	Tue, 29 Apr 2025 08:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D633AC4CEE3;
	Tue, 29 Apr 2025 08:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745913684;
	bh=DZa3T3b4vAqSDABkH+cRjLnDd7YvrAb15Rd26zzgywA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MnsuiDp+lzuDisqX3K/PeFS7IaRrr7kxMPv89NciMhfqgR51dtIs7h/hbgRH9XkbN
	 mfVXEqlceXIJCdR7bi7EqNjVNoJomSYS0myF8xFTrMRYY3uWBAOql+h4ipIC+KrEEz
	 2Xruxqob2qPJZIi2detPfIw4graWbTCquJFyE5/bh14/t1ACMSIt51HqV+gwnPFUq5
	 auYvlV52DSPGVZjjvybTDfqtsFkUG+EX4VqSssMst74qpx1LJUGs1FLsmLUKboBC1Y
	 RMDkEay4sBz5aPVl7Ui0uYqZ84pWzCZ6Y/QM474cqkqZvO07MX9pCfyH01RXKkMHld
	 ENvx79CA28eJQ==
Date: Tue, 29 Apr 2025 10:01:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: google: Add gs101-pmu-intr-gen
 binding documentation
Message-ID: <20250429-scrupulous-aquatic-toucanet-1aa9df@kuoka>
References: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
 <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-1-1bcc44fb1d55@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-1-1bcc44fb1d55@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_010125_138882_9B487CD6 
X-CRM114-Status: UNSURE (   8.71  )
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

On Tue, Apr 29, 2025 at 07:19:37AM GMT, Peter Griffin wrote:
> Add bindings documentation for the Power Management Unit (PMU) interrupt
> generator.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes since v2:
>  - Fix dtschema error "relative path/filename doesn't match actual path or filename" (Robs patch bot)
> ---
>  .../soc/google/google,gs101-pmu-intr-gen.yaml      | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


