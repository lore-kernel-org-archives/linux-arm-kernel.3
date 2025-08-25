Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34A1CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 08:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3a5UB+GovoIsQfVq0lAQQOKwlK09WrhT/sZPiYsK/g8=; b=xit4U9tvJ8kRayGs6PEdfRvhmE
	M3cU6HdPKynOQ/c7P/k1HTxz3OXrlXJkVvZUl0O3+lruKFDCqAu518BCi8h9soZ2klYVuyh416n1W
	dpIn/KubAiWTvSf5w164UaXC3SjL/ZrmhttkZFpvs0Z3Pjrszijv9la3FFhlCtBTT8DVlE0yGZlc1
	IC9jD9dIg9fwdf+7Wp0YZ0qsM5tqoqyEiCBmWFvurZmCWH5HH+2R3CUePdSgZtdYn+SA1mqzMa27a
	yTYGo/EsOAhexL9zfFMbeFp7SqgNXMAjvESlkzv6jvvaX8LBTbQGy8IvXpN1WIy+eB9KFlDvInz5m
	/l3r6zJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSuS-00000007Nxf-0Mph;
	Mon, 25 Aug 2025 08:50:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSXN-00000007INY-06AI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 08:26:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11A8A601CF;
	Mon, 25 Aug 2025 08:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E758FC4CEED;
	Mon, 25 Aug 2025 08:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756110403;
	bh=JhmYYHVQIIQ7Csurfk62kT6LMaFbd2N3YVxTtzBRMX4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pCBEu3EtIW+SnXjYv65YO8vxgAisoOnQh0kf2IVKmspHprv9NmJzn1ygswz0UoYo9
	 EXrPbSE8FSQDt+C/Wcgln7MkrLdxv/BuASxcNcjW/hRZUyjSCpE8h73SdOf47JuKmc
	 2s9FwBz2tfBByWbbCNIx6z+UGemHhOI+YYp5JS3UijCduk398en3u6rJjzKwxk2FgH
	 bR0p1XCod3qDjKYiwsgMwyKiNGCt8TEGoEoSOZVm3WWZnGgnJ0z+4qcS2a3zV5smcg
	 AAyfMz/PfAPVchpsdZw6nH+hbfn3ClpEOPM1pEYSnCMJCK20U1i/pobzyKeVUcZjT3
	 jhXhKgSE3XvbA==
Date: Mon, 25 Aug 2025 09:26:34 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Salih Erim <salih.erim@amd.com>, conall.ogriofa@amd.com,
 nuno.sa@analog.com, andy@kernel.org, michal.simek@amd.com, krzk@kernel.org,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: Update xilinx-ams driver maintainers
Message-ID: <20250825092634.75230a7d@jic23-huawei>
In-Reply-To: <e61c2e01-cd8d-4193-afcf-5ddaef34300e@baylibre.com>
References: <20250820100519.2272509-1-salih.erim@amd.com>
	<e61c2e01-cd8d-4193-afcf-5ddaef34300e@baylibre.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 23 Aug 2025 11:13:06 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 8/20/25 5:05 AM, Salih Erim wrote:
> > Anand left AMD/Xilinx some time ago. Salih and Connall are new
> > maintainers of xilinx-ams driver.
> > 
> > Signed-off-by: Salih Erim <salih.erim@amd.com>  
> 
> Looks like you forgot to pick up all of the trailers from v1.
> 
> Also, there should be a changelog of what changed from v1 to
> v2. Just rewording the commit message, I assume.
> 
> 
> 

Looks to be just that. Something to fix for next time but
for this one, applied (having dropped v1)

