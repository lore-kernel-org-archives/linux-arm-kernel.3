Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F3EE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 11:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:In-Reply-To:Message-ID:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=lvB4BBNGMAV8YyKfA+yq4kRzeVqE1+GW4krTt9wxxCU=; b=l5HPEP78H7i9/crNOWzRNuUpU3
	xavonhnfcgjRoHUS3IrIfBEVX0nSHJc67tbYDApRUAB5gG42uX1Z2TBPsgNya00VH/7Y2Ul07FzJ6
	zM48PioAHyNslgqvMHKatlsnEsApbigZsnNGXePQDh7+rUZoTr8xGlkYT1TxaCG8u6boVYJEo+5GY
	9yiiRSi4SptyD4vdiEl0sKROcK7AEJvw1vdzILkOPCPYh+42YSqOV18XUJzVgXb9d2sJ1zrn9mW4X
	t4OgNTQQarO53Lz+UuD3GU+40iI2ZteI6n5ZQ6o8I3taw8vMaZR2H/3nzrW5G3E7iITCp3xuRYrbZ
	JyUbPmPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWu8-00000001VO1-2TqY;
	Fri, 06 Dec 2024 11:53:52 +0000
Received: from out-03.smtp.spacemail.com ([63.250.43.88])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWt6-00000001VCm-01Jn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 11:52:49 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y4V4W4w9FzGpPB;
	Fri, 06 Dec 2024 11:52:43 +0000 (UTC)
Received: from dummy.faircode.eu (public-gprs382651.centertel.pl [37.47.125.252])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y4V4M2Hlwz2x98;
	Fri,  6 Dec 2024 11:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733485958;
	bh=lvB4BBNGMAV8YyKfA+yq4kRzeVqE1+GW4krTt9wxxCU=;
	h=Date:From:To:Cc:In-Reply-To:Subject:From;
	b=OizvNwJRfvazQCJXHVxgSFiFTb+aJKnQwNqRSPzCgrB5QWoKmIxrgaPyPKYaeIMEv
	 5KC+acQ+Rt4nEW9dLGByzlklHhyrbyI58EMV+AGvWXJFdRJ6qETOM2Z8bhpNXP/bq/
	 cUy5mwUjZrmNhzHDIzB4c4cHabRRdjK1BHtoh3qw3LmwIW/rcWRWqrPhrrVZjpQuRs
	 5ICDTrgPnU8a1enY+Vf1CHhyOfrmd9rmCYCb6IeYpvPcN/QeDt+cndZzMtWTRvrflv
	 wk4cKNst5aqnWCL6XOvCPc/7mfe7dcjzRPVYGaRbq5c92PdDj4hp3AhgsOpVOD9N+k
	 dPC+p3KPZzo9A==
Date: Fri, 6 Dec 2024 12:52:29 +0100 (GMT+01:00)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: krzk@kernel.org
Cc: alim.akhtar@samsung.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, robh@kernel.org
Message-ID: <bb128c8f-5315-447f-ad47-c051a4a9ebf5@mentallysanemainliners.org>
In-Reply-To: <fdb4af16-468a-4c23-b8f4-ab60d4b535d2@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: exynos990: Add clock management unit
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <bb128c8f-5315-447f-ad47-c051a4a9ebf5@mentallysanemainliners.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_035248_124538_89AB408F 
X-CRM114-Status: UNSURE (   6.04  )
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

Hi Krzysztof

Thanks for the review.

I just have a question - do you prefer having the two (pmu and cmu)
device tree changes spread out, or should I merge them into
one patchset?

Thanks and best regards

Igor

