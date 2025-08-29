Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E8FCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlGz2LOiYCQqbZoz9wUcAwe5/4u+OMh13Gay5toYcRM=; b=y/BQ8rLi+VZb2E86oeUweZl5ct
	EsL5wVl/2IwILMGg4iOM+KbstVg/IunDvAxPjTOlcW5ZyduOFG6HqrWsfSrvW0KQhrCGS4iElQGAg
	pGpCHwExcRbZJ6T64TTGiBfEOG9dRmtw5t/+c5L9o2PNjCGVRJIMyrYzP5EW+c4qYHoLrjjwMvqIZ
	3X++hWu+fIjRGiYrZKmGg/MtXha3iKSo/clXW3iUL44k+wJi7zRJXK3hRkylUD9erC2zUAT/Klcs1
	q4TJgKi4oMiZzRwJ3wES+fe+js4i82Hz8Z0njmwNHOaEWpEVgCBAP74sVOS28bONQIYD036p8pcfq
	zg/B2XuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9lz-00000007Avq-3cUm;
	Sat, 30 Aug 2025 00:48:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us3FS-00000006ZqM-0hBy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 17:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FA1A44651;
	Fri, 29 Aug 2025 17:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E33C4CEF0;
	Fri, 29 Aug 2025 17:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756489849;
	bh=7qIvpZlYTi//fSzjgZvpyX5N/FgxRpkmRhI5BQCHWyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iy1WN3LLMTh8o28cBvQ2uz8LR2949jBvHlcSEag1c6FkEswp5kPcpdnM8oJyTt/Tu
	 hBKNMlhvZpUXkkvoryVlxfH3gfZM4OYVZ8v/M+WKlgdZcxGaw/pKyQ16bdmcF4QGa4
	 zB4J/T1fuluugizSv00DOXYekb9hauLY69nOyusgmM8NgT4jUXlSn9Y7UWW74G2VBQ
	 dlT+jNyIa3zC0iWqD2tKdI745xbuxi9BUA7fyfgIdvngQc96Zx1y4HdHgwWAdgPDVf
	 PHfQYNt4qYn7LjMQNimQ6xgA2T5L95TzF4ZNLyJ38o62nwV/r+nZVDZAhjL5Jq+EdK
	 X0/WWfIdsZLhw==
Date: Fri, 29 Aug 2025 12:50:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, kernel@oss.qualcomm.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Coresight
 Interconnect TNOC
Message-ID: <175648984746.1068381.2779865131984484045.robh@kernel.org>
References: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
 <20250828-itnoc-v3-1-f1b55dea7a27@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-itnoc-v3-1-f1b55dea7a27@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_105050_223102_74379718 
X-CRM114-Status: UNSURE (   9.54  )
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


On Thu, 28 Aug 2025 02:27:22 -0700, Yuanfang Zhang wrote:
> Add device tree binding for Qualcomm Coresight Interconnect Trace
> Network On Chip (ITNOC). This TNOC acts as a CoreSight
> graph link that forwards trace data from a subsystem to the
> Aggregator TNOC, without aggregation or ATID functionality.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
>  .../bindings/arm/qcom,coresight-itnoc.yaml         | 90 ++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


