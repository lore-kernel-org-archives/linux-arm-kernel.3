Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19E4E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 12:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fNQK0VC5hmdkf5xB9w2EQXUei7uJNRsiN8mjKgCeDE=; b=S59pJFgoVm4JlfWw4YCEiPOnB1
	n9F2Q8yQT+SBDEmmv28QJc5+pG9++WZLLs6PyVmI1n6D7e9euTw800p2nXqioiaHV+X6f1gw8e9hW
	zKtuUb3BE9aQ2IgTxe5nj46+EsH+KF44YNLFp2LmF6IELiAJcOOsCpqOq+WqojZBpoEmtqDilhj1B
	jOWjVw/Nte97LyXXdsGWalBkhJdFUgP7xqj7W5VL4tHop8Uwt1mshkjEqEKOOhLj2qNZBqDj51Cts
	pcQSmyDln6DxT6antZnzonPrlMHyhW6RkFSvWFqtEQXpJdLLu5saQCEHxfHKn7VEkr9duQRIDqEPX
	M7zKYONg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKd8u-00000007lwS-0tAr;
	Mon, 09 Dec 2024 12:45:40 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcwE-00000007hRy-36PS;
	Mon, 09 Dec 2024 12:32:36 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id 82C55605F0;
	Mon,  9 Dec 2024 12:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733747548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2fNQK0VC5hmdkf5xB9w2EQXUei7uJNRsiN8mjKgCeDE=;
	b=HmsVggyOYb4b6hCgAOoZTRkTYjnu9X2Mj1mGgv+WcHtMf7EKAtJCqImI3UsGf6tXhGFg+t
	yPWIWYJFPaDQFS3dBLz0v0ImNUHd9OA/hadfZ4wSk8zROQZA1WP3y0nrw8YRG4uUlSTcXy
	NiatFxMY57d2z2gD1NYj0tuRadkkGwo=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id D6DEF4003A;
	Mon,  9 Dec 2024 12:32:27 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 09 Dec 2024 13:32:27 +0100
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@kernel.org>, Frank Wunderlich <frank-w@public-files.de>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 5/5] arm64: dts: mediatek: mt7988: add pinctrl subnodes
 for bpi-r4
In-Reply-To: <9b1a385e-da1c-429b-91b9-d5b5d6d5abb7@collabora.com>
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-6-linux@fw-web.de>
 <9b1a385e-da1c-429b-91b9-d5b5d6d5abb7@collabora.com>
Message-ID: <4e0ace7c5a0766395f8801bdd2fcdbf9@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: b6b2de20-0394-48f5-9719-e7ee90c90504
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_043234_954613_F0300CCA 
X-CRM114-Status: UNSURE (   8.44  )
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

Am 2024-12-09 12:52, schrieb AngeloGioacchino Del Regno:
> Il 02/12/24 12:00, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files.de>
>> 
>> Add board specidic pinctrl configurations on Bananapi R4.
>> 
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> 
> Can you change the title as suggested in the review for the other 
> series?
> So that we stay consistent.

already done in my tree (and fixed typo in commit message) ;)

8e566779ee82 arm64: dts: mediatek: mt7988a-bpi-r4: Add pinctrl subnodes 
for bpi-r4

> After which,
> 
> Reviewed-by: AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@collabora.com>

thx

are parts 1+2 now ok?

regards Frank

