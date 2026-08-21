Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43377C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9vNkwYc9Gq8M4ihGaI0B6VYDiHukAmfL99c9HOM/p4=; b=bJ8zBKCEL7i75v20FhBqFjgJhY
	drQu/vDo8uJdnKwms2QZ6psJWS38RiRZcFyM37bruhDSz3/d7ePjCaavYdfyUwSutY/G9ZNIqOz1a
	qRbxDJFlZv2cP3o1aFJEsJbGQnDtXr0f2C3tDyR0KIleNo99OVkfWK11mHBvS4ou7QZcGLqnq2fg/
	UwF/7nrAxDPeNkvpqIE34LPSPT9yhinWFGIBHG1KsgdxKSKQtxoa2XEoZzpimvakB/dB80iLSSnTw
	nob6P2p0zJm6G6Ovd4oOWPvkoMz9rwuDclwqFGot+EqqoaxLT8k7RpxVaF01X3qGHSl+nWWetYqDb
	vFk6w1tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxL91-0000000CsR3-20u0;
	Fri, 21 Aug 2026 09:02:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxL8y-0000000CsNs-0h11
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:02:34 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4397C18E1;
	Fri, 21 Aug 2026 11:01:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787302864;
	bh=uKDLFlr3nucpLxUZNWN/RD6C1s+iINj2iN8wtFoAs1Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oXr4qGsX5uiODZG98QRfsZinvhkoNPDZQnX2OTJquyfWAjJPER36xrLPKLDRhJIMc
	 /qGKfL9NCObRge4wDwVWRg2RysfKLsmnOnnGcDZ5JPhxmRbRhKXJwCIBDuKgW8GizW
	 GF0bbj0SrluX4/ohNcw/0HQxsduaVCO2HoMPfbek=
Message-ID: <5727ba42-4469-4a12-ab70-9f85089dc6c1@ideasonboard.com>
Date: Fri, 21 Aug 2026 12:02:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add DSS support for AM62L SoC
To: Swamil Jain <s-jain1@ti.com>, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devarsht@ti.com, praneeth@ti.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811130822.2324438-1-s-jain1@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20260811130822.2324438-1-s-jain1@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_020232_357770_FAB07818 
X-CRM114-Status: UNSURE (   6.61  )
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

Hi,

On 11/08/2026 16:08, Swamil Jain wrote:
> This series:
> - Adds base support to enable Display on TI AM62L[1] SoCs
> - Adds base support for DSI output
> - Enbales HDMI output out-of-box
> 
> [1]: https://www.ti.com/product/AM62L
Do we really need bootph-all? In any case:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi


