Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C72C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGPay9A9qATNnqppqo4cBmmU5rAf4n9Ajlzx3PExD4I=; b=yWQjC1fhmPH5JfCbmtOGubqp6c
	3+pmGULVHQde4MKpKgZ3s0Q0NC1NpF/jn1TwBoQVlHEZ1bgu3BeX0AhW19aFVEqXn64dlNV+M1C+A
	2wFd+gTvA/Osj1ivoZ6u7iDW2LlVYKLoELP3a5SNokhsagg6FrkG50I6HO2Ef5MW/pfhZUsIuc0an
	4WCKxiTVCcRLEVRh0LG8mxrVVQhV8304NizU/Opoikw5mi8w7sopyqs1K/A0BVLq/DP9s7qPoMqs5
	NSLenIEhnPudzv3RcIC/xmZW0SdTnwTc7mMNda3o3dDh/Tadfh1OISBqHS5u4JQQYAe4lQwGSWBcu
	D5hDrz8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Sa9-00000005zkG-1UN7;
	Mon, 07 Sep 2026 06:11:53 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Sa7-00000005zih-0ngF;
	Mon, 07 Sep 2026 06:11:52 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hdcCh18ZLzMlCM;
	Mon, 07 Sep 2026 08:11:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788761504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wGPay9A9qATNnqppqo4cBmmU5rAf4n9Ajlzx3PExD4I=;
	b=n4+nhmX2YrLYMSIb6VrVETQrp1mPvyUkA4grZShT815sCyb9F7viXZqvAhM2VbXXG3To3y
	U6IfYoTQf5LvCviVaNSsT/L1l9dZknpKg4EhxFFsYPbmWM0jQo87e7kqxM5xJdZKplbk+C
	MpEkiftx9rTFlJmEYJueUii3KyDyk8EpZBiALcKDkzGNs4o1fi99GMvK4k7HVXJRH0w/QI
	+SVATSHDRUrtLIx/jNGN2WBpmI5DaT5z08XWmXoDoaPuEEP+hGNDrLnjunr91UTteeaIB4
	mQpjp55cPP9Cf8nZA4rpv9BFp26QItE65sNP/z36cdzg0RxNw/eutwaL3hCRbA==
Message-ID: <6c47f4e0-bcd3-4349-b8d6-a3889e08370d@mailbox.org>
Date: Mon, 7 Sep 2026 08:02:20 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] regulator: rpi-panel-v2: Add required vcc-supply
 support
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 venkata.valluru@oss.qualcomm.com, Jessica Zhang <jesszhan0024@gmail.com>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
 <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 3rtxcznpykrpkofi3z1e1xdqpbddtpj3
X-MBO-RS-ID: 7c43c5405db0c7d7e45
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_231151_381349_B925A94D 
X-CRM114-Status: UNSURE (   6.90  )
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

On 9/7/26 7:46 AM, Shashank Maurya wrote:
> The Raspberry Pi 7" touchscreen panel V2 MCU requires an external power
> rail to be enabled before any I2C register access is attempted. Use
> devm_regulator_get() to obtain the vcc supply and enable it at the
> start of probe.
Which power rail is this ?

