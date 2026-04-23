Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D09DF99344
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joLckX5CQ014yF9dP6cUd98WMCHR3mXxpMLtKfczJT8=; b=kYtgjlNq9IeW3acjA6oNS0u6US
	ULLbNkPzZX9JXfy9IwpkKJAOOGQiBzH36EBdjt3KYItbkd4Uwhwfv97ncoN3zjGO493H9k5skKgRY
	xxGEbtZHf+0QUIvktZfKKHgLGIzce1JIsp9LpDUOkjZNA8RpWajyJ2QbrD+IW/ZHenaunYdQhrv/6
	qdOXCgXLfa8GpsC03GLwFCBOvur916vIzW6cU1Z55QbTa2UEsRarx56q7w/lPcsyFZpt7qORMJT4Q
	0/FREa8VkxUGOe+Y1D9PEN9rv6Nq7Ydw8sY1qa7eIeKcgGBwZlMU8Ip0UsGy9dyhYDs7pvfooYj66
	XGkC/8Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqCP-0000000BKLK-2TWg;
	Thu, 23 Apr 2026 09:18:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqCO-0000000BKKp-3poa;
	Thu, 23 Apr 2026 09:18:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2354960121;
	Thu, 23 Apr 2026 09:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888BEC2BCAF;
	Thu, 23 Apr 2026 09:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776935895;
	bh=Y6/lNXH3C4HQbpKDWa0YwXaIA3OBZvjg8EbWb10xWK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ssixCe85SjUCd04FcVKLIRgHxFUg4eHYb4pMARdhoZfYbnMRQuleK8Fvtjd/MKcjw
	 gUWHQmaiiRzHaVlVs4thUppefIzR7Jqemuorh/hYb5Z9gSPhBdsjuacksfeqhuWXM4
	 NdL6bZ08gNHAyDzIpjUVJNDH+IoHDVVklrHz0onuM9X+IhNIUmnSwE+GsA2aSjJQmL
	 aR1m9Wy9OVL21O6+pZ6avYYn9Ncun71+y1ImlVKdnZGt8YEt619OHo/VQKfvUGCZNU
	 IYp0huftnALJiN3IqsfFz7pw9SktEItuZHkVwioeIN3pUKYNgO4IAvrtP39XoJO1VL
	 jSlZGm85rhHkA==
Date: Thu, 23 Apr 2026 11:18:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: phucduc.bui@gmail.com
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Joseph Chen <chenjh@rock-chips.com>, 
	Chris Zhong <zyw@rock-chips.com>, Zhang Qing <zhangqing@rock-chips.com>, 
	David Rau <David.Rau.opensource@dm.renesas.com>, Animesh Agarwal <animeshagarwal28@gmail.com>, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: rockchip: drop redundant
 wakeup-source definitions
Message-ID: <20260423-elegant-camel-of-might-a3afda@quoll>
References: <20260423042831.21114-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260423042831.21114-1-phucduc.bui@gmail.com>
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

On Thu, Apr 23, 2026 at 11:28:30AM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The 'wakeup-source' property already has its type defined in the core
> schema. The Rockchip MFD bindings redundantly specify 'type: boolean'

No, core schema has TWO types.

Defining it as type boolean is not redundant, because
of_property_read_bool() on non-bool is deprecated.

This must be explained somehow - are these device drivers expecting bool
or not?

Best regards,
Krzysztof


