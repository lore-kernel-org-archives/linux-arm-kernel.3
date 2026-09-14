Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97ECC88E67
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 05:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjHlY1Zvv57TSs2OSGWEAG30aK/nTy7pcaVzrqBbpU4=; b=u+AfuVSE3DXSdFCl+QWWe6llhE
	9IoBt2U0IiMvvMqg1n6zpZlrGGR2POkzokxPTFR3pzZfv0J4N0C4NWr2QCODHLIP9B8KJIW+WmbHp
	GjejLfK1Y/Hcsk72zsD1Wolivjm+wKjTEQ0kHTMxREqKB04fmEe0vQZodqHGhdPPMryicYaVWCmQ7
	mbsZIKBcAHBW2jaCeke90i+etesCq9mEyUrGm1zUIxm2MTZvw46BwajtzxRaZ5vrnVEFjPVkXbcDj
	FKXLf++XZPHZdziRdMLg65ycnGjszpyWvHe8MY5Vpigu93rTB6QZCPTYhsief2DwzFegrElmZR47W
	0s7+pheA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zIf-00000002N98-3iki;
	Mon, 14 Sep 2026 05:32:17 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zId-00000002N8U-1fcJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 05:32:16 +0000
DKIM-Signature: a=rsa-sha256; b=w85p4Pr3vyldw4Fn6aC2IMeeVGCMdPXlbQ6qMWqjfg6UUbAvjK5maYPauleA5x1QkmRZ1OmJFg50vk7V0D002rY1wM9KHAhXiAaMS5me4FCO5QfpWFQ6H+JHQVyWI286svJga8ljF4VlVmuJ8EVxxMsgY58eRmSzVnQCSJMeeimFGFyxKcQ++EIWLV6Hxzc8ggK2I3jbGyKcptpt5iImW9beQJbsXYB0TiV3aTcG75JAje/jIDK6hRpOQRWV1jImxy9FJ/T9rgaQeqVUarYccw9VuKiuWmMm/7JPYHkEzflOJVjMN4QYzbvDisg7UqBMUYgbopnIFB7+V71ePrVp0g==; s=purelymail1; d=purelymail.com; v=1; bh=JLDyb1EJ9pEsBiZ5e7lfY4A4KF9zkpRjkgHJql1+FZ4=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1229845082;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 14 Sep 2026 05:32:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1x5zIT-0000000Fmcu-3VsK;
	Mon, 14 Sep 2026 07:32:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,  Conor Dooley
 <conor+dt@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Michal
 Simek <michal.simek@amd.com>,  Rob Herring <robh@kernel.org>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
In-Reply-To: <00acb35f-ea7c-465c-96da-4eb5dac9e2cc@nabladev.com> (Marek
	Vasut's message of "Mon, 14 Sep 2026 03:55:28 +0200")
References: <20260909182641.165383-1-marex@nabladev.com>
	<20260909182641.165383-2-marex@nabladev.com>
	<874ifwjff2.fsf@dell.be.48ers.dk>
	<fdf07bc2-428f-4055-97fa-61a302f57a6b@nabladev.com>
	<87wlspb50g.fsf@dell.be.48ers.dk>
	<00acb35f-ea7c-465c-96da-4eb5dac9e2cc@nabladev.com>
Date: Mon, 14 Sep 2026 07:32:05 +0200
Message-ID: <87y0d4v1nu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_223215_518802_41CA602C 
X-CRM114-Status: GOOD (  10.07  )
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

>>>>> "Marek" == Marek Vasut <marex@nabladev.com> writes:

Hi,

 >> OK, but why not add all the referenced GPIOs if you fill out
 >> gpio-line-names anyway?

 > Because the userspace depends only on this one line name. But since
 > eeprom node contains wp-gpios DT property now and the kernel controls
 > the nWP GPIO, I can also turn this around and drop the gpio-line-names
 > entirely. What do you think ?

Up to you. I personally find it helpful for debugging (E.G. the debugfs
output), but if it isn't used at all...

-- 
Bye, Peter Korsgaard

