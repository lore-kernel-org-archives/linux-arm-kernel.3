Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1250C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 08:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtUdoB0MGnFfiTWiEW20r7reAdx0wvHGfo9o/sE45mQ=; b=Ye4SWalrai60Cn00twfwFA+4Ly
	sd4Ds4kvLq39IVTFDLYYKvqOukrYN7vjdPBDydKKyHIpyNKvBJiwZGo1bn60ROiazELKGELkdWXbK
	ASXrfvBvpRKX1XY6zmKJ9vzooEMRJ+VT3oX8PbK4NtHXPPleHU8kfF19Cx0DtGE/NCJDOMZgvj1Qy
	UcJFkRZhG3fwg1YNZHHVgDvsyQl1WxAN2XQTe2Wj/trXYzj65KYT0897RW92fr5zUFI/Lhm9CGfBF
	bRvKrYoMBimgVZfa8PVKDvD2epJuV1wuY45fFvh70ZNf3iZrBtFx6AMfgO6fttW0WEIDh48em8vr7
	bLd5Gpsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOik-00000004mBm-1xpU;
	Fri, 21 Feb 2025 08:49:18 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOg7-00000004li0-0AKn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 08:46:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E80B61147;
	Fri, 21 Feb 2025 08:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F3DAC4CED6;
	Fri, 21 Feb 2025 08:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740127594;
	bh=/7ch4XQAX4vODZjmYMOM7L1Ju/T7AgMW7U8g3mm6OiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hK0yXHMmfZT9Ot35prS7Izdgu40ivvH/I+Z8zPAoiM//uhBxnlTtnCmHPKZjC1O8j
	 Eq+poiJXdQzCH3iv8H3DGcIxTKdn3h+mzGUgWY3PnwBtR2RvYFspZ8h+6c9a6vs3g9
	 hH0Xeg2ZCC1HrXAo/tM+dlG5RNAWsRcJLAzpf6af/b3y9gtvYv0IHlSqiFWazcQHtg
	 MBKb3udv4h0MMKL7Rd2HLs03TKpOOBzTfOWgST4yHFf0UAWiuzDauJWO/6l+w0NjpD
	 qyyMHZQsufHVJdDCb0I4lZEnoL7E0+CFvjH4A+JYj8nJuDB8Vw9pUZNqyxvdw62tB0
	 +v6VM+TbSj93g==
Date: Fri, 21 Feb 2025 09:46:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wilson Ding <dingwei@marvell.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andrew@lunn.ch, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, salee@marvell.com, gakula@marvell.com
Subject: Re: [PATCH v2 2/4] dt-bindings: cp110: Document the reset controller
Message-ID: <20250221-huge-able-ostrich-5c70cd@krzk-bin>
References: <20250220232527.882888-1-dingwei@marvell.com>
 <20250220232527.882888-3-dingwei@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250220232527.882888-3-dingwei@marvell.com>
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

On Thu, Feb 20, 2025 at 03:25:25PM -0800, Wilson Ding wrote:
> Add reset-controller sub-node into the system controller node, and
> document the supported reset lines.
> 
> Signed-off-by: Wilson Ding <dingwei@marvell.com>
> ---
>  .../arm/marvell/cp110-system-controller.txt   | 43 +++++++++++++++++++

NAK.

You already got feedback that TXT bindings are not accepted.

Best regards,
Krzysztof


