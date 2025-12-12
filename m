Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0FDD59D93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 20:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10qdpGGqPeb9LfijJwwMefCJOSFYWatV7/F0eGW2+yg=; b=w1WlA42JHKltI3oY2VGP90DQVD
	nVZOFxD4H6QCjbuUZAiKXP2lr/TteL59k/Wq4N17a8raiwZ0x+/1gWWzn/2ghyrdHI2oNxWtjpGaU
	nefLjRixvQ2iJhwsKj4k5uFID6/co7+h8SzM0vNH28mYeukS7DnJbkJeFeKPFHIULXtS5g/1GymIe
	cTtbROhb3jjk4uNuxVE4fA3brvFK06fSD8NdIxGDO9mHq2ly2HAZgBMABPuxFckExMp2IZWzoUsup
	XAUFCQbX1+Ow/6ph5BynUVjgSlB5spPrANRUjPVoOkiHYehtZ/yMMx7DLwm3XiFjSERbcIMiEu9BJ
	uaDS5G9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU9hZ-000000012nZ-1rv8;
	Fri, 12 Dec 2025 20:25:21 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU9hW-000000012mb-0FRJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 20:25:19 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 0BC76240029
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 21:25:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1765571112; bh=10qdpGGqPeb9LfijJwwMefCJOSFYWatV7/F0eGW2+yg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=nD5YgSKDrmjPi/NQLB5DxUN/dqA/3ACC9ZTfodtXjFEa59FQo93jzhM+gi59c9bwA
	 D05np83iw/D+31uwOPBAqR7YMUYlMuJ7Bj4gtW6FzyIByW7SKpHjOPkI0UFU/x77pj
	 GMA9aJiPHCODDVusvVEpfs94IWKejIDhywB2O1aACn/84xBEqXWr2c4xCUk3YIQMBC
	 FOTflGUIzkWpqCXMe1q7rtbaD01LT+5YTgh7CYoIG8tmdZdMbdlJAnSVb1XalrdnDL
	 1D9HOGCf5ksKxzrwhzq+QCDfx5UzqCkbs+8blX5Ow87aw0T7KdhW31MmcJwJQd3L4S
	 NSyv3UTz4pfBg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4dSgtX5r0pz9rxD;
	Fri, 12 Dec 2025 21:25:08 +0100 (CET)
From: Adrian Kossmann <adrian.kossmann@posteo.de>
To: andrew@lunn.ch
Cc: adrian.kossmann@posteo.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add compatible for Ethernet PHY
Date: Fri, 12 Dec 2025 20:25:11 +0000
Message-ID: <20251212202451.556449-1-adrian.kossmann@posteo.de>
In-Reply-To: <8e4607b7-8045-413d-aa3e-c2c1a74f52a6@lunn.ch>
References: <8e4607b7-8045-413d-aa3e-c2c1a74f52a6@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_122518_227704_47551010 
X-CRM114-Status: GOOD (  10.12  )
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

Hi Andrew,

> It is a bit unusual for phylib to get the wrong driver, so i would
like to understand this a bit more.

after double-checking my setup I found that the PHY is in fact always 
bound to the RTL8211F driver, even without the compatible string, and 
this was rather an issue with my setup. 

The link instability I observed was caused by inappropriate RGMII RX/TX 
delay settings in the mainline DTS. With the current values for 
rx_delay and tx_delay in the mainline DTS the link collapsed under load. 
I've troubleshooted this with a known-good DTB and using its rx_delay 
and tx_delay values fixes the issue. 
I will send a v2 patch adjusting the delays instead of adding a compatible.

      Adrian


