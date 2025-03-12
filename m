Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF23BC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 14:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5YzmjGj4fjLeTORLxLYxKXkIraULWRR8Fzl231qWkI=; b=Dhe2UAOpkrpQtF4byoS6wWGpOT
	XY390Y4BFFvDdBLJ4CRc6NEmblmyLKjzOmrgZVbLOs9XFPiiuVuUcZMeQZQGk0Up22xQ9tEjf1Obs
	D5wO9AeQKDVS/1qjHkieSvPuQ+hgAMxP25DrfiAOSuTkKpYZbpjAwrcqQynfpV7wjkXV/h/69+vOc
	7sj1zQK1g4X/oJrqfjn3rriFjye3yJGl5/SQPKNpk8BpYRz531MZ5C4UqXCV3pCj2J7e5Yb4L86K2
	teHTshS1MDijTnsCalICTZ3+8v8bTF0CkVylei4vPhiN7o+v1FbsPPisNcqnXyCbZyem3AjdOmFQW
	PYCKou/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNE6-00000008iNh-20an;
	Wed, 12 Mar 2025 14:38:30 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNBB-00000008huX-47be;
	Wed, 12 Mar 2025 14:35:31 +0000
Received: from localhost.localdomain (unknown [119.122.215.89])
	by smtp.qiye.163.com (Hmail) with ESMTP id e0ccc294;
	Wed, 12 Mar 2025 22:35:20 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Add pwm nodes for RK3528
Date: Wed, 12 Mar 2025 22:35:15 +0800
Message-Id: <20250312143515.1225171-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a5ec9062-ca57-4748-8c0f-fb5b9c75fa28@kwiboo.se>
References: <a5ec9062-ca57-4748-8c0f-fb5b9c75fa28@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQ0lKVh1LTRpCTU5OSEkeTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVDQllXWRYaDxIVHRRZQVlPS0hVSktJT09PS1VKS0tVS1
	kG
X-HM-Tid: 0a958ac80af803a2kunme0ccc294
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MSI6Vio5EzIDMhwtHU0cTTcD
	HkkaCzdVSlVKTE9KTEJLSklKTk9OVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUNCWVdZCAFZQUNPTjcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_073530_193033_50EB3987 
X-CRM114-Status: UNSURE (   9.20  )
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

> The pinctrl-names should be changed to "default" and not "active",
> something you can fixup or do you want a patch?

Sorry I've been a bit busy this week and forgot to send the v2 patch.
In rk3528.dtsi, the uart and upcoming i2c nodes do not have pinctrl,
so I prefer to remove them.

>> Unlike other SoCs, pinctrl-names need to be in "active" state,
>> I'm not sure about this, but otherwise the pwm-regulator will
>> not work properly.

BTW, setting the pinctrl of pwm corresponding to pwm-regulator
to "default" will cause kernel boot suspended.
Sorry but do you know why?

e.g.
```
vdd_arm: regulator-vdd-arm {
	compatible = "pwm-regulator";
	pwms = <&pwm1 0 5000 1>;
	...
};

&pwm1 {
	pinctrl-0 = <&pwm1m0_pins>;
	pinctrl-names = "default";
	status = "okay";
};
```

Thanks,
Chukun

--
2.25.1


