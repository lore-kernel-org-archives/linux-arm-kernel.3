Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE357C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 19:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JrikhqZFPP+Lng8d8INd8zXdTRmN3rWF23+dPXAUK9Q=; b=gjJg+ly3F73kNx0paQU5jUZL8u
	w5GZj2vvd7ZP9vO0aCarU/kp19qJdQY946rQFchFbsBNItXKKhXNbadQrbIMQIQ/zbCuS9g+f0qcB
	/DTQ5yzP1QTjeG4pZ9ndCyRUkbFXIaBzQMCkH+B+VapQt6b54UrvcUD7oZzLc4+oaDWd1fv2KDqw0
	/eeTuPZkJu+3yYqXmY9Y/LvGsaUOeeViF4hVNrRflq9PAW/TggNUGEr2IvduOSjbOFJAlU6Y4How3
	SxKMRQ3HAD+x++vIZA3R0zZLHnBYGeQd8vFpUJ14TybhIvUwQELWqDxK1ikR9bQ1nwe9lh6G3/djW
	NKb8dKfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf15C-00000002vlR-3XsK;
	Wed, 01 Jul 2026 19:58:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf15A-00000002vkI-3KVc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 19:58:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 600E043D85;
	Wed,  1 Jul 2026 19:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B291F00A3D;
	Wed,  1 Jul 2026 19:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782935932;
	bh=JrikhqZFPP+Lng8d8INd8zXdTRmN3rWF23+dPXAUK9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XZ++U1dV6WpJuG1bYUo8HIfR4hyErcRySYZg0RooAht8UD9dschBWcjvukcNEbQsd
	 l8yTsJZc/So+SSxKEOK5bvnG+B9ZBZom1MnHwLeEOkEkqYvHuP0+jUAlpOQruekH9W
	 om22bL6NOmDTR7/UBQriOExfyTlxYtwAo4409l2d9v83vwNgxBJZRkfbvDNFXUvjw7
	 KsUtP5FrOsuci2VaDbETURk8x8gRQHzth1gAzpz1CU11ONcvBdg+lpFXHUbz3xAvg5
	 zUTiIbMwB4vi+YtOOgQiTvx9Mt0fZ9lAFTJ1W/tLmVfflLfbsd69/LV8ybMFXZB4XU
	 U7N/bGZu4Q4bw==
Date: Wed, 1 Jul 2026 14:58:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: samsung: exynos-pmu: Narrow allowed
 reboot modes
Message-ID: <178293593089.1663807.4500562387695566670.robh@kernel.org>
References: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260701105731.196618-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701105731.196618-4-krzysztof.kozlowski@oss.qualcomm.com>
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


On Wed, 01 Jul 2026 12:57:33 +0200, Krzysztof Kozlowski wrote:
> syscon-reboot-mode schema allows arbitrary "mode-.* properties but only
> a subset actually makes sense and is valid.  Provide negative look-ahead
> pattern to disallow any modes not supported by the device, which
> tightens the binding.
> 
> Most of Android-based Exynos devices share the bootloader or its parts,
> thus reboot modes are most likely the same, however only a few upstream
> DTS define them, so add restrictions only for these.
> 
> Google GS101 has on the other hand quite different bootloader with many
> known reboot modes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/soc/samsung/exynos-pmu.yaml      | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


