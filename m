Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CC8C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 08:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6Wy/9vN9ADDZZX+mcOiwXk9RSq7RXtiVJ2ibQ0mqWg=; b=vcm4QRFoon9nUDXSk+2UGrpkma
	sPh9uvIE7FMhaUTiR+XAoBxhYJx2ohewcHmIqKbmpMpx0jwSaa5r5Ib7951QNA5EoVnytM9XW69aF
	aZVBeUt+XGD3KBKnpSTP1HX7t+u8qgi0xq+JOw7PDfyT5poGBFfQxdDGsaCITCJ2jRLQs8Dev7pXj
	aCCeIdiermEEezBOKx+UxP87OboZ3wkz8vE8EjRCGvOiPeJmiyefdyCDvBigCwRmuqCVZwB8prq+/
	v1bIgL9+zXb5IJAXW8T2wHqV3zHDkiAo2bDnME+vjlUs7qe6NOWDsLyxSq6+SyBj0S9ucOQX4ld5L
	jiCgouqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfbFz-00000002e0R-2DHW;
	Wed, 05 Feb 2025 08:59:39 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfbDt-00000002dl9-150b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 08:57:30 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 433F5A0031;
	Wed,  5 Feb 2025 09:57:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=Q6Wy/9vN9ADDZZX+mcOi
	wXk9RSq7RXtiVJ2ibQ0mqWg=; b=THZbnIV/ocLEg79CbULPv7eUwBqcR78AHGpK
	vP+KbnpXW60Ouaj6hZBYYK9/uDmlwOBMt7FnsbA7U+/+jCzyuDAFH/UjMAzWvJj0
	2DOd9MndfiOZU8MBpTY65qgvSAECEfN53GpUWF5Mx57ljwPA+XtHxAyCbWZFsTpy
	tR7irtAxI13xYYipAuHYuEfWlaIhzpVtq9AitZJ0W38tlPbbupQoclHMU2ogInfl
	D6T4x9MjOyq7xOQd58rGKBrdojt52OExX/DK6i2t1NUVGc9189hKZ1hCPiJsbVPE
	HRXGvZRAJao06F4d9W40YTb8fsRo5KfcO6p2S+Y6oLuNd6HaFvrqOgcNv4E334vG
	k7sz/drIHYFsSbJRlqXt2/p7TxxxoscQ4N9EjZloedwhqVVuPeAViHQmtbL/9agN
	zYBBmMKCVS1yjRFWcQMytK5MxCjYY+vm5DN9ZwkWP5U21drz3UB9KxUAbIc3new9
	SmLaPKjpecLFHXcaKS5g8edY7d7agRIbur/Q+F5S4lbYXNpKjOqz1Jrlq3W5YriG
	7uJWnFptv3NAoIPAC/umt4OGOFSuVAbh3WtOi6P+Jnv5bV/6VioJA78DGemd+i5I
	NgMGSRpN2uXLPLCVBiSz5Unmc0h/3itlit4nAxaCUmaGJ0X4dkMomEMo4JRMvWF+
	drW7/Kw=
Message-ID: <7b581014-a351-4077-8832-d3d347b4fdb5@prolan.hu>
Date: Wed, 5 Feb 2025 09:57:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] counter: microchip-tcb-capture: Add capture
 extensions for registers RA-RC
To: William Breathitt Gray <wbg@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kamel Bouhara <kamel.bouhara@bootlin.com>
References: <20250203162955.102559-1-csokas.bence@prolan.hu>
 <20250203162955.102559-2-csokas.bence@prolan.hu> <Z6KsrhUYoYF8n10J@ishi>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <Z6KsrhUYoYF8n10J@ishi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852667264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_005729_770926_E95C37B3 
X-CRM114-Status: GOOD (  10.88  )
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

On 2025. 02. 05. 1:11, William Breathitt Gray wrote:
> On Mon, Feb 03, 2025 at 05:29:53PM +0100, Bence Csókás wrote:
>> TCB hardware is capable of capturing the timer value to registers RA and
>> RB. On top, it is capable of triggering on compare against a third
>> register, RC. Add these registers as extensions.
>>
>> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> 
> What is the difference between RA and RB (your code looks like they
> represent two distinct event channels, so I want to confirm)? Is RC a
> threshold value set by the user, or is it another captured timer value?
> The capture extension represents Count value specifically, so I want to
> make sure we're using the right extension for these components.

RA, RB and RC are three R/W-able "general purpose" hardware registers. 
The HW additionally has the following capabilities:
* in PWM mode (not used by this driver), send an interrupt on compare to 
RA/B/C, and/or change output signals
* in Counter Capture mode (used here):
   * trigger interrupt on RC compare only
   * on external trigger rising/falling edge, sample Counter Value 
Register (CV) to RA/RB, optionally send an interrupt of this change
   * stop counting after sampling to RB
All of this is enable-able of course.

So yes, RA and RB can be thought of two near-identical, separate 
channels. Since they both sample CV, it made sense to use 
COUNTER_EVENT_CAPTURE. RC is indeed set by the user.

Bence


