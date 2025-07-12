Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BC0C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 04:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwKSoNmEHADKMlwpcXsRn20n1OkyI2kkSfMbpuBgMqs=; b=HU/Kh4VztpDI1bIKDleZjkm9d5
	nTBidgI21qiD4verRzF6JnOw/nbYP/fEAC9Ulu119j+YC7U7wOpJviaZMzkYmOzqWhDKVpC47MIad
	/FhwhRBzqF3BhorrpgpyWPXIjHmxIIcXzydlXo8aaTeO1MRGwDs50s4MCN3u/Jbwsye9QEJgJqy9I
	tfz28/acIqVk33LhN96wK2DL8HYwjhO2KknZIxaWVJuIXEW4jZjqVC3aDr29WZlqtlCGU+XJSeBrG
	8+QddYLbJl/NkN5RoYroeSGlIcPfyvQh86xEJ3eGxs4Bq9Zp7Sjag6Rf6mG5qbUvoDjcv/W1ymf19
	9JqzZyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaRS2-0000000GEvD-1ipT;
	Sat, 12 Jul 2025 04:03:02 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaRPd-0000000GEoD-3v1B;
	Sat, 12 Jul 2025 04:00:35 +0000
Received: from localhost.localdomain (unknown [119.122.214.98])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1bc2c329a;
	Sat, 12 Jul 2025 12:00:26 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	ziyao@disroot.org
Subject: Re: [PATCH v2 4/6] arm64: dts: rockchip: Add ArmSoM Sige1
Date: Sat, 12 Jul 2025 12:00:19 +0800
Message-Id: <20250712040019.165440-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <acbbf570-7a56-4d88-a631-32acd13d29c7@kwiboo.se>
References: <acbbf570-7a56-4d88-a631-32acd13d29c7@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0lCVk8aHRlMQh4fSk5NH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VCQ1lXWRYaDxIVHRRZQVlPS0hVSktJT09PS1VKS0tVS1
	kG
X-HM-Tid: 0a97fcca9bd403a2kunm68a720276516be
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mww6Sjo*UTE3DR1IHyMMTB4R
	DQ8KCTRVSlVKTE5JSUJJQ0lNQk5JVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpPVUJDWVdZCAFZQUpNQ0w3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_210034_162187_C79CC866 
X-CRM114-Status: GOOD (  13.00  )
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

> > Should this label be named as led-0/led-1?

> The nodes must include 'led' anywhere in their name according to schema:
>
> """
> patternProperties:
>   # The first form is preferred, but fall back to just 'led' anywhere in the
>   # node name to at least catch some child nodes.
>   "(^led-[0-9a-f]$|led)":
> """
>
> Using the color name similar to the the pin labels in schematics made
> most sense to me.
>
> Do you want me to change these to conform to the more restricted
> ^led-[0-9a-f]$ pattern?

This will be better.

> I only try to enable controllers for devices that are properly described,
> so I ignored the pwm-fan and its required pwm6 controller. Mostly
> because it make more sense to describe the fan once thermal support is
> completed, work [1] currently being blocked by a rk356x otp series [2]
> and that depends on a rk3576 thermal series [3].

Ok, I got it. Is usb2.0 also stuck?

Thanks,
Chukun

--
2.25.1


