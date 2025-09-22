Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19EECA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 15:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/cGdFxmGsz5n5JDLBI5mHR2ZThbO8N2bLNXFxLPYl8=; b=A9INWgy3AmA/6km66/9wG25TQA
	jlYd/JLisXjAfw/rCqxXNlIvZIb3jM4qg4Bl/uQ7zDk77lNSmiKaLbIMi75uYVtOuUHAhXWMp/i2X
	40NqfPltgHDhpgN9bxqaD5um/SWzx63AxNhUPuKQYL8y2OfhgjzisPQgHxmo2dQdpOn1AuA5geEnK
	9DrpEqOV+X1fkzSCLO73MvRbKzLngBfGwyoWRxNUAbIR9OiroAFgzVo+xbhoNOusqditL0AFPEWrL
	kfQmc4fOy4oc7aE9E7wg6v5VLZ6BZVr+lhuWylGG/eZAN+DaaxCx/RCN62G/GnP9XEdYQ6OoL1EiO
	jbQk8yjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iZ6-0000000ApQi-0pkd;
	Mon, 22 Sep 2025 15:34:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0iZ3-0000000ApPc-3Cj2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 15:34:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DACF40209;
	Mon, 22 Sep 2025 15:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5791C4CEF0;
	Mon, 22 Sep 2025 15:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555293;
	bh=9HGSjB3r5dniqSgwxmcE42ehkPwt/ZrU3TU596OdGSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qm0blVSlaSiqGsTnpobe23kzg1bJY5b87rq0IKksHw8ZqimpMUQGNklkkjo+A0tRi
	 wU/2BmWZriav9VtPXul9T2P+hQCkXQQb1F+aTTyu9/rdJWTSwRzHaO332ToqKjJf/k
	 WjXhkDnoqRLZWWAQGJfmMoCAeU/xVm7dzS8nFn3j76okS8kzQt6P1a0nxYeUS3fB5G
	 QyQedonYX9kaw+MO+3YjuzT4vTF0T7JBGz2nuehg9l4tAi9ykHVmxjUmvThjR/WvDY
	 0Dd+J9mf9PflW2yAUM1j3yKAijypHRelJOcHoh+xQwmLcH8MlM4o8gpM1gt9G5JAp3
	 SCwdzu6BP5Q+Q==
Date: Mon, 22 Sep 2025 10:34:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: serial: samsung: add
 samsung,exynos8890-uart compatible
Message-ID: <175855529033.4177731.4812595067760499826.robh@kernel.org>
References: <20250914132201.2622955-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914132201.2622955-1-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_083453_819328_4FA54E47 
X-CRM114-Status: GOOD (  11.33  )
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


On Sun, 14 Sep 2025 16:22:01 +0300, Ivaylo Ivanov wrote:
> Add dedicated samsung,exynos8890-uart compatible to the dt-schema for
> representing uart of the exynos8890.
> 
> Like exynos8895, it has a required DT property samsung,uart-fifosize,
> so reuse support for it.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


