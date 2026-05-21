Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C47CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 07:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52vwZ/BSNkydb9uU93Hebvk9NIZbJYHRFhGEKEB4wvo=; b=LlaymhTk8+4uSJGhzSzf9GVn6k
	kiXIyYlQAFrLwPMuyZ0Yp5jq1m+gyURUmZsr31hizNI0onRUnx0ppsZcnxw7QfAtPDdrtw5L6rFeL
	ZcvPGwaK07X82gXyovFPo+oaVgTKNCS7ECTJCeCEj2fU5Ky5Kf74da22Qg4IqIboM3lwwt9YjMo24
	eWp9TiLm7dLT0yRhaHSLEadidivzvXhovBjraQg19G7NnW8ctt6KPUPkmR1DcKArKHmLDh8Q2el/C
	v8pQpfElftUeVUEGhNCe5ByvgBKbkeAZNPR34h8uthHs+ErX8mtvjpKUovrnxaC3gLsj4YGZMEZFX
	Lhl4Aisg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPy2B-00000006zf5-3vhY;
	Thu, 21 May 2026 07:41:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPy2A-00000006zek-0YBH;
	Thu, 21 May 2026 07:41:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 297E860207;
	Thu, 21 May 2026 07:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0671F00A3B;
	Thu, 21 May 2026 07:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779349292;
	bh=52vwZ/BSNkydb9uU93Hebvk9NIZbJYHRFhGEKEB4wvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M8beKdZgg9+KeP/MfjGyGScAesw/Iw+ZDWKCqEOjnU/hyjKrxtrGv1gXnuwkGzvwP
	 HqkC+1eW0H8qH1rHJp7Bgu4WPAsAJ9f3mEQl4pQMkvkTbF22IDwD0HO6FF4xzinxts
	 AJnZCrSWsLqTDDOMnGbcAzR6dYCDf/eF0KGt6plAEz3boRGcf8FZJK7MkoEC1/l6qk
	 cFjS8Y99YLZs1PwPUU5VIKI67Fii5Pp6g8YZfGdeu+ghi19YMA7+qty5pX9sgRFF2r
	 KTNr84Ld8P22b6SD02pRfqCVR3ZJJjakpIpGQ41M5u8ThFc4KdNhtLK5xIXNaaooAW
	 1I5GUEy8kIPIw==
Date: Thu, 21 May 2026 09:41:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v8 1/5] dt-bindings: clock: airoha: Add PHY binding for
 Serdes port
Message-ID: <20260521-savvy-attractive-ant-b43826@quoll>
References: <20260520150912.11614-1-ansuelsmth@gmail.com>
 <20260520150912.11614-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520150912.11614-2-ansuelsmth@gmail.com>
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

On Wed, May 20, 2026 at 05:09:06PM +0200, Christian Marangi wrote:
> Add PHY cell property for Serdes port selection. Currently supported only
> for Airoha AN7581 SoC, that support up to 4 Serdes port.
> 
> The Serdes port can support both PCIe, USB3 or Ethernet mode.
> 
> - PCIe1 Serdes can support PCIe or Ethernet mode.
> - PCIe2 Serdes can support PCIe or Ethernet mode.
> - USB1 Serdes can support USB3 or HSGMII mode.
> - USB2 Serdes can support USB3 or PCIe mode.
> 
> Add bindings to permit correct reference of the Serdes ports in DT.
> Values are just symbolic and enumerates the Serdes port with a specific
> number for precise reference.
> 
> The available Serdes port can be selected following the dt-binding header
> in [2].
> 
> [2] <include/dt-bindings/soc/airoha,scu-ssr.h>
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/clock/airoha,en7523-scu.yaml  |  9 +++++++++
>  include/dt-bindings/soc/airoha,scu-ssr.h              | 11 +++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


