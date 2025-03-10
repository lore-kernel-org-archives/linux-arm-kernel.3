Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4645BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 08:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1RPvwC+SFy2YIdkjWwuNaPaUWekWLQniVxE5EnDG1B8=; b=WGadBQ+UDEm7bEPOEbTctXAlYy
	BZ09WmzcK3STEitOv+XnKGE8XdXfEM3t7ZmKX9iVKi+vxK8NKSDURsV/vIzPme+/ZqH1lEfKr+l3b
	zdW75YI8lgypXMwTnvzirSGXNr5kDNB6yavTti10Q4CsKeYkunFke0sUff5E9yKO5qz/tcL8k66kN
	KalwyDjgw9rn5vP5bSHjMg7Rc7Hvt3IUnWspH2QCpOJQjTbZxa6ZYZPPHbIg4mnVDePd3xSJlFe6r
	jutuyobPrpF1aD0GNxwoG3UujuR4MxF+66pDz7yOOPqadXNu1CcGpejaOUs2plfApAKsaQ/1bQPsf
	RcLtuZxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trYgC-00000001wjc-2aeW;
	Mon, 10 Mar 2025 08:40:08 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trYeY-00000001wUE-0wDY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 08:38:28 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 39688A0397;
	Mon, 10 Mar 2025 09:38:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=1RPvwC+SFy2YIdkjWwuN
	aPaUWekWLQniVxE5EnDG1B8=; b=UhrfUTVC37v4qZRwCV/aThUVI46V6B18Qc05
	HuvcPrcXOvM5V/kF/pSa8HquCMmbLJXOqvXQgCDEv5HxpejqO7RlzrgKwT4SAh0i
	A9LbLotIB8uhz2hh9p8KUL67lePVISnoQjdU5usVzMuROcw2mdLrUj5OzUwGQmGc
	GfPY8zU7uWFUmG+3QenSdOUDQogd36Q/pVmvMj1IxKj4fdNbyFsJuKmYilrZfo1X
	p8PFgc8GM6K4jPA6l8i6mFvQrCqyElufwhj6zmBIW5+zPt6rwIFnQQCkTy0kwdQx
	AxPwylG0A8/1MBtwlIzblNxX4HKd58lH04iGLS3bEU1f//amdmAIV8+2atP0zZBb
	Ooh3hHwz+0g/wFBI2f2fJGKeEqkx3RMdFjHlBKmU604my3jT6bQ4rGHWsyo2t76A
	YQxPG8Ghy1o2YRu6gSTcEZuUtUUj7WD/LGhWTG/MWCuPnPeLJqCH6RG3jZd0iGZ9
	TxjKf7Io/crgBcwyUT5pCNV5aPR8zU1vTgnOl64VV8ApF2CL6WF7vc4C7OBsJdQf
	SLJAN8pJIE6jHnaEfqIVFPINs0g3CHkBhjhVGWtQGVICgHbkoUdy7YpYodv9JLr8
	SAUvm1N1FPWxBYcdZA4NCUP1CxAkwcS9Q/0GliG63eZVgpXrtRDwRlehuSeYWbc1
	qzO47dk=
Message-ID: <790f00da-d66e-42bc-bae2-339144fbec95@prolan.hu>
Date: Mon, 10 Mar 2025 09:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] counter: microchip-tcb-capture: Add support for RC
 Compare
To: William Breathitt Gray <wbg@kernel.org>, Kamel Bouhara
	<kamel.bouhara@bootlin.com>
CC: <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20250306-introduce-compare-component-v1-0-93993b3dca9c@kernel.org>
 <20250306-introduce-compare-component-v1-2-93993b3dca9c@kernel.org>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250306-introduce-compare-component-v1-2-93993b3dca9c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852627664
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_013826_725407_0FC9A83C 
X-CRM114-Status: UNSURE (   7.40  )
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

Hi,

On 2025. 03. 06. 8:05, William Breathitt Gray wrote:
> In Capture mode, the RC register serves as a compare register for the
> Timer Counter Channel. When a the Counter Value reaches the RC value, a
> RC Compare event occurs (COUNTER_EVENT_THRESHOLD). This patch exposes
> the RC register to userspace as the 'compare' Count extension, thus
> allowing users to configure the threshold condition for these events.
> 
> Signed-off-by: William Breathitt Gray <wbg@kernel.org>

I'm assuming you'll merge it with my capture extensions patch. Will this 
`compare` extension be carried over to 104-quad-8 as well? Otherwise:

Acked-by: Bence Csókás <csokas.bence@prolan.hu>

Bence


