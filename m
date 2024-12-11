Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A635E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 09:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2GZKjI+dvSqNOzpNpL56iBMQwaBhJ9JsG0hMpOPvjE=; b=k7uL7j132RvdEqMHF9pUfFHVUt
	nfEyzwZeHnMVpr7BPmXyzYfOsUW2KAz7xWCEENFwY/Fd7t1mWb6SWHKF4MD8lXZhlIdsOVsOSDhtH
	tmFn3Wam9tm3NlV30ecaJe8rtSxyoVKFAjQLlRtLVMeKlhtOTasUKCLFCfeJi/n7+h6GrUY4z+iuf
	T43P6dHMJdhVJBFOOJ9pCAqcTxcgQX2eB7x7ZW+hvPfhU1gM6q+jkz+1G9dSMI/MXJSBz11WFY6Mt
	usulZjactd489TrJO54zkHBgInZxxBYic2bMA76REOHnLkHLJ82JX/Vi3YZOkOH1ae2yqZUNRtWc1
	EsnKaUkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIhV-0000000ELYU-1kCD;
	Wed, 11 Dec 2024 09:08:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIgQ-0000000ELGP-45nC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 09:07:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DB83EA41FF1;
	Wed, 11 Dec 2024 09:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C1DC4CEE0;
	Wed, 11 Dec 2024 09:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733908021;
	bh=DiGUbD7xWdGFywNvLEFW1NGBQYsE/SozjDV/iopg888=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SlcB/ZRcZbpjLdDUebZxf+cmjaVc5bPwsGUhWlfA8XJjphUyy8Z40dBOcAg5K/oDL
	 o5aRaOZ0ADHms6HUUgw52GuUdI2XOFk5fx/Emkfb0a1CwbDXyWNOixDTW3vMz/5P0d
	 MUCoHM+30GPRPbGsDTVH9K3QOJ0PwiKBqp/907t6Ovq9HUDdMSLCbC5VHKGJ5rh99A
	 BeQrteuMkW9VNzRzCM7lA7qBUa1DzBccgNW+AxTAMmQXgFS/27zrcHZYHpboy4JPf7
	 MDyVKEHjmlzeEsBrIesnDGZ2kaCTF0Vs5OZgQhGXy7F/AVrd1WumvmiN27zXzPA+4g
	 KoTEB6DENN3Zw==
Date: Wed, 11 Dec 2024 10:06:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, festevam@gmail.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, frank.li@nxp.com, aisheng.dong@nxp.com, daniel.baluta@gmail.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, iuliana.prodan@nxp.com, 
	a.fatoum@pengutronix.de
Subject: Re: [PATCH v3 5/6] arm64: dts: imx8mp: Add fsl,dsp-ctrl property for
 dsp
Message-ID: <l3z3mu5inmfc23v4mymtcb4gnzic5zupqfpcuk7vqeweluy5jn@c2b5ex4lkdgc>
References: <20241210125338.104959-1-daniel.baluta@nxp.com>
 <20241210125338.104959-6-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210125338.104959-6-daniel.baluta@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_010703_079063_DB0FB7C0 
X-CRM114-Status: GOOD (  10.01  )
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

On Tue, Dec 10, 2024 at 02:53:37PM +0200, Daniel Baluta wrote:
> Audio block control contains a set of registers some of them used for
> DSP configuration.
> 
> Drivers (rproc, SOF) are using fsl,dsp-ctrl property to access those
> registers in order to control the operations of the DSP (e.g for
> start, reset, etc).

This should have been implemented as reset controller, not syscon. It's
really poor choice to call everything syscon. It does not scale, does
not provide you runtime PM or probe ordering (device links). Quick look
at your drivers suggest that you have exacvtly that problems.

Best regards,
Krzysztof


