Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E0EC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 19:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8v5fQeg/HFBsHzTPFipZAduJK0Nq+lc9Mtz9NERTzE=; b=qm+9WRbmKsMXkUNNfFzdxHJCZ+
	zj8HqrGEHAVfUMg1uCEFG0++yV1mPJrwjyMAVblm6UEgMiY9mn7NjxD9QZK6FCh0347aQZ2G60v6f
	pQzAkUlSLcqgiI3ZeFFUMjAVNaT1WDLoqjcQCiQYSVZAtvao+JMmXsFhdr2sYGR9V4VlUaT5uvHLH
	Qm7EVWANPOkr9b5i3mc/RvhUmEdGBRS5vO+xY+0/jDKAPSjcNE1M7u7Dny7VpMxfwsgaMpfAcJstv
	vXDOucCoX/iML6GOMED4vUbW7JPcOO+QQfqENgqxp/AuzpKiPWYnVYRw4GN8ePmsinLY+q3F2Ak40
	xAVvqUAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFI8u-0000000GDSe-0Li3;
	Wed, 14 May 2025 19:51:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHq4-0000000GBNa-2sCS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 19:32:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02EEB4A63B;
	Wed, 14 May 2025 19:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD20FC4CEE3;
	Wed, 14 May 2025 19:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747251143;
	bh=jgNWTWiWkIwzVlf6pEDhEKvyRN9QG8lqyb8q90ZMvdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UVsseQZroc++JvR1GiWqQW2iFu/U6eWs21colKYitO+7TcBo9WYuidPT839+DNXRX
	 yRi2HgPXkfDbmSpZc/TW7KOykaUsJLRrsDcvETfebAtyAPXLNOGVXqnPaEpEubmhe9
	 9Thfv1RE/wU0yT68RWAWVuKnt7TYxwMQ2hSF+avKFPL2abZVXTp2VcMwa9ZIJpEh9U
	 LDMMT5l/6yPsVsZecCjmLCgnC5xNtg7eq3Y91jIn+iVYQ3JM2PGweq5JOhPdkbqGre
	 bZl7wbboHCZa/kitlVx7su7MPy2iUltP3VkOmJznak/sbGzZZVdwlsjnH4+MeQEx1F
	 mUWwaQTRBwihw==
Date: Wed, 14 May 2025 14:32:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/8] dt-bindings: rtc: tegra: Document Tegra264 RTC
Message-ID: <174725114145.2870991.544607577077096887.robh@kernel.org>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507143802.1230919-3-thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_123224_739545_B17A6026 
X-CRM114-Status: UNSURE (   9.57  )
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


On Wed, 07 May 2025 16:37:56 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the compatible string for the RTC block found on the Tegra264 SoC.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


