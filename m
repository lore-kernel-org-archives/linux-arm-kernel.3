Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062A1C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 19:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0a6Xxe0k89v50nERPhn1WwcLMzGJwCPuqi/f9yVUFkk=; b=2r6JZCLe7q3gdADFp7+cBKg/uR
	nLiAGPWGjDGHuGnrj7Y9JM3nnM94JDGJcCF7fjgZ2s7Oim3FmFGM8LKSfdHAFquzvG/MRudquc7IL
	pLbGVccf1CFanK8Wzvh2itOQBRp8XXSHeqktWW37di7SAjPwUWUVQcwsggeD5yd7oLzYLOUPfSKg4
	Qh5wTl8zYcB4/vsqTyiOwD4IJx/DbadTswXCtUqiGDr46lnGsXxgYUP+6hxzoUlRd4ERw9rW3qqDy
	4UixJs7QSGEzi7UXFIioyJrAobfk4anjuv34zJz4fRiadKMfckqy5mF4psHy4B5BKTiJSAWk0EllN
	3qatqAng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOfv-00000001NFS-1cYH;
	Tue, 04 Feb 2025 19:33:35 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOcY-00000001MgA-1Czn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 19:30:07 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DB34625B35;
	Tue,  4 Feb 2025 20:30:00 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sI-zIj3P_Tsb; Tue,  4 Feb 2025 20:29:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738697399; bh=hxElP6ZMp8TmfVNOG45r9dWrj5+/1qB6QlQBTJTNWfU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HphrJAQj4f+5MpePcznZQt9+nPvLQp/jJrxZlgaE+vWtgagKBmJ++NGCWO3C8jTcx
	 84mxKI0yCgq9o/EOybq1ZhM865i7LUE0BGY36QwCgHFZarxOLxpJTmmLeLYC+BZyRo
	 LHg7GjVahaP6wKMt9NeaXRGQ14P5f5zZ1Sw+ltVn3KssBDM8RZeD6n5CD6UlUvGA7Z
	 pJnIuhANa1G+TrG4Am1dACp4iRUtpAnOTMPm1yoLFUdkkze4TkpbjahyUSt615LVKV
	 DrnP821pFvCLCGmugmmjIjPz7l4qWCW/juXKFP/VEkJ3xP6tiLCrZrmDrVrfOD7b0h
	 BIRdx3taTP9nw==
MIME-Version: 1.0
Date: Tue, 04 Feb 2025 19:29:59 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sergey Lisov <sleirsgoevy@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Kaustabh
 Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH 0/2] Add chip ID for Exynos7870 SoC
In-Reply-To: <339ea40f-6bc7-42ad-a5c2-f57b3be8cc39@kernel.org>
References: <20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org>
 <339ea40f-6bc7-42ad-a5c2-f57b3be8cc39@kernel.org>
Message-ID: <e9d9388d0adacd5599c6c6f5b7f33f87@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_113006_463334_3DBEEA1E 
X-CRM114-Status: GOOD (  15.00  )
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

On 2025-02-04 07:53, Krzysztof Kozlowski wrote:
> On 03/02/2025 21:32, Kaustabh Chakraborty wrote:
>> This patch series is a part of Exynos7870 upstreaming.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>> Kaustabh Chakraborty (2):
>>       dt-bindings: hwinfo: samsung,exynos-chipid: add exynos7870-chipid compatible
>>       soc: samsung: exynos-chipid: add support for exynos7870
>> 
>>  Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
>>  drivers/soc/samsung/exynos-chipid.c                                 | 1 +
>>  2 files changed, 2 insertions(+)
> 
> When I asked to split, I said per subsystem. Soc is one subsystem.
> Everything targeting SoC should be in one patchset. get_maintainers.pl
> tells the name of the subsystem and its maintainers.
> 
> If there is going to be resend/new version, combine patchsets for soc
> into one patchset (just like the example I gave last time).

Alright, so I'll move these patches to the one which has the devicetrees.

There's also a Documentation/devicetree/bindings/soc/ patch in
exynos7870-pmu-clocks [1]. The CLKOUT driver uses the compatible declared
in there, i.e., the CLKOUT driver depends on that commit. So, should it
stay there? Or...?

[1] https://lore.kernel.org/r/20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org

> 
> Best regards,
> Krzysztof

