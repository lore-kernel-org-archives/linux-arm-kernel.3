Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2896CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 18:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcU9A/tq5+oi7hBJMmArLeP3C7GfHr2OsLC6PY1wg9s=; b=dW5aEWmTdFH270z3PO6yVFM9bq
	Ky+L47mWk3RP3hrKDfb5UQ8RhfK7DNEqukt6Z2jJmz4T2jDJYr3/wx9R4bBgrKZAg9uZoA4QRyW+Z
	QJRbg5STHXDCJvQjeAMtzVayi9C/DUuCoelJuXH9l0GwFG5bLxfMhlvjRZVLOS1IOcWtdWIApplei
	6XhQHrvCrDPWDn7RMg1UhEDx3zXCHVrz2C4az2ZGsqLXa0D0U9cy4bwcUkt27GsMKeY7ZeFOC06F6
	CUSlfPoLI5X8i2m5L2rJVLUgsfa/H2YFAL/+p++7xghCfOmjSRLQ5yl38t068//9glPncs/XjUf1w
	8/bRekPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uya0R-00000008hb1-2AMU;
	Tue, 16 Sep 2025 18:02:19 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uya0O-00000008hYD-2JkC;
	Tue, 16 Sep 2025 18:02:18 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1758045732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tcU9A/tq5+oi7hBJMmArLeP3C7GfHr2OsLC6PY1wg9s=;
	b=OK93RaaWnkocTLdikKRF0xvCK4IJRIQo6zYoBR7M12A6V/i7Zi5vN57SMabR1ftqdaiI3w
	5wSLj4Mfkuf2tXJqc3W0aZuWIU8YW9Vl+dEpHg8pITdrNSw5q6QKLPi8BP+3P4qjnF4C8y
	SVEC0R9sqUpg5yxi09dHu9zRUZ+93c3QxzqO+j6BMTDoH7FsyCqDDv+c/E+4whne1ajLiV
	2TgyQ76s7OaKndeTm7VISUBiHz6Bj+3/DBGEj7Ay178jZuK2ZvXBydCsWz1KU4uFOuTD5E
	ffdSwca6Lv5D++1so5EcGqNa3YRWBnoGEb011jxbfK2HjksK7ygi34w28akJpg==
Date: Tue, 16 Sep 2025 20:02:11 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Andrey Leonchikov <andreil499@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 heiko@sntech.de, dmitry.osipenko@collabora.com, tglx@linutronix.de,
 amadeus@jmu.edu.cn, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: arm64: dts: rockchip: RK356x: Add OTP description.
In-Reply-To: <20250912135542.2304150-1-andreil499@gmail.com>
References: <20250912135542.2304150-1-andreil499@gmail.com>
Message-ID: <957705f3b0f6407031f76ca433a0541d@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_110216_841343_0DBD1B24 
X-CRM114-Status: UNSURE (   7.74  )
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

Hello Andrey,

On 2025-09-12 15:55, Andrey Leonchikov wrote:
> Add OTP mapping, can be used on future by drivers.
> Contain a factory-programmed values for a various peripheral.
> U-Boot already use "CPU-ID" OTP value ("otp_id" on this patch).
> All values from original Rockchip sources tree on github.
> 
> Signed-off-by: Andrey Leonchikov <andreil499@gmail.com>

Thanks for the revised version of this patch.  As Jonas already pointed
out, [1] this patch needs more work before it can be accepted.

I'd suggest that this patch is temporarily dropped, and I'll include it
as part of my upcoming patch series that will handle the SoC binning,
with the appropriate tags.

[1] 
https://lore.kernel.org/linux-rockchip/6bd28aaf-aafd-436e-8799-fcdb07082660@kwiboo.se/

