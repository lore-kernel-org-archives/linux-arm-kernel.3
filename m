Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F126E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 07:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzjqwe7YAw9+sc6uCiawhBP9unb9wJPu48Etu3C6q+g=; b=P+VOXCc14BqE7slQiKiO9IhjEp
	BE4rg+8k9wFWDcQvUaYS4FcdhSKyieOdACrYW58NE0fxNtg3LAgBIq8/BgPI4PSnDbxoQYaSjpsHb
	KKIxKVy/yVqIAL8kC7oAw61C3pBXGv62UTEcEcWOqoTmzj2EQ+461Z1oPfTSZyH3+sKZK1tO7bks4
	wBlV3TWFHFctA1YhHI3AbgNfZ/WD8syKpmpMSvRejTRAaaBjPn0mXBrmvVHy0CwYs1DM8uRYwcWfX
	EVprjFUwS76+bmZlYwsPJINUAD7vU0oUekWGumH39GUlwc7cYQuufC0TlMmpPL5EguhdG2ILcBhs1
	+wDrmZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR51v-0000000HIF1-05tu;
	Fri, 27 Dec 2024 07:45:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR4zS-0000000HHjL-1Fvi;
	Fri, 27 Dec 2024 07:42:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C5D6DA411F6;
	Fri, 27 Dec 2024 07:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBE4C4CED0;
	Fri, 27 Dec 2024 07:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735285353;
	bh=yzjqwe7YAw9+sc6uCiawhBP9unb9wJPu48Etu3C6q+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0vkNPsdVfn+oGfKYtgbAakEJtXAg71dK9JD9RFMTPRd9mtd+M45eoIsidksyee9O
	 K/Qc+BAawh/nrrRwdrkxN+UmVe2F11jKY3unrfQzQQBsuyZnU4qiBdUzsxRaBZXd1Z
	 ShFO5A25PC9/PpKki0zUQOLQKIAuIEnxMTiOZPbEXldQN/qHnV7egzlVVxk0XA9X5z
	 9yQLFUsxDuJc8X7pdQnK7YUbyGYvG1hFOL4XFW5G9jqFjHoW9bWNdy5quO3bWXkNii
	 /D4dO1Y66l3MthZBlouE8B0UlFcBjD/eEK6Y9kZi1bzyVEhiSOKa9WXdxmmYEClk1k
	 tNd9l775NIQkQ==
Date: Fri, 27 Dec 2024 08:42:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 11/17] dt-bindings: pwm: rockchip: Add
 rockchip,rk3562-pwm
Message-ID: <c3r3ezqr6sg7vtvomngjchzlk6btyzrjtukezjvuqxesqbtrh5@cmlu3bw7dyzl>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
 <20241224094920.3821861-12-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224094920.3821861-12-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_234234_404395_9924707E 
X-CRM114-Status: UNSURE (   6.46  )
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

On Tue, Dec 24, 2024 at 05:49:14PM +0800, Kever Yang wrote:
> Add rockchip,rk3562-pwm compatible string.

This we see from the diff. Say something not obvious. Where is the
driver change? Why devices are or are not compatible?

Best regards,
Krzysztof


