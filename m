Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D59D3398B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/Km0duaUxN9zrPZeOy2RJQXZwW6MUMmomrvB9hLoAo=; b=lx1JUzjCwwtZZHjN7gFVbzpkGF
	ppMspRb76GNBRWFUN7Pj0BfRS62MwOSE6i4+JirmR2351pdWWTUAugmmkQUBlMLmbGzsFABV0Ugli
	tSyaj6IrTtsfe+nhWMCbsHrz5NJULm0OZyzKTktzxXeLonB0isvGFkuXYGv1vVIzyFgp9cwLCDs0l
	cHX+CDiezVrR7OHUt0d2ZDMuVrPgtbSxPRoNoV0G5oxsuWdjoG5j5WxSRXFdjn1uESPUxOfaE08Of
	pQpFeypEPuI+GiAru0whnhiebugiGpvY5h6SxB1MGLkT1NFHJvLptRiQ7Bq/FZHVv29uzpDxnNcWX
	hN6f3AKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QWf-0000000B4nE-0ZBt;
	Mon, 28 Oct 2024 14:15:21 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5PY1-0000000AtWZ-0E36
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 13:12:43 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 998F7A09F1;
	Mon, 28 Oct 2024 14:12:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=a/Km0duaUxN9zrPZeOy2
	RJQXZwW6MUMmomrvB9hLoAo=; b=UQseZHBFhaIAsUXZ58dfmX3kXyOr9KsCgXPS
	SvuPoNSgAFOOUl0/qNd3141M6WDsLsFoSJC9JjZn4ivvS5+kBpqngIkhOaMwCNQA
	KF9fqHW8dSodcN9PKeBElOXmZ/Cc9XR6fMS5zYOp5eHGprkGKm4+JYL3TKRv1lrV
	IwDjMqW9TiEPX0ROUTWXUUgXhaBee6TuaOxGoh/QkJaHcxRuuWJvRPFEhCrghNU3
	Wmluxl01SWWNsb4JT/xp7OFcnmbzEhMchUJRKB4xfmoKwe86k6Zr4UvuR9fQE52x
	o9dUohQCkaQCuvxubzo5yxWjXUvMzYgs0h8fdtf2wbXcpj2KuaXiHt9chN4011Kg
	NyV1Rb9pbRzbTl3NPDdb3A422KwNadY7u65YL7tPNavAz6HP0cvMXeoi6OE9Tufs
	TJbMGsiTimrxoP2HPth+1UadXhZcoCG3nBiDXgBzuhnM0c8l+5azFD68+TMHYDUo
	vCKaiXeak4hGeMKvtkia51+se47Rj1vf6CmQSb/RSwyL/A4vVMK7IPCMDa/rXCfe
	z3uleYY5GPW2+FT9T3fw/Akugxsk0c6hfBFdpIxDBkoLy8ej+oP+cQVpJRvZaE30
	L72tb6TkN9X+9ZNPRyl9r+AilBTLusns99Yctynj3xNHUPEaSjZ5SMoNVVdF4C7P
	JdnmnSo=
Message-ID: <1811aa2a-3d19-4ce4-83c5-863aa0f4daab@prolan.hu>
Date: Mon, 28 Oct 2024 14:12:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] dma-engine: sun4i: Add has_reset option to quirk
To: <wens@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, "Vinod
 Koul" <vkoul@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20241027091440.1913863-1-csokas.bence@prolan.hu>
 <20241027091440.1913863-2-csokas.bence@prolan.hu>
 <nlhsxigg3rbfvua76ekmub4p6df2asps2ihueouuk6zkbn56zl@xdj6jzzt4gfb>
 <b74dafed-197a-4644-a546-54c7a1639484@prolan.hu>
 <CAGb2v65ZXftjrG9+f1_88=EsU7rM8vnOPZCszWfWYFQ+Do9Xsg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <CAGb2v65ZXftjrG9+f1_88=EsU7rM8vnOPZCszWfWYFQ+Do9Xsg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855677C6B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_061241_595263_2FC80B63 
X-CRM114-Status: GOOD (  10.76  )
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



On 2024. 10. 28. 8:44, Chen-Yu Tsai wrote:
> I suggest adding a patch to switch the clk API calls to devm_clk_get_enabled()
> which handles all the cleanup. Similarly you can switch to
> 
>      devm_reset_control_get_exclusive_deasserted()
> 
> for this patch.
> 
> 
> ChenYu

Huh, that's a new API! Thanks, I'll switch to that then.

Regarding the change to devm_clk_get_enabled(), I think that should be a 
separate patch from this series, where all the pre-existing dev_err()'s 
get changed as well. If someone wants to work on that, go ahead, but if 
no one does then after this series is merged I might get around to that too.

Bence


