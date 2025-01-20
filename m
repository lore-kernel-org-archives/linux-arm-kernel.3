Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7637EC02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 12:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8JrxicJWV4VsyUGa8L3zIdfH0ReN8VLbFnTYg856C8=; b=hLT8DH23vhd+hjxuJsMtG/ZO5y
	irHOW7XS6JeroI0BC4WJ6ja2Fr/w/wvMOA4r9UIZI0v5C247XuhqRzo7pFxv7JOl1aHmqWVFgTwK2
	ADv666jzSAEIMl/ASayD5N59qXc5vyJ3Lm+tKkB4Pbn6ZkmOrPRaOoGdeEYS9fOabWjhgx54Mzm0r
	VtikW9mEI1ZpRXe9Mt76CQ53V4DTxWZ4Zb/csNfujyIU36CycWwGzZUJBxoKhotslOe0OQUPyfTeQ
	avyy6qLW/vp0aQeAqFicRqJdkpz41Fnzz56rUXr5ICdnL/ITkm+12GrBv+blgqgc8vr+Bny8VkHph
	4lvBTbkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZqeY-00000005WXS-2L5w;
	Mon, 20 Jan 2025 12:13:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZqdH-00000005WO3-3uIb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 12:11:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C60B75C54A8;
	Mon, 20 Jan 2025 12:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E7AC4CEDD;
	Mon, 20 Jan 2025 12:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737375114;
	bh=2d5KQE0gBmmuHj8ZO3Kd2vSJ/xLvCvZoaI8AOHlA3Ws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jgL0gfc9N9yniX9QiOKt3qqokRUTwKrqnaBFn36y43l2uLe/+WknsBZiFpXESFKx6
	 RLbz0jxgkm1ZEvzbRkdXg0E95FylA4niYVF51ggQAmxNOSPmqA6iUbHIA/VucrRd/O
	 MUlNIady22xqK7gInl7lWhxIRaYMKRrcK1spXKb2EsY9b1Uq8fza2Gyvv4/DD6bf9Y
	 97zjNrsrPZthRD8eMe3jpfZmAUPomlc06rTIcu16FQ4H+4Ii5CFWRNs3Lu9akuyDVT
	 xqErv6/nSFc9oFRT4tTJ7K7IZTJ/J60p4exFlp8hOdFnAlxBJ/FL4WRZDHYbiJKZav
	 gYioot4NmuY+w==
Message-ID: <1f7a3d91-3b5b-4706-8857-7bb71beecb3a@kernel.org>
Date: Mon, 20 Jan 2025 14:11:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s-evm: Fix USB2.0_MUX_SEL to
 select Type-C
To: Hrushikesh Salunke <h-salunke@ti.com>, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 r-gunasekaran@ti.com, s-vadapalli@ti.com
Cc: srk@ti.com, danishanwar@ti.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250116125726.2549489-1-h-salunke@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250116125726.2549489-1-h-salunke@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_041156_021396_B58D532B 
X-CRM114-Status: GOOD (  11.74  )
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



On 16/01/2025 14:57, Hrushikesh Salunke wrote:
> J722S SOC has two usb controllers USB0 and USB1. USB0 is brought out on
> the EVM as a stacked USB connector which has one Type-A and one Type-C
> port. These Type-A and Type-C ports are connected to MUX so only
> one of them can be enabled at a time.
> 
> Commit under Fixes, tries to enable the USB0 instance of USB to
> interface with the Type-C port via the USB hub, by configuring the
> USB2.0_MUX_SEL to GPIO_ACTIVE_HIGH. But it is observed on J722S-EVM
> that Type-A port is enabled instead of Type-C port.
> 
> Fix this by setting USB2.0_MUX_SEL to GPIO_ACTIVE_LOW to enable Type-C
> port.
> 
> Fixes: 485705df5d5f ("arm64: dts: ti: k3-j722s: Enable PCIe and USB support on J722S-EVM")
> Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>

Reviewed-by: Roger Quadros <rogerq@kernel.org>


