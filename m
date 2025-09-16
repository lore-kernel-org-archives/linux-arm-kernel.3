Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073C8CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 10:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdIyrLi3nW2t1K8FwKq4I28/MZNgshfDCvJob9sLfCU=; b=xx2d98xaDCKvVdfJsaLiikQJJf
	NB0Ku7SN33N9lgFh6qjzW8C4/b3Ghwuan6wxwd1HFaGku+Ag9ZNyrP6F7mlxTf5vj+tCozW0Fo+K0
	SZtYRE3y6PY5x/RXVEuAjmrlPW/mb4jxNcw1gVC5LwO+87Cdr8rawc8ZEQzd4QjZmMV9en3Waujn/
	Ai1JwfCBkIA1PwJnPUzPAbJeq9qauMHMnZhZaRG5g7riFPaiymyUZ9hqztfPq+cdEPCKgCbyumnAa
	L3Ym2FFPPa//sn0JuEfOfK0K63FOnCmFlFpVG4RUxGR276LGS53RltrTUwZQTs8/afOglQqMoZqPT
	LAVbGpBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySol-00000007VFp-0ZSQ;
	Tue, 16 Sep 2025 10:21:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySoi-00000007VEt-2OYf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 10:21:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01BD144BD3;
	Tue, 16 Sep 2025 10:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D4EC4CEF0;
	Tue, 16 Sep 2025 10:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758018103;
	bh=jOv5Tv4HO/+nI6hQ8fLo8KO6cz67WfuMNY3VLR7Scaw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CGA1cEbp7yOT0VYpobcycEgLRGaJNtFF28oJNDBF4lSDQ8Cc7LWOBPyxYofrjbfZy
	 CxdYRB6wfAMe/yFKCP93Aj2wxQonEWgqJjcVjq0mXP87ZnEpPF4e6ho7s+9E6f6bxl
	 JdsCRWMOs32xRL+LPKdmiGvY7fvQZVA+7nb5hULqtrOsWPBBQ6tcpSarxcQFF+zgE6
	 ZUm0TDSa5NwOzpuwctPUvv6MNm3BduvK4biLhaBuxJ5Lvx5hPRrgBw0RdE2CDmZ3jg
	 Z0gUi34295EGglDkmPrH9b5t6wcWcHmxNRFkOCNo9GSTg/qXuAhPUZKBYGdPbI6kyb
	 wOVako25a5NSA==
Message-ID: <dba79871-672f-4bf1-97df-d9a4471612d7@kernel.org>
Date: Tue, 16 Sep 2025 12:21:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] arm64: Add initial device trees for Apple M2
 Pro/Max/Ultra devices
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 Marc Zyngier <maz@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250914-dt-apple-t6020-v2-0-1a738a98bb43@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250914-dt-apple-t6020-v2-0-1a738a98bb43@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_032144_635467_2BFE3060 
X-CRM114-Status: UNSURE (   8.15  )
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

On 14.09.25 21:38, Janne Grunau wrote:
> This series adds device trees for Apple's M2 Pro, Max and Ultra based
> devices. The M2 Pro (t6020), M2 Max (t6021) and M2 Ultra (t6022) SoCs
> follow design of the t600x family so copy the structure of SoC *.dtsi
> files.
> 


Hi,

There are a few minor typos in the commit messages that I'll fix up when 
applying this series later this week. LGTM otherwise:

Reviewed-by: Sven Peter <sven@kernel.org>



Best,


Sven


