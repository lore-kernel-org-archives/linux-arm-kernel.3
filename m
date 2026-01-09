Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A988D26D70
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/RbSJSKXBhaXJeMQUoZiZUf/Lpx97n5lCjhw1lv7B8=; b=n48ndRx40smjFJtoAHIU45ZlnP
	T+R41PAtm9LqIlh49j0dfrbtOIZ+wPzayc2fd3H6KF1e9fP0UxWLlzArkZLcBSzjG9qkxQZ+AnS0G
	uvSGyq1x77WH9SfT1OwmQ35Yh1B0MBVQQ7P5dgFPOP/fEYNh5Yqc2ukDSST5z4zaEbKpi39ZGkzx7
	gf+4GndJdfBrNzIKivAbhrz8bTorCWapxxootncCc7daFiOi49TjT7ZZZIftQh5ErsSyKy4MUqnee
	MXLWmUUaVJkI0nLinTYMHC2xkt/Dh0eqJfVWJY7EOKbkR4PNqhokdrmSPTHxnmgaMm+y+jle979Rv
	VgCecXPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFO8-00000002cxT-3Rp5;
	Fri, 09 Jan 2026 16:31:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFO6-00000002cwd-0hb1;
	Fri, 09 Jan 2026 16:30:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0265840B92;
	Fri,  9 Jan 2026 16:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41805C4CEF1;
	Fri,  9 Jan 2026 16:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767976256;
	bh=2nnt/RAhlgbAIoBNQy+A3kflDIjfGtjH4Wnd7s6M8kw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UyAC+vU+9kTM3F3DIAqpZNoxKIwucU61mm4w4acu6wPdZG7r3KXTf8HeOpkdj4eT8
	 avvUauUPHyg68/2LA3Xl+TzZxH25duQUw1H63Je8lBAUqmDmHqpzt0tqgqDNWCMC1H
	 ds/RhaB9n3WWX56kWMvXJvqBobLFe6qmJajCyT4+OjsWEavKJa8pzRfPGafbkJEkzY
	 fm4n26h+V5sPrnpKu5jiPEjYxxBUg6xyzmFkf4W+Vis6i/rUU6u7nU7lL2GOqYAEad
	 EBuYTTXUcrYHXFNoY4X25KQSF0bFI2xj3nmJryqjMkhB0Ten4BA+rKKakvWQa1+ouk
	 gPv38Zj3aMlRA==
Message-ID: <3905bda3-169f-45d8-bdec-c199f226d45f@kernel.org>
Date: Fri, 9 Jan 2026 18:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] interconnect: mediatek: Add support for MediaTek
 MT8196 EMI ICC
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Henry Chen <henryc.chen@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20251124-mt8196-dvfsrc-v2-0-d9c1334db9f3@collabora.com>
 <20251124-mt8196-dvfsrc-v2-11-d9c1334db9f3@collabora.com>
From: Georgi Djakov <djakov@kernel.org>
Content-Language: en-US
In-Reply-To: <20251124-mt8196-dvfsrc-v2-11-d9c1334db9f3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_083058_231584_9FA76245 
X-CRM114-Status: GOOD (  10.43  )
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

On 11/24/25 1:07 PM, Nicolas Frattaroli wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Add a new driver with data to register the External Memory
> Interface (EMI) Interconnect on the MediaTek MT8196 Chromebook
> SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The interconnect patches look good to me and there is no build dependency,
so i picked them. On a side note, we recently added support for dynamic
node ids in the framework, so maybe switch to that in the future.

Thanks!
Georgi

> ---
>   drivers/interconnect/mediatek/Kconfig  |   7 +
>   drivers/interconnect/mediatek/Makefile |   1 +
>   drivers/interconnect/mediatek/mt8196.c | 383 +++++++++++++++++++++++++++++++++
>   3 files changed, 391 insertions(+)
> 

