Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EAFCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 06:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RROh9iqQ70OdBywmW1IULQcZq8kweW4OW0QocIf8EY=; b=iBveztjQ6pNfkx/DVWEBOD1vtF
	nlxPpS9PocJa7YK4DntdpJxzLiy20Me0aT4dBnqnuL+M9Sdt2426BtowsC+JsblPyQHzPwLUpOFUd
	ukFCXCTHkzmCuAQQXf7CIZbsWMfhVcWXz1poTnN15KSeBy0XaaOU79vGJZ+3fAoMxFE9x5at7W+73
	UzYLCLaDj/OQyYgurbZqN2NTxBsBYGIZI1hWKbfAtlukpg/Y9ovEOmeTo2LFCZD4gb1RK546VpMl3
	uhE07gMI7/5sD3vimbcIR+ydQWA3fbhZPstTdlVLjNXgWIC0SskKWKtWJ+TYJMB96Qz5HF/W/hWq2
	ENakRtZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utghF-00000004UIu-0kXT;
	Wed, 03 Sep 2025 06:10:17 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utgeV-00000004TDY-49BM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 06:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756879645;
	bh=4RROh9iqQ70OdBywmW1IULQcZq8kweW4OW0QocIf8EY=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=GSYt7p1g4bETO9d6Qq8Y5QOvEUe42ZM625lNOjYH+OOczlvKkSlbOn09/ufRp4XfZ
	 /et9W1u79/dBVZYfAdiSPWGbocL1uHaGz/HqQE6pSBs52GRUY3GnGJbjvwn2U53KR+
	 mRmemqbaug9is1yOMIsfZrrIaxPTY0pQk1BSvXgJpztqfeicGoY6TtHY96JD8YxrJr
	 i0iiy03mDtRx8apj5TcfPYGFP3V2yxoCmiM2j2udEh6YsjO3T3qGOL4nOMTB5jKxGp
	 WueU2FKz47+e9inVRGwvv7OgDVoNnwyqxy5Xf3I2x64EBU1Hn4CjVK8VMG8BrDsPuj
	 K4+GGYvegHX5w==
Received: from [127.0.1.1] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 59A716E02C;
	Wed,  3 Sep 2025 14:07:24 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250819131743.86905-2-krzysztof.kozlowski@linaro.org>
References: <20250819131743.86905-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: aspeed: Minor whitespace cleanup
Message-Id: <175687964426.808220.6591590873945932888.b4-ty@codeconstruct.com.au>
Date: Wed, 03 Sep 2025 15:37:24 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_230728_221095_16DCE60D 
X-CRM114-Status: UNSURE (   7.18  )
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

On Tue, 19 Aug 2025 15:17:44 +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '=' or '{'
> characters.
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


