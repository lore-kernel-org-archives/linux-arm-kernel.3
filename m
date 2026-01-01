Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F95EED626
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 17:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7Bc5k2+BP73Q5+QHhDfou1RNTc4ksdE/d5iruGkMmk=; b=CmNjzsa4B3Vwv/IfdiwxN2crlr
	ux6YdXVp4uttAo3Tj6sL7sjTSpz+TndAo/27Kv6bWuRDJ8csiDVNtuPVoiI1Uw5Al0M49bW5Z0kSs
	vaqfKdmk/T55VkxFPPXq+q3Lxhc+h3RPwB/pnofXwJlORidwrr5I952uv5rvetwR51svhVfMjFiFF
	lMdGaeD1UowbfwrA2dEg0XWunRpLCVERHh9eXAWkjIs3A2aq5KlFkigjfFSQqJkaVmWykgi4S0JgT
	iHHSS7UMbibahSa4uZSgw4g3rDwjEeOR2j1CiPNdWOmjkH5ifn5xO3JQGhlPq6cG6jKkvd7jiDvMU
	jDhWnEkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMg4-00000007Ocl-0yki;
	Thu, 01 Jan 2026 17:41:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMg1-00000007OcO-1Ird
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 17:41:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8670644275;
	Thu,  1 Jan 2026 17:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7F8C4CEF7;
	Thu,  1 Jan 2026 17:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767289292;
	bh=P1/z+ggHodxfiwF/y3Y8LXsHEgBGIcsN14k9+EHGsuw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cB82Mb4oeBIwgoWN54pO7vcUzmGh5rWu6ImPZt2JIigS2vRQnRs3yZotaj4//An9U
	 r5gV/d6iz89C46iOTxtXC0/KU6eNwhE7nB0e+x1DR4dJlWYYYVtBDN2YaK/tkMR8jq
	 4gNeXUgCltNgtns/mt7Lw72bIZuPsRB1xq3/DW2BTzxyXGbRY2iAvUhT8pNB+I9V6n
	 9bnGY/Nxq3ocvm8734AC2fzP1MdJ29dsESQR1MIijMMC5Q76Xrc9cMNqt0iga6N57X
	 vt3LhPaRG3AcXxi2w1ka7H05/slUud6xIZYNi5Eye4VlfN1Kwd5VzBia4fvfrKNaZK
	 q0ipHcrVR72lQ==
From: Vinod Koul <vkoul@kernel.org>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20251231-apple-admac-t8103-base-compat-v1-1-ec24a3708f76@jannau.net>
References: <20251231-apple-admac-t8103-base-compat-v1-1-ec24a3708f76@jannau.net>
Subject: Re: [PATCH] dmaengine: apple-admac: Add "apple,t8103-admac"
 compatible
Message-Id: <176728928984.239319.10678694314115348401.b4-ty@kernel.org>
Date: Thu, 01 Jan 2026 23:11:29 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_094133_377312_4D609E1B 
X-CRM114-Status: UNSURE (   6.52  )
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


On Wed, 31 Dec 2025 13:34:59 +0100, Janne Grunau wrote:
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,admac" anymore [1]. Use
> "apple,t8103-admac" as base compatible as it is the SoC the driver and
> bindings were written for.
> 
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
> 
> [...]

Applied, thanks!

[1/1] dmaengine: apple-admac: Add "apple,t8103-admac" compatible
      commit: ad9a3567d02a5b6e866b58fc756d0d79f43b7412

Best regards,
-- 
~Vinod



