Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44793CAC589
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxwuPRjJ35ocSEMeL3QEHwuercBgbhv/Jvq8shw2L2E=; b=EnaZKzPko0YcPUool5Lwv1MTv/
	fVsQUOGDKReFn7HDc2TDASW/tU8kWuymCLaElDO04rYpvTGlxdxn+xHAbNKw2lqLqm6EK/aeLFjL0
	2MRpZSfvuvsjW7rwuFcRovib7FN+7JBh0wBtbaf1CK6uBqBGL6R7ySMKIKk7sFUdBMxZvWRrO1WU0
	5R7WSkXZfokZX701KPqt/YE7x0Mp+TxaNF3jyBz4/nUK3qO8FTHRB6ggO9gykOFIGnqvqmC4j+XJe
	mWk9uixNa9FCc0us2wvlCPUB5e4M9jT0LLID/XfjuwrJjyDQ+QUWc/b5pRDk2ciHgp8uIpfRdX/vj
	PDB3QLTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvu3k-00000005hDg-1FOV;
	Tue, 09 Sep 2025 08:50:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvscF-000000056pa-0IVL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:18:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7F7140A4E;
	Tue,  9 Sep 2025 07:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB84C4CEF4;
	Tue,  9 Sep 2025 07:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757402290;
	bh=eoG0JvxQp/KV0F0KtC0hcRUu86Whu+2DoUruzb6EW50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qsnBOfzHqqyo/mfM/vPx5i2NCelOlLzFkiRfORokrOnVNXhbOdDchOM4jSkFmenph
	 1IRcb10DaTszVCHuDL/wI5znKTXQnCZzMYOjnwJdFt9ta3c5VnxrfSFV6fseExHYbE
	 Hh2JFaz/egM42Xbsw7h8/omrZuTaWQgvwJMwLQUuZ6HXBEe7filTIEDaVB2gYClzyA
	 KZHf1xz9X1TXmf9Sy8Jo+N9oI282nNUcWYdT+cv8cpVHkc+y9cKAcAtjcmmHSQxeiN
	 gNBPfvnH7IP1dcxZZOac6OqQa5d20dw5fD6ER9Ua48eJus8HyGm7rq9j1i9pq4T6Ik
	 O8N/0A0L/4XAQ==
Date: Tue, 9 Sep 2025 09:18:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 5/8] dt-bindings: serial: samsung: Add Exynos990 UART
 compatible
Message-ID: <20250909-sophisticated-urban-goshawk-fc11fb@kuoka>
References: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
 <20250907-perics-add-usinodes-v2-5-58f41796d2d3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250907-perics-add-usinodes-v2-5-58f41796d2d3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_001811_126518_14D79298 
X-CRM114-Status: UNSURE (   8.88  )
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

On Sun, Sep 07, 2025 at 10:13:36PM +0000, Denzeel Oliva wrote:
> Add samsung,exynos990-uart compatible string to the Samsung UART bindings.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


