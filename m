Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E808AC9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 09:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCm1L5q7AiO4jCOp4zLM7mfHci9BZuAuRJddZz459kg=; b=bWYHe2V8+e6aGjEuaQIMWcY1L6
	H5OXi/QL7Go6rzcR5TPTK2koHYSHSdvgDkBB6n6U06FERgRTQ4I3TbSFKlIThb9kHgjLdP2rrngt4
	DuwoLcgs/H6bVepOb1KPRf/zi0QESFkSP01h+ymL26ill63m3WWjrxXqQBZlcnbyPWphdZfOzrSM4
	dHsgTZ+16B4kGC87hTXlCVz1vlxME8CV0XI+z3MdK5J1atJAuYPlBTGbFGNnFLvovObpWMmdtffRC
	e8lZbTRp2NbbMCYXdC6136/cci/jHTFBTWR9ktpPrde9lqkcNSgmaiQrrIp/9CZw/TjipeLuRzvfq
	5Y1gIZWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7lX-00000000EsG-2pbG;
	Mon, 28 Sep 2026 09:35:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7lX-00000000Es0-1IHo;
	Mon, 28 Sep 2026 09:35:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B948A43E60;
	Mon, 28 Sep 2026 09:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9391F00893;
	Mon, 28 Sep 2026 09:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790588118;
	bh=vCm1L5q7AiO4jCOp4zLM7mfHci9BZuAuRJddZz459kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AanTJQPNbURukvEMvdXrBHsQC7iLUm/dDYRbZ8IBB9R6yKl3ndAwU7Va5Y60GDV1P
	 Kpd67UL6jqN6DeMA6YAaNaAtNoufh9PGBTnrfZpuSQ/nOs0kpO0WLgpJ/GmlMjgKKc
	 pXrVfaShp/+58J0xYRSlOKhQeATzy7ar372SUR7qAmYWbazBpUHs0cf7Y18urmuCLK
	 u8S6pdsrL0SicXZwPQ4Ntdc8Ub2YHJKe98X4MUXwxVo5eNGjil8/OgIWuaEk37AplY
	 rGcdThi2/0OpOZOuE1WebDlXGfLEHZg9ld/CndFYCW8rXVMz+qZD+ocFONuJWDS/FY
	 +hyi5hG/ndXDQ==
Date: Mon, 28 Sep 2026 11:35:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com, 
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: regulator: rpi-panel-v2: Add
 vcc-supply property
Message-ID: <20260928-big-hyena-from-atlantis-0e48c5@quoll>
References: <20260922-rpi_reg-v3-0-9214321c4070@oss.qualcomm.com>
 <20260922-rpi_reg-v3-1-9214321c4070@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922-rpi_reg-v3-1-9214321c4070@oss.qualcomm.com>
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

On Tue, Sep 22, 2026 at 09:01:59PM +0530, Shashank Maurya wrote:
> Add an optional vcc-supply property to the Raspberry Pi 7" touchscreen
> panel V2 regulator binding. The panel controller MCU is powered from an
> external power rail, which has to be supplied before any I2C
> communication can take place.
> 
> The property is optional so that existing device trees which do not
> describe the supply remain valid.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> ---
>  .../regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml   | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


