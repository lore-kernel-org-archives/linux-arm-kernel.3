Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0792CF5389
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 13:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ax9eRwWPZXLgm4yvofbAOjuWDmYM/Iqk+DvqnyNNQJI=; b=ABw+fAGdg8PlOLDA6ro3WhDUwb
	sGmHfYvuSTnkjtgpyOzlBDUvvi2dAPVvgXDyJ917ikBt5z9JbYAAW9ThkuuqKYpa3WNAnH0tmAh4R
	KTkm7uf0zSwDaV/+C6Pb5UmlZ68JQERTU0Y/62Vk3psJn2VWSJ5TDL5oe7FmtBYlFglEgTHRRSCfm
	ie93GJILjY7Mrd9lIMOIlIeLZNPY00NnY/lGMkBHa9RojERapD/4qFrTYSDAQgSKcyHiNaqBu4eJh
	mRh9bBzYwX13hBNIqgP7Qydj3zM7sacndRA3v8RO50GU9YFPxRFqW5CFjYtBzBxWLdFPifRG+AuS6
	zGT3pung==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bZo-0000000EZk2-3o2h;
	Wed, 23 Oct 2024 13:39:04 +0000
Received: from gofer.mess.org ([2a02:8011:d000:212::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bYH-0000000EZSN-1i0I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 13:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1729690635; bh=wL9KCqJ/ruF83veiEKHat5EaBIz1miOELOH//btIfic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HTXRV5JQgKGOf1v9LUtq+XEsgO9sRPakP/OsGDD8ujiWoK3vUyyQJu4HtnsKphmZN
	 r1YB3kgnhOfSawJfKoFj3bariYpERnl0DTVJeEcboZu6gBvFReynnSZOtsSs7N2bOQ
	 vhVKSMXHpEjo6bms12P99JIrFkAlrBDimm5DRzYf66u0QadFnBB2joEHUmJm7qd8hu
	 zyuwgx1EmJNj0x2vYBFhs1XdtdKJozqO83Zgz2EBc0ZxlhtfapMmzHBkuS+KGT02Vk
	 hDOYPC3F+PpJgwDT5Gfs6ORZfqiV1j9um+VFeiYlVj/9QH0rQcS5ve6EIJlhrBZLEn
	 JtWcCr/G1jqkw==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 6535E1000E1; Wed, 23 Oct 2024 14:37:15 +0100 (BST)
Date: Wed, 23 Oct 2024 14:37:15 +0100
From: Sean Young <sean@mess.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chi-Wen Weng <cwweng.linux@gmail.com>, ukleinek@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, ychuang3@nuvoton.com,
	schung@nuvoton.com, cwweng@nuvoton.com
Subject: Re: [PATCH v2 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
Message-ID: <Zxj8C46QeSt3sboN@gofer.mess.org>
References: <20241023111841.158049-1-cwweng.linux@gmail.com>
 <20241023111841.158049-3-cwweng.linux@gmail.com>
 <1087f21b-d56b-4ab0-bb56-96096c23f0d8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1087f21b-d56b-4ab0-bb56-96096c23f0d8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_063729_603599_7DDDBC52 
X-CRM114-Status: UNSURE (   9.34  )
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

On Wed, Oct 23, 2024 at 02:02:14PM +0200, Krzysztof Kozlowski wrote:
> On 23/10/2024 13:18, Chi-Wen Weng wrote:
> > This commit adds a generic PWM framework driver for Nuvoton MA35D1
> > PWM controller.
> > 
> > Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Sean Young <sean@mess.org>
> > Reviewed-by: "Uwe Kleine-Konig" <ukleinek@kernel.org>
> 
> NAK.
> 
> Stop adding fake tags.

I never sent a Reviewed-by either.

Please re-send without those tags.


Sean

