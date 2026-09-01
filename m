Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A961C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 04:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUCzwf9CD+OnfzpzC5PUhAw0YaOd8FPDvJcoSm9l5bo=; b=GYCC77qQh43+dqtNN5QZXo5zp0
	KNlkdDbp6zMUA9X/Uqa7JWl81uyQ89fizGD2aLbn8sg7uidYKHuhrWCPPFJE6nu7TQcvRDFKDxTcp
	Gx4X9bRVB9TOvqIGm/NYQMbRGQ6YjX0kkIU5g99eXKSPruBLxF9Tz2DFgpZ7DNRMM44gZbL5AG6sj
	ZWeeEVOYydYFadL3JxPTuhWAFo69SFPybO5oY9Hm48wXQL6f0cwLj4TZSzfVEDfHk/JRWWV5/6zmD
	bpM/RZlyJY4OLeuWojQoaBSFNVSu8BQJGghIBtIsVuUdkLJo3CZqwYka9Zmsnpnq30G10LiP4O2oC
	TaphIxBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1FnU-0000000Axvh-1ers;
	Tue, 01 Sep 2026 04:08:32 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1FnR-0000000AxvB-35gU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 04:08:31 +0000
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 01 Sep 2026 13:08:26 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id 0D0CA2068E57;
	Tue,  1 Sep 2026 13:08:26 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Tue, 1 Sep 2026 13:08:26 +0900
Received: from [10.212.247.149] (unknown [10.212.247.149])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 7469E10A006;
	Tue,  1 Sep 2026 13:08:25 +0900 (JST)
Message-ID: <5b147a60-4d4d-4048-ab52-b5d956b68881@socionext.com>
Date: Tue, 1 Sep 2026 13:08:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Support AM62P silicon revision detection via
 uniphier-efuse
To: Judith Mendez <jm@ti.com>, Srinivas Kandagatla <srini@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260812154442.3379851-1-jm@ti.com>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20260812154442.3379851-1-jm@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_210829_887648_2BB042CD 
X-CRM114-Status: GOOD (  19.36  )
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

Sorry for late.

On 2026/08/13 0:44, Judith Mendez wrote:
> This series adds support for reading AM62P silicon revision from the
> efuse GP_SW register. The solution reuses the  existing uniphier-efuse
> driver by adding ti,am62p-efuse as a compatible string. The three patches
> update the devicetree binding to document the new compatible, configure
> the driver as mandatory builtin for K3 architectures, and extend the
> driver
> to support AM62P devices. The uniphier-efuse driver is simple enough to be
> reused for efuse register reads on the AM62P SoC.

Reusing the uniphier-efuse driver seems reasonable to me.

The driver is already fairly generic, and contains no arch-specific elements
that would justify introducing a dedicated driver at this point.

> Feedback is welcome on whether reusing the uniphier-efuse driver is the
> preferred solution or if a dedicated AM62P efuse driver would be more
> appropriate.
> 
> Patches have been tested on AM62p SK hardware using SR1.0, SR1.1 and SR1.2
> silicon.

Provided the functionality has been validated on the target hardware,
I would prefer to reuse the driver rather than write another similar driver.

Thank you,

---
Best Regards
Kunihiko Hayashi

