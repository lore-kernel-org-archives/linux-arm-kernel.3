Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D871D3ABEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 06:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPTzVBaqEy6TULFAz5dE1caK6KjuW23EPXH/+kI6e3w=; b=1IPY5/6h4Bo0rXYdPlWL9ehhsM
	NdMzrJEjK5KrMxXanOXV3w/lbuVboL+fw/KuyH++XggYP+/xZ9wl2li6QFf0EE5j++a4r3R1jcErw
	X+BF9ybTx0uocbesajSe7pQ43aV+QRbJzbWX36gDbLWQXIu5BKEoHExsFHuZ1ZZ8frZ5/96ZYcmxv
	Kt3Tv1j9yz16XPM7xWgkgc/LVtq/Gzqkfbbi9wP/uGT90VMVdSxjB4s0A5a4DB64IlrExc3HVUVMP
	k4VVDfoL+5eArHfTMluj7u/gQgSEQwbqm+m4tjiXT9cZF/IWcKdxrKHo7u1NC7FCNdmCiPF81C1+a
	8WDaQz0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUgG-0000000CgG4-3wIv;
	Mon, 08 Dec 2025 06:25:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUgF-0000000CgFb-09F7;
	Mon, 08 Dec 2025 06:25:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D80AB43E02;
	Mon,  8 Dec 2025 06:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D39EC4CEF1;
	Mon,  8 Dec 2025 06:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765175105;
	bh=hPTzVBaqEy6TULFAz5dE1caK6KjuW23EPXH/+kI6e3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=km20+9PIg/iViZ0NYE8uaRiyLaTbKSmgch3obiYfXVs+ozkiZJZ8arJC9IiSsgUYQ
	 neZTOdq7bafg4OT0DtMcMQBK7ztBDzbIa/0ByW/WS6A4BwJLxETD15VmYJIPjLPpjq
	 Qpvb2cOkraeDtYJEMJTSlzq1H5FTOKcLM5PCjLchseIJSbwcoYlJFVyLfnheKoKlDC
	 vnqDOyoYkXh1T2Tl0iRBoUw/Tfd04RgMNQ8UiH39UXVt3C4U65uagIDNjNalWUj2ou
	 Vwt7db1NHtAZ8mOieOY17dMqF7uqV0YpB8EkOX/iaEJRjv68xP1kRNv7Rm1U3vqHyV
	 RCsM+/6YfqevA==
Date: Mon, 8 Dec 2025 07:25:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Subject: Re: [PATCH v2 3/8] dt-bindings: pinctrl: Add rv1126b pinctrl support
Message-ID: <20251208-snobbish-curvy-mouse-67fafe@quoll>
References: <20251206050844.402958-1-ye.zhang@rock-chips.com>
 <20251206050844.402958-4-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251206050844.402958-4-ye.zhang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_222507_113057_708FB874 
X-CRM114-Status: UNSURE (   7.01  )
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

On Sat, Dec 06, 2025 at 01:08:39PM +0800, Ye Zhang wrote:
> Add the compatible string for the rv1126b SoC.

Why? What is the difference against existing one? Please write useful
commit msgs, not something obvious being copy of the diff and subject.

Best regards,
Krzysztof


