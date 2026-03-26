Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E24109E547
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 04:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8MoVHmnri3Cl6KqI9p0QwU1t7f2UmlqeymbhBedSQk=; b=1YYzFClsMM/CCrnhzsZNaM40Ps
	rY0JaF0LF49Tcfc8d1IICirQSEjHCgkl6OQSEadY2Qyt6kyJpUGggi/OJeMWV6JxwvI6Vvv0eHMHr
	tFc2IU5YXeQLSdHPsUKtu8MnNZg8sRvHkOspLXndifs97fmgx2Pr9uohkaT+YdtUrNyLw7qAaVAC9
	A7MmnWNn82YTJA4uqvX949AN0RUQWQCTLmbAC2x4naTAqEQ75I/Fl37iLtA6x5FQdVglJ/cRie2aG
	AEEMSIFnhUkBhjy/9yJ0HGCZe3wur8w4aANCJzS0OqvcJYvnpzgP5sNp5lmpBxFNQ9fRgzQY1RTJk
	+0LboYvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cKe-00000004gCK-0dR4;
	Thu, 26 Mar 2026 04:28:33 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cKb-00000004gBF-3wBp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 04:28:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7526511235B;
	Thu, 26 Mar 2026 05:28:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1774499300;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=L8MoVHmnri3Cl6KqI9p0QwU1t7f2UmlqeymbhBedSQk=;
	b=AjaK5I7BFXMnFI+2HcRDawC/xob/VQ748J5RHgRbK9FLPWVJAtFvIPdyzojUsHATfSkonD
	84Ms/M70WkiQV79UxjekOE2hMsc6KxPV2q90HU6F29rpPB95vRVRa4MCQzNCWp1H2sJlvC
	22lWXixYleZz7ZUL160jpXngAtAPeaxbSNU76GZaAGSC5MtYC4DcjkNid2f3y3aSuT/Bg0
	jLUP/0RoETGqSwVPRAYIpUQ0vhaKe/758QHD8jwWD4odLVAV9vZiCNngvoeNzXW3CE68eT
	A2Nta6wLH3YRrBDQOdpGnDsnbDFHAeKbKlZW3H/BBRJn/4l3MXhxyK2Mwz9JcQ==
Message-ID: <49b82956-4ec8-4602-9aaa-0d6a2a612fca@nabladev.com>
Date: Thu, 26 Mar 2026 05:28:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add DT overlays for DH i.MX8M Plus
 DHCOM SoM and boards
To: Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-kernel@vger.kernel.org
References: <20260324190544.74531-1-marex@nabladev.com>
 <acQqc1AuCa1Tkb-w@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <acQqc1AuCa1Tkb-w@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_212830_200169_69A3B967 
X-CRM114-Status: UNSURE (   8.64  )
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

On 3/25/26 7:33 PM, Frank Li wrote:

Hello Frank,

>> +#define DH_OVERLAY_PANEL_I2C_BUS			i2c5
>> +#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_PINCTRL	&pinctrl_dhcom_b &pinctrl_dhcom_h
> 
> This is not straight forward.
> 
> you can add label like panel_i2c at dts file.
> 
> panel_i2c: &i2c5 {
> }
> 
> in overlay file use
> 
> &panel_i2c {
> 	....
> }
> 
> So you use the same overlay file for difference dts. The same as others
I did that in V3, thanks.

