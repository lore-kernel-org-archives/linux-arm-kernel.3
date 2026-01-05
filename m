Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733D8C2A062
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 08:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xuz8o/gb6QERQ6+/8fZLHtPXBEmYMHI7qqP90dZeLA=; b=uQABJ8WVzuymppIvuNmtd6dyi5
	YE3+nFRYgIu5QrojyEy6C9iOx3+mt+fvV9flQsUXy3qZuE1vYQdhzfTyFD0wsiIzXNozDOqlp6knS
	12jFh+SWDnI2gLOZrzQIlTsO3iyfc5Ht+kEkVp4fdPY8cdhp/3/sF4NM7Qtq6VENnxHhBoW7fpGTD
	FTYL90TUnTbPT78cTue54tMdL6AwtC0Y+wWAPRKBlV+aDerCuPJK1r8phP/JMv2CduCk+bYf6aX1Z
	H5TfMad1x2S+79NlE6i8b7XRYTJ7h66Q+oJt0wIB2IddYm2q+ko+XMFfZoiFvOuxxATRhz6PoFFwE
	K9iGGyog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfzu-0000000AzGC-3ZMB;
	Mon, 05 Jan 2026 08:31:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfzt-0000000AzFj-03X1;
	Mon, 05 Jan 2026 08:31:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A71F400FD;
	Mon,  5 Jan 2026 08:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A45C116D0;
	Mon,  5 Jan 2026 08:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767601888;
	bh=6xuz8o/gb6QERQ6+/8fZLHtPXBEmYMHI7qqP90dZeLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m0zpWZGkSxVKTdN7HrCPz92ypNhbN1w1zDeqrAcx+9MbI1vYYo5498R4h8MI/W6g2
	 PyvVQOdHvv0o5j7nlvbKS8pHWejn3KRycnkXCFdqiMZrN/JvOSMDGb1VJw1rZlsT+U
	 qhzGWN4Uu6QytU/wTFo/uAXDtvsgAUUWsgLuOX/J1cQtxOFz0RaiQtRYLV3O8YBhag
	 RGI1i4u+JJSD8zwn1eJ6wrXdJmStDe4zPsW2C8AZOE01DiTfpVxXDhkZntQyXSrhoj
	 aXP0Cpv+MuLtsqirs5652iBBvRBYGeV9odoBrMw4pKwCm+27QIkCYu1kJWWVHWygtu
	 In4RvTE8Gf4yA==
Date: Mon, 5 Jan 2026 09:31:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/11] dt-bindings: phy: renesas: usb3-phy: add r8a77990
 support
Message-ID: <20260105-beneficial-seal-of-swiftness-1c5eeb@quoll>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
 <20260101203938.159161-2-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260101203938.159161-2-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_003129_075299_7D20C999 
X-CRM114-Status: UNSURE (   7.44  )
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

On Thu, Jan 01, 2026 at 09:35:48PM +0100, Marek Vasut wrote:
> This patch adds support for r8a77990 (R-Car E3).

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

Also, you cannot add support in bindings. You either document hardware
or you add bindings for or simply you add hardware.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


