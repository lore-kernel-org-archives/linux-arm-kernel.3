Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EDAFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 12:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoKCQPMpn1EFup8AbJftFkjPKom5Zewqy8Mv2L6J014=; b=j0WvOvZH0CT/RAHXuw1zv7n9TT
	pyMRNq4c6ynJFNoR/6+v+r4bR9TUAlIHDKuf7A9DM8pEZLnjve3ZoR9Zx6nTRaC/cMBGxzpLBDxXy
	6bY+Dn3x7br7DKu0PXwOl+vpOZ7DEXXTQhOfByIaVgFkAbPeCVTbAfVoZbo2ARcq2CzYCSHfYr/AT
	9QDpdKvRcE4Axw4kJdfwFdZn9Nwy8OUvEMLUasj5PWw0Zx1MvID1iDqx/+CJH9LmeYCTnNdO4FkG6
	xWvrPM6OkN5pyHu3u8e7pEXRIrsHW67tYIJdkyx+1sbLODxOCMpHqZlnIHOz61OsmXh9xK4r3UGkp
	XOpK3JAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhCh-00000001Oed-39ih;
	Tue, 28 Apr 2026 12:06:15 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhCe-00000001Oe2-0P44
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 12:06:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1D7344E42B5A;
	Tue, 28 Apr 2026 12:06:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E05CB601D0;
	Tue, 28 Apr 2026 12:06:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A17010728A74;
	Tue, 28 Apr 2026 14:06:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777377967; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZoKCQPMpn1EFup8AbJftFkjPKom5Zewqy8Mv2L6J014=;
	b=n2V8omZ92scNhPAKpj0/uW5WZ1Awm6eV+h3dnrauNGiNyf3Tf9wiz5CMYHngOA+hZclq/f
	+mTK5KGsGiZhxHzvbbR7PSAohzWqYonwAceTwrmpqU4Y69bjeY/I3w8+zpRKWORV3z8jKe
	jogCkZ0Y9dy0Owx8EMzAhLCVh8c2J85//a0/SAsJUqM/4OlpoiHXagYORYyopapNsEWZl5
	el6FNkcgv+7Rs5zQXVAuAsBl8wVrvG4p6ekS9u7Lx5W8u+NxjgUSTT+oWXLtyw8//S+f/+
	RpXknn3CcddiCQEDApz3UBqC+BZ2nhuwlxkofzIz8858D1Ngg5zaOcT+2jLykA==
Message-ID: <3a78ff9c-e70e-47c2-b356-2bf9d75bc372@bootlin.com>
Date: Tue, 28 Apr 2026 14:06:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721s2-som-p0: add bootph-pre-ram
 property to pmic@4c
To: "Kumar, Udit" <u-kumar1@ti.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregory.clement@bootlin.com,
 richard.genoud@bootlin.com, a-kumar2@ti.com
References: <20260428-k3-j721s2-som-bootph-pre-ram-pmic-4c-v1-1-e8202ce955a0@bootlin.com>
 <6aa8fd45-ec3d-4bd7-9b13-6c00e4fd4efc@ti.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <6aa8fd45-ec3d-4bd7-9b13-6c00e4fd4efc@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_050612_579196_9CE28413 
X-CRM114-Status: UNSURE (   5.95  )
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

On 4/28/26 12:15 PM, Kumar, Udit wrote:
> 
> 
> On 4/28/2026 2:23 PM, Thomas Richard (TI) wrote:
>> On j721s2, pmic@4c is needed to exit the DDR from retention after
> 
> pmic@4c to PMIC-A to align with schematic, please

You mean PMIC-B.

Best Regards,
Thomas

