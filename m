Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044B5C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 20:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuIYaACFfYHQrqG9qgcFjCKehJqKFbN314wuAG+MnDA=; b=nu/zGvHKb1I7o68AjoYLptnWYz
	iWMfotyJaVtgBo0QYWkZNdp58yqzrrV8Km0+RM4sM2XivVJ0e2sAx8MOxRuiQX0GYNZcKxXs4CeFs
	Q+eNj9C7y9e80IPJvX2oQIxQXlOyruE9TgUr1Anj08RjVKgSEsMLvX1ag1wgoZp5AA92oc2vulazm
	tAX+Uu1EtdvdcEIocyQhH1NSAoPi4ESKahdei4GJIaOz4AVPYoNGKm2favJaXhDw2oYJ+wI8yN8oY
	H5KptdGd5osghde5diEk0rqTOjjVSy406xpXeyuwEtCuimh6VXafCPxnOiBD2YOPWmWxdPnyOXbHI
	dC0nE8oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kXu-00000003KkG-3qNQ;
	Mon, 21 Sep 2026 20:23:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kXt-00000003Kk1-3S2v;
	Mon, 21 Sep 2026 20:23:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D7AC960142;
	Mon, 21 Sep 2026 20:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A411F000FF;
	Mon, 21 Sep 2026 20:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790022204;
	bh=EuIYaACFfYHQrqG9qgcFjCKehJqKFbN314wuAG+MnDA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mkSvno16N/KbJGqH9JJZG3oUqniaYsWHOFiSd9ghPUELNVKurBiKi3yJDjkAbLoRD
	 xGKOhi//72HswvsfOg1UO9UzNxVoOgyxDGA09uczWblOpvKqhNwVzKtE4Nmg7q8Alq
	 oJJdF3xhwK2GNG/oiFS+mklEUQB4Nl9i5O362wvz7KzhGYn4cGHMJqhOvsAUxpmejw
	 dF2Pl8nHmPWHq0/TTbk0nJYkY3n5GTnap8fnt9gJoyy/8oIWJW5OMFDhmOMgDcUm9d
	 8muczurGCO4jezT8YoOO6RqoACBvBu+HF+ws0+K52hrf/oCE/kEx9EPpGJno1pMcOB
	 4xz92dZYnAW4Q==
Date: Mon, 21 Sep 2026 13:23:23 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, Sergey Ryazanov
 <ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>, Shi-Wei
 Yeh <shi-wei.yeh@mediatek.com>, "Minano Tseng" <Minano.tseng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "Simon Horman"
 <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, "Yu. Robert (GSM)" <robert_yu@compal.com>,
 "Chang. Jeff (GSM)" <Jeff_Chang@compal.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [External Mail] Re: [PATCH v8 1/6] net: wwan: t9xx: Add PCIe
 core
Message-ID: <20260921132323.7e6f76d3@kernel.org>
In-Reply-To: <690e3d6d04ba47efba2b4cda7b18e42e@compal.com>
References: <20260914-t9xx_driver_v1-v8-0-5206c2e6bea0@compal.com>
	<20260914-t9xx_driver_v1-v8-1-5206c2e6bea0@compal.com>
	<20260919165434.08d026a8@kernel.org>
	<690e3d6d04ba47efba2b4cda7b18e42e@compal.com>
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

On Mon, 21 Sep 2026 07:06:23 +0000 Wu. JackBB (GSM) wrote:
> Two questions on the prompts document.
> 
> Are the following hard requirements the series has to meet, or targets
> for the tool?

Targets for the LLM but also these are describing a high quality
submission in general.

>  - line 44: "Ideal patches are between 200 and 700 LoC (added +
>    removed, not counting context)."
>  - line 46: "Avoid series larger than 2.5k LoC. The first series is
>    usually larger, but must not exceed 4k LoC."
>  - lines 57-58: "Series 1 should aim to add the simplest possible
>    version of the driver which nonetheless can send and receive a
>    trivial (no offloads) packet."
>  - line 117: "Avoid the use of managed APIs (``devm_``, ``pcim_``)."
> 
> On the packet one: this series carries no netdev because an earlier
> review found the driver too large to submit at once, so the network
> functionality was split into follow-up series.

That's fine.

> The document also asks for no defensive checks (lines 119-120) and few
> code comments (line 124).  That runs against the direction of the AI review
> we have been getting, where both have been growing.  Is the current
> direction still fine?

The kernel coding guide has not changed, defensive checks are still
discouraged. If AI is suggesting checks that can't trigger just comment
on the review or add a comment / WARN to the code to mark the condition
as impossible.

