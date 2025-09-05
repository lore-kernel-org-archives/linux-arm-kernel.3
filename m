Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA61CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 09:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Cc:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xkWeTb8lOsbwxHBNQAiLG/GOYrFmBBfRltFTpI+7WeM=; b=jVop0vqqx3pN5iQxG5E2ZbqBju
	zmfWcIlg16JIzPrDCTKZ0Rtzcl4Kdvzj0yO3DOjN5J5dtBq5G8QC3Gq43wuW7IZ7M6a1TziUORqEl
	PIGtPBTptNN9v5do+4WO0kk9feN25byLBWrRABjcOjvVtDiPlRTqK0jM8QPkgFAx8Rcl6kzgcgzhb
	yFm+zkJZnmLUenowbticjnx4brnVhdGl2JhV+S3uCej2UO5UCwLW8UeRArdrAHpIhK/Nl/WdNPR8w
	CBGx7HGU0VmLXGYRvshxRV/aGCU1xLAsoypIh3xrduDaBF/ZA6qQ0rvDEPzMA8koW2WD2WNMp3E9g
	TornqM9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSMT-00000000aI2-2V6M;
	Fri, 05 Sep 2025 09:04:01 +0000
Received: from proxima.lasnet.de ([2a01:4f8:121:31eb:3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuR8f-000000007Dn-3QHb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 07:45:43 +0000
Received: from [192.168.2.30] (unknown [45.118.184.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan@datenfreihafen.org)
	by proxima.lasnet.de (Postfix) with ESMTPSA id 0689BC0488;
	Fri,  5 Sep 2025 09:45:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datenfreihafen.org;
	s=2021; t=1757058327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xkWeTb8lOsbwxHBNQAiLG/GOYrFmBBfRltFTpI+7WeM=;
	b=jkH2JhTlc3PgelBVDX5sr4jT/CL6PhAkkZdJOddka0LABnij0/XsXaCjyoUYwP2oOxCc1d
	zmsfMyOORa3rkDhMHBEvuB6O3NpvP7Iz/RtXddbVPZBceefiFSELJQklV1z7XAx2Pfop4/
	l87zZcva+wNvTcX7tfeWY12F8AiXZjVm6l8JqoJ95lH3d+QJ3R9CAZOu4uMUJmZYjUnjql
	WtASpzUH2B9H0/YLmg6Sc0Rg5TXaqAupLnf4UIlGPdNgt32apBXe63tWWIbefHqcM81uUt
	7oiKJ5dEYEHFIyE7ikB+Ri7wRybfom7u/kRtFNjS84bmkKE2HsMCqz0VQbyP7Q==
Message-ID: <2a353817-f1da-4e7c-8b2c-0853779ec054@datenfreihafen.org>
Date: Fri, 5 Sep 2025 09:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Stefan Schmidt <stefan@datenfreihafen.org>
Content-Language: en-US
Cc: Jan Lubbe <jlu@pengutronix.de>, stefan.schmidt@linaro.org
Subject: Call for Participation: Embedded & IoT micro-conference at Linux
 Plumbers 2025
To: linux-arm-kernel@lists.infradead.org, linux-embedded@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 "linux-wpan@vger.kernel.org" <linux-wpan@vger.kernel.org>,
 BlueZ development <linux-bluetooth@vger.kernel.org>,
 linux-can <linux-can@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>,
 boot-architecture@lists.linaro.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_004542_363092_236E6552 
X-CRM114-Status: UNSURE (   3.44  )
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

We are happy to announce that the Embedded & IoT micro-conference was
again accepted for Linux Plumbers this year. Hosted in beautiful Tokyo,
Japan December 11-13.
https://lpc.events/event/19/contributions/2005/

Topics cover all things embedded and IoT. Boot time to kernel size, low
power communication, telemetry and also RTOS. Devicetree and build
system have their own MC and we can move sessions between them as needed.

As with all MC's at Plumbers we are not looking for talks, but rather
discussing current problems and working towards their solution. If your
proposal has a specific stakeholder (maintainer, developer, company)
that would be needed for a fruitful discussion, please mention it in
your submission.

The CfP is open now and will run until October 3rd. Please do not wait
until the end with your submissions as we are going to accept good
proposals even before the end, so the MC might be filled up before 
October 3rd.

Jan & Stefan

