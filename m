Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41C1F8FA90
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpJV3RY0EbaEZUr7cB+U3AXYZF0kplYNLFyuwZ/YRu4=; b=254tT5S19mTJfMDA6VT243QsK/
	LPHSzVLI4Bu8vNotrIo9Bo/JbjAzwUCtJriEuH/+fR3wgd6s3K20sXOp8A9yQpRj/MRwmeLjXUTte
	y6vuIRie4O4T2Guh2TkWX6B5WRo9gX1O9vdohVeBTAAC5ywhbCv28Yo9FBA7SEp3Nb8D6b/3neUNt
	94sl4a7d68UmZpHsRgp+CPLCIaDTJaVKfO73G7DL2zaB6wA4QObPFHbBhcJdjDGkz1qwvL88XAK+F
	i5XWmtfC1uFMtLoGst7A0zsJCOjmITpuQKFMRSWCQRZ2FnjQb+EsJjbTT6ccUzaL3C6xeWcm8uyvK
	MsshmqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFE6s-00000008v2X-0d5N;
	Tue, 21 Apr 2026 16:38:02 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFE6q-00000008v1Z-0cF4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 16:38:01 +0000
Date: Tue, 21 Apr 2026 16:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1776789467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OpJV3RY0EbaEZUr7cB+U3AXYZF0kplYNLFyuwZ/YRu4=;
	b=ORLnEF5qdgVpnRWwe+ZGDZRScEa9amzvTYBVvrDt3C6KffoF3IOiJuAsxNZJRe0OLubZR2
	0Q5IIYUgUNPmwOfL2EkA7FdYj8YqQHBdIAeNIWGV49DKTgkQv25LkVrwY31tlDT+mxSE0Y
	5eb0rf1riSjwB3GMibR5G7aQeMUonu+g77nOyI1PO2qk6W7IkD3pKs8ciosWGRDu5R6XRZ
	pnq+DUpMUcPCy6LwGy3LNvcDF8D7yDzghkqcYI7V3zpBMstJvaqvCmR/fIiPOv7KYDASx4
	nlHfefVgG8s+ryZbX7mC/CaQE0QRc357miibthjO4rgC3Oq+bEyJSRnO1Ona5g==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, christian.koever-draxl@student.uibk.ac.at, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Christian Stefan K=?UTF-8?B?w7Y=?=v=?UTF-8?B?w6k=?=r-Draxl <christian.koever-draxl@student.uibk.ac.at>
Subject: Re: [PATCH v3 2/2] arm64: dts: amlogic: add support for X98Q
References: <20260421155328.26359-1-christian.koever-draxl@student.uibk.ac.at> <20260421155328.26359-3-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20260421155328.26359-3-christian.koever-draxl@student.uibk.ac.at>
Message-ID: <tdurii.1o3p0jnn1bsji@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_093800_331083_226E08AC 
X-CRM114-Status: UNSURE (   8.91  )
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

On Tue, 21 Apr 2026 15:53, christian.koever-draxl@student.uibk.ac.at wrote:
>From: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
>
>Add dts enabling core hardware for the Amediatech X98Q.
>

You should explain what the Amediatech X98Q is. You did this in the v2's
cover letter, but it should additionally go in here too so it's visible
in git commits in the kernel. What hardware does it have? Maybe also what is
enabled in the DT?

>Signed-off-by: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
>---
> arch/arm64/boot/dts/amlogic/Makefile          |   1 +
> .../boot/dts/amlogic/meson-s4-s905w2-x98q.dts | 249 ++++++++++++++++++
> 2 files changed, 250 insertions(+)
> create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
><...>

--
Best regards,
Ferass

