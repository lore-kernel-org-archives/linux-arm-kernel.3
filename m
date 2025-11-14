Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D51CDB480
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 03:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7Wa5zv6kJms6DiLqqXPzKVowzYle1GvZ5G3rdIqE/s=; b=gc8ZMqhuzGh0pBDuLYyzezmPjW
	h7Qib4qs3BxHkXZVzAgy7JGZrCjLWrBt4Gc3MvWx/Jx8q67RDei1+SUgnjI8+q4X7R72EEOfIvScw
	GTqaLhaFh/xDVC1pwZpatTPuXwmdlcDYwPgv5IQ47oZyE4y7bz9PUaSMhp8bAEzXj5M6dJREo6E2k
	ul7OK5OGpHfhrbBOaCl6XV14SybV7FU0fQE+EwZore9GHQAWVRJFw3PRjt/bI2bor/XVCmnJ9hPgU
	jzYQO99h0KT0UWJsvqObrUGxaj3jwEG3EYl00BQLoajLQ/FVTFix/Omblju9X2ZpBHQ02AMyTeftO
	siyzLtLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkfA-0000000BUv9-1GJk;
	Fri, 14 Nov 2025 03:39:52 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkf8-0000000BUue-17Yl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 03:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1763091585;
	bh=n7Wa5zv6kJms6DiLqqXPzKVowzYle1GvZ5G3rdIqE/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=G7YEiJQ/nxh6zWkZGsKi3M65JA1ugHSdZF+jmP5H0v4cN2bIrF3lkDgJhefkRuRtZ
	 UoMGsHHBNydzEo07wb+HD8z+eObQllZZngvB6J/SAX9eMk26dBocMqPGSLL7/J4a2q
	 CMzlTPqPSHnMgM3MevKx9yTqVLp0OAi65gj8Yn243xBowKCbx6LuJ1bbEJ9XMWgxtd
	 Jbod5EFnS4u7ZgBBBXA5nhIf0XBr7YmDNKZQvEzyTDU3NkB82OolpnYLXfKk8BWqV+
	 dYGrIvy1yX7VIDEIPY9CW9KxdhmqoKh/acHgEvJzNub9rpK0aBSpL8FOnPYMOE95tD
	 6v56rZV7xlryw==
Received: from [127.0.1.1] (unknown [180.150.112.244])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CF0CB783DF;
	Fri, 14 Nov 2025 11:39:44 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Leo Wang <leo.jt.wang@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 george.kw.lee@fii-foxconn.com, bruce.jy.hung@fii-foxconn.com, 
 leo.jt.wang@fii-foxconn.com
In-Reply-To: <20251021-leo-dts-add-nvme-eeprom-v1-1-33166b3665b4@gmail.com>
References: <20251021-leo-dts-add-nvme-eeprom-v1-1-33166b3665b4@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: clemente: Add EEPROMs for boot and
 data drive FRUs
Message-Id: <176309158432.894995.1068506101584521049.b4-ty@codeconstruct.com.au>
Date: Fri, 14 Nov 2025 14:09:44 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_193950_522448_B1C76398 
X-CRM114-Status: UNSURE (   7.35  )
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

On Tue, 21 Oct 2025 11:15:39 +0800, Leo Wang wrote:
> Add EEPROM devices on the I2C buses used for the boot and data NVMe
> drives. These EEPROMs store FRU information for each drive, allowing
> the BMC to identify.
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


