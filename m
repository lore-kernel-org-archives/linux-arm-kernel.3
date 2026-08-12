Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2FAC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 13:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aN0Rctm4SjqqlH4vLdV5CYotaM/NXhc8bnviXagqhCY=; b=yoTvIPohcnE5yCEAadpmEt4kjz
	Y6WaIdK1UuONwvp00PM+5ZoedZv2Y81lZFoEW75J0nFBcRBtAtsyQAaIP4/ffjbX98HwdDBsA4sQJ
	b5/Lsc38roJDqOj4PTxqzWqXMTaVVl1Cz1veiXBJnrieM6mL3GdginjF+Ri4229sEQKbGi3CjJija
	Khv0hJ8kzBC7HL+tUf6Mfss1F+F/N6uNa/txzXEo5DHvz66clFIzk/cWcaYpakL5zNWQr3UbkAO17
	wHpvUgP9BQd/bNhsOM8frqSKvigK5KpU5BXoIGU1giLjc+0ddXAs1yEiKyuXKL+O9+fVxHaB140JQ
	xPQQwzCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu95j-0000000GIdk-26Jv;
	Wed, 12 Aug 2026 13:33:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu95i-0000000GIdW-0Bj3;
	Wed, 12 Aug 2026 13:33:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B236441FE6;
	Wed, 12 Aug 2026 13:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE101F00A3D;
	Wed, 12 Aug 2026 13:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786541637;
	bh=aN0Rctm4SjqqlH4vLdV5CYotaM/NXhc8bnviXagqhCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MCX/khdNbC5ZwrO3A3eST89exVOy1ThmkVXT+TXfKbj9O8PpyqNblVLrBMdnxuOUs
	 elC7WpgtcZS4zq3AFLx9kpnT54iF6V5XSm9hf93/clNou00v9pGvxoSRnDZbgy3utG
	 7uXXkZ7vhRzOlL0FzKK1Osh9wRK012af8y3zEcjsJS6T+u/FZ+pE6HcEUh1Vk2VFRg
	 6Sbf1tEXjxx0UFUihievkvxhQOUxEpNYCHZhgyn36q84rzzz97fyolCzcz3nqI4FaD
	 waMSzkdv9B7FqX7BsdEjVIc/s65zd6UqTqBVkzyv8hIDZU9nYPUZq/0mH+HVNcXpj7
	 X3c4h5E60tMMg==
Date: Wed, 12 Aug 2026 15:33:51 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, 
	"moderated list:ARM/UNIPHIER ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] phy: uniphier-usb3: no devm for nvmem_cell_get
Message-ID: <2tfri32wtmflxal62n5v3bsd4wgtwplv5ybul5ap66j6mhbvlp@pqyrjq6nd74f>
References: <20260304041602.7539-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304041602.7539-1-rosenp@gmail.com>
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

On Tue, Mar 03, 2026 at 08:16:02PM -0800, Rosen Penev wrote:
> There is absolutely no reason to extend the lifetime of nvmem_cell_get
> to after removal of the driver. Use and free right after use.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

