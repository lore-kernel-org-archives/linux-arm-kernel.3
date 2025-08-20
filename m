Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE80CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 03:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvh1pCRqTHR9A4JoztiXroqfhBCPl8NMVk/GDb/Q5xo=; b=zKxMZJb8jeJYh+DliIee3vehnF
	8aOEV8qvm90XloUuw2iqP+Oi+FitUpwXvRnwku+i6CZpieae8DiJlPbHZwXcx8kBjAgGMNfZ2vd/L
	cMA+Qfy7+iDHMSd8ztftC+HGyU8WJxKwmRk4mr8Z/+EFkxdG1pwqrfQTq8oWxvTRN0kVHw3MwarS4
	QGvhni/b9RPKl58bm5H+B20ODptrhbflq+2JURkhNPyQ49KCYTT5j2KGVFjz0TL+fLgSeXosHypw4
	4nDRdtJQebl5WkruCzdN0bLadaAw2IgYbDpKUnLRH/u084yE5JAQZBh2pe3EWI/Y58DL2LXiVJzy3
	xT538g0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZgk-0000000CIjc-3XYU;
	Wed, 20 Aug 2025 03:40:38 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZe7-0000000CIc9-16Xo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 03:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=xvh1pCRqTHR9A4JoztiXroqfhBCPl8NMVk/GDb/Q5xo=;
	b=IfyRyfoEto1U+DaXmFsp0MsFgucj9/2y/e++USXzSJH7jOSp/wrt7ZUpuLyFu0
	41IBX9V4itX9F4R6ROlXZqmIoxoKez7rzHYHVZYo+mP/aiMv06kTKcQ8AJmidh4W
	myToVIImsthOLa9Ba50Tc7gMkqcztvD9cFKa8rlLitaF8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCnFdsGQ6VooU8KAw--.63245S3;
	Wed, 20 Aug 2025 11:37:44 +0800 (CST)
Date: Wed, 20 Aug 2025 11:37:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH] arm64: dts: freescale: imx93-phyboard-nash: Add current
 sense amplifier
Message-ID: <aKVDBnMro4kg59Kq@dragon>
References: <20250714103624.857493-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714103624.857493-1-primoz.fiser@norik.com>
X-CM-TRANSID: Ms8vCgCnFdsGQ6VooU8KAw--.63245S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrXr13uryfCr15uF1xJFWfuFg_yoWxGrX_ua
	97JFsrt3y7Aa4Ikw13AFySq34S9w43JF9FqFWjvrZ2g3sav393tw4qvas5Jw4DWrW3JF13
	uas3Ca1j9asrWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbzVbPUUUUU==
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNAhWu2ilQwg7+gAA3W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_203755_604920_FD7C566C 
X-CRM114-Status: UNSURE (   8.86  )
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

On Mon, Jul 14, 2025 at 12:36:24PM +0200, Primoz Fiser wrote:
> There is a current sensing circuitry on the phyBOARD-Nash-i.MX93 capable
> of measuring input current consumption of the phyCORE-i.MX93 SoM @ 3.3V.
> Circuity consists of MAX4372 current-sense amplifier (50V/V) with two 70
> mOhm shunts resistors in parallel configuration (effective R = 35 mOhm)
> connected to the SoC internal 12-bit ADC channel #1 (Vref = 1.8V) via
> voltage divider with ratio of 1/2. This results in a current scaling
> factor of 0.502232142 mA/LSB.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Applied, thanks!


