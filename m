Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86B4C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpShxvzMAomyKuqDbWZLQNfx9r/OvhIXet3IXrxtWVw=; b=UiGac+o7dzJ9Q6JIVvo2vGZosY
	e8AJMe4PJLBo8Gg3ZVKxJfm8QbHqmOPLgYat6zqzH1qGYxb1FWj+6hO4OYKcaUtI0ioiNxRcX8rR3
	c9axdeCZD2PefDaCT1VAcmuZq/ZtkSWZnRyuCWqjlcSC7GSP9g9aZQbmYCarS47+9qjyEqQSwKB6J
	M/rdh1LV+LZFnQYpFkAI+4KO3XoRdK6ypMsNKSeGhXTJAnMLTk0F7L3W91NXj0IyT704SxPIsa26e
	isXS+0XihSVQPWKrfbNzwdZXoZvqRxyO5xLBEYFZ8AClbdPhf02iJ0YR9SjgxRqw3QV6bv6g8wE2H
	WNScrYNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24LS-0000000H2HF-3Kbj;
	Thu, 03 Sep 2026 10:06:58 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24LP-0000000H2GD-2roI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 10:06:57 +0000
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 03 Sep 2026 19:06:52 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id 65C3520914A3;
	Thu,  3 Sep 2026 19:06:52 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Thu, 3 Sep 2026 19:06:52 +0900
Received: from [10.212.247.149] (unknown [10.212.247.149])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 6510A10A004;
	Thu,  3 Sep 2026 19:06:51 +0900 (JST)
Message-ID: <a08151f3-3f3c-45ec-b21e-4bfab0eacee5@socionext.com>
Date: Thu, 3 Sep 2026 19:06:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Support AM62P silicon revision detection via
 uniphier-efuse
To: Judith Mendez <jm@ti.com>, Srinivas Kandagatla <srini@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260902222759.736124-1-jm@ti.com>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20260902222759.736124-1-jm@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_030655_848216_885EE7C3 
X-CRM114-Status: GOOD (  18.93  )
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

Hi Judith,

On 2026/09/03 7:27, Judith Mendez wrote:
> This series adds support for reading AM62P silicon revision from the
> efuse GP_SW register. The solution reuses the  existing uniphier-efuse
> driver by adding ti,am62p-efuse as a compatible string. The three patches
> update the devicetree binding to document the new compatible, configure
> the driver as mandatory builtin for K3 architectures, and extend the
> driver
> to support AM62P devices. The uniphier-efuse driver is simple enough to be
> reused for efuse register reads on the AM62P SoC.
> 
> Patches have been tested on AM62p SK hardware using SR1.0, SR1.1 and SR1.2
> silicon.
> 
> Changes since rfc:
> - rebase against next
> - update cover letter
> 
> Link to rfc:
> https://lore.kernel.org/all/20260812154442.3379851-1-jm@ti.com/
> 
> Judith Mendez (3):
>    dt-bindings: nvmem: uniphier-efuse: Add ti,am62p-efuse compatible
>    nvmem: uniphier-efuse: Enable for K3 SoCs
>    nvmem: uniphier-efuse: Add ti,am62p-efuse compatible
> 
>   .../devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml   | 4 +++-
>   drivers/nvmem/Kconfig                                         | 3 ++-
>   drivers/nvmem/uniphier-efuse.c                                | 1 +
>   3 files changed, 6 insertions(+), 2 deletions(-)
Looks good to me.

Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Thank you,

---
Best Regards
Kunihiko Hayashi

