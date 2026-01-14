Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D531D29FEC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYkHH7nA+BMetV6pxkhbdEeDqz4onhOut/dR5PCUMHg=; b=RWNvgMIenKmkzekt/sCO5Zy/SX
	wfEbE3sLK/+xGf/88YoR/AlaKZMtny9C3MAoelVP9TUppPrBIhTmmrVCIcECTSachyK3EiIT8T84A
	SApXHMCEZKPYjsr9khCNdcAUToU+p0QKl55HwHzy1/6nj3LxQq13phUfhGAfmm+RnEJCRcpfmR8kC
	2gmS0YF8nKUJ/dP8zneQBq4BpxhtjOGgAuEVvUXnxhnJHNqcaNCya5PxIGMsbIh5WqgEG/c8vsGxU
	S5JOxjoZcX+VwmaEugO0Q9p4X70tj4XfZEc60eQLSdWEdpLq9MaORcUZ5PavAe+tdjqoUgQDhfqGG
	Fdo75l5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyZE-00000008stz-0FCJ;
	Wed, 14 Jan 2026 10:57:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyZB-00000008stb-1J8E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:57:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A4CD41B33;
	Wed, 14 Jan 2026 10:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05F7C4CEF7;
	Wed, 14 Jan 2026 10:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768388252;
	bh=SLQWpSAl5g4iziudfBqu2+69O5MMdguWGtFvQeZxn1s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=P9odwutNFGfCx5HcX10K4SmWcOVWkbgGJn5kp3wM1W0CNLeCHVtjmua+kNu+Rkycb
	 /vrOo6DyOfwdzhWR/6WouJPZWFewvjfsG82x++D4ryy6GXbdlWbc5Nq2cg1Kz/BDz1
	 YhLBGwqI+JNEGCBjRzR6ycxY2eekMzKRwB97dfT3uLzC3Kw23bbHw6rmuPL/iIjnTA
	 dtTdC0k3+BFg/8fJEKaKOWoOqtCnfd5/PIqVK9dLZE6Cl/q1OZZEqyI2XKrDNPx7LG
	 Mqa1PcvG/zwmnJaYzD1eSUPUeJuHCoPOG3tQvOjKrzjVB5Ljuv7jrYf2dhKDVSy8sn
	 mU6A2fH9jEkKg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260112211554.3755188-1-vz@mleia.com>
References: <20260112211554.3755188-1-vz@mleia.com>
Subject: Re: [PATCH] ARM: s3c: remove a leftover hwmon-s3c.h header file
Message-Id: <176838825137.154403.3766025208225807155.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 11:57:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_025733_376023_88053619 
X-CRM114-Status: UNSURE (   7.13  )
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


On Mon, 12 Jan 2026 23:15:54 +0200, Vladimir Zapolskiy wrote:
> The last user of defined structures s3c_hwmon_pdata and s3c_hwmon_chcfg
> was removed in commit 0d297df03890 ("ARM: s3c: simplify platform code"),
> thus the platform data header file itself can be removed also.
> 
> 

Applied, thanks!

[1/1] ARM: s3c: remove a leftover hwmon-s3c.h header file
      https://git.kernel.org/krzk/linux/c/900131320bc9a9ec1d84702b2694b813c11c91b7

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


