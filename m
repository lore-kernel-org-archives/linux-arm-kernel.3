Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30614D149C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 16:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brnsUzmsYYgk2XN2BF7I4MByKsqIk/ou5OdCQOYN58Q=; b=GmrupsZrBR3iwE5GVtH+tKGP8R
	uq3h6FE1X9d51HeCcDQNnsV/EWyYaQSwOblrm8zsK5sy0esxmIU/8pCy8AXTCNHcXbO5Bz3/rnrsr
	2c/lovluzsbtbUFBiGOt6Jo31ZHkrb7xZ496IhzVL5W/B7uSPOrkNrJxXk/SDIrnH6VKV34uWsb4/
	bxzkj5OX6/2lgkYeM/D44PkXPbYzidIN5ZX7Pu57Z2EIcSzspNCfATf1sj+PlN7FiXAXuTJ5B9tMh
	+upH6mjy3oBPhqBJ2mDkvXA1lE4CewbsN6WdffEXsEJX70M4hBJUmz4Rt8o5+l7MQE8q9aOcc9rBH
	biAh5oeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NAu-00000004RKP-49zg;
	Fri, 25 Oct 2024 16:28:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4N4k-00000004Q85-20mn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 16:22:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2BBF5A43963;
	Fri, 25 Oct 2024 16:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20DD2C4CEC3;
	Fri, 25 Oct 2024 16:22:09 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id C5E6A5FC74;
	Sat, 26 Oct 2024 00:22:06 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20240919-b4-nanopineoplus2-fix-mmc0-wp-v2-1-c708a9abc9eb@gmail.com>
References: <20240919-b4-nanopineoplus2-fix-mmc0-wp-v2-1-c708a9abc9eb@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: allwinner: Add disable-wp for boards
 with micro SD card
Message-Id: <172987332678.809046.10942756189276546172.b4-ty@csie.org>
Date: Sat, 26 Oct 2024 00:22:06 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_092210_720311_06B8213E 
X-CRM114-Status: UNSURE (   6.65  )
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

On Thu, 19 Sep 2024 20:35:39 +0200, Kryštof Černý wrote:
> Adding disable-wp property for micro SD nodes of Allwinner arm64 devices.
> Boards were verified from online pictures/tables
> that they have micro SD slots.
> 
> 

Applied to dt-for-6.13 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] arm64: dts: allwinner: Add disable-wp for boards with micro SD card
      commit: aee2eca83fb4725f3a81166ff21805d87504dac1

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


