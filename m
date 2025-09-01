Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A87ECA1002
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIlcVJPppl1wH/7DM6mkvTr1Y5bU3UYJfpeBUkz2V7g=; b=EbzVKW3U45Xxk09+bsqZzmIU0L
	mgVpxixOY+eA/ZficZf4+jnTr0Yh415q8LZEs/ZZM95jQRaf5vu5uB4n+xUDBrRZfXIDH7HX1ysSD
	hZKtf9AJs84/8oK3ODYzr1ypNKGmKn+EOIsay8gLR8XRQSJlCkSd9gnGCYtx8z3RZhf3QzV3U359U
	auKTK/u9OoB8SszmqyK0fvQrc12EwaMvxpfi71rFca8BcwFvz5jmR8Sfr3FB5h/IDsgOXOmLSa71J
	wVEuL++7zMa7tU5mYgi5Kh74b7nELFL9QLmsnJJ/RWwT496TyrGmTJu7s+KoC4bEdshmY7LXQY0k2
	HKbsYOTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFG6-0000000EYDK-0Z0x;
	Tue, 02 Sep 2025 00:52:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utAhq-0000000DjbW-0wtk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 20:00:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5A9D601F1;
	Mon,  1 Sep 2025 20:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F0D9C4CEF5;
	Mon,  1 Sep 2025 20:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756756845;
	bh=CFkBOeYNe06+1/UF6vKOmObFAnoKtYOc56dz9hmioNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dF5QL4IhHX5peWtKPcWO33+Y/3jYSVPCYwQVLn4vWsTG5pUjvAx8X3+EkpQyK4cwd
	 RXXaTi9MTftGORj9chATZHBlTnlf3oEMH5w4nzSzNKMSrD17q6MQXtgrvf+s40vRuK
	 qSCqWOPpc8hKBThcZ0VyZgHvRX94245kcVzuTrfDfQguT+UbeygsqlfuJGkWadMHPT
	 Bvqqts9V1e85LulqF6aV3Ou4aDCgnj67lMhQmqLTRu+SIr721QbXgyWEB4QkdqQxyN
	 fIVb1WDAmeg4q+IXL8sl3o+HGZi6vGR9hPufJ5LJ3i47jTDVZcHSLMg9ua6AZqH2uY
	 FRQmP7aqHPijA==
Date: Mon, 1 Sep 2025 15:00:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-perf-users@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: Add Cortex-A320/A520AE/A720AE cores
 and PMU
Message-ID: <175675683724.229121.8672693936627716247.robh@kernel.org>
References: <20250821190722.417639-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821190722.417639-1-robh@kernel.org>
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


On Thu, 21 Aug 2025 14:07:21 -0500, Rob Herring (Arm) wrote:
> Add the recently introduced Cortex-A320/A520AE/A720AE core and PMU
> compatible strings.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 3 +++
>  Documentation/devicetree/bindings/arm/pmu.yaml  | 3 +++
>  2 files changed, 6 insertions(+)
> 

Applied, thanks!


